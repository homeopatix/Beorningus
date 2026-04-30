------------------------------------------------------------------------------------------
-- Command file
-- Written by Homeopatix
-- 10 january 2022
------------------------------------------------------------------------------------------
BeorningusCommand = Turbine.ShellCommand();
------------------------------------------------------------------------------------------
-- commands
------------------------------------------------------------------------------------------
function BeorningusCommand:Execute( command, arguments )
	------------------------------------------------------------------------------------------
	-- Help command--
	------------------------------------------------------------------------------------------
	if ( arguments == "help" ) then
		commandsHelp();
	elseif ( arguments == "show" ) then
		Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowShow);
		BeorningusWindow:SetVisible(true);
		settings["isWindowVisible"]["isWindowVisible"] = true;
		SaveSettings();
	elseif ( arguments == "hide" ) then
		Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowHide);
		BeorningusWindow:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
	elseif ( arguments == "lock" ) then
		--Turbine.Shell.WriteLine("Hide the PopoHelper Window");
		if(settings.isLocked == false)then
			settings.isLocked = true;
			Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginLocked);
		else
			settings.isLocked = false;
			Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginUnlocked);
		end
		SaveSettings();
------------------------------------------------------------------------------------------
-- toggle command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "toggle" ) then
		if(settings["isWindowVisible"]["isWindowVisible"] == true)then
			Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowHide);
			BeorningusWindow:SetVisible(false);
			settings["isWindowVisible"]["isWindowVisible"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowShow);
			BeorningusWindow:SetVisible(true);
			settings["isWindowVisible"]["isWindowVisible"] = true;
		end
		SaveSettings();
	elseif ( arguments == "options" ) then
		Turbine.Shell.WriteLine("Display the options Window");
		OptionsWindow:SetVisible(true);
		BeorningusWindow:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = true;
		SaveSettings();
	elseif ( arguments == "clear" ) then
		Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowClear);
		ClearWindow();
		SaveSettings();
	elseif ( arguments == "esc" ) then
		if(settings["escEnable"]["escEnable"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginEscDesable);
			settings["escEnable"]["escEnable"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginEscEnable);
			settings["escEnable"]["escEnable"] = true;
		end
		SaveSettings();
	------------------------------------------------------------------------------------------
	-- alt command--
	------------------------------------------------------------------------------------------
	elseif ( arguments == "alt" ) then
		if(settings["altEnable"]["altEnable"] == true) then
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltDesable);
			settings["altEnable"]["altEnable"] = false;
		else
			Turbine.Shell.WriteLine(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltEnable);
			settings["altEnable"]["altEnable"] = true;
		end
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- Add the sahell command --
------------------------------------------------------------------------------------------
Turbine.Shell.AddCommand( "Beo;Beorningus", BeorningusCommand );