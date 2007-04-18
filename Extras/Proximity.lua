﻿assert( BigWigs, "BigWigs not found!")

-----------------------------------------------------------------------
--      Are you local?
-----------------------------------------------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsProximity")

local RL
local paintchips = AceLibrary("PaintChips-2.0")
local active = nil -- The module we're currently tracking proximity for.
local anchor = nil
local lastplayed = 0 -- When we last played an alarm sound for proximity.
local playername
local tooClose = {} -- List of players who are too close.

local table_insert = table.insert
local table_concat = table.concat
local UnitName = UnitName
local UnitExists = UnitExists
local UnitIsDeadOrGhost = UnitIsDeadOrGhost

local coloredNames = setmetatable({}, {__index =
	function(self, key)
		if RL then
			local obj = RL:GetUnitObjectFromName(key)
			if not obj then return key end
			self[key] = "|cff" .. paintchips:GetHex(obj.class) .. key .. "|r"
		else
			local num = GetNumRaidMembers()
			local found
			for i = 1, num do
				if UnitExists("raid"..i) and UnitName("raid"..i) == key then
					local class = select(2, UnitClass("raid"..i) )
					self[key] = "|cff" .. paintchips:GetHex(class) .. key .."|r"
					found = true
				end
			end
			if not found then
				return key
			end
		end
		return self[key]
	end
})

-----------------------------------------------------------------------
--      Localization
-----------------------------------------------------------------------

L:RegisterTranslations("enUS", function() return {
	["Proximity"] = true,
	["Options for the Proximity Display."] = true,
	["|cff777777Nobody|r"] = true,
	["Sound"] = true,
	["Play sound on proximity."] = true,
	["Disabled"] = true,
	["Disable the proximity display."] = true,
	["Show"] = true,
	["Show the proximity frame."] = true,

	proximity = "Proximity Alert",
	proximity_desc = "Show the proximity window.",
} end)

L:RegisterTranslations("koKR", function() return {
	--["Proximity"] = true,
	--["Options for the Proximity Display."] = true,
	["|cff777777Nobody|r"] = "|cff777777아무도 없음|r",
	["Sound"] = "경고음",
	--["Play sound on proximity."] = true,
	--["Disabled"] = true,
	--["Disable the proximity display."] = true,
} end )

L:RegisterTranslations("frFR", function() return {
	["Proximity"] = "Proximité",
	["Options for the Proximity Display."] = "Options concernant l'affichage de proximité.",
	["|cff777777Nobody|r"] = "|cff777777Personne|r",
	["Sound"] = "Son",
	["Play sound on proximity."] = "Joue un son quand à proximité.",
	["Disabled"] = "Désactivé",
	["Disable the proximity display."] = "Désactive l'affichage de proximité.",

	proximity = "Proximit\195\169",
	proximity_desc = "Affiche la fen\195\170tre de proximit\195\169.",
} end)

-----------------------------------------------------------------------
--      Module Declaration
-----------------------------------------------------------------------

local plugin = BigWigs:NewModule("Proximity")
plugin.revision = tonumber(("$Revision$"):sub(12, -3))
plugin.defaultDB = {
	posx = nil,
	posy = nil,
	sound = true,
	disabled = nil,
}
plugin.external = true

plugin.consoleCmd = L["Proximity"]
plugin.consoleOptions = {
	type = "group",
	name = L["Proximity"],
	desc = L["Options for the Proximity Display."],
	handler = plugin,
	pass = true,
	get = function( key )
		return plugin.db.profile[key]
	end,
	set = function( key, value )
		plugin.db.profile[key] = value
		if key == "disabled" then
			if value then
				plugin:CloseProximity()
			else
				plugin:OpenProximity()
			end
		end
	end,
	func = function()
		if anchor and active then
			anchor:Show()
		end
	end,
	args = {
		anchor = {
			type = "execute",
			name = L["Show"],
			desc = L["Show the proximity frame."],
			order = 1,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 50,
		},
		sound = {
			type = "toggle",
			name = L["Sound"],
			desc = L["Play sound on proximity."],
			order = 100,
		},
		disabled = {
			type = "toggle",
			name = L["Disabled"],
			desc = L["Disable the proximity display."],
			order = 101,
		}
	}
}

-----------------------------------------------------------------------
--      Initialization
-----------------------------------------------------------------------

function plugin:OnRegister()
	BigWigs:RegisterBossOption("proximity", L["proximity"], L["proximity_desc"])

	playername = UnitName("player")
end

function plugin:OnEnable()
	self:RegisterEvent("Ace2_AddonEnabled")
	self:RegisterEvent("Ace2_AddonDisabled")

	if AceLibrary:HasInstance("Roster-2.1") then
		RL = AceLibrary("Roster-2.1")
	end
end

function plugin:OnDisable()
	self:CloseProximity()
end

-----------------------------------------------------------------------
--      Event Handlers
-----------------------------------------------------------------------

function plugin:Ace2_AddonDisabled(module)
	if active == module then
		self:CloseProximity()
	end
end

function plugin:Ace2_AddonEnabled(module)
	-- If this is the current module, we don't do anything, since this would
	-- re-show the frame if the user had hidden it, etc.
	if active and active == module then return end

	if type( module.proximityCheck ) == "function" then
		active = module
		self:OpenProximity()
	end
end

