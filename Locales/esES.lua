local L = LibStub("AceLocale-3.0"):NewLocale("Big Wigs", "esES") or LibStub("AceLocale-3.0"):NewLocale("Big Wigs", "esMX")
if not L then return end
-- Core.lua
L["%s has been defeated"] = "%s ha sido derrotado"

L.bosskill = "Jefe muerto"
L.bosskill_desc = "Avisa cuando el jefe ha sido derrotado."
L.berserk = "Rabia"
L.berserk_desc = "Muestra un contador que avisa cuando el jefe entrará en rabia"

L.already_registered = "|cffff0000ATENCIóN:|r |cff00ff00%s|r (|cffffff00%s|r) ya existe ese módulo en BigWigs, pero sin embargo está intentando registrarlo de nuevo. Esto normalmente ocurre cuando tienes varias copias de este módulo en tu carpeta de addons posiblemente por una actualización fallida. Es recomendable que borres la carpeta de Big Wigs y lo reinstales por completo."

-- Loader / Options.lua
L["You are running an official release of Big Wigs %s (revision %d)"] = "Estás usando la versión oficial de Big Wigs %s (revisión %d)"
L["You are running an ALPHA RELEASE of Big Wigs %s (revision %d)"] = "Estás usando la VERSION ALPHA de Big Wigs %s (revisión %d)"
L["You are running a source checkout of Big Wigs %s directly from the repository."] = "Estás usando la versión de Big Wigs %s directamente del repositorio."
L["There is a new release of Big Wigs available(/bwv). You can visit curse.com, wowinterface.com, wowace.com or use the Curse Updater to get the new release."] = "Existe una nueva versión de Big Wigs disponible(/bwv). Puedes visitar curse.com, wowinterface.com, wowace.com o usar el cliente de Curse para adquirirla."
L["Your alpha version of Big Wigs is out of date(/bwv)."] = "Tu versión alpha de Big Wigs está desactualizada(/bwv)."

L.tooltipHint = "|cffeda55fClic|r para reiniciar todos los módulos. |cffeda55fAlt-Clic|r para desactivarlos. |cffeda55fRight-Clic|r para acceder a las opciones."
L["Active boss modules:"] = "Módulos de jefes activos:"
L["All running modules have been reset."] = "Todos los módulos han sido reiniciados."
L["All running modules have been disabled."] = "Todos los módulos han sido desactivados."

L["There are people in your group with older versions or without Big Wigs. You can get more details with /bwv."] = "Hay gente en tu grupo con versiones antiguas o sin Big Wigs. Más detalles con /bwv."
L["Up to date:"] = "Al día:"
L["Out of date:"] = "Desactualizado"
L["No Big Wigs 3.x:"] = "Sin Big Wigs 3.x:"

L.coreAddonDisabled = "Big Wigs no puede funcionar debidamente ya que el addon %s está desactivado. Puedes activarlo desde el addon Control panel o en la pantalla de selección de personaje."

