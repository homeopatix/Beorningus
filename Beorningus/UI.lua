------------------------------------------------------------------------------------------
-- UI file
-- Written by Homeopatix
-- 10 january 2022
------------------------------------------------------------------------------------------
-- create the window
------------------------------------------------------------------------------------------
centerWindow = {};
centerLabel = {};
centerQS = {};

function GenerateWindow()

		local horizontalPosition = 20 ;
		local verticalPosition = 40;
		local nbrSlot = 0;
		local windowWidth = 150;
		local windowHeight = 0;

		windowHeight = 110;
		local totalSlots = 2;

		if(settings["borderShow"]["value"] == true)then
			BeorningusWindow=Turbine.UI.Lotro.GoldWindow(); 
		else
			BeorningusWindow=Turbine.UI.Extensions.SimpleWindow(); 
		end 
		BeorningusWindow:SetSize(windowWidth, windowHeight); 
		BeorningusWindow:SetText(Strings.PluginName); 

		BeorningusWindow.Message=Turbine.UI.Label(); 
		BeorningusWindow.Message:SetParent(BeorningusWindow); 
		BeorningusWindow.Message:SetSize(150,10); 
		BeorningusWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 20 ); 
		BeorningusWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		if(settings["borderShow"]["value"] == true)then
			BeorningusWindow.Message:SetText(Strings.PluginText); 
		else
			BeorningusWindow.Message:SetText(""); 
		end 
		

		BeorningusWindow:SetZOrder(0);
		BeorningusWindow:SetWantsKeyEvents(true);
		BeorningusWindow:SetWantsUpdates(true);

		BeorningusWindow:SetPosition(settings["windowPosition"]["xPos"], settings["windowPosition"]["yPos"]);

		------------------------------------------------------------------------------------------
		-- center window --
		------------------------------------------------------------------------------------------
		verticalPosition = 40;
		horizontalPosition = 30;

		for i=1, totalSlots do
			
			
			centerWindow[i] = Turbine.UI.Extensions.SimpleWindow();
			centerWindow[i]:SetSize( 40 , 40 );
			centerWindow[i]:SetParent( BeorningusWindow );
			centerWindow[i]:SetPosition( horizontalPosition , verticalPosition);
			centerWindow[i]:SetVisible( true );
			centerWindow[i]:SetBackColor( Turbine.UI.Color( .3, .5, .7, .5) );

			centerLabel = Turbine.UI.Label();
			centerLabel:SetParent(centerWindow[i]);
			centerLabel:SetPosition( 0, 0 );
			centerLabel:SetSize( 40, 40  );
			centerLabel:SetText( "" );
			centerLabel:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
			centerLabel:SetZOrder(-1);
			centerLabel:SetMouseVisible(false);

			centerQS[i] = Turbine.UI.Lotro.Quickslot();
			centerQS[i]:SetParent( centerWindow[i] );
			centerQS[i]:SetPosition( 1, 1 );
			centerQS[i]:SetSize( 36, 36 );
			centerQS[i]:SetUseOnRightClick(false);

			nbrSlot = nbrSlot + 1;
			horizontalPosition = horizontalPosition + 50;
		end
------------------------------------------------------------------------------------------
-- setting the datas	
------------------------------------------------------------------------------------------
	SettingTheShortCuts();
	DragAndDrop();
	DeleteShortCutes();
	EscapeKeyPressed();
	ClosingTheWindow();
end
------------------------------------------------------------------------------------------
-- setting the shortcuts	
------------------------------------------------------------------------------------------
function SettingTheShortCuts()
		local totalSlots = 2;

		for i=1, totalSlots do
			if(settings["shortcuts"]["Data" .. i] ~= "") then
				centerQS[i]:SetShortcut( Turbine.UI.Lotro.Shortcut( settings["shortcuts"]["Type" .. i], settings["shortcuts"]["Data" .. i] ) );
			end
		end
end
------------------------------------------------------------------------------------------
-- setting the shortcuts for drag and drop	
------------------------------------------------------------------------------------------
function DragAndDrop()
	local totalSlots = 2;

	for i=1, totalSlots do
		centerQS[i].DragDrop = function(sender, args)
			local tmp = Turbine.UI.Lotro.Quickslot();

			tmp = centerQS[i]:GetShortcut();
			tmp = tmp:GetData();

			settings["shortcuts"]["Data" .. i] = tmp;

			tmp2 = centerQS[i]:GetShortcut();
			tmp2 = tmp2:GetType();

			settings["shortcuts"]["Type" .. i] = tmp2;

			SaveSettings();
		end
	end
end
------------------------------------------------------------------------------------------
-- delete the shortcut with mouse wheel
------------------------------------------------------------------------------------------
function DeleteShortCutes()
	local totalSlots = 2;

	for i=1, totalSlots do
		centerQS[i].MouseWheel = function(sender, args)
			if(settings.isLocked == false)then
				settings["shortcuts"]["Data" .. i] = ""; 
				settings["shortcuts"]["Type" .. i] = "";
				centerQS[i]:SetShortcut(Turbine.UI.Lotro.Shortcut());
				SaveSettings();
			end
		end
	end
end
------------------------------------------------------------------------------------------
-- MousCLick Handler
------------------------------------------------------------------------------------------
function MouseClickHandlerForRandomMount()
	centerQSRandom.MouseClick = function(sender, args)
		BeorningusWindow:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheWindow()
	function BeorningusWindow:Closing(sender, args)
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- updating the window
------------------------------------------------------------------------------------------
function UpdateWindow()
	GenerateWindow();
end