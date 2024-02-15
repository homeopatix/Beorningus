------------------------------------------------------------------------------------------
-- localization file
-- Written by Homeopatix
-- 10 january 2022
------------------------------------------------------------------------------------------
function CreateLocalizationInfo()
	Strings = {};

	------------------------------------------------------------------------------------------
	-- datas for special character
	------------------------------------------------------------------------------------------
	-- ü = \195\188
	-- ä = \195\164
	-- ö = \195\182
	-- Ä = \195\132
	-- ß = \195\159
	-- à = \195\160
	-- é = \195\169
	-- è = \195\168
	------------------------------------------------------------------------------------------
	-- Deutsche --
	------------------------------------------------------------------------------------------
	if Turbine.Engine.GetLanguage() == Turbine.Language.German then
		Strings.PluginName = "Beorningus";
		Strings.PluginText = "Von Homeo";
		Strings.PluginEscEnable = "Escape-Taste aktiviert";
		Strings.PluginEscDesable = "Escape-Taste deaktiviert";
		Strings.PluginAltEnable = "Alt-Taste aktiviert";
		Strings.PluginAltDesable = "Alt-Taste deaktiviert";
		Strings.PluginOptionsText = "Beorningus Optionen";
		Strings.PluginWindowShow = "Schaufenster.";
		Strings.PluginWindowHide = "Verstecke das Fenster.";
		------------------------------------------------------------------------------------------
		-- help --
		------------------------------------------------------------------------------------------
		Strings.PluginHelp1 = "\n\nListe der Befehle:\n";
		Strings.PluginHelp2 = "/Class show - Schaufenster.\n";
		Strings.PluginHelp3 = "/Class hide - verstecke das Fenster.\n";
		Strings.PluginHelp4 = "/Class options - Zeigen Sie das Optionsfenster an.\n";
		Strings.PluginHelp5 = "/Class esc - Aktivieren oder deaktivieren Sie die Escape-Taste.\n";
		Strings.PluginHelp6 = "/Class clear - L\195\182schen Sie alle Verkn\195\188pfungen.\n";
		Strings.PluginHelp7 = "/Class lock um die Symbole zu sperren oder zu entsperren\n";
		Strings.PluginHelp8 = "/Class toggle - Fenster ein-oder ausblenden\n\n";
		Strings.PluginHelp9 = "/Class alt - Aktivieren oder deaktivieren Sie die alt-Taste um das Symbol zu verschieben.\n";
		Strings.PluginHelp10 = "Klicken Sie mit der rechten Maustaste auf das Symbol, um das Optionsfeld anzuzeigen";
		------------------------------------------------------------------------------------------
		-- command text  --
		------------------------------------------------------------------------------------------
		Strings.PluginWindowShow = "Schaufenster.";
		Strings.PluginWindowHide = "verstecke das Fenster.";
		Strings.PluginWindowClear = "L\195\182schen Sie alle Verkn\195\188pfungen.";
		Strings.PluginLocked = "Gesperrte Symbole";
		Strings.PluginUnlocked = "Symbole freigeschaltet";
		------------------------------------------------------------------------------------------
		-- option window --
		------------------------------------------------------------------------------------------
		Strings.PluginOption1 = "Anzahl der Zeilen";
		Strings.PluginOption2 = "Anzahl der Steckpl\195\164tze pro Zeile";
		Strings.PluginOption3 = " Zeigen Sie den Fensterrand an";
		Strings.PluginOption10 = "\195\132nderungen validieren";
		------------------------------------------------------------------------------------------
		-- Français --
		------------------------------------------------------------------------------------------
elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
		Strings.PluginName = "Beorningus";
		Strings.PluginText = "Par Homeo";
		Strings.PluginEscEnable = "Touche Escape activ\195\169";
		Strings.PluginEscDesable = "Touche Escape desactiv\195\169";
		Strings.PluginAltEnable = "Touche Alt activ\195\169";
		Strings.PluginAltDesable = "Touche Alt desactiv\195\169";
		Strings.PluginOptionsText = "Beorningus Options";
		Strings.PluginWindowShow = "Affiche la fen\195\168tre.";
		Strings.PluginWindowHide = "Cache la fen\195\168tre.";
		------------------------------------------------------------------------------------------
		-- help --
		------------------------------------------------------------------------------------------
		Strings.PluginHelp1 = "\n\nListe des commandes:\n";
		Strings.PluginHelp2 = "/Class show - affiche la fen\195\168tre.\n";
		Strings.PluginHelp3 = "/Class hide - cache la fen\195\168tre.\n";
		Strings.PluginHelp4 = "/Class options - affiche la fen\195\168tre d'options.\n";
		Strings.PluginHelp5 = "/Class esc - active ou desactive la touche escape.\n";
		Strings.PluginHelp6 = "/Class clear - efface tous les raccourcis.\n";
		Strings.PluginHelp7 = "/Class lock pour verrouill\195\169 ou d\195\169verrouill\195\169 les icones\n";
		Strings.PluginHelp8 = "/Class toggle - affiche ou cache la fenetre\n\n";
		Strings.PluginHelp9 = "/Class alt - Active ou d\195\169sactive la touche alt pour le d\195\169placement de l'icon.\n";
		Strings.PluginHelp10 = "Clique droit sur l'icon pour afficher la fen\195\168tre d'options";
		------------------------------------------------------------------------------------------
		-- command text  --
		------------------------------------------------------------------------------------------
		Strings.PluginWindowShow = "Affiche la fen\195\168tre.";
		Strings.PluginWindowHide = "Cache la fen\195\168tre.";
		Strings.PluginWindowClear = "Efface tous les raccourcis.";
		Strings.PluginLocked = "Icones verrouill\195\169es";
		Strings.PluginUnlocked = "Icones d\195\169verouill\195\169es";
		------------------------------------------------------------------------------------------
		-- option window --
		------------------------------------------------------------------------------------------
		Strings.PluginOption1 = "Nombre de lignes";
		Strings.PluginOption2 = "Nombre d'emplacements par ligne";
		Strings.PluginOption3 = " Afficher la bordure de la fenetre";
		Strings.PluginOption10 = "Valider les changements";
		------------------------------------------------------------------------------------------
		-- English --
		------------------------------------------------------------------------------------------
elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
		Strings.PluginName = "Beorningus";
		Strings.PluginText = "By Homeo";
		Strings.PluginEscEnable = "Escape key Activated";
		Strings.PluginEscDesable = "Escape key Desactivated";
		Strings.PluginAltEnable = "Alt key Activated";
		Strings.PluginAltDesable = "Alt key Desactivated";
		Strings.PluginOptionsText = "Options Beorningus";
		Strings.PluginWindowShow = "Show the window.";
		Strings.PluginWindowHide = "Hide the window.";
		------------------------------------------------------------------------------------------
		-- help --
		------------------------------------------------------------------------------------------
		Strings.PluginHelp1 = "\n\nList of all commands:\n";
		Strings.PluginHelp2 = "/Class show - show the window.\n";
		Strings.PluginHelp3 = "/Class hide - hide the window.\n";
		Strings.PluginHelp4 = "/Class options - display the options window.\n";
		Strings.PluginHelp5 = "/Class esc - activate or deactivate the escape key.\n";
		Strings.PluginHelp6 = "/Class clear - delete all shortcuts.\n";
		Strings.PluginHelp7 = "/Class lock to lock or unlock the icons\n";
		Strings.PluginHelp8 = "/Class toggle - display or hide the window\n\n";
		Strings.PluginHelp9 = "/Class alt - Activate or deactivate the alt key to move the icon.\n";
		Strings.PluginHelp10 = "Right click the icon to show the options panel";
		------------------------------------------------------------------------------------------
		-- command text  --
		------------------------------------------------------------------------------------------
		Strings.PluginWindowShow = "show the window.";
		Strings.PluginWindowHide = "hide the window.";
		Strings.PluginWindowClear = "delete all shortcuts.";
		Strings.PluginLocked = "Icons Locked";
		Strings.PluginUnlocked = "Icons Unlocked";
		------------------------------------------------------------------------------------------
		-- option window --
		------------------------------------------------------------------------------------------
		Strings.PluginOption1 = "Number of lines";
		Strings.PluginOption3 = " Display the window border";
		Strings.PluginOption2 = "Number of slots per line";
		Strings.PluginOption10 = "Validate Changes";
	end
end