-- Options.lua
L["Big Wigs Encounters"] = "Big Wigs Encounters"
L["Customize ..."] = "Personalizar..."
L["Profiles"] = "Perfiles"
L.introduction = "Bienvenido a Big Wigs. Ponte rápidamente el cinturón y come cacahuetes mientras disfrutas del paseo. De manera no intrusiva le preparará para ese nuevo encuentro de jefe como si estuviera siendo servido en una cena de 7 platos, usted y su grupo."
L["Configure ..."] = "Configurar..."
L.configureDesc = "Cierra la ventana de opciones y deja configurar como se verían las barras y mensajes.\nSi quieres personalizar más cosas, puedes expandir Big Wigs en el arbol de la izquierda y buscar la subsección Personalizar..."
L["Sound"] = "Sonido"
L.soundDesc = "Los mensajes podrían llegar con un sonido. A algunas personas les resulta más fácil escucahr. Cuando aprenden que 'tal' sonido va con 'cual' mensaje, en vez de leer dicho mensaje. \n\n|cffff4411Incluso cuando está apagado, el sonido por defecto de aviso de raid será usado para avisar a los otros jugadores. Este sonido, sin embargo, es diferente de los sonidos que usamos.|r"
L["Show Blizzard warnings"] = "Mostrar avisos de Blizzard"
L.blizzardDesc = "Blizzard nos provee de sus propios mensajes y sonidos. En nuestra opinion, estos pueden ser demasiado largos y descriptivos. Intentaremos simplificarlos sin interferir en el juego y sin que le digan que hacer especificamente.\n\n|cffff4411Cuando está apagado, los avisos de Blizzard no serán mostrados en medio de la pantalla, pero si en la ventana de chat.|r"
L["Show addon warnings"] = "Mostrar avisos del addon"
L.addonwarningDesc = "Big Wigs y otros addons similares pueden difundir sus mensajes al grupo por el canal de raid. Estos mensajes normalmente son envueltos en tres estrellas (***), entonces es donde Big Wigs decidirá si debería bloquearlos o no.\n\n|cffff4411Activando esta opción podría surgir demasiado spam y no es recomendable.|r"
L["Flash and shake"] = "Flash y temblar"
L["Flash"] = "Flash"
L["Shake"] = "Temblar"
L.fnsDesc = "Ciertas habilidades son suficientemente importantes como para necesitar tu atención especial. Cuando te afecten Big Wigs puede hacer temblar y mostrar un flash en la pantalla.\n\n|cffff4411Si estás jugando con los nameplates (marcos encima de las cabezas de los pjs) activados, el temblor no se usará de acuerdo a las restricciones de Blizzard, la pantalla entonces solo usará el flash.|r"
L["Raid icons"] = "Iconos de Raid"
L.raidiconDesc = "Algunos encuentros usan los iconos de raid para marcar jugadores de interés especial para tu grupo. Por ejemplo los efectos tipo 'bomba' y control mental. Si la cambias a desactivado, no marcarás a nadie.\n\n|cffff4411¡Solo aplica las marcas si eres ayudante o lider!|r"
L["Whisper warnings"] = "Avisos de susurros"
L.whisperDesc = "Envía un susurro a los jugadores afectados con ciertas habilidades. Efectos tipo 'bomba' y similares.\n\n|cffff4411¡Solo lo aplicará si eres ayudante o lider!|r"
L["Broadcast"] = "Difundir"
L.broadcastDesc = "Comparte todos los mensajes de Big Wigs por el canal de alerta de raid. \n\n|cffff4411Solo si eres ayudante en raid, pero en grupo lo mostrará sea como sea.|r"
L["Raid channel"] = "Canal de raid"
L["Use the raid channel instead of raid warning for broadcasting messages."] = "Usa el canal de raid para avisar y difundir los mensajes."
L["Minimap icon"] = "Icono del minimapa"
L["Toggle show/hide of the minimap icon."] = "Cambia entre mostrar/ocultar el icono en el minimapa."
L["Configure"] = "Configurar"
L["Test"] = "Probar"
L["Reset positions"] = "Reiniciar posiciones"
L["Colors"] = "Colores"
L["Select encounter"] = "Seleccionar encuentro"
L["List abilities in group chat"] = "Listar las habilidades en el chat"
L["Block Boss Movies"] = "Block Boss Movies"
L["After you've seen a boss movie once, Big Wigs will prevent it from playing again."] = "After you've seen a boss movie once, Big Wigs will prevent it from playing again."
L["Prevented boss movie '%d' from playing."] = "Prevented boss movie '%d' from playing."

L["BAR"] = "Barras"
L["MESSAGE"] = "Mensajes"
L["ICON"] = "Icono"
L["WHISPER"] = "Susurro"
L["SAY"] = "Decir"
L["FLASHSHAKE"] = "Flash y temblor"
L["PING"] = "Ping"
L["EMPHASIZE"] = "Enfatizar"
L["MESSAGE_desc"] = "La mayoria de las abilidades de los encuentros se presentan con uno o más mensajes que Big Wigs mostrará en tu pantalla. Si desactivas esta opción, ningún mensaje se ceñirá a esto, si que algunos, serán mostrados."
L["BAR_desc"] = "Las barras serán mostradas en el momento apropiado. Si esta habilidad está acompañada por una barra que quieres ocultar, desactiva esta opción."
L["FLASHSHAKE_desc"] = "Algunas habilidades pueden ser más importantes que otras. Si quieres que la pantalla muestre un flash y tiemble cuando esta habilidad ocurra, activa esta opción."
L["ICON_desc"] = "Big Wigs puede marcar personajes afectados por habilidades con un icono."
L["WHISPER_desc"] = "Algunos efectos que son importantes, Big Wigs enviará un susurro a la persona afectada."
L["SAY_desc"] = "Los bocadillos de chat son fáciles de ver. Big Wigs usará un mensaje para anunciar a la gente cercana sobre un efecto en ti."
L["PING_desc"] = "A veces la localizaciones pueden ser importantes, Big Wigs pinchará el minimapa para que la gente sepa donde estás."
L["EMPHASIZE_desc"] = "Activando esto SUPER ENFATIZARA cualquier mensaje o barra asociada con esta habilidad del encuentro. Los mensajes serán grandes, las barras usarán flash y tendran un color diferente, se usarán sonidos para la cuenta atras cuando la habilidad sea inminente. Basicamente tendrás noticia de el. (:"
L["PROXIMITY"] = "Ventana de proximidad"
L["PROXIMITY_desc"] = "La ventana de proximidad se ajustará especificamente para esa habilidad para que sepas de un vistazo si estás a salvo o no."
L["Advanced options"] = "Opciones avanzadas"
L["<< Back"] = "<< Volver"

L["About"] = "Acerca de"
L["Main Developers"] = "Desarrolladores principales"
L["Developers"] = "Desarrolladores"
L["Maintainers"] = "Mantenedores"
L["License"] = "Licencia"
L["Website"] = "Web"
L["Contact"] = "Contacto"
L["See license.txt in the main Big Wigs folder."] = "Ve license.txt en la carpeta principal de Big Wigs."
L["irc.freenode.net in the #wowace channel"] = "irc.freenode.net en el canal #wowace"
L["Thanks to the following for all their help in various fields of development"] = "Gracias a las siguientes personas por su ayuda en varias partes del desarrollo"

