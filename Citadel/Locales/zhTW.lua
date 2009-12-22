local L = BigWigs:NewBossLocale("Blood Princes", "zhTW")
if L then
	L.switch_message = "虛弱轉換！"
end

L = BigWigs:NewBossLocale("Festergut", "zhTW")
if L then

end

L = BigWigs:NewBossLocale("Lady Deathwhisper", "zhTW")
if L then
	L.engage_trigger = "這騷動是怎麼回事?"
	L.phase2_message = "第二階段 - 失去法力屏障！"

	L.dnd_message = ">你< 死亡凋零！"

	L.adds = "增援"
	L.adds_desc = "當召喚增援時顯示計時條。"
	L.adds_bar = "<下一增援>"
	L.adds_warning = "5秒後，新的增援！"

	L.touch_message = "無脅之觸%2$dx：>%1$s<！"
	L.touch_bar = "<下一無脅之觸>"
end

L = BigWigs:NewBossLocale("Lord Marrowgar", "zhTW")
if L then
	L.impale_cd = "<下一刺穿>"

	L.bonestorm_cd = "<下一骸骨風暴>"
	L.bonestorm_warning = "5秒後，骸骨風暴！"

	L.coldflame_message = ">你< 冷焰！"

	L.engage_trigger = "天譴軍團會化身為死亡與毀滅，席捲整個世界。"
end

L = BigWigs:NewBossLocale("Precious", "zhTW")
if L then
	L.zombies = GetSpellInfo(71159)
	L.zombies_desc = "召喚11個瘟疫殭屍協助施法者。"
	L.zombies_message = "召喚 瘟疫殭屍！"
	L.zombies_cd = "<下一瘟疫殭屍>" -- 20sek cd (11 Zombies)

	L.wound_message = "致死重傷%2$dx：>%1$s<！"

	L.decimate_cd = "<下一虐殺>" -- 33 sec cd
end

L = BigWigs:NewBossLocale("Professor Putricide", "zhTW")
if L then
	L.blight_message = "毒氣膨脹：>%s<！"
	L.violation_message = "暴躁軟泥怪黏著：>%s<！"
end

L = BigWigs:NewBossLocale("Rotface", "zhTW")
if L then
	L.infection_bar = "突變感染：>%s<！"

	L.flood_trigger1 = "大夥聽著，好消息!我修好了劇毒軟泥管!"
	L.flood_trigger2 = "Great news, everyone! The slime is flowing again!"
	L.flood_warning = "A new area is being flooded soon!"
end

L = BigWigs:NewBossLocale("Deathbringer Saurfang", "zhTW")
if L then
	L.adds = "血獸"
	L.adds_desc = "當召喚血獸時發出警報和顯示計時條。"
	L.adds_warning = "5秒後，血獸！"
	L.adds_message = "召喚血獸！"
	L.adds_bar = "<下一血獸>"

	L.rune_bar = "<下一血魄符文>"

	L.nova_bar = "<下一血魄新星>"

	L.mark = "墮落勇士印記：>%d<！"

	L.engage_trigger = "以巫妖王之力!"
	L.warmup_alliance = "Let's get a move on then! Move ou..."
	L.warmup_horde = "Kor'kron, move out! Champions, watch your backs. The Scourge have been..."
end

L = BigWigs:NewBossLocale("Sindragosa", "zhTW")
if L then
	L.airphase_trigger = "你們的入侵將在此終止!誰也別想存活!"
	L.airphase = "空中階段"
	L.airphase_message = "空中階段！"
	L.airphase_desc = "當辛德拉苟莎起飛時發出警報。"
	L.boom = "極凍之寒！"
end

L = BigWigs:NewBossLocale("Stinky", "zhTW")
if L then
	L.wound_message = "致死重傷%2$dx：>%1$s<！"
	L.decimate_cd = "<下一虐殺>" -- 33sec cd
end

L = BigWigs:NewBossLocale("Valithria Dreamwalker", "zhTW")
if L then
	L.manavoid_message = ">你< 潰法力場！"
	L.portal = "夢魘之門！"
	L.portal_desc = "當瓦莉絲瑞雅·夢行者打開夢魘之門時發出警報。"
	L.portal_message = "打開夢魘之門！"
	L.portal_trigger = "I have opened a portal into the Dream. Your salvation lies within, heroes..."
end