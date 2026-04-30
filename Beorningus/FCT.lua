------------------------------------------------------------------------------------------
-- fonctions file
-- Written by Homeopatix
-- 10 january 2022
------------------------------------------------------------------------------------------
-- clear the main window
------------------------------------------------------------------------------------------
function ClearWindow()
	for i=1, 100 do
		settings["shortcuts"]["Data" .. i] = "";
		settings["shortcuts"]["Type" .. i] = "";
		if(centerQS[i] ~= nil)then
			centerQS[i]:SetShortcut( Turbine.UI.Lotro.Shortcut( ));
		end
	end
end
------------------------------------------------------------------------------------------
-- display the list of command
------------------------------------------------------------------------------------------
function commandsHelp()
	notification(
		rgb["start"] .. 
		Strings.PluginHelp1 ..
		rgb["clear"] ..
		Strings.PluginHelp2 ..
		Strings.PluginHelp3 ..
		Strings.PluginHelp4 ..
		Strings.PluginHelp5 ..
		Strings.PluginHelp6 ..
		Strings.PluginHelp7 ..
		Strings.PluginHelp8 ..
		Strings.PluginHelp9 ..
		Strings.PluginHelp10
	);
end
------------------------------------------------------------------------------------------
-- event handler for escape key
------------------------------------------------------------------------------------------
function EscapeKeyPressed()
	BeorningusWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			if(settings["escEnable"]["escEnable"] == false) then
				BeorningusWindow:SetVisible(false);
				settings["isWindowVisible"]["isWindowVisible"] = false;
				SaveSettings();
			end
			OptionsWindow:SetVisible(false);
			settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
			SaveSettings();
		end
	
		-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
		if ( args.Action == 268435635 ) then
			hudVisible=not hudVisible;
			if hudVisible then
				BeorningusWindow:SetVisible(false);
				MainMinimizedIcon:SetVisible(false);
			else
				BeorningusWindow:SetVisible(settings["isWindowVisible"]["isWindowVisible"]);
				MainMinimizedIcon:SetVisible(true);
			end
		end
	end
end
------------------------------------------------------------------------------------------
-- window position changed
------------------------------------------------------------------------------------------
function WindowPositionChanged()
	BeorningusWindow.PositionChanged = function( sender, args )
   		local x,y = BeorningusWindow:GetPosition();
		settings["windowPosition"]["xPos"] = x;
   		settings["windowPosition"]["yPos"] = y;
		settings["optionsWindowPosition"]["xPos"] = x;
		settings["optionsWindowPosition"]["yPos"] = y;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- options window position changed
------------------------------------------------------------------------------------------

function OptionsWindowPositionChanged()
	OptionsWindow.PositionChanged = function( sender, args )
		local x,y = OptionsWindow:GetPosition();
		settings["optionsWindowPosition"]["xPos"] = x;
		settings["optionsWindowPosition"]["yPos"] = y;
		SaveSettings();
	end
end


function CreateAndHandleMinimizeIcon()
	if(settings["isWindowVisible"]["isWindowVisible"] == true)then
		MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, BeorningusWindow:SetVisible(true));
	else
		MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, BeorningusWindow:SetVisible(false));
	end

	MainMinimizedIcon:SetPosition(settings["IconPosition"]["xPosIcon"], settings["IconPosition"]["yPosIcon"]);
	MainMinimizedIcon:SetZOrder(0);

	MainMinimizedIcon.PositionChanged = function()
		settings["IconPosition"]["xPosIcon"] = MainMinimizedIcon:GetLeft();
		settings["IconPosition"]["yPosIcon"] = MainMinimizedIcon:GetTop();
		SaveSettings();
	end
end