function plugin:CloseProximity()
	if anchor then anchor:Hide() end
	self:CancelScheduledEvent("bwproximityupdate")
end

function plugin:OpenProximity()
	if self.db.profile.disabled or not active or type( active.proximityCheck ) ~= "function" or not active.db.profile.proximity then return end
	self:SetupFrames()

	local text = nil
	if active.name then
		text = active.name
	else
		text = L["Proximity"]
	end
	for k in pairs(tooClose) do tooClose[k] = nil end
	anchor.text:SetText(L["|cff777777Nobody|r"])

	anchor.cheader:SetText(text)
	anchor:Show()
	if not self:IsEventScheduled("bwproximityupdate") then
		self:ScheduleRepeatingEvent("bwproximityupdate", self.UpdateProximity, .1, self)
	end
end

function plugin:UpdateProximity()
	if not active or type( active.proximityCheck ) ~= "function" then return end

	if RL then
		for n, u in pairs(RL.roster) do
			if u and u.name and u.class ~= "PET" and not UnitIsDeadOrGhost(u.unitid) and u.name ~= playername then
				if active.proximityCheck(u.unitid) then
					table_insert(tooClose, coloredNames[u.name])
				end
			end
			if #tooClose > 4 then break end
		end
	else
		local num = GetNumRaidMembers()
		for i = 1, num do
			local unit = "raid"..i
			if UnitExists(unit) and not UnitIsDeadOrGhost(unit) and UnitName(unit) ~= playername then
				if active.proximityCheck(unit) then
					table_insert(tooClose, coloredNames(UnitName(unit)))
				end
			end
			if #tooClose > 4 then break end
		end
	end
	if #tooClose == 0 then
		anchor.text:SetText(L["|cff777777Nobody|r"])
	else
		anchor.text:SetText(table_concat(tooClose, "\n"))
		for k in pairs(tooClose) do tooClose[k] = nil end
		local t = time()
		if t > lastplayed + 1 then
			lastplayed = t
			if self.db.profile.sound and UnitAffectingCombat("player") and not active.proximitySilent then
				self:TriggerEvent("BigWigs_Sound", "Alarm")
			end
		end
	end
end

------------------------------
--    Create the Anchor     --
------------------------------

function plugin:SetupFrames()
	if anchor then return end

	local frame = CreateFrame("Frame", "BigWigsProximityAnchor", UIParent)
	frame:Hide()

	frame:SetWidth(200)
	frame:SetHeight(100)

	frame:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\AddOns\\BigWigs\\Textures\\otravi-semi-full-border", edgeSize = 32,
		insets = {left = 1, right = 1, top = 20, bottom = 1},
	})

	frame:SetBackdropColor(24/255, 24/255, 24/255)
	frame:ClearAllPoints()
	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	frame:EnableMouse(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetMovable(true)
	frame:SetScript("OnDragStart", function() this:StartMoving() end)
	frame:SetScript("OnDragStop", function()
		this:StopMovingOrSizing()
		self:SavePosition()
	end)

	local cheader = frame:CreateFontString(nil, "OVERLAY")
	cheader:ClearAllPoints()
	cheader:SetWidth(190)
	cheader:SetHeight(15)
	cheader:SetPoint("TOP", frame, "TOP", 0, -14)
	cheader:SetFont("Fonts\\FRIZQT__.TTF", 12)
	cheader:SetJustifyH("LEFT")
	cheader:SetText(L["Proximity"])
	cheader:SetShadowOffset(.8, -.8)
	cheader:SetShadowColor(0, 0, 0, 1)
	frame.cheader = cheader

	local text = frame:CreateFontString(nil, "OVERLAY")
	text:ClearAllPoints()
	text:SetWidth( 190 )
	text:SetHeight( 80 )
	text:SetPoint( "TOP", frame, "TOP", 0, -35 )
	text:SetJustifyH("CENTER")
	text:SetJustifyV("TOP")
	text:SetFont("Fonts\\FRIZQT__.TTF", 12)
	frame.text = text

	local close = frame:CreateTexture(nil, "ARTWORK")
	close:SetTexture("Interface\\AddOns\\BigWigs\\Textures\\otravi-close")
	close:SetTexCoord(0, .625, 0, .9333)

	close:SetWidth(20)
	close:SetHeight(14)
	close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -7, -15)

	local closebutton = CreateFrame("Button", nil)
	closebutton:SetParent( frame )
	closebutton:SetWidth(20)
	closebutton:SetHeight(14)
	closebutton:SetPoint("CENTER", close, "CENTER")
	closebutton:SetScript( "OnClick", function() self:CloseProximity() end )

	anchor = frame

	local x = self.db.profile.posx
	local y = self.db.profile.posy
	if x and y then
		local s = anchor:GetEffectiveScale()
		anchor:ClearAllPoints()
		anchor:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
	else
		self:ResetAnchor()
	end
end

function plugin:ResetAnchor()
	if not anchor then self:SetupFrames() end
	anchor:ClearAllPoints()
	anchor:SetPoint("CENTER", UIParent, "CENTER")
	self.db.profile.posx = nil
	self.db.profile.posy = nil
end

function plugin:SavePosition()
	if not anchor then self:SetupFrames() end

	local s = anchor:GetEffectiveScale()
	self.db.profile.posx = anchor:GetLeft() * s
	self.db.profile.posy = anchor:GetTop() * s
end

