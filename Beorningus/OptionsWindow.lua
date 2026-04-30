------------------------------------------------------------------------------------------
-- OptionWindow file
-- Written by Homeopatix
-- 10 january 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- define size of the window
------------------------------------------------------------------------------------------
local windowWidth = 0;
local windowHeight = 0;
local positionInitiale = 0;

windowWidth = 400;
windowHeight = 300;
positionInitiale = 40;
------------------------------------------------------------------------------------------
-- create the options window
------------------------------------------------------------------------------------------
function GenerateOptionsWindow()
		OptionsWindow=Turbine.UI.Lotro.GoldWindow(); 
		OptionsWindow:SetSize(windowWidth, windowHeight); 
		OptionsWindow:SetText(Strings.PluginOptionsText); 

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(150,10); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 17 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetText(Strings.PluginText); 

		OptionsWindow:SetZOrder(0);
		OptionsWindow:SetWantsKeyEvents(true);

		OptionsWindow:SetPosition((Turbine.UI.Display:GetWidth()-OptionsWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-OptionsWindow:GetHeight())/2);
		OptionsWindow:SetVisible(false);

		------------------------------------------------------------------------------------------
		-- center window
		------------------------------------------------------------------------------------------
		checkBoxKeep = Turbine.UI.Lotro.CheckBox();
		checkBoxKeep:SetParent( OptionsWindow );
		checkBoxKeep:SetSize(350, 20); 
		checkBoxKeep:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxKeep:SetText(Strings.PluginOption3);
		checkBoxKeep:SetPosition(windowWidth/2 - 100, 150);
		checkBoxKeep:SetVisible(true);
		if(settings["borderShow"]["value"] == true)then
			checkBoxKeep:SetChecked(true);
		else
			checkBoxKeep:SetChecked(false);
		end
		checkBoxKeep:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

		buttonValider = Turbine.UI.Lotro.GoldButton();
		buttonValider:SetParent( OptionsWindow );
		buttonValider:SetPosition(windowWidth/2 - 125, 250);
		buttonValider:SetSize( 300, 20 );
		buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		buttonValider:SetText( Strings.PluginOption10 );
		buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		buttonValider:SetVisible(true);
		buttonValider:SetMouseVisible(true);

		ValidateChanges();
end
------------------------------------------------------------------------------------------
-- boutton valider
------------------------------------------------------------------------------------------
function ValidateChanges()
	buttonValider.MouseClick = function(sender, args)

			if (checkBoxKeep:IsChecked()) then
				settings["borderShow"]["value"] = true;
			else
				settings["borderShow"]["value"] = false;
			end

			OptionsWindow:SetVisible(false);
			settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;

			SaveSettings();
			UpdateWindow();
			UpdateOptionsWindow();
			ClosingTheOptionsWindow();
		end
end
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheOptionsWindow()
	function OptionsWindow:Closing(sender, args)
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- updating the options window
------------------------------------------------------------------------------------------
function UpdateOptionsWindow()
	GenerateOptionsWindow();
	EscapeKeyPressed();
	ClosingTheWindow();
	ClosingTheOptionsWindow();
end