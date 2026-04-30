------------------------------------------------------------------------------------------
-- Load and save file
-- Written by Homeopatix
-- 10 january 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create or load the settings
------------------------------------------------------------------------------------------
function LoadSettings()
	local _settings = PatchDataLoad(Turbine.DataScope.Character, "Beorningus_Settings", settings);
    if (_settings ~= nil) then 
		settings = _settings; 
	end

		------------------------------------------------------------------------------------------
	--- adding new vars in the settings file ---
------------------------------------------------------------------------------------------
	if( not settings.isLocked or
    not settings.altEnable)then
    settings = {
        windowPosition = { 
            xPos = 500, 
            yPos = 500 
        },
        optionsWindowPosition = { 
            xPos = 500, 
            yPos = 500 
        },
        IconPosition = { 
            xPosIcon = 500, 
            yPosIcon = 500 
        },
        shortcuts = { 
            Data1 = settings["shortcuts"]["Data1"], 
            Data2 = settings["shortcuts"]["Data2"],
            Type1 = settings["shortcuts"]["Type"], 
            Type2 = settings["shortcuts"]["Type"]
        },
        isMinimizeEnabled = { 
            isMinimizeEnabled = true 
        },
        isWindowVisible = { 
            isWindowVisible = true 
        },
        isOptionsWindowVisible = { 
            isOptionsWindowVisible = false 
        },
        escEnable = { 
            escEnable = false 
        },
        altEnable = { 
            altEnable = false 
        },
        borderShow = { 
            value = true 
        },
        isLocked = { 
            value = true
        }
    };                                                                                    
    end
end
------------------------------------------------------------------------------------------
-- create the save settings
------------------------------------------------------------------------------------------
function SaveSettings()
	settings["windowPosition"]["xPos"] = tostring(BeorningusWindow:GetLeft());
    settings["windowPosition"]["yPos"] = tostring(BeorningusWindow:GetTop());
	settings["optionsWindowPosition"]["xPos"] = tostring(OptionsWindow:GetLeft());
	settings["optionsWindowPosition"]["yPos"] = tostring(OptionsWindow:GetTop());
    settings["IconPosition"]["xPosIcon"] = tostring(MainMinimizedIcon:GetLeft());
   	settings["IconPosition"]["yPosIcon"] = tostring(MainMinimizedIcon:GetTop());
	settings["isMinimizeEnabled"]["isMinimizeEnabled"] = settings["isMinimizeEnabled"]["isMinimizeEnabled"];
	settings["isWindowVisible"]["isWindowVisible"] = settings["isWindowVisible"]["isWindowVisible"];
    settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = settings["isOptionsWindowVisible"]["isOptionsWindowVisible"];
	settings["escEnable"]["escEnable"] = settings["escEnable"]["escEnable"];
    settings["altEnable"]["altEnable"] = settings["altEnable"]["altEnable"];
    settings.isLocked = settings.isLocked;

	for i=1, 2 do
		settings["shortcuts"]["Data" .. i] = settings["shortcuts"]["Data" .. i];
	end

	settings["shortcuts"]["Type1"] = settings["shortcuts"]["Type1"];
    settings["shortcuts"]["Type2"] = settings["shortcuts"]["Type2"];

	------------------------------------------------------------------------------------------
    -- save the settings --
    ------------------------------------------------------------------------------------------
	PatchDataSave( Turbine.DataScope.Character, "Beorningus_Settings", settings);
end