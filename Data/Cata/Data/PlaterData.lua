local NUI = unpack(NaowhUI)

NUI.PlaterData = {
	["aura_breakline_space"] = 15,
	["script_data"] = {
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["Time"] = 1604599472,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
			["Enabled"] = true,
			["Revision"] = 355,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 6",
					["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Change Nameplate Color",
					["Value"] = true,
					["Key"] = "changeNameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "change to true to change the color",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Nameplate Color",
					["Value"] = {
						1, -- [1]
						0, -- [2]
						0.52549019607843, -- [3]
						1, -- [4]
					},
					["Key"] = "nameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "increase the nameplate height by this value",
					["Min"] = 0,
					["Name"] = "Nameplate Size Offset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "nameplateSizeOffset",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						1, -- [1]
						0.71372549019608, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotsColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 5,
					["Name"] = "Skull Texture",
					["Value"] = "Skull Texture",
					["Key"] = "option10",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [10]
				{
					["Type"] = 1,
					["Name"] = "Skull Color",
					["Value"] = {
						1, -- [1]
						0.46274509803922, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "skullColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "",
					["Min"] = 0,
					["Name"] = "Alpha",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "skullAlpha",
				}, -- [12]
				{
					["Type"] = 2,
					["Max"] = 2,
					["Desc"] = "",
					["Min"] = 0.4,
					["Name"] = "Scale",
					["Value"] = 0.6,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "skullScale",
				}, -- [13]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
			["SpellIds"] = {
			},
			["Name"] = "Unit - Important [Plater]",
			["NpcNames"] = {
				"164362", -- [1]
				"168882", -- [2]
				"168988", -- [3]
				"170234", -- [4]
				"165905", -- [5]
				"170452", -- [6]
				80875, -- [7]
				163746, -- [8]
				152033, -- [9]
			},
		}, -- [1]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
			["Time"] = 1669327144,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["Enabled"] = true,
			["Revision"] = 632,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Add the buff name in the trigger box.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
			["SpellIds"] = {
				398151, -- [1]
				323149, -- [2]
				324392, -- [3]
				340544, -- [4]
				342189, -- [5]
				333227, -- [6]
				163689, -- [7]
				227931, -- [8]
				233210, -- [9]
				300207, -- [10]
				301629, -- [11]
				297133, -- [12]
				377738, -- [13]
				378149, -- [14]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Glow Enabled",
					["Value"] = false,
					["Key"] = "glowEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Glow Color",
					["Value"] = {
						0.403921568627451, -- [1]
						0.00392156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "glowColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Name"] = "Dots Enabled",
					["Value"] = true,
					["Key"] = "dotsEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Key"] = "dotsColor",
					["Value"] = {
						1, -- [1]
						0.3215686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Dots Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
			},
			["version"] = -1,
			["Name"] = "Aura - Buff Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [2]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.castBar, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1673994690,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_darkorange",
			["Enabled"] = true,
			["Revision"] = 828,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    Plater.SetCastBarColorForScript(self, scriptTable.config.useCastbarColor, scriptTable.config.castBarColor, envTable)\n    \n    --Dominator on Shadowmoon Burial Grounds\n    if (envTable._SpellID == 154327) then\n        if (UnitHealth(unitId) == UnitHealthMax(unitId)) then\n            if (envTable._Duration == 604800) then\n                Plater.SetCastBarColorForScript(self, scriptTable.config.useCastbarColor, {1, 0, 0, 1}, envTable)\n            end\n        end\n    end\nend",
			["SpellIds"] = {
				373046, -- [1]
				372863, -- [2]
				164686, -- [3]
				153072, -- [4]
				153680, -- [5]
				196497, -- [6]
				388886, -- [7]
				387145, -- [8]
				384365, -- [9]
				152964, -- [10]
				398150, -- [11]
				152801, -- [12]
				397878, -- [13]
				397914, -- [14]
				183263, -- [15]
				3636, -- [16]
				376171, -- [17]
				350687, -- [18]
				321247, -- [19]
				334522, -- [20]
				320232, -- [21]
				319962, -- [22]
				325879, -- [23]
				324427, -- [24]
				322999, -- [25]
				325360, -- [26]
				322903, -- [27]
				324103, -- [28]
				333294, -- [29]
				333540, -- [30]
				319521, -- [31]
				326021, -- [32]
				326450, -- [33]
				322711, -- [34]
				329104, -- [35]
				295000, -- [36]
				242391, -- [37]
				320197, -- [38]
				329608, -- [39]
				161090, -- [40]
				156301, -- [41]
				166341, -- [42]
				163379, -- [43]
				166923, -- [44]
				172952, -- [45]
				164426, -- [46]
				163665, -- [47]
				227578, -- [48]
				228528, -- [49]
				227789, -- [50]
				227779, -- [51]
				229608, -- [52]
				227925, -- [53]
				300129, -- [54]
				296522, -- [55]
				294349, -- [56]
				293854, -- [57]
				297834, -- [58]
				299588, -- [59]
				302682, -- [60]
				291946, -- [61]
				295169, -- [62]
				285440, -- [63]
				291613, -- [64]
				283551, -- [65]
				372735, -- [66]
				373017, -- [67]
				392488, -- [68]
				257732, -- [69]
				256060, -- [70]
				257899, -- [71]
				384633, -- [72]
				374339, -- [73]
				395694, -- [74]
				391634, -- [75]
				372701, -- [76]
				369328, -- [77]
				265487, -- [78]
				413044, -- [79]
				183526, -- [80]
				88194, -- [81]
				87762, -- [82]
				413385, -- [83]
				411001, -- [84]
				378282, -- [85]
				384161, -- [86]
				259572, -- [87]
				255371, -- [88]
				427460, -- [89]
				429172, -- [90]
				426500, -- [91]
				413607, -- [92]
				412922, -- [93]
				417481, -- [94]
				201399, -- [95]
				411994, -- [96]
				415770, -- [97]
				260907, -- [98]
				260703, -- [99]
				260741, -- [100]
				265876, -- [101]
				263959, -- [102]
				266225, -- [103]
				253517, -- [104]
				377488, -- [105]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Plays a big animation when the cast start.",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Option 4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Flash:",
					["Name"] = "Flash",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Fraction"] = true,
					["Value"] = 0.8,
					["Key"] = "flashDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Flash Duration",
				}, -- [6]
				{
					["Type"] = 1,
					["Key"] = "flashColor",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Flash Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [7]
				{
					["Type"] = 6,
					["Key"] = "option7",
					["Value"] = 0,
					["Name"] = "Option 7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 5,
					["Name"] = "Shake",
					["Value"] = "Shake:",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 0.5,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Fraction"] = true,
					["Value"] = 0.2,
					["Key"] = "shakeDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Duration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "How strong is the shake.",
					["Min"] = 1,
					["Fraction"] = false,
					["Value"] = 5,
					["Key"] = "shakeAmplitude",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Amplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Fraction"] = false,
					["Value"] = 40,
					["Key"] = "shakeFrequency",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Frequency",
				}, -- [12]
				{
					["Type"] = 6,
					["Key"] = "option13",
					["Value"] = 0,
					["Name"] = "Option 13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 5,
					["Key"] = "option14",
					["Value"] = "Dot Animation:",
					["Name"] = "Dot Animation",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [14]
				{
					["Type"] = 1,
					["Key"] = "dotColor",
					["Value"] = {
						0.5647058823529412, -- [1]
						0.5647058823529412, -- [2]
						0.5647058823529412, -- [3]
						1, -- [4]
					},
					["Name"] = "Dot Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dots around the nameplate",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 8,
					["Key"] = "xOffset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [16]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Key"] = "yOffset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Dot Y Offset",
				}, -- [17]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [18]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [19]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [20]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [21]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [22]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [23]
				{
					["Type"] = 5,
					["Key"] = "option19",
					["Value"] = "Cast Bar",
					["Name"] = "Option 19",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [24]
				{
					["Type"] = 4,
					["Key"] = "useCastbarColor",
					["Value"] = true,
					["Name"] = "Use Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Use cast bar color.",
				}, -- [25]
				{
					["Type"] = 1,
					["Key"] = "castBarColor",
					["Value"] = {
						0.4117647058823529, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Cast bar color.",
				}, -- [26]
			},
			["version"] = -1,
			["Name"] = "Cast - Very Important [Plater]",
			["NpcNames"] = {
			},
		}, -- [3]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\n    \n    Plater.DenyColorChange(unitFrame, false)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to run the update as fast as the game framerate\n    self.ThrottleUpdate = 0\n    \n    if (scriptTable.config.useNameplateColor) then\n        Plater.SetNameplateColor(unitFrame, envTable.NameplateColor)\n    end\n    \n    local dotSpeed = abs(envTable._Duration - envTable._RemainingTime) + 1.5\n    envTable.dotAnimation.textureInfo.speedMultiplier = dotSpeed\nend\n\n\n\n\n",
			["Time"] = 1670201853,
			["url"] = "",
			["Icon"] = 2175503,
			["Enabled"] = false,
			["Revision"] = 533,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    Plater.SetCastBarColorForScript(self, true, scriptTable.config.castBarColor, envTable)\n    \n    if (scriptTable.config.useNameplateColor) then\n        envTable.NameplateColor = Plater.GetColorByPriority(unitFrame, scriptTable.config.healthBarColor)\n        Plater.DenyColorChange(unitFrame, true)\n    end       \nend\n\n\n\n\n\n\n",
			["SpellIds"] = {
				240446, -- [1]
				385339, -- [2]
				198077, -- [3]
				210261, -- [4]
				360857, -- [5]
				273577, -- [6]
				389446, -- [7]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Fraction"] = false,
					["Value"] = 3,
					["Name"] = "Cast Bar Height Mod",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [1]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.5843137254901961, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Changes the cast bar color to this one.",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 5,
					["Name"] = "Arrow:",
					["Value"] = "Arrow:",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Show Arrow",
					["Value"] = true,
					["Key"] = "showArrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Arrow alpha.",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 1,
					["Name"] = "Arrow Alpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowAlpha",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Width.",
					["Min"] = 4,
					["Name"] = "Arrow Width",
					["Value"] = 8,
					["Key"] = "arrowWidth",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Height.",
					["Min"] = 4,
					["Fraction"] = false,
					["Value"] = 8,
					["Name"] = "Arrow Height",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowHeight",
				}, -- [8]
				{
					["Type"] = 6,
					["Name"] = "Option 13",
					["Value"] = 0,
					["Key"] = "option13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 5,
					["Name"] = "Dot Animation:",
					["Value"] = "Dot Animation:",
					["Key"] = "option12",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [10]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						1, -- [1]
						0.615686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dot animation.",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot X Offset",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 4,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "xOffset",
				}, -- [12]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot Y Offset",
					["Min"] = -10,
					["Key"] = "yOffset",
					["Value"] = 3,
					["Name"] = "Dot Y Offset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [13]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "Option 18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [14]
				{
					["Type"] = 5,
					["Key"] = "option17",
					["Value"] = "Nameplate Color",
					["Name"] = "Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [15]
				{
					["Type"] = 4,
					["Name"] = "Change Nameplate Color",
					["Value"] = false,
					["Key"] = "useNameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Change Nameplate Color",
				}, -- [16]
				{
					["Type"] = 1,
					["Key"] = "healthBarColor",
					["Value"] = {
						1, -- [1]
						0.1843137294054031, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Health Bar Color",
				}, -- [17]
			},
			["version"] = -1,
			["Name"] = "Explosion Affix M+ [Plater]",
			["NpcNames"] = {
			},
		}, -- [4]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Time"] = 1669327144,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["Enabled"] = true,
			["Revision"] = 368,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Desc"] = "Add the debuff name in the trigger box.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
			["SpellIds"] = {
				337220, -- [1]
				337253, -- [2]
				337251, -- [3]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Glow Enabled",
					["Value"] = false,
					["Key"] = "glowEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Glow Color",
					["Value"] = {
						0.403921568627451, -- [1]
						0.00392156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "glowColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Name"] = "Dots Enabled",
					["Value"] = true,
					["Key"] = "dotsEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Key"] = "dotsColor",
					["Value"] = {
						1, -- [1]
						0.3215686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Dots Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
			},
			["version"] = -1,
			["Name"] = "Aura - Debuff Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [5]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\", 7)\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsShowingCastBarTest) then\n        --don't execute on battlegrounds and arenas\n        if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n            return\n        end    \n    end\n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1670203603,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
			["Enabled"] = true,
			["Revision"] = 1194,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (not Plater.IsShowingCastBarTest) then\n        if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n            return\n        end\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    Plater.SetCastBarColorForScript(self, scriptTable.config.useCastbarColor, scriptTable.config.castbarColor, envTable)\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				396640, -- [1]
				372743, -- [2]
				377389, -- [3]
				396812, -- [4]
				388392, -- [5]
				387955, -- [6]
				386546, -- [7]
				377503, -- [8]
				384808, -- [9]
				386024, -- [10]
				387615, -- [11]
				387606, -- [12]
				225100, -- [13]
				211401, -- [14]
				211470, -- [15]
				215433, -- [16]
				192563, -- [17]
				198959, -- [18]
				152818, -- [19]
				156776, -- [20]
				398206, -- [21]
				153524, -- [22]
				396073, -- [23]
				396018, -- [24]
				345202, -- [25]
				377950, -- [26]
				372223, -- [27]
				338353, -- [28]
				334748, -- [29]
				334749, -- [30]
				320784, -- [31]
				341352, -- [32]
				341520, -- [33]
				341522, -- [34]
				336005, -- [35]
				339777, -- [36]
				331933, -- [37]
				326617, -- [38]
				324914, -- [39]
				324776, -- [40]
				326046, -- [41]
				340634, -- [42]
				319070, -- [43]
				328295, -- [44]
				317936, -- [45]
				327413, -- [46]
				319654, -- [47]
				323821, -- [48]
				320772, -- [49]
				324293, -- [50]
				330562, -- [51]
				330868, -- [52]
				341902, -- [53]
				342139, -- [54]
				342675, -- [55]
				323190, -- [56]
				332836, -- [57]
				327648, -- [58]
				328217, -- [59]
				322938, -- [60]
				340544, -- [61]
				325876, -- [62]
				325700, -- [63]
				323552, -- [64]
				332666, -- [65]
				332612, -- [66]
				332706, -- [67]
				340026, -- [68]
				294171, -- [69]
				292910, -- [70]
				294165, -- [71]
				338871, -- [72]
				330813, -- [73]
				335694, -- [74]
				327461, -- [75]
				329787, -- [76]
				304946, -- [77]
				15245, -- [78]
				276754, -- [79]
				304831, -- [80]
				277036, -- [81]
				320657, -- [82]
				294362, -- [83]
				270248, -- [84]
				292926, -- [85]
				350421, -- [86]
				352158, -- [87]
				349985, -- [88]
				329239, -- [89]
				328400, -- [90]
				164192, -- [91]
				176032, -- [92]
				166335, -- [93]
				166387, -- [94]
				162066, -- [95]
				163689, -- [96]
				227592, -- [97]
				228254, -- [98]
				227999, -- [99]
				227987, -- [100]
				232115, -- [101]
				29580, -- [102]
				227616, -- [103]
				241828, -- [104]
				228606, -- [105]
				227800, -- [106]
				228239, -- [107]
				229706, -- [108]
				294884, -- [109]
				301629, -- [110]
				284219, -- [111]
				301689, -- [112]
				300650, -- [113]
				297835, -- [114]
				300171, -- [115]
				300087, -- [116]
				300414, -- [117]
				300436, -- [118]
				301088, -- [119]
				293729, -- [120]
				291928, -- [121]
				384194, -- [122]
				392451, -- [123]
				392924, -- [124]
				397889, -- [125]
				209413, -- [126]
				207980, -- [127]
				257397, -- [128]
				257736, -- [129]
				382787, -- [130]
				374699, -- [131]
				377402, -- [132]
				369602, -- [133]
				369465, -- [134]
				369400, -- [135]
				381593, -- [136]
				265091, -- [137]
				265433, -- [138]
				382791, -- [139]
				376780, -- [140]
				225573, -- [141]
				278444, -- [142]
				164887, -- [143]
				168082, -- [144]
				76813, -- [145]
				227913, -- [146]
				265368, -- [147]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 3",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Cast Bar Color Enabled",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.4313725490196079, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Name"] = "Flash Duration",
					["Value"] = 0.4,
					["Key"] = "flashDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Name"] = "Cast Bar Height Mod",
					["Value"] = 5,
					["Key"] = "castBarHeight",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.2,
					["Key"] = "shakeDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 100,
					["Desc"] = "How strong is the shake.",
					["Min"] = 2,
					["Fraction"] = false,
					["Value"] = 8,
					["Key"] = "shakeAmplitude",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Amplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Fraction"] = false,
					["Value"] = 40,
					["Key"] = "shakeFrequency",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Frequency",
				}, -- [12]
			},
			["version"] = -1,
			["Name"] = "Cast - Big Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [6]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        envTable.flashIn = Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        envTable.flashOut = Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    envTable.flashIn:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.flashOut:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.SmallFlashTexture:SetColorTexture (Plater:ParseColors(scriptTable.config.flashColor))\n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    \nend\n\n\n",
			["Time"] = 1669325410,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
			["Enabled"] = true,
			["Revision"] = 662,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
			["SpellIds"] = {
				376851, -- [1]
				396044, -- [2]
				381517, -- [3]
				373932, -- [4]
				397801, -- [5]
				208165, -- [6]
				392576, -- [7]
				198750, -- [8]
				387843, -- [9]
				387411, -- [10]
				211299, -- [11]
				198595, -- [12]
				198934, -- [13]
				198962, -- [14]
				156722, -- [15]
				320170, -- [16]
				320171, -- [17]
				320462, -- [18]
				330712, -- [19]
				332170, -- [20]
				333875, -- [21]
				326836, -- [22]
				342135, -- [23]
				333861, -- [24]
				341969, -- [25]
				317963, -- [26]
				327481, -- [27]
				328331, -- [28]
				322614, -- [29]
				325701, -- [30]
				326438, -- [31]
				323538, -- [32]
				321764, -- [33]
				296523, -- [34]
				330755, -- [35]
				295929, -- [36]
				296019, -- [37]
				335685, -- [38]
				170751, -- [39]
				342207, -- [40]
				350554, -- [41]
				348513, -- [42]
				351779, -- [43]
				328180, -- [44]
				319898, -- [45]
				166335, -- [46]
				172810, -- [47]
				172943, -- [48]
				173148, -- [49]
				163376, -- [50]
				228011, -- [51]
				228277, -- [52]
				29928, -- [53]
				228559, -- [54]
				230050, -- [55]
				374743, -- [56]
				227615, -- [57]
				229716, -- [58]
				229083, -- [59]
				299525, -- [60]
				300514, -- [61]
				285388, -- [62]
				294324, -- [63]
				294180, -- [64]
				293827, -- [65]
				297128, -- [66]
				294015, -- [67]
				291865, -- [68]
				281420, -- [69]
				274383, -- [70]
				259092, -- [71]
				367521, -- [72]
				374544, -- [73]
				385039, -- [74]
				382474, -- [75]
				369823, -- [76]
				377500, -- [77]
				260879, -- [78]
				186269, -- [79]
				378818, -- [80]
				371875, -- [81]
				372225, -- [82]
				200658, -- [83]
				266036, -- [84]
				265407, -- [85]
				164965, -- [86]
				429176, -- [87]
				428526, -- [88]
				418200, -- [89]
				407124, -- [90]
				200630, -- [91]
				415437, -- [92]
				264050, -- [93]
				267824, -- [94]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Plays a small animation when the cast start.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 3",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Name"] = "Flash Duration",
					["Value"] = 0.6,
					["Key"] = "flashDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Flash Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "flashColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [6]
			},
			["version"] = -1,
			["Name"] = "Cast - Small Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [7]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
			["Time"] = 1615905300,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Revision"] = 110,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Enabled"] = true,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
			["Name"] = "Aura - Invalidate Unit [Plater]",
			["PlaterCore"] = 1,
			["Prio"] = 99,
			["SpellIds"] = {
				261265, -- [1]
				261266, -- [2]
				271590, -- [3]
			},
			["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
			["NpcNames"] = {
			},
		}, -- [8]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
			["Time"] = 1596198406,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
			["Icon"] = 135024,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
			["Revision"] = 62,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
			["Enabled"] = true,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
			["Name"] = "Color Change [Plater]",
			["PlaterCore"] = 1,
			["Prio"] = 99,
			["SpellIds"] = {
			},
			["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
			["NpcNames"] = {
				"141851", -- [1]
			},
		}, -- [9]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        --if not envTable.blinkTexture then\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        --end\n        \n        envTable.glowEffect = envTable.glowEffect or self.overlay or Plater.CreateIconGlow (self)\n        --envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
			["Time"] = 1626382829,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
			["Enabled"] = true,
			["Revision"] = 375,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option10",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 17",
					["Value"] = "Enter the spell name or spellID in the Add Trigger box and hit \"Add\".",
					["Key"] = "option17",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option10",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Blink Enabled",
					["Value"] = true,
					["Key"] = "blinkEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'false' to disable blink",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Glow Enabled",
					["Value"] = true,
					["Key"] = "glowEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'false' to disable glows",
				}, -- [5]
				{
					["Type"] = 4,
					["Name"] = "Change NamePlate Color",
					["Value"] = false,
					["Key"] = "changeNameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'true' to enable nameplate color change",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "in seconds, affects the blink effect only",
					["Min"] = 1,
					["Name"] = "Timeleft to Blink",
					["Value"] = 3,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "timeleftToBlink",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 3,
					["Desc"] = "time to complete a blink loop",
					["Min"] = 0.5,
					["Name"] = "Blink Speed",
					["Value"] = 1,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "blinkSpeed",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
					["Min"] = 0.1,
					["Name"] = "Blink Max Alpha",
					["Value"] = 0.6,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "blinkMaxAlpha",
				}, -- [9]
				{
					["Type"] = 1,
					["Name"] = "Blink Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "blinkColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "color of the blink",
				}, -- [10]
				{
					["Type"] = 1,
					["Name"] = "Nameplate Color",
					["Value"] = {
						0.28627450980392, -- [1]
						0.003921568627451, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "nameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "nameplate color if ChangeNameplateColor is true",
				}, -- [11]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option10",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [12]
				{
					["Type"] = 4,
					["Name"] = "Timer Color Enabled",
					["Value"] = true,
					["Key"] = "timerColorEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'false' to disable changes in the color of the time left text",
				}, -- [13]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "in seconds, affects the color of the text",
					["Min"] = 1,
					["Name"] = "Time Left Warning",
					["Value"] = 8,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "timeLeftWarning",
				}, -- [14]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "in seconds, affects the color of the text",
					["Min"] = 1,
					["Name"] = "Time Left Critical",
					["Value"] = 3,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "timeLeftCritical",
				}, -- [15]
				{
					["Type"] = 1,
					["Name"] = "Warning Color",
					["Value"] = {
						1, -- [1]
						0.87058823529412, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "warningColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "color when the time left entered in a warning zone",
				}, -- [16]
				{
					["Type"] = 1,
					["Name"] = "Critical Color",
					["Value"] = {
						1, -- [1]
						0.074509803921569, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "criticalColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "color when the time left is critical",
				}, -- [17]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
			["SpellIds"] = {
			},
			["Name"] = "Aura - Blink by Time Left [Plater]",
			["NpcNames"] = {
			},
		}, -- [10]
		{
			["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
			["Time"] = 1543680853,
			["Icon"] = 133006,
			["Enabled"] = false,
			["Revision"] = 45,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Name"] = "Aura - Border Color [Plater]",
			["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
			["NpcNames"] = {
			},
		}, -- [11]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
			["Time"] = 1578054190,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
			["Icon"] = 136048,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
			["Revision"] = 133,
			["Options"] = {
			},
			["Author"] = "Celian-Sylvanas",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
			["Name"] = "UnitPower [Plater]",
			["PlaterCore"] = 1,
			["Enabled"] = true,
			["SpellIds"] = {
			},
			["Desc"] = "Show the energy amount above the nameplate",
			["NpcNames"] = {
				"Guardian of Yogg-Saron", -- [1]
			},
		}, -- [12]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local movingArrowTexture = unitFrame._movingArrowTexture\n    if (not movingArrowTexture) then\n        movingArrowTexture = self:CreateTexture(nil, \"artwork\", nil, 6)\n        unitFrame._movingArrowTexture = movingArrowTexture\n    end\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (unitFrame._movingArrowTexture, \n        function() \n            unitFrame._movingArrowTexture:Show() \n            unitFrame._movingArrowTexture:SetPoint(\"left\", 0, 0)\n        end, \n        function() unitFrame._movingArrowTexture:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    envTable.arrowAnimation = envTable.arrowAnimation or Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.20, self:GetWidth()-16, 0)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\nend\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    unitFrame._movingArrowTexture:SetAlpha(scriptTable.config.arrowAlpha)\n    \n    local percent = envTable.movingAnimation:GetProgress()\n    \n    if (percent < 0.4) then\n        local value = Lerp(0.01, scriptTable.config.arrowAlpha, percent) or 0\n        unitFrame._movingArrowTexture:SetAlpha(Saturate(value))\n        \n    elseif (percent > 0.6) then\n        local value = Lerp(scriptTable.config.arrowAlpha, 0.01, percent) or 0\n        unitFrame._movingArrowTexture:SetAlpha(Saturate(value))\n    end\n    \n    --unitFrame._movingArrowTexture:SetAlpha(1)\n    \n    self.ThrottleUpdate = 0\nend",
			["Time"] = 1670202265,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_frontal",
			["Enabled"] = true,
			["Revision"] = 620,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    unitFrame._movingArrowTexture:SetTexture([[Interface\\PETBATTLES\\PetBattle-StatIcons]])\n    unitFrame._movingArrowTexture:SetSize(16, self:GetHeight() - 2)\n    unitFrame._movingArrowTexture:SetTexCoord(unpack({0, 15/32, 18/32, 30/32}))\n    unitFrame._movingArrowTexture:SetAlpha(scriptTable.config.arrowAlpha)\n    unitFrame._movingArrowTexture:SetDesaturated(scriptTable.config.desaturateArrow)    \n    \n    unitFrame._movingArrowTexture:SetParent(self.FrameOverlay)\n    unitFrame._movingArrowTexture:SetDrawLayer(\"overlay\",  7)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\n    envTable.movingAnimation:Play()\nend\n\n\n",
			["SpellIds"] = {
				375943, -- [1]
				385958, -- [2]
				388623, -- [3]
				377034, -- [4]
				374361, -- [5]
				381525, -- [6]
				386660, -- [7]
				385578, -- [8]
				384699, -- [9]
				153501, -- [10]
				153686, -- [11]
				154442, -- [12]
				192018, -- [13]
				219488, -- [14]
				372087, -- [15]
				391726, -- [16]
				391723, -- [17]
				377383, -- [18]
				388976, -- [19]
				370764, -- [20]
				387067, -- [21]
				391118, -- [22]
				391136, -- [23]
				382233, -- [24]
				209027, -- [25]
				212031, -- [26]
				207261, -- [27]
				207979, -- [28]
				198888, -- [29]
				199805, -- [30]
				199050, -- [31]
				191508, -- [32]
				152792, -- [33]
				153395, -- [34]
				323489, -- [35]
				323496, -- [36]
				319941, -- [37]
				319592, -- [38]
				334266, -- [39]
				325258, -- [40]
				334913, -- [41]
				326221, -- [42]
				322936, -- [43]
				323236, -- [44]
				321834, -- [45]
				336752, -- [46]
				325418, -- [47]
				324667, -- [48]
				327233, -- [49]
				324368, -- [50]
				324205, -- [51]
				323943, -- [52]
				319713, -- [53]
				320596, -- [54]
				320729, -- [55]
				323608, -- [56]
				330614, -- [57]
				320063, -- [58]
				332708, -- [59]
				334023, -- [60]
				317231, -- [61]
				317943, -- [62]
				320966, -- [63]
				334053, -- [64]
				328458, -- [65]
				321968, -- [66]
				331718, -- [67]
				325793, -- [68]
				330453, -- [69]
				326997, -- [70]
				334051, -- [71]
				292903, -- [72]
				330843, -- [73]
				294173, -- [74]
				189200, -- [75]
				352833, -- [76]
				330403, -- [77]
				166675, -- [78]
				176127, -- [79]
				166380, -- [80]
				162058, -- [81]
				167516, -- [82]
				166923, -- [83]
				178299, -- [84]
				172982, -- [85]
				163390, -- [86]
				173384, -- [87]
				173514, -- [88]
				29513, -- [89]
				227672, -- [90]
				228603, -- [91]
				227339, -- [92]
				227493, -- [93]
				241774, -- [94]
				229611, -- [95]
				229151, -- [96]
				300188, -- [97]
				299475, -- [98]
				299502, -- [99]
				300777, -- [100]
				301681, -- [101]
				298946, -- [102]
				298940, -- [103]
				300424, -- [104]
				283422, -- [105]
				294290, -- [106]
				291973, -- [107]
				293986, -- [108]
				291878, -- [109]
				292264, -- [110]
				209495, -- [111]
				257426, -- [112]
				255952, -- [113]
				257870, -- [114]
				413147, -- [115]
				383107, -- [116]
				377559, -- [117]
				388060, -- [118]
				376170, -- [119]
				384524, -- [120]
				375351, -- [121]
				390111, -- [122]
				369791, -- [123]
				369573, -- [124]
				369563, -- [125]
				369335, -- [126]
				369061, -- [127]
				375727, -- [128]
				265016, -- [129]
				265019, -- [130]
				260793, -- [131]
				260292, -- [132]
				272457, -- [133]
				272609, -- [134]
				269843, -- [135]
				183465, -- [136]
				226296, -- [137]
				188169, -- [138]
				183088, -- [139]
				410873, -- [140]
				411012, -- [141]
				88308, -- [142]
				382708, -- [143]
				375251, -- [144]
				375439, -- [145]
				372311, -- [146]
				373742, -- [147]
				372201, -- [148]
				374533, -- [149]
				377204, -- [150]
				201226, -- [151]
				204667, -- [152]
				198379, -- [153]
				200768, -- [154]
				253239, -- [155]
				250258, -- [156]
				255567, -- [157]
				194956, -- [158]
				427510, -- [159]
				426645, -- [160]
				412505, -- [161]
				412129, -- [162]
				419351, -- [163]
				401482, -- [164]
				404916, -- [165]
				200345, -- [166]
				200261, -- [167]
				198641, -- [168]
				265372, -- [169]
				271174, -- [170]
				264694, -- [171]
				264923, -- [172]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Produces an effect to indicate the spell will hit players in front of the enemy.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 4",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 3",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Set the alpha of the moving arrow",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 0.73,
					["Name"] = "Arrow Alpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowAlpha",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Time that takes for an arrow to travel from the to right.",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 0.2,
					["Name"] = "Animation Speed",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "animSpeed",
				}, -- [6]
				{
					["Type"] = 4,
					["Name"] = "Use White Arrow",
					["Value"] = false,
					["Key"] = "desaturateArrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If enabled, the arrow color will be desaturated.",
				}, -- [7]
			},
			["version"] = -1,
			["Name"] = "Cast - Frontal Cone [Plater]",
			["NpcNames"] = {
			},
		}, -- [13]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
			["Time"] = 1604239880,
			["url"] = "",
			["Icon"] = 1029718,
			["Enabled"] = true,
			["Revision"] = 269,
			["semver"] = "",
			["Author"] = "Celian-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Options"] = {
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Show above the nameplate who is the player fixated",
			["SpellIds"] = {
			},
			["Name"] = "Fixate [Plater]",
			["NpcNames"] = {
				"165560", -- [1]
			},
		}, -- [14]
		{
			["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1604087921,
			["url"] = "",
			["Icon"] = 841383,
			["Enabled"] = true,
			["Revision"] = 266,
			["semver"] = "",
			["Author"] = "Tecno-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Options"] = {
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["SpellIds"] = {
				"spawn of g'huun", -- [1]
				"smuggled crawg", -- [2]
				"sergeant bainbridge", -- [3]
				"blacktooth scrapper", -- [4]
				"irontide grenadier", -- [5]
				"feral bloodswarmer", -- [6]
				"earthrager", -- [7]
				"crawler mine", -- [8]
				"rezan", -- [9]
			},
			["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
			["Name"] = "Fixate On You [Plater]",
			["NpcNames"] = {
			},
		}, -- [15]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TextSize = 12\n    envTable.TextFont  = \"Gotham Ultra\"\n    envTable.Xoffset = 0\n    envTable.Yoffset = -12\n    \n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"center\", unitFrame.healthBar, \"center\", envTable.Xoffset, envTable.Yoffset);    \n    \n    envTable.FixateTarget.textsize = envTable.TextSize\n    envTable.FixateTarget.textfont = envTable.TextFont\n    \n    \n    \nend\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    \n    \nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        \n        \n    else \n        envTable.FixateTarget.text = \"\"\n        \n    end    \nend\n\n\n\n\n\n\n\n\n",
			["Time"] = 1605189097,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TextSize = 12\n    envTable.TextFont  = \"Gotham Ultra\"\n    envTable.Xoffset = 0\n    envTable.Yoffset = -12\n    \n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"center\", unitFrame.healthBar, \"center\", envTable.Xoffset, envTable.Yoffset);    \n    \n    envTable.FixateTarget.textsize = envTable.TextSize\n    envTable.FixateTarget.textfont = envTable.TextFont\n    \n    \n    \nend\n\n\n\n\n\n\n\n\n",
			["url"] = "https://wago.io/cQbyWpQeE/3",
			["Icon"] = 1029718,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    \n    \nend\n\n\n",
			["Enabled"] = true,
			["Revision"] = 302,
			["semver"] = "1.0.2",
			["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        \n        \n    else \n        envTable.FixateTarget.text = \"\"\n        \n    end    \nend\n\n\n\n\n\n\n\n\n",
			["Author"] = "Celian-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    \n    \nend\n\n\n",
			["SpellIds"] = {
				272584, -- [1]
				244653, -- [2]
				260954, -- [3]
				257739, -- [4]
				257314, -- [5]
				266107, -- [6]
				257582, -- [7]
				262377, -- [8]
				257407, -- [9]
			},
			["Prio"] = 99,
			["Name"] = "Fixate No cast",
			["PlaterCore"] = 1,
			["version"] = 3,
			["Desc"] = "Show above the nameplate who is the player fixated",
			["Options"] = {
			},
			["NpcNames"] = {
				"Earthrager", -- [1]
				"Spiteful Shade", -- [2]
				"Carrion Worm", -- [3]
			},
		}, -- [16]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\n    \n    Plater.DenyColorChange(unitFrame, false)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n    if (scriptTable.config.useNameplateColor) then\n        Plater.SetNameplateColor(unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["Time"] = 1670790652,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_red",
			["Enabled"] = true,
			["Revision"] = 694,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Used on casts that make the mob explode or transform if the cast passes.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    else\n        envTable.topArrow:Hide()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    local customColor = scriptTable.config.castColor[tostring(envTable._SpellID)]\n    \n    Plater.SetCastBarColorForScript(self, scriptTable.config.useCastbarColor, customColor or scriptTable.config.castBarColor, envTable)\n    \n    if (scriptTable.config.useNameplateColor) then\n        local npcIdString = tostring(envTable._NpcID)\n        envTable.NameplateColor = Plater.GetColorByPriority(unitFrame, scriptTable.config.healthBarColor)        \n        Plater.DenyColorChange(unitFrame, true)            \n    end\n    \nend",
			["SpellIds"] = {
				383823, -- [1]
				382670, -- [2]
				388537, -- [3]
				372851, -- [4]
				200682, -- [5]
				192307, -- [6]
				196838, -- [7]
				193827, -- [8]
				194043, -- [9]
				209410, -- [10]
				211464, -- [11]
				361180, -- [12]
				156718, -- [13]
				395859, -- [14]
				358320, -- [15]
				374045, -- [16]
				386757, -- [17]
				367500, -- [18]
				370225, -- [19]
				376200, -- [20]
				332329, -- [21]
				320103, -- [22]
				321406, -- [23]
				335817, -- [24]
				321061, -- [25]
				320141, -- [26]
				326171, -- [27]
				163966, -- [28]
				227966, -- [29]
				372107, -- [30]
				388923, -- [31]
				376934, -- [32]
				384899, -- [33]
				373960, -- [34]
				374724, -- [35]
				385551, -- [36]
				259732, -- [37]
				373424, -- [38]
				373084, -- [39]
				87618, -- [40]
				255041, -- [41]
				428926, -- [42]
				76634, -- [43]
				200050, -- [44]
				197546, -- [45]
				198079, -- [46]
				199193, -- [47]
				266181, -- [48]
				253544, -- [49]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Plays a special animation showing the explosion time.",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Option 3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "Increases the health bar height by this value",
					["Min"] = 0,
					["Key"] = "castBarHeight",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Health Bar Height Mod",
				}, -- [4]
				{
					["Type"] = 4,
					["Key"] = "useNameplateColor",
					["Value"] = true,
					["Name"] = "Change Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Change Nameplate Color",
				}, -- [5]
				{
					["Type"] = 1,
					["Key"] = "healthBarColor",
					["Value"] = {
						1, -- [1]
						0.5843137254901961, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Nameplate Color",
				}, -- [6]
				{
					["Type"] = 6,
					["Key"] = "option7",
					["Value"] = 0,
					["Name"] = "Option 7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 4,
					["Name"] = "Use Cast Bar Color",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show an arrow above Use Cast Bar Color",
				}, -- [8]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.431372, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Cast Bar Color",
				}, -- [9]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [10]
				{
					["Type"] = 5,
					["Key"] = "option6",
					["Value"] = "Arrow:",
					["Name"] = "Arrow:",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [11]
				{
					["Type"] = 4,
					["Name"] = "Show Arrow",
					["Value"] = true,
					["Key"] = "showArrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
				}, -- [12]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Arrow alpha.",
					["Min"] = 0,
					["Key"] = "arrowAlpha",
					["Value"] = 0.5,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Arrow Alpha",
				}, -- [13]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Width.",
					["Min"] = 4,
					["Fraction"] = false,
					["Value"] = 8,
					["Name"] = "Arrow Width",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowWidth",
				}, -- [14]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Height.",
					["Min"] = 4,
					["Key"] = "arrowHeight",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Arrow Height",
				}, -- [15]
				{
					["Type"] = 6,
					["Key"] = "option13",
					["Value"] = 0,
					["Name"] = "Option 13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [16]
				{
					["Type"] = 5,
					["Key"] = "option12",
					["Value"] = "Dot Animation:",
					["Name"] = "Dot Animation:",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [17]
				{
					["Type"] = 1,
					["Key"] = "dotColor",
					["Value"] = {
						1, -- [1]
						0.615686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Dot Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dot animation.",
				}, -- [18]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot X Offset",
					["Min"] = -10,
					["Key"] = "xOffset",
					["Value"] = 4,
					["Name"] = "Dot X Offset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [19]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot Y Offset",
					["Min"] = -10,
					["Fraction"] = false,
					["Value"] = 3,
					["Key"] = "yOffset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Dot Y Offset",
				}, -- [20]
				{
					["Type"] = 7,
					["Key"] = "castColor",
					["Value"] = {
						{
							"200682", -- [1]
							"darkslateblue", -- [2]
						}, -- [1]
						{
							"192307", -- [1]
							"goldenrod", -- [2]
						}, -- [2]
						{
							"196838", -- [1]
							"maroon", -- [2]
						}, -- [3]
						{
							"193827", -- [1]
							"darkgreen", -- [2]
						}, -- [4]
						{
							"194043", -- [1]
							"darkgreen", -- [2]
						}, -- [5]
						{
							"156718", -- [1]
							"DRUID", -- [2]
						}, -- [6]
						{
							"395859", -- [1]
							"ROGUE", -- [2]
						}, -- [7]
					},
					["Name"] = "Color List by SpellId",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_list",
					["Desc"] = "Insert the spellId in the Key, and the color name in the Value",
				}, -- [21]
			},
			["version"] = -1,
			["Name"] = "Cast - Ultra Important [P]",
			["NpcNames"] = {
			},
		}, -- [17]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
			["Time"] = 1612442358,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
			["url"] = "",
			["Icon"] = "Interface\\Worldmap\\GlowSkull_64Grey",
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Enabled"] = false,
			["Revision"] = 64,
			["semver"] = "",
			["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
			["Author"] = "Aelerolor-Torghast",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
			},
			["Prio"] = 99,
			["Name"] = "Auto Set Skull",
			["PlaterCore"] = 1,
			["version"] = -1,
			["Desc"] = "Auto set skull marker",
			["Options"] = {
				{
					["Type"] = 5,
					["Name"] = "Option 1",
					["Value"] = "Auto set a raid target Skull on the unit.",
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 6,
					["Name"] = "Option 2",
					["Value"] = 0,
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 4,
					["Name"] = "Only in Combat",
					["Value"] = false,
					["Key"] = "onlyInCombat",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Set the mark only if the unit is in combat.",
				}, -- [3]
			},
			["NpcNames"] = {
				"163520", -- [1]
				"163618", -- [2]
				"164506", -- [3]
			},
		}, -- [18]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n--[=[\n\n154564 - debug\n\n168098 - empowered coldheart agent\n156212 - coldheart agent\n\n\n\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --check if can change the nameplate color\n    if (scriptTable.config.changeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, scriptTable.config.nameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["Time"] = 1604607993,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
			["Enabled"] = true,
			["Revision"] = 406,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    unitFrame.healthBar.MainTargetDotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + scriptTable.config.nameplateSizeOffset)\n    \nend\n\n\n\n\n\n\n\n",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 6",
					["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Change Nameplate Color",
					["Value"] = true,
					["Key"] = "changeNameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "change to true to change the color",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Nameplate Color",
					["Value"] = {
						1, -- [1]
						0, -- [2]
						0.52549019607843, -- [3]
						1, -- [4]
					},
					["Key"] = "nameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "increase the nameplate height by this value",
					["Min"] = 0,
					["Name"] = "Nameplate Size Offset",
					["Value"] = 0,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "nameplateSizeOffset",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						1, -- [1]
						0.71372549019608, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotsColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [9]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
			["SpellIds"] = {
			},
			["Name"] = "Unit - Main Target [P]",
			["NpcNames"] = {
				"156212", -- [1]
				"168098", -- [2]
				179124, -- [3]
			},
		}, -- [19]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1604354364,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\Images\\countdown_bar_icon",
			["Enabled"] = true,
			["Revision"] = 206,
			["semver"] = "",
			["Author"] = "Aelerolor-Torghast",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Options"] = {
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Some units has special events without a clear way to show. This script adds a second cast bar to inform the user about it.",
			["SpellIds"] = {
			},
			["Name"] = "Countdown",
			["NpcNames"] = {
				"164427", -- [1]
				"164414", -- [2]
				"164185", -- [3]
				"164567", -- [4]
				"165408", -- [5]
			},
		}, -- [20]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        [154564] = {80, 30},   --debug\n        [164451] = {40}, --dessia the decapirator - theater of pain\n        [164463] = {40}, --Paceran the Virulent - theater of pain\n        [164461] = {40}, -- Sathel the Accursed - theater of pain\n        [165946]= {50}, -- ~mordretha - thather of pain\n        [164501] = {70, 40, 10}, --mistcaller - tina scythe\n        [164218] = {70, 40}, --Lord Chamberlain - Halls of Atonement\n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, unitFrame.healthBar:GetHeight())\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, unitFrame.healthBar:GetHeight())\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (unitLifePercent - percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"left\", unitFrame.healthMarker, \"right\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
			["Time"] = 1606506781,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\health_indicator",
			["Enabled"] = true,
			["Revision"] = 109,
			["semver"] = "",
			["Author"] = "Aelerolor-Torghast",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
			["Options"] = {
				{
					["Type"] = 5,
					["Name"] = "Option 1",
					["Value"] = "Add markers into the health bar to remind you about boss abilities at life percent.",
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 6,
					["Name"] = "blank line",
					["Value"] = 0,
					["Key"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 1,
					["Name"] = "Vertical Line Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "indicatorColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Indicator color.",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Indicator alpha.",
					["Min"] = 0.1,
					["Name"] = "Vertical Line Alpha",
					["Value"] = 0.79,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "indicatorAlpha",
				}, -- [4]
				{
					["Type"] = 6,
					["Name"] = "blank line",
					["Value"] = 0,
					["Key"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Fill Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "fillColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Fill color.",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Fill alpha.",
					["Min"] = 0,
					["Name"] = "Fill Alpha",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "fillAlpha",
				}, -- [7]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Place a marker into the health bar to indicate when the unit will change phase or cast an important spell.",
			["SpellIds"] = {
			},
			["Name"] = "Unit - Health Markers [P]",
			["NpcNames"] = {
				"164451", -- [1]
				"164463", -- [2]
				"164461", -- [3]
				"165946", -- [4]
				"164501", -- [5]
				"164218", -- [6]
			},
		}, -- [21]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1618996775,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_tank",
			["Enabled"] = true,
			["Revision"] = 843,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 3",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Cast Bar Color Enabled",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.43137254901961, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Name"] = "Flash Duration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Name"] = "Cast Bar Height Mod",
					["Value"] = 0,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.1,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 200,
					["Desc"] = "How strong is the shake.",
					["Min"] = 10,
					["Name"] = "Shake Amplitude",
					["Value"] = 25,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 30,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [12]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Cast alert for abilities which only the tank can interrupt.",
			["SpellIds"] = {
				321828, -- [1]
			},
			["Name"] = "Cast - Tank Interrupt [P]",
			["NpcNames"] = {
			},
		}, -- [22]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
			["Time"] = 1604357453,
			["url"] = "",
			["Icon"] = 136048,
			["Enabled"] = true,
			["Revision"] = 233,
			["semver"] = "",
			["Author"] = "Celian-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "script desc",
					["Value"] = "Show the power of the unit above the nameplate.",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "add trigger",
					["Value"] = "Add the unit name or unitId in the \"Add Trigger\" field and press \"Add\".",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 2",
					["Value"] = 0,
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Show at 80% of Energy",
					["Value"] = true,
					["Key"] = "showLater",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If enabled, the energy won't start showing until the unit has 80% energy.",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Option 2",
					["Value"] = 0,
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "Text size.",
					["Min"] = 8,
					["Name"] = "Text Size",
					["Value"] = 16,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "fontSize",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Font Color",
					["Value"] = {
						0.80392156862745, -- [1]
						0.80392156862745, -- [2]
						0.80392156862745, -- [3]
						1, -- [4]
					},
					["Key"] = "fontColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the text.",
				}, -- [8]
				{
					["Type"] = 4,
					["Name"] = "Enable Text Outline",
					["Value"] = true,
					["Key"] = "outline",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If enabled, the text uses outline.",
				}, -- [9]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Show the energy amount above the nameplate.",
			["SpellIds"] = {
			},
			["Name"] = "Unit - Show Energy [Plater]",
			["NpcNames"] = {
				"164406", -- [1]
				"164407", -- [2]
				"162100", -- [3]
				"162099", -- [4]
				"162329", -- [5]
				"164558", -- [6]
				150159, -- [7]
			},
		}, -- [23]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    if (not unitFrame.spitefulTexture) then\n        unitFrame.spitefulTexture = unitFrame.healthBar:CreateTexture(nil, \"overlay\", nil, 6)\n        unitFrame.spitefulTexture:SetPoint('right', 0, 0)\n        unitFrame.spitefulTexture:SetSize(27, 14)\n        unitFrame.spitefulTexture:SetColorTexture(.3, .3, 1, .7)\n        \n        unitFrame.spitefulText = unitFrame.healthBar:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)\n        DetailsFramework:SetFontFace (unitFrame.spitefulText, \"2002\")\n        unitFrame.spitefulText:SetPoint(\"right\", unitFrame.spitefulTexture, \"right\", -2, 0)\n        unitFrame.spitefulText:SetJustifyH(\"right\")\n        \n        unitFrame.roleIcon = unitFrame:CreateTexture(nil, \"overlay\")\n        unitFrame.roleIcon:SetPoint(\"left\", unitFrame.healthBar, \"left\", 2, 0)\n        unitFrame.targetName = unitFrame:CreateFontString(nil, \"overlay\", \"GameFontNormal\")\n        unitFrame.targetName:SetPoint(\"left\", unitFrame.roleIcon, \"right\", 2, 0)\n        \n        unitFrame.spitefulTexture:Hide()\n        unitFrame.spitefulText:Hide()\n    end\n    \n    function envTable.UpdateSpitefulWidget(unitFrame)\n        \n        local r, g, b, a = Plater:ParseColors(scriptTable.config.bgColor)\n        unitFrame.spitefulTexture:SetColorTexture(r, g, b, a)\n        unitFrame.spitefulTexture:SetSize(scriptTable.config.bgWidth, unitFrame.healthBar:GetHeight())   \n        Plater:SetFontSize(unitFrame.spitefulText, scriptTable.config.textSize)\n        Plater:SetFontColor(unitFrame.spitefulText, scriptTable.config.textColor)\n        \n        local currentHealth = unitFrame.healthBar.CurrentHealth\n        local maxHealth = unitFrame.healthBar.CurrentHealthMax\n        \n        local healthPercent = currentHealth / maxHealth * 100\n        local timeToDie = format(\"%.1fs\", healthPercent / 8)\n        unitFrame.spitefulText:SetText(timeToDie)\n        \n        unitFrame.spitefulText:Show()\n        unitFrame.spitefulTexture:Show()\n        \n        if scriptTable.config.switchTargetName then\n            local plateFrame = unitFrame.PlateFrame\n            \n            local target = UnitName(unitFrame.namePlateUnitToken .. \"target\") or UnitName(unitFrame.namePlateUnitToken)\n            \n            if (target and target ~= \"\") then\n                local _, class = UnitClass(unitFrame.namePlateUnitToken .. \"target\")\n                if (class) then\n                    target = DetailsFramework:AddClassColorToText(target, class)\n                end\n                \n                local role = UnitGroupRolesAssigned(unitFrame.namePlateUnitToken .. \"target\")\n                if (role and role ~= \"NONE\") then\n                    target = DetailsFramework:AddRoleIconToText(target, role)\n                end\n                \n                plateFrame.namePlateUnitName = target\n                Plater.UpdateUnitName(plateFrame)\n            end\n        end\n        \n        if scriptTable.config.useTargetingColor then\n            local targeted = UnitIsUnit(unitFrame.namePlateUnitToken .. \"target\", \"player\")\n            if targeted then\n                Plater.SetNameplateColor (unitFrame, scriptTable.config.targetingColor)\n            else\n                Plater.RefreshNameplateColor(unitFrame)\n            end\n        end\n    end\nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    if (unitFrame.spitefulTexture) then\n        unitFrame.spitefulText:Hide()\n        unitFrame.spitefulTexture:Hide()    \n        unitFrame.roleIcon:Hide()\n        unitFrame.targetName:Hide()\n    end\nend\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
			["Time"] = 1611844883,
			["url"] = "",
			["Icon"] = 135945,
			["Enabled"] = false,
			["Revision"] = 186,
			["semver"] = "",
			["Author"] = "Symantec-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateSpitefulWidget(unitFrame)\nend\n\n\n",
			["Options"] = {
				{
					["Type"] = 5,
					["Name"] = "Time to Die",
					["Value"] = "Time to Die",
					["Key"] = "option12",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 2,
					["Max"] = 50,
					["Desc"] = "",
					["Min"] = 10,
					["Name"] = "Width",
					["Value"] = 27,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "bgWidth",
				}, -- [2]
				{
					["Type"] = 1,
					["Name"] = "Background Color",
					["Value"] = {
						0.50588235294118, -- [1]
						0.070588235294118, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "bgColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 24,
					["Desc"] = "",
					["Min"] = 7,
					["Name"] = "Text Size",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "textSize",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Text Color",
					["Value"] = {
						1, -- [1]
						0.5843137254902, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "textColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 5,
					["Name"] = "Targeting",
					["Value"] = "Targeting",
					["Key"] = "option11",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 4,
					["Name"] = "Show Target instead of Name",
					["Value"] = true,
					["Key"] = "switchTargetName",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 4,
					["Name"] = "Change Color if targeting You",
					["Value"] = true,
					["Key"] = "useTargetingColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 1,
					["Name"] = "Color if targeting You",
					["Value"] = {
						0.070588235294118, -- [1]
						0.61960784313725, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "targetingColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [10]
				{
					["Type"] = 6,
					["Name"] = "Option 11",
					["Value"] = 0,
					["Key"] = "option11",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [11]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Time to die Spiteful affix",
			["SpellIds"] = {
			},
			["Name"] = "M+ Spiteful",
			["NpcNames"] = {
				"174773", -- [1]
			},
		}, -- [24]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    function envTable.SetCastbarSize(unitFrame, envTable, unitId, scriptTable)\n        local spellId = envTable._SpellID\n        local overridedSize = scriptTable.config.customSize[tostring(spellId)]\n        \n        if (overridedSize) then\n            local width, height = Plater.GetNumbersFromString(overridedSize)\n            Plater.SetCastBarSize(unitFrame, width, height)\n        else\n            local castBarWidth = scriptTable.config.width\n            local castBarHeight = scriptTable.config.height\n            Plater.SetCastBarSize(unitFrame, castBarWidth, castBarHeight)\n        end\n        \n        --update timer text\n        Plater:SetFontSize (unitFrame.castBar.percentText, scriptTable.config.timerFontSize)\n    end\n    \n    --sub divisions\n    \n    unitFrame.CastbarIsTimerVerticalLines = unitFrame.CastbarIsTimerVerticalLines or {}\n    local amountOfLines = 6\n    local animationSpeed = 0.2\n    \n    local onAnimationStop = function(self)\n        self:GetParent():Hide()\n    end\n    \n    if (not unitFrame.CastbarIsTimerVerticalLines[1]) then\n        for i = 1, amountOfLines do\n            local verticalLine = unitFrame.castBar:CreateTexture(nil, \"border\", nil, -3)\n            unitFrame.CastbarIsTimerVerticalLines[i] = verticalLine\n            verticalLine:SetColorTexture(1, 1, 1, 1)\n            \n            local animationHub = Plater:CreateAnimationHub(verticalLine, onPlayFunc, onAnimationStop)       \n            Plater:CreateAnimation (animationHub, \"scale\", 1, animationSpeed, 1, 1, 2.5, 2.5)\n            Plater:CreateAnimation (animationHub, \"alpha\", 1, animationSpeed, 1, 0)\n            Plater:CreateAnimation (animationHub, \"translation\", 1, animationSpeed, -16, 0)\n            verticalLine.anim = animationHub\n        end\n        \n        --make an animation on the spark texture\n        local spark = unitFrame.castBar.Spark\n        local animationHub = Plater:CreateAnimationHub(spark, onPlayFunc, onStopFunc)\n        Plater:CreateAnimation (animationHub, \"scale\", 1, 0.2, 1.2, 1.2, 1, 1)\n        --Plater:CreateAnimation (animationHub, \"scale\", 1, 0.3, 1, 1, 1.2, 1.2)\n        --Plater:CreateAnimation (animationHub, \"scale\", 2, 0.2, 1.2, 1.2, 1, 1)\n        spark.bumpAnimation = animationHub\n        --Plater:CreateAnimation (animationHub, \"alpha\", 1, 0.5, 1, 0)\n        \n    end\n    \n    function envTable.UpdateLinePositions(unitFrame)\n        local lineTable = unitFrame.CastbarIsTimerVerticalLines\n        local castBarWidth = unitFrame.castBar:GetWidth()\n        local castBarHeight = unitFrame.castBar:GetHeight()\n\n        local spaceBetweenLines = castBarWidth / amountOfLines\n        local r, g, b, a = Plater:ParseColors(scriptTable.config.separatorColor)        \n        \n        for i = 1, amountOfLines do\n            local line = lineTable[i]\n            line:ClearAllPoints()\n            local xLocation = spaceBetweenLines * i\n            line:SetPoint(\"left\", unitFrame.castBar, \"left\", xLocation, 0)\n            line:SetSize(scriptTable.config.separatorWidth, castBarHeight)\n            line:SetColorTexture(r, g, b, a)\n            line:Show()\n            line:SetAlpha(1)\n            line:SetScale(1)\n            line.percent = xLocation / castBarWidth * 100\n            line.playedAnim = false\n            \n            if (i == amountOfLines) then\n                line:Hide()\n            end\n        end\n    end\n    \n    function envTable.HideLines(unitFrame)\n        local lineTable = unitFrame.CastbarIsTimerVerticalLines\n        for i = 1, amountOfLines do\n            local line = lineTable[i]\n            line:Hide()\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.HideLines(unitFrame)\n    \nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --override the update frequency to run every tick\n    unitFrame.castBar.ThrottleUpdate = -1\n    \n    \n    local lineTable = unitFrame.CastbarIsTimerVerticalLines\n    for i = 1, #lineTable do\n        local line = lineTable[i]\n        \n        if (not line.playedAnim)  then\n            if (envTable._CastPercent > line.percent) then\n                line.anim:Play()\n                line.playedAnim = true\n                \n                if (unitFrame.castBar.Spark.bumpAnimation:IsPlaying()) then\n                    unitFrame.castBar.Spark.bumpAnimation:Stop()\n                end\n                unitFrame.castBar.Spark.bumpAnimation:Play()                    \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1625697537,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_is_timer",
			["Enabled"] = true,
			["Revision"] = 282,
			["semver"] = "",
			["Author"] = "Ditador-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.SetCastbarSize(unitFrame, envTable, unitId, scriptTable)\n    \n    --override the update frequency to run every tick\n    unitFrame.castBar.ThrottleUpdate = -1\n    \n    envTable.UpdateLinePositions(unitFrame) \n    \n    unitFrame.castBar:SetAlpha(1)\nend\n\n\n\n\n",
			["Options"] = {
				{
					["Type"] = 7,
					["Name"] = "Customized Size (Key = Spell ID, Value = Width, Height)",
					["Value"] = {
						{
							"17", -- [1]
							"120, 16", -- [2]
						}, -- [1]
					},
					["Key"] = "customSize",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_list",
					["Desc"] = "Enter the spellId into the Key and width,height into the Value. Example: Key 17 Value 120,16",
				}, -- [1]
				{
					["Type"] = 2,
					["Max"] = 200,
					["Desc"] = "",
					["Min"] = 5,
					["Name"] = "Cast Bar Width",
					["Value"] = 120,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "width",
				}, -- [2]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "",
					["Min"] = 5,
					["Name"] = "Cast Bar Height",
					["Value"] = 16,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "height",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 5",
					["Value"] = 0,
					["Key"] = "option5",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "Set the size of the cast time",
					["Min"] = 8,
					["Name"] = "Cast Timer Size",
					["Value"] = 12,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "timerFontSize",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Option 6",
					["Value"] = 0,
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 5,
					["Name"] = "Option 7",
					["Value"] = "Time Separators",
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						0.5992676615715, -- [4]
					},
					["Key"] = "separatorColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "",
					["Min"] = 1,
					["Name"] = "Width",
					["Value"] = 1,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "separatorWidth",
				}, -- [9]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["SpellIds"] = {
				354080, -- [1]
			},
			["Desc"] = "When a spell resembles more a timer than a spell being cast",
			["Name"] = "Cast - Castbar is Timer [P]",
			["NpcNames"] = {
			},
		}, -- [25]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --create a texture to use for a flash behind the cast bar\n    \n    if (not unitFrame.backGroundFlashTextureImpTarget) then\n        unitFrame.backGroundFlashTextureImpTarget =  Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    end\n    \n    local backGroundFlashTexture = unitFrame.backGroundFlashTextureImpTarget\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\n    \n    --create the target unit name box\n    if (not unitFrame.targetBox) then\n        unitFrame.targetBox = CreateFrame(\"frame\", unitFrame:GetName() .. \"ScriptImportantTarget\", unitFrame, \"BackdropTemplate\")\n        unitFrame.targetBox:SetSize(80, 20)\n        unitFrame.targetBox:SetFrameStrata(\"TOOLTIP\")\n        unitFrame.targetBox:Hide()\n        unitFrame.targetBox:SetPoint(\"left\", unitFrame, \"right\", 0, 0)\n        \n        unitFrame.targetBox:SetBackdrop({edgeFile = [[Interface\\Buttons\\WHITE8X8]], edgeSize = 1, bgFile = [[Interface\\AddOns\\Details\\images\\background]], tile = true, tileSize = 16})\n        unitFrame.targetBox:SetBackdropColor(.2, .2, .2, .8)\n        unitFrame.targetBox:SetBackdropBorderColor(0, 0, 0, 1)\n        \n        unitFrame.targetBoxName = unitFrame.targetBox:CreateFontString(nil, \"artwork\", \"GameFontNormal\")\n        unitFrame.targetBoxName:SetPoint(\"center\")\n    end\n    \n    function envTable.UpdateTargetBox(unitFrame, unitId)\n        local targetUnitId = unitId .. \"target\"\n        local unitName = UnitName(targetUnitId)\n        \n        if (unitName) then\n            if (scriptTable.config.colorByClass) then\n                Plater:SetFontColor(unitFrame.targetBoxName, \"white\")\n                unitName = Plater.SetTextColorByClass(targetUnitId, unitName)\n            else\n                Plater:SetFontColor(unitFrame.targetBoxName, scriptTable.config.textColor)\n            end\n            \n            unitFrame.targetBoxName:SetText(unitName)\n            Plater:SetFontSize(unitFrame.targetBoxName, scriptTable.config.targetNameSize)\n            unitFrame.targetBox:SetBackdropColor(Plater:ParseColors(scriptTable.config.targetBgColor))\n            unitFrame.targetBox:SetBackdropBorderColor(Plater:ParseColors(scriptTable.config.targetBgBorderColor))\n            unitFrame.targetBox:Show()\n            \n            unitFrame.targetBox:SetWidth(scriptTable.config.targetFrameWidth)\n            unitFrame.targetBox:SetHeight(scriptTable.config.targetFrameHeight)\n            \n            if (not Plater.HasDotAnimationPlaying(unitFrame.targetBox)) then\n                envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.targetBox, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n            end\n            \n            unitFrame.backGroundFlashTextureImpTarget:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n            \n            return true\n            \n        end\n    end\n    \nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.targetBox, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \n    unitFrame.targetBox:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.UpdateTargetBox(unitFrame, unitId) \n    \nend\n\n\n",
			["Time"] = 1669339628,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_target",
			["Enabled"] = true,
			["Revision"] = 878,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Highlight the target name",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (envTable.UpdateTargetBox(unitFrame, unitId)) then\n        \n        envTable.BackgroundFlash:Play()\n        \n        Plater.FlashNameplateBorder (unitFrame, 0.05)   \n        Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n        \n        unitFrame:PlayFrameShake (envTable.FrameShake)\n        \n        if (envTable._CanInterrupt) then\n            if (scriptTable.config.useCastbarColor) then\n                self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n            end\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n",
			["SpellIds"] = {
				354173, -- [1]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Shows the target name in a separate box",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Option 4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Flash:",
					["Name"] = "Flash",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Name"] = "Flash Duration",
					["Value"] = 0.8,
					["Key"] = "flashDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [6]
				{
					["Type"] = 1,
					["Key"] = "flashColor",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Flash Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [7]
				{
					["Type"] = 6,
					["Key"] = "option7",
					["Value"] = 0,
					["Name"] = "Option 7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 5,
					["Name"] = "Shake",
					["Value"] = "Shake:",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 0.5,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.2,
					["Key"] = "shakeDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "How strong is the shake.",
					["Min"] = 1,
					["Name"] = "Shake Amplitude",
					["Value"] = 5,
					["Key"] = "shakeAmplitude",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 40,
					["Key"] = "shakeFrequency",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [12]
				{
					["Type"] = 6,
					["Key"] = "option13",
					["Value"] = 0,
					["Name"] = "Option 13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 5,
					["Key"] = "option14",
					["Value"] = "Dot Animation:",
					["Name"] = "Dot Animation",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [14]
				{
					["Type"] = 1,
					["Key"] = "dotColor",
					["Value"] = {
						0.5647058823529412, -- [1]
						0.5647058823529412, -- [2]
						0.5647058823529412, -- [3]
						1, -- [4]
					},
					["Name"] = "Dot Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dots around the nameplate",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Fraction"] = false,
					["Value"] = 8,
					["Key"] = "xOffset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Dot X Offset",
				}, -- [16]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Name"] = "Dot Y Offset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "yOffset",
				}, -- [17]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [18]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [19]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [20]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [21]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [22]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [23]
				{
					["Type"] = 5,
					["Key"] = "option19",
					["Value"] = "Cast Bar",
					["Name"] = "Option 19",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [24]
				{
					["Type"] = 4,
					["Key"] = "useCastbarColor",
					["Value"] = true,
					["Name"] = "Use Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Use cast bar color.",
				}, -- [25]
				{
					["Type"] = 1,
					["Key"] = "castBarColor",
					["Value"] = {
						0.4117647058823529, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Cast bar color.",
				}, -- [26]
				{
					["Type"] = 6,
					["Name"] = "Option 27",
					["Value"] = 0,
					["Key"] = "option27",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [27]
				{
					["Type"] = 5,
					["Name"] = "Option 28",
					["Value"] = "Target Options",
					["Key"] = "option28",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [28]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "",
					["Min"] = 8,
					["Name"] = "Text Size",
					["Value"] = 14,
					["Key"] = "targetNameSize",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [29]
				{
					["Type"] = 4,
					["Name"] = "Use Class Color",
					["Value"] = true,
					["Key"] = "colorByClass",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [30]
				{
					["Type"] = 1,
					["Name"] = "Text Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "textColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [31]
				{
					["Type"] = 1,
					["Name"] = "Background Color",
					["Value"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.9846720322966576, -- [4]
					},
					["Key"] = "targetBgColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [32]
				{
					["Type"] = 1,
					["Name"] = "Border Color",
					["Value"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "targetBgBorderColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [33]
				{
					["Type"] = 2,
					["Max"] = 160,
					["Desc"] = "",
					["Min"] = 30,
					["Name"] = "Frame Width",
					["Value"] = 90,
					["Key"] = "targetFrameWidth",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [34]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "",
					["Min"] = 8,
					["Key"] = "targetFrameHeight",
					["Value"] = 20,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Frame Height",
				}, -- [35]
			},
			["version"] = -1,
			["Name"] = "Cast - Important Target [P]",
			["NpcNames"] = {
			},
		}, -- [26]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\", 7)\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \n    --check if there's a timer for this spell\n    local timer = scriptTable.config.timerList[tostring(envTable._SpellID)]\n    \n    if (timer) then\n        --insert code here\n        \n        --set the castbar config\n        local config = {\n            iconTexture = \"\",\n            iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n            iconAlpha = 1,\n            iconSize = 14,\n            \n            text = \"Spikes Incoming!\",\n            textSize = 8,\n            \n            texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n            color = {.6, .6, .6, 0.8},\n            \n            isChanneling = false,\n            canInterrupt = false,\n            \n            height = 5,\n            width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n            \n            spellNameAnchor = {side = 3, x = 0, y = -2},\n            timerAnchor = {side = 5, x = 0, y = -2},\n        }\n        \n        Plater.SetAltCastBar(unitFrame.PlateFrame, config, timer, nil, nil)\n        local castBar2 = unitFrame.castBar2\n        castBar2.Text:ClearAllPoints()\n        castBar2.Text:SetPoint (\"topleft\", castBar2, \"bottomleft\", 0, 0)\n        castBar2.percentText:ClearAllPoints()\n        castBar2.percentText:SetPoint (\"topright\", castBar2, \"bottomright\", 0, 0)\n        Plater:SetFontSize(castBar2.percentText, 8)\n    end\n    \nend\n\n\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1670203758,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
			["Enabled"] = true,
			["Revision"] = 1213,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["Desc"] = "Player an animation when the cast start. Start a timer when the cast finishes. Set the time in the options.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    Plater.SetCastBarColorForScript(self, scriptTable.config.useCastbarColor, scriptTable.config.castbarColor, envTable)\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				350421, -- [1]
				355787, -- [2]
				348513, -- [3]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Cast start animation settings",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Cast Bar Color Enabled",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.4313725490196079, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Key"] = "flashDuration",
					["Value"] = 0.4,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Flash Duration",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Key"] = "castBarHeight",
					["Value"] = 5,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Cast Bar Height Mod",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Key"] = "shakeDuration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Duration",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 100,
					["Desc"] = "How strong is the shake.",
					["Min"] = 2,
					["Key"] = "shakeAmplitude",
					["Value"] = 8,
					["Name"] = "Shake Amplitude",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Key"] = "shakeFrequency",
					["Value"] = 40,
					["Name"] = "Shake Frequency",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [11]
				{
					["Type"] = 7,
					["Key"] = "timerList",
					["Value"] = {
					},
					["Name"] = "Timer (Key is SpellId and Value is Time)",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_list",
					["Desc"] = "Key is the spellId and value is the amount of time of the Timer",
				}, -- [12]
			},
			["version"] = -1,
			["Name"] = "Cast - Alert + Timer [P]",
			["NpcNames"] = {
			},
		}, -- [27]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    function envTable.CheckUnit(unitFrame, envTable)\n        if (envTable._NpcID == 185680) then\n            --haste\n            envTable.SetColor(unitFrame, \"haste\")\n            \n        elseif (envTable._NpcID == 185683) then\n            --movement speed\n            envTable.SetColor(unitFrame, \"ms\")\n            \n        elseif (envTable._NpcID == 185685) then\n            --cooldown reduction\n            envTable.SetColor(unitFrame, \"cdr\")\n            \n        end\n    end\n    \n    function envTable.SetColor(unitFrame, bonusType)\n        \n        local r, g, b, a, name\n        \n        if (bonusType == \"haste\") then\n            name = scriptTable.config.hasteName\n            r, g, b, a = DetailsFramework:ParseColors(scriptTable.config.hasteColor)\n            \n        elseif (bonusType == \"ms\") then\n            name = scriptTable.config.msName\n            r, g, b, a = DetailsFramework:ParseColors(scriptTable.config.msColor)\n            \n        elseif (bonusType == \"cdr\") then\n            name = scriptTable.config.cdrName\n            r, g, b, a = DetailsFramework:ParseColors(scriptTable.config.cdrColor)\n        end\n        \n        Plater.SetNameplateColor(unitFrame, r, g, b, a)\n        if (scriptTable.config.canChangeSize) then\n            Plater.SetNameplateSize(unitFrame, scriptTable.config.width, scriptTable.config.height)\n        end\n        \n        --border\n        if (scriptTable.config.showBorder) then\n            r, g, b, a = r+0.2, g+0.2, b+0.2\n            Plater.SetBorderColor(unitFrame, r, g, b)\n        end\n        \n        --name\n        unitFrame.healthBar.unitName:SetText(name)\n    end\nend\n\n\n--185685 cooldown reduction\n--185680 haste\n--185683 movement speed\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckUnit(unitFrame, envTable)\nend\n\n\n",
			["Time"] = 1647994498,
			["url"] = "",
			["Icon"] = 4263293,
			["Enabled"] = true,
			["Revision"] = 70,
			["semver"] = "",
			["Author"] = "Ditador-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Make more easy to distinguish relics within dungeons in 9.2 patch",
			["NpcNames"] = {
				"185685", -- [1]
				"185680", -- [2]
				"185683", -- [3]
			},
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Name"] = "Relics 9.2 M Dungeons",
			["version"] = -1,
			["Options"] = {
				{
					["Type"] = 5,
					["Name"] = "ColorSettingsAnchor",
					["Value"] = "Color Settings",
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "Adjust the nameplate color for each mob",
				}, -- [1]
				{
					["Type"] = 1,
					["Name"] = "Haste Color",
					["Value"] = {
						0.4549019607843137, -- [1]
						0.2156862745098039, -- [2]
						0.5490196078431373, -- [3]
						1, -- [4]
					},
					["Key"] = "hasteColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "haste color",
				}, -- [2]
				{
					["Type"] = 1,
					["Key"] = "msColor",
					["Value"] = {
						0.3098039215686275, -- [1]
						0.5215686274509804, -- [2]
						0.2588235294117647, -- [3]
						1, -- [4]
					},
					["Name"] = "Moviment Speep Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "moviment speep color",
				}, -- [3]
				{
					["Type"] = 1,
					["Name"] = "Cooldown Reduction Color",
					["Value"] = {
						0.1725490196078431, -- [1]
						0.2823529411764706, -- [2]
						0.5215686274509804, -- [3]
						1, -- [4]
					},
					["Key"] = "cdrColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "cooldown reduction color",
				}, -- [4]
				{
					["Type"] = 6,
					["Name"] = "Option 5",
					["Value"] = 0,
					["Key"] = "option5",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 5,
					["Name"] = "SizeSettingsAnchor",
					["Value"] = "Size Settings",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Key"] = "canChangeSize",
					["Value"] = false,
					["Name"] = "Change Nameplate Size",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If this is checked, the nameplate size is changed to the values below",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 200,
					["Desc"] = "total width of the nameplate",
					["Min"] = 50,
					["Name"] = "Width",
					["Value"] = 100,
					["Key"] = "width",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 40,
					["Desc"] = "total height of the nameplate",
					["Min"] = 2,
					["Key"] = "height",
					["Value"] = 12,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Height",
				}, -- [9]
				{
					["Type"] = 6,
					["Name"] = "Option 9",
					["Value"] = 0,
					["Key"] = "option9",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [10]
				{
					["Type"] = 5,
					["Name"] = "BorderSettingsAnchor",
					["Value"] = "Border Settings",
					["Key"] = "option10",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [11]
				{
					["Type"] = 4,
					["Name"] = "Paint Border",
					["Value"] = true,
					["Key"] = "showBorder",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, the color of the border will have the same color as the nameplate",
				}, -- [12]
				{
					["Type"] = 6,
					["Name"] = "Option 12",
					["Value"] = 0,
					["Key"] = "option12",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 5,
					["Name"] = "NameSettings",
					["Value"] = "Name Settings",
					["Key"] = "option13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [14]
				{
					["Type"] = 3,
					["Name"] = "Haste Name",
					["Value"] = "HASTE",
					["Key"] = "hasteName",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
					["Desc"] = "",
				}, -- [15]
				{
					["Type"] = 3,
					["Key"] = "cdrName",
					["Value"] = "CDR",
					["Name"] = "Cooldown Reduction Name",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
					["Desc"] = "",
				}, -- [16]
				{
					["Type"] = 3,
					["Name"] = "Movement Speed Name",
					["Value"] = "MS",
					["Key"] = "msName",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
					["Desc"] = "",
				}, -- [17]
			},
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckUnit(unitFrame, envTable)\n    \nend",
		}, -- [28]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    local unitPowerBar = unitFrame.powerBar\n    unitPowerBar:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE) then\n        return \n    end\n    \n    local continuationToken\n    local slots\n    local foundAura = false\n    \n    repeat    \n        slots = { UnitAuraSlots(unitId, \"HELPFUL\", BUFF_MAX_DISPLAY, continuationToken) }\n        continuationToken = slots[1]\n        numSlots = #slots\n        \n        for i = 2, numSlots do\n            local slot = slots[i]\n            local name, texture, count, actualAuraType, duration, expirationTime, caster, canStealOrPurge, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, isCastByPlayer, nameplateShowAll, timeMod, auraAmount = UnitAuraBySlot(unitId, slot) \n            \n            if (spellId == envTable._SpellID) then --need to get the trigger spellId\n                --Ablative Shield\n                local unitPowerBar = unitFrame.powerBar\n                if (not unitPowerBar:IsShown()) then\n                    unitPowerBar:SetUnit(unitId)\n                end\n                \n                foundAura = true\n                return\n            end\n        end\n        \n    until continuationToken == nil\n    \n    if (not foundAura) then\n        local unitPowerBar = unitFrame.powerBar\n        if (unitPowerBar:IsShown()) then\n            unitPowerBar:Hide()\n        end\n    end\nend",
			["Time"] = 1669327146,
			["url"] = "",
			["Icon"] = 610472,
			["Enabled"] = true,
			["Revision"] = 65,
			["semver"] = "",
			["Author"] = "Keyspell-Azralon",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["Desc"] = "Show power bar where its value is the buff value (usualy shown in the buff tooltip)",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["SpellIds"] = {
				227548, -- [1]
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Aura is Shield [P]",
			["NpcNames"] = {
			},
		}, -- [29]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnHideCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (UnitIsUnit(unitId .. \"target\", \"player\")) then\n        Plater.SetNameplateColor(unitFrame, scriptTable.config.nameplateColor)\n    else\n        Plater.RefreshNameplateColor(unitFrame)\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1668886509,
			["url"] = "",
			["Icon"] = "Interface\\ICONS\\Ability_Fixated_State_Red",
			["Enabled"] = true,
			["Revision"] = 33,
			["semver"] = "",
			["Author"] = "Ditador-Azralon",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["Desc"] = "Alert about a unit fixated on the player by using a buff on the enemy unit.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["SpellIds"] = {
				285388, -- [1]
				426662, -- [2]
				426663, -- [3]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 1,
					["Name"] = "Nameplate Color",
					["Value"] = {
						0, -- [1]
						0.5568627450980392, -- [2]
						0.03529411764705882, -- [3]
						1, -- [4]
					},
					["Key"] = "nameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Change the enemy nameplate color to this color when fixating you!",
				}, -- [1]
			},
			["version"] = -1,
			["Name"] = "Fixate by Unit Buff [P]",
			["NpcNames"] = {
			},
		}, -- [30]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local castBar = unitFrame.castBar\n    local castBarPortion = castBar:GetWidth()/scriptTable.config.segmentsAmount\n    local castBarHeight = castBar:GetHeight()\n    \n    unitFrame.felAnimation = unitFrame.felAnimation or {}\n    \n    if (not unitFrame.felAnimation.textureStretched) then\n        unitFrame.felAnimation.textureStretched = castBar:CreateTexture(nil, \"overlay\", nil, 5)\n    end\n    \n    if (not unitFrame.felAnimation.Textures) then\n        unitFrame.felAnimation.Textures = {}\n        \n        for i = 1, 20 do --max amount of segments is 20\n            local texture = castBar:CreateTexture(nil, \"overlay\", nil, 6)\n            unitFrame.felAnimation.Textures[i] = texture            \n            \n            texture.animGroup = texture.animGroup or texture:CreateAnimationGroup()\n            local animationGroup = texture.animGroup\n            animationGroup:SetToFinalAlpha(true)            \n            animationGroup:SetLooping(\"NONE\")\n            \n            texture:SetTexture([[Interface\\COMMON\\XPBarAnim]])\n            texture:SetTexCoord(0.2990, 0.0010, 0.0010, 0.4159)\n            texture:SetBlendMode(\"ADD\")\n            \n            texture.scale = animationGroup:CreateAnimation(\"SCALE\")\n            texture.scale:SetTarget(texture)\n            \n            texture.alpha = animationGroup:CreateAnimation(\"ALPHA\")\n            texture.alpha:SetTarget(texture)\n            \n            texture.alpha2 = animationGroup:CreateAnimation(\"ALPHA\")\n            texture.alpha2:SetTarget(texture)\n        end\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (unitFrame.felAnimation and unitFrame.felAnimation.Textures) then\n        for i = 1, scriptTable.config.segmentsAmount  do\n            local texture = unitFrame.felAnimation.Textures[i]\n            if (texture) then\n                texture:Hide()\n            end\n        end\n    end\n    \n    if (unitFrame.felAnimation and unitFrame.felAnimation.textureStretched) then\n        local textureStretched = unitFrame.felAnimation.textureStretched\n        if (textureStretched) then\n            textureStretched:Hide()\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (self.channeling) then\n        return \n    end\n    \n    if (not envTable.NextPercent) then\n        return\n    end\n    \n    local castBar = unitFrame.castBar\n    \n    local textures = unitFrame.felAnimation.Textures\n    \n    if (envTable._CastPercent > envTable.NextPercent) then --eeror here, compare with nil\n        local nextPercent = 100  / scriptTable.config.segmentsAmount\n        \n        textures[envTable.CurrentTexture]:Show()\n        textures[envTable.CurrentTexture].animGroup:Play()\n        envTable.NextPercent = envTable.NextPercent + nextPercent \n        envTable.CurrentTexture = envTable.CurrentTexture + 1\n        \n        if (envTable.CurrentTexture == #textures) then\n            envTable.NextPercent = 98\n        elseif (envTable.CurrentTexture > #textures) then\n            envTable.NextPercent = 999\n        end\n    end\n    \n    local normalizedPercent = envTable._CastPercent / 100\n    local textureStretched = unitFrame.felAnimation.textureStretched\n    local point = DetailsFramework:GetBezierPoint(normalizedPercent, 0, 0.001, 1)\n    textureStretched:SetPoint(\"left\", castBar, \"left\", point * envTable.castBarWidth, 0)\n    \n    self.ThrottleUpdate = 0\nend",
			["Time"] = 1672514190,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_glow",
			["Enabled"] = true,
			["Revision"] = 547,
			["semver"] = "",
			["Author"] = "Terciob",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Show a different animation for the cast bar.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (self.channeling) then\n        return \n    end\n    \n    local castBar = unitFrame.castBar\n    envTable.castBarWidth = castBar:GetWidth()\n    castBar.Spark:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.sparkColor))\n    \n    local textureStretched = unitFrame.felAnimation.textureStretched\n    textureStretched:Show()\n    textureStretched:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.glowColor))\n    textureStretched:SetAtlas(\"XPBarAnim-OrangeTrail\")\n    textureStretched:ClearAllPoints()\n    textureStretched:SetPoint(\"right\", castBar.Spark, \"center\", 0, 0)\n    textureStretched:SetHeight(castBar:GetHeight())\n    textureStretched:SetBlendMode(\"ADD\") \n    textureStretched:SetAlpha(0.5)\n    textureStretched:SetDrawLayer(\"overlay\", 7)\n    \n    for i = 1, scriptTable.config.segmentsAmount  do\n        local texture = unitFrame.felAnimation.Textures[i]\n        --texture:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.trailColor))\n        texture:SetVertexColor(1, 1, 1, 1)\n        texture:SetDesaturated(true)\n        \n        local castBarPortion = castBar:GetWidth()/scriptTable.config.segmentsAmount\n        \n        texture:SetSize(castBarPortion+5, castBar:GetHeight())\n        texture:SetDrawLayer(\"overlay\", 6)\n        \n        texture:ClearAllPoints()\n        if (i == scriptTable.config.segmentsAmount) then\n            texture:SetPoint(\"right\", castBar, \"right\", 0, 0)\n        else\n            texture:SetPoint(\"left\", castBar, \"left\", (i-1)*castBarPortion, 2)\n        end\n        \n        texture:SetAlpha(0)\n        texture:Hide()\n        \n        texture.scale:SetOrder(1)\n        texture.scale:SetDuration(0.5)\n        texture.scale:SetScaleFrom(0.2, 1)\n        texture.scale:SetScaleTo(1, 1.5)\n        texture.scale:SetOrigin(\"right\", 0, 0)\n        \n        local durationTime = DetailsFramework:GetBezierPoint(i / scriptTable.config.segmentsAmount, 0.2, 0.01, 0.6)\n        local duration = abs(durationTime-0.6)\n        \n        texture.alpha:SetOrder(1)\n        texture.alpha:SetDuration(0.05)\n        texture.alpha:SetFromAlpha(0)\n        texture.alpha:SetToAlpha(0.4)\n        \n        texture.alpha2:SetOrder(1)\n        texture.alpha2:SetDuration(duration) --0.6\n        texture.alpha2:SetStartDelay(duration)\n        texture.alpha2:SetFromAlpha(0.5)\n        texture.alpha2:SetToAlpha(0)\n    end\n    \n    envTable.CurrentTexture = 1\n    envTable.NextPercent  = 100  / scriptTable.config.segmentsAmount\n    \n    local customColor = scriptTable.config.castColor[tostring(envTable._SpellID)]\n    Plater.SetCastBarColorForScript(self, true, customColor or scriptTable.config.castBarColor, envTable)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				376644, -- [1]
				373017, -- [2]
				386781, -- [3]
				384823, -- [4]
				372735, -- [5]
				385536, -- [6]
				392398, -- [7]
				375596, -- [8]
				387135, -- [9]
				360850, -- [10]
				212784, -- [11]
				199033, -- [12]
				199034, -- [13]
				200969, -- [14]
				394512, -- [15]
				397881, -- [16]
				396020, -- [17]
				374430, -- [18]
				373429, -- [19]
				384353, -- [20]
				265376, -- [21]
				193941, -- [22]
				411002, -- [23]
				169445, -- [24]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Need a /reload",
					["Min"] = 5,
					["Key"] = "segmentsAmount",
					["Value"] = 7,
					["Name"] = "Amount of Segments",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [1]
				{
					["Type"] = 1,
					["Key"] = "sparkColor",
					["Value"] = {
						0.9568627450980391, -- [1]
						1, -- [2]
						0.9882352941176471, -- [3]
						1, -- [4]
					},
					["Name"] = "Spark Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 1,
					["Key"] = "glowColor",
					["Value"] = {
						0.8588235294117647, -- [1]
						0.4313725490196079, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Glow Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 7,
					["Key"] = "castColor",
					["Value"] = {
						{
							"385536", -- [1]
							"maroon", -- [2]
						}, -- [1]
						{
							"198750", -- [1]
							"midnightblue", -- [2]
						}, -- [2]
						{
							"360850", -- [1]
							"lime", -- [2]
						}, -- [3]
						{
							"212784", -- [1]
							"deepskyblue", -- [2]
						}, -- [4]
						{
							"207980", -- [1]
							"midnightblue", -- [2]
						}, -- [5]
						{
							"199033", -- [1]
							"gold", -- [2]
						}, -- [6]
						{
							"199034", -- [1]
							"gold", -- [2]
						}, -- [7]
						{
							"200969", -- [1]
							"orange", -- [2]
						}, -- [8]
						{
							"394512", -- [1]
							"indigo", -- [2]
						}, -- [9]
						{
							"397881", -- [1]
							"deepskyblue", -- [2]
						}, -- [10]
						{
							"396020", -- [1]
							"khaki", -- [2]
						}, -- [11]
					},
					["Name"] = "Cast Color by SpellID",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_list",
					["Desc"] = "Insert the Spell ID in the to Key and a color name into the Value",
				}, -- [4]
			},
			["version"] = -1,
			["Name"] = "Cast - Glowing [P]",
			["NpcNames"] = {
			},
		}, -- [31]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    --set the castbar config\n    envTable.configAltCastBar = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end    \n        \n        \n    end\nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable._SpellID == 191284) then\n        Plater.SetAltCastBar(unitFrame.PlateFrame, envTable.configAltCastBar, 4.70, GetTime(), 191284)\n        \n        C_Timer.After(4.75, function()\n                Plater.SetAltCastBar(unitFrame.PlateFrame, envTable.configAltCastBar, 5.30, GetTime(), 191284)\n        end)\n        \n        C_Timer.After(4.75 + 5.30, function()\n                Plater.SetAltCastBar(unitFrame.PlateFrame, envTable.configAltCastBar, 4.30, GetTime(), 191284)\n                C_Timer.After(4.50, function() unitFrame.castBar2:Hide() end)\n        end)\n    end\n    \nend",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Time"] = 1671066705,
			["url"] = "",
			["Icon"] = 134229,
			["Enabled"] = true,
			["Revision"] = 37,
			["semver"] = "",
			["Author"] = "Huugg-Valdrakken",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["Desc"] = "Start extra cast bars for effects after the cast is done. Setup the effect on On Hide script.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["SpellIds"] = {
				191284, -- [1]
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Cast - Effect After Cast [P]",
			["NpcNames"] = {
			},
		}, -- [32]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.lifePercent = { --dragonflight\n        [197697] = {50}, --Flamegullet\n        [59544] = {50}, --The Nodding Tiger\n        [186227] = {20}, --Monstrous Decay\n        [184020] = {40}, -- Hulking Berserker\n        [91005] = {20}, --Naraxas\n    }\n    \n    \n    function envTable.CreateMarker(unitFrame)\n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, unitFrame.healthBar:GetHeight())\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, unitFrame.healthBar:GetHeight())\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (unitLifePercent - percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"left\", unitFrame.healthMarker, \"right\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker and unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
			["Time"] = 1683596223,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\health_indicator",
			["Enabled"] = true,
			["Revision"] = 146,
			["semver"] = "",
			["Author"] = "Aelerolor-Torghast",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Place a marker into the health bar to indicate when the unit will change phase or cast an important spell.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 5,
					["Name"] = "Option 1",
					["Value"] = "Add markers into the health bar to remind you about boss abilities at life percent.",
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 6,
					["Name"] = "blank line",
					["Value"] = 0,
					["Key"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 1,
					["Name"] = "Vertical Line Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "indicatorColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Indicator color.",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Indicator alpha.",
					["Min"] = 0.1,
					["Key"] = "indicatorAlpha",
					["Value"] = 0.79,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Vertical Line Alpha",
				}, -- [4]
				{
					["Type"] = 6,
					["Key"] = "",
					["Value"] = 0,
					["Name"] = "blank line",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 1,
					["Key"] = "fillColor",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Fill Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Fill color.",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Fill alpha.",
					["Min"] = 0,
					["Name"] = "Fill Alpha",
					["Value"] = 0.2,
					["Key"] = "fillAlpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [7]
			},
			["version"] = -1,
			["Name"] = "Add - Health Markers [P]",
			["NpcNames"] = {
				"197697", -- [1]
				"59544", -- [2]
				"186227", -- [3]
				"184020", -- [4]
				"91005", -- [5]
			},
		}, -- [33]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n196548 = ancient branch (academy dungeon)\n195580, 195821, 195820 = nokhub saboteur\n189886 = blazebound firestorm\n75966 = Defiled Spirit\n102019 = Stormforged Obliterator\n    187159 = Shrieking Whelp\n194897 = stormsurge totem\n104251 = duskwatch sentry\n101326 = honored ancestor\n189669 = binding speakl netharius\n192464 = raging ember neltharius\n--]=]\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\n    Plater.DenyColorChange(unitFrame, false)\nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --check if can change the nameplate color\n    if (scriptTable.config.changeNameplateColor) then\n        Plater.SetNameplateColor(unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["Time"] = 1670423785,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
			["Enabled"] = true,
			["Revision"] = 572,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Change the color and highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\n    \n    --color priority:\n    local npcIdString = tostring(envTable._NpcID)\n    envTable.NameplateColor = Plater.GetColorByPriority(unitFrame, scriptTable.config.npcColor[npcIdString], scriptTable.config.nameplateColor)    \n    \n    if (scriptTable.config.showExtraTexture) then\n        unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n        unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n        unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n        unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/x_64]])\n        unitFrame.UnitImportantSkullTexture:ClearAllPoints()\n        unitFrame.UnitImportantSkullTexture:SetPoint(\"right\", unitFrame.healthBar, \"left\", -2, 0)\n        unitFrame.UnitImportantSkullTexture:SetSize(28, 28)\n        unitFrame.UnitImportantSkullTexture:Show()\n    else\n        unitFrame.UnitImportantSkullTexture:Hide()\n    end\n    \n    --rules for some npcs\n    if (envTable._NpcID == 194895) then --unstable squall (explode at dying\n        unitFrame.UnitImportantSkullTexture:Hide()\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation) \n    end\n    \n    if (scriptTable.config.changeNameplateColor) then\n        local npcIdString = tostring(envTable._NpcID)\n        \n        envTable.NameplateColor = Plater.GetColorByPriority(unitFrame, scriptTable.config.npcColor[npcIdString], scriptTable.config.nameplateColor)        \n        \n        Plater.DenyColorChange(unitFrame, true)\n    end\n    \nend\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option6",
					["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
					["Name"] = "Option 6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Key"] = "changeNameplateColor",
					["Value"] = true,
					["Name"] = "Change Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "change to true to change the color",
				}, -- [4]
				{
					["Type"] = 1,
					["Key"] = "nameplateColor",
					["Value"] = {
						1, -- [1]
						0, -- [2]
						0.5254901960784314, -- [3]
						1, -- [4]
					},
					["Name"] = "Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Nameplate Color",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "increase the nameplate height by this value",
					["Min"] = 0,
					["Name"] = "Nameplate Size Offset",
					["Value"] = 3,
					["Key"] = "nameplateSizeOffset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Key"] = "dotsColor",
					["Value"] = {
						1, -- [1]
						0.7137255072593689, -- [2]
						0, -- [3]
						0.5631310641765594, -- [4]
					},
					["Name"] = "Dot Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Dot Color",
				}, -- [8]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 5,
					["Key"] = "option10",
					["Value"] = "Extra Texture",
					["Name"] = "Extra Texture",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "Extra Texture",
				}, -- [10]
				{
					["Type"] = 4,
					["Name"] = "Show Extra Texture",
					["Value"] = false,
					["Key"] = "showExtraTexture",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show Extra Texture",
				}, -- [11]
				{
					["Type"] = 1,
					["Key"] = "skullColor",
					["Value"] = {
						1, -- [1]
						0.4627450980392157, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Texture Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Texture Color",
				}, -- [12]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Alpha",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 0.2,
					["Key"] = "skullAlpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Alpha",
				}, -- [13]
				{
					["Type"] = 2,
					["Max"] = 2,
					["Desc"] = "Scale",
					["Min"] = 0.4,
					["Name"] = "Scale",
					["Value"] = 0.6,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "skullScale",
				}, -- [14]
				{
					["Type"] = 7,
					["Name"] = "Npc Color By NpcID",
					["Value"] = {
						{
							"196548", -- [1]
							"forestgreen", -- [2]
						}, -- [1]
						{
							"195580", -- [1]
							"forestgreen", -- [2]
						}, -- [2]
						{
							"195820", -- [1]
							"forestgreen", -- [2]
						}, -- [3]
						{
							"195821", -- [1]
							"forestgreen", -- [2]
						}, -- [4]
						{
							"189886", -- [1]
							"forestgreen", -- [2]
						}, -- [5]
						{
							"75966", -- [1]
							"forestgreen", -- [2]
						}, -- [6]
						{
							"102019 ", -- [1]
							"forestgreen", -- [2]
						}, -- [7]
						{
							"187159", -- [1]
							"forestgreen", -- [2]
						}, -- [8]
						{
							"194897", -- [1]
							"forestgreen", -- [2]
						}, -- [9]
						{
							"104251", -- [1]
							"forestgreen", -- [2]
						}, -- [10]
					},
					["Key"] = "npcColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_list",
					["Desc"] = "Key is the npcID, value is the color name",
				}, -- [15]
			},
			["version"] = -1,
			["Name"] = "Add - Important [P]",
			["NpcNames"] = {
				"196548", -- [1]
				"195580", -- [2]
				"195820", -- [3]
				"195821", -- [4]
				"189886", -- [5]
				"75966", -- [6]
				"102019", -- [7]
				"187159", -- [8]
				"194897", -- [9]
				"104251", -- [10]
				"101326", -- [11]
				"189669", -- [12]
				"192464", -- [13]
				190381, -- [14]
				92538, -- [15]
				192464, -- [16]
				131009, -- [17]
				127315, -- [18]
				133361, -- [19]
				136330, -- [20]
				214117, -- [21]
				212483, -- [22]
				101008, -- [23]
				194745, -- [24]
				190426, -- [25]
			},
		}, -- [34]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (unitFrame.AddSpawnIDTexture) then\n        unitFrame.AddSpawnIDTexture:Hide()\n        unitFrame.AddIcon:Hide()\n        unitFrame.AddNumber:Hide()\n    end\n    \nend\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Time"] = 1669340442,
			["url"] = "",
			["Icon"] = "interface/addons/plater/images/add_id_icon",
			["Enabled"] = false,
			["Revision"] = 161,
			["semver"] = "",
			["Author"] = "Huugg-Valdrakken",
			["Initialization"] = "function (scriptTable)\n    \n    scriptTable.allAdds = {} \n    scriptTable.nextAddWave = 0\n    scriptTable.waveTime = 20\n    \n    function scriptTable.ArrangeNpcNumbers(GUID)\n        local spawnId = select(7, strsplit (\"-\", GUID))\n        spawnId = tonumber(spawnId, 16)\n        \n        if (spawnId) then\n            --check if this is a new wave of adds\n            if (GetTime() > scriptTable.nextAddWave) then\n                scriptTable.nextAddWave = GetTime() + scriptTable.waveTime\n                scriptTable.allAdds = {}\n            end\n            \n            local bIsAlreadyOnTheList = false\n            \n            for o = 1, #scriptTable.allAdds do\n                if (scriptTable.allAdds[o][1] == GUID) then\n                    bIsAlreadyOnTheList = true\n                end\n            end\n            \n            if (not bIsAlreadyOnTheList) then\n                scriptTable.allAdds[#scriptTable.allAdds+1] = {GUID, spawnId}\n            end\n        end\n        \n        table.sort(scriptTable.allAdds, function(t1, t2) return t1[2] < t2[2] end)\n        \n        --this is a \"loop\" because this is running each time a nameplate is added!\n        \n        for namePlateIndex, plateFrame in ipairs(Plater.GetAllShownPlates()) do\n            local unitFrame = plateFrame.unitFrame\n            \n            --get the unit GUID\n            local unitGUID = unitFrame.namePlateUnitGUID\n            \n            for addId = 1, #scriptTable.allAdds do\n                local addTable = scriptTable.allAdds[addId]\n                local addGUID = addTable[1]\n                \n                if (unitGUID == addGUID) then\n                    scriptTable.TagNameplate(unitFrame, unitGUID, addId)\n                    break\n                end\n            end\n            \n        end\n    end\n    \n    function scriptTable.TagNameplate(unitFrame, GUID, addId)\n        scriptTable.CreateAddWidgetsForNameplate(unitFrame, GUID, addId)\n        \n        if (addId and addId >= 1 and addId <= 8) then\n            unitFrame.AddSpawnIDTexture:Show()\n            unitFrame.AddIcon:Show()\n            unitFrame.AddNumber:Show()\n            \n            local addTexture = \"Interface\\\\TargetingFrame\\\\UI-RaidTargetingIcon_\" .. addId\n            \n            unitFrame.AddIcon:SetTexture(addTexture)\n            unitFrame.AddNumber:SetText(addId)\n        end\n    end\n    \n    function scriptTable.CreateAddWidgetsForNameplate(unitFrame, GUID, addId)\n        if (not unitFrame.AddSpawnIDTexture) then\n            local healthBar = unitFrame.healthBar\n            \n            local textureBackground = healthBar.FrameOverlay:CreateTexture(nil, \"overlay\", nil, 5)\n            local addIcon = healthBar.FrameOverlay:CreateTexture(nil, \"overlay\", nil, 6)\n            local addNumber = healthBar.FrameOverlay:CreateFontString(nil, \"overlay\", \"GameFontNormal\", 6)           \n            \n            unitFrame.AddSpawnIDTexture = textureBackground\n            unitFrame.AddIcon = addIcon\n            unitFrame.AddNumber = addNumber\n        end\n    end    \nend\n\n--Creature-0-2085-1-11042-153285-0002F8DB2B --training dummy for testing\n--195138 Detonating Crystal\n--192955 dracomoc illusion\n--190294 nokhub stormcaster\n--76518 ritual of bones\n\n\n\n\n",
			["Desc"] = "Put a number above multiples adds, numbers follow their respawn id.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (unitFrame.AddSpawnIDTexture) then\n        unitFrame.AddSpawnIDTexture:Hide()\n        unitFrame.AddIcon:Hide()\n        unitFrame.AddNumber:Hide()\n    end\n    \n    scriptTable.ArrangeNpcNumbers(unitFrame.namePlateUnitGUID)\n    \n    local textureBackground = unitFrame.AddSpawnIDTexture\n    textureBackground:SetSize(22, 10)\n    textureBackground:ClearAllPoints()\n    textureBackground:SetPoint(\"bottomright\", unitFrame.healthBar, \"topright\", 0, 1)\n    \n    textureBackground:SetMask([[Interface\\AddOns\\Plater\\masks\\mask_smallrectangle_rounded1]])\n    textureBackground:SetTexture([[Interface\\AddOns\\Plater\\masks\\mask_smallrectangle_rounded1]])\n    textureBackground:SetVertexColor(0.1215, 0.1176, 0.1294, 1)\n    \n    \n    --textureBackground:SetMask([[Interface/ChatFrame/UI-ChatIcon-HotS]])\n    --    \"Interface/ChatFrame/UI-ChatIcon-HotS\"\n    \n    local addIcon = unitFrame.AddIcon\n    addIcon:ClearAllPoints()\n    addIcon:SetPoint(\"left\", textureBackground, \"left\", 2, 0)\n    addIcon:SetSize(10, 10)\n    \n    local addNumber = unitFrame.AddNumber\n    addNumber:ClearAllPoints()\n    addNumber:SetPoint(\"right\", textureBackground, \"right\", -2, 0)\n    DetailsFramework:SetFontSize(addNumber, 10)\n    \nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Add - Tag Number [P]",
			["NpcNames"] = {
				"195138", -- [1]
				"192955", -- [2]
				"190294", -- [3]
				"76518", -- [4]
			},
		}, -- [35]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1669324381,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_quickflash.tga",
			["Enabled"] = true,
			["Revision"] = 887,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["Desc"] = "Play a very fast flash when the cast start",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    Plater.SetCastBarColorForScript(self, scriptTable.config.useCastbarColor, scriptTable.config.castBarColor, envTable)\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				392640, -- [1]
				397888, -- [2]
				209033, -- [3]
				385029, -- [4]
				374563, -- [5]
				377341, -- [6]
				369675, -- [7]
				369365, -- [8]
				369411, -- [9]
				278961, -- [10]
				202108, -- [11]
				88186, -- [12]
				255824, -- [13]
				252781, -- [14]
				250096, -- [15]
				200248, -- [16]
				197797, -- [17]
				264520, -- [18]
				418202, -- [19]
				201839, -- [20]
				412012, -- [21]
				411958, -- [22]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Produces a notable but fast effect in the cast bar when a spell from the 'Triggers' starts to cast.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 3",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Cast Bar Color Enabled",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.4313725490196079, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Fraction"] = true,
					["Value"] = 0.2,
					["Name"] = "Flash Duration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Fraction"] = false,
					["Value"] = 0,
					["Name"] = "Cast Bar Height Mod",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Fraction"] = true,
					["Value"] = 0.1,
					["Name"] = "Shake Duration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 200,
					["Desc"] = "How strong is the shake.",
					["Min"] = 10,
					["Name"] = "Shake Amplitude",
					["Value"] = 25,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 30,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [12]
			},
			["version"] = -1,
			["Name"] = "Cast - Quick Flash [P]",
			["NpcNames"] = {
			},
		}, -- [36]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n--190187 draconic image\n--189893 infused whelp\n--99922 Ebonclaw Packmate\n--104822 flames of woe",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.DenyColorChange(unitFrame, false)\n    unitFrame.onShowAddToKillFlash:Stop()\n    \nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.useNameplateColor) then\n        Plater.SetNameplateColor(unitFrame, envTable.NameplateColor)\n    end\nend\n\n\n\n\n",
			["Time"] = 1670427654,
			["url"] = "",
			["Icon"] = "interface/addons/plater/media/exclamation_64",
			["Enabled"] = true,
			["Revision"] = 162,
			["semver"] = "",
			["Author"] = "Huugg-Valdrakken",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Change the color of  add",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    unitFrame.onShowAddToKillFlash = unitFrame.onShowAddToKillFlash or Plater.CreateFlash (unitFrame.healthBar, 0.25, 1, \"white\")\n    \n    if (scriptTable.config.useFlash) then\n        unitFrame.onShowAddToKillFlash:Play()\n    end\n    \n    if (scriptTable.config.useNameplateColor) then\n        local npcIdString = tostring(envTable._NpcID)\n        envTable.NameplateColor = Plater.GetColorByPriority(unitFrame, scriptTable.config.npcColor[npcIdString], scriptTable.config.healthBarColor)\n        Plater.DenyColorChange(unitFrame, true)\n    end\nend\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 4,
					["Key"] = "useNameplateColor",
					["Value"] = true,
					["Name"] = "Change Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Change Nameplate Color",
				}, -- [1]
				{
					["Type"] = 1,
					["Name"] = "Nameplate Color",
					["Value"] = {
						1, -- [1]
						0.4392157196998596, -- [2]
						0.458823561668396, -- [3]
						1, -- [4]
					},
					["Key"] = "healthBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Nameplate Color",
				}, -- [2]
				{
					["Type"] = 6,
					["Key"] = "option5",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Flash Nameplate",
					["Value"] = true,
					["Key"] = "useFlash",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Flash Nameplate",
				}, -- [4]
				{
					["Type"] = 7,
					["Name"] = "NpcID to Color",
					["Value"] = {
						{
							"189893", -- [1]
							"olivedrab", -- [2]
						}, -- [1]
						{
							"190187", -- [1]
							"olivedrab", -- [2]
						}, -- [2]
						{
							"99922", -- [1]
							"olivedrab", -- [2]
						}, -- [3]
						{
							"153285", -- [1]
							"olivedrab", -- [2]
						}, -- [4]
						{
							"104822", -- [1]
							"olivedrab", -- [2]
						}, -- [5]
					},
					["Key"] = "npcColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_list",
					["Desc"] = "If the npc isn't on this list, use the default color set in the Health Bar Color",
				}, -- [5]
			},
			["version"] = -1,
			["Name"] = "Add - Warning [P]",
			["NpcNames"] = {
				"190187", -- [1]
				"189893", -- [2]
				"99922", -- [3]
				"104822", -- [4]
				129758, -- [5]
				186696, -- [6]
				101075, -- [7]
				100818, -- [8]
				98081, -- [9]
				52019, -- [10]
			},
		}, -- [37]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    local plateFrame = unitFrame.PlateFrame\n    \n    if (not plateFrame.BWC_RedBackground) then\n        plateFrame.BWC_RedBackground = plateFrame:CreateTexture(nil, \"background\")\n        plateFrame.BWC_RedBackground:SetAllPoints()\n    end\n    \n    plateFrame.BWC_RedBackground:SetTexture([[Interface/AddOns/Plater/masks/mask1]])\n    plateFrame.BWC_RedBackground:Hide()\n    \n    function envTable.ShowBackground(unitFrame)\n        local plateFrame = unitFrame.PlateFrame\n        plateFrame.BWC_RedBackground:SetVertexColor(1, 0, 0, 0.4)\n        plateFrame.BWC_RedBackground:Show()\n    end\n    \n    function envTable.HideBackground(unitFrame)\n        plateFrame.BWC_RedBackground:Hide()\n    end\nend\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.HideBackground(unitFrame)\nend\n\n\n",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (Plater.UnitIsCasting(unitId)) then\n        envTable.ShowBackground(unitFrame)\n    else\n        envTable.HideBackground(unitFrame)\n    end\n    \nend",
			["Time"] = 1673726734,
			["url"] = "",
			["Icon"] = 236209,
			["Enabled"] = true,
			["Revision"] = 18,
			["semver"] = "",
			["Author"] = "Tiranaa-Azralon",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["Desc"] = "Highlight the nameplate of a unit when has a certain Buff (trigger) and start to cast a spell",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["SpellIds"] = {
				372743, -- [1]
				372749, -- [2]
				384933, -- [3]
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Aura While Casting [P]",
			["NpcNames"] = {
			},
		}, -- [38]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local castBar = unitFrame.castBar\n    local castBarPortion = castBar:GetWidth()/scriptTable.config.segmentsAmount\n    local castBarHeight = castBar:GetHeight()\n    \n    unitFrame.felAnimation = unitFrame.felAnimation or {}\n    \n    if (not unitFrame.felAnimation.textureStretched) then\n        unitFrame.felAnimation.textureStretched = castBar:CreateTexture(nil, \"overlay\", nil, 5)\n    end\n    \n    if (not unitFrame.stopCastingX) then\n        unitFrame.stopCastingX = castBar.FrameOverlay:CreateTexture(nil, \"overlay\", nil, 7)\n        unitFrame.stopCastingX:SetPoint(\"center\", unitFrame.castBar.Spark, \"center\", 0, 0)\n        unitFrame.stopCastingX:SetTexture([[Interface\\AddOns\\Plater\\Media\\stop_64]])\n        unitFrame.stopCastingX:SetSize(16, 16)\n        unitFrame.stopCastingX:Hide()\n    end\n    \n    if (not unitFrame.felAnimation.Textures) then\n        unitFrame.felAnimation.Textures = {}\n        \n        for i = 1, 20 do\n            local texture = castBar:CreateTexture(nil, \"overlay\", nil, 6)\n            unitFrame.felAnimation.Textures[i] = texture            \n            \n            texture.animGroup = texture.animGroup or texture:CreateAnimationGroup()\n            local animationGroup = texture.animGroup\n            animationGroup:SetToFinalAlpha(true)            \n            animationGroup:SetLooping(\"NONE\")\n            \n            texture:SetTexture([[Interface\\COMMON\\XPBarAnim]])\n            texture:SetTexCoord(0.2990, 0.0010, 0.0010, 0.4159)\n            texture:SetBlendMode(\"ADD\")\n            \n            texture.scale = animationGroup:CreateAnimation(\"SCALE\")\n            texture.scale:SetTarget(texture)\n            \n            texture.alpha = animationGroup:CreateAnimation(\"ALPHA\")\n            texture.alpha:SetTarget(texture)\n            \n            texture.alpha2 = animationGroup:CreateAnimation(\"ALPHA\")\n            texture.alpha2:SetTarget(texture)\n        end\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    for i = 1, scriptTable.config.segmentsAmount  do\n        local texture = unitFrame.felAnimation.Textures[i]\n        texture:Hide()\n    end\n    \n    local textureStretched = unitFrame.felAnimation.textureStretched\n    textureStretched:Hide()    \n    unitFrame.stopCastingX:Hide()\n    \n    self.Text:SetDrawLayer(\"overlay\", 0)\n    self.Spark:SetDrawLayer(\"overlay\", 3)\n    self.Spark:Show()\n    \nend\n\n\n\n\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local castBar = unitFrame.castBar\n    local textures = unitFrame.felAnimation.Textures\n    \n    if (envTable._CastPercent > envTable.NextPercent) then\n        local nextPercent = 100 / scriptTable.config.segmentsAmount\n        \n        textures[envTable.CurrentTexture]:Show()\n        textures[envTable.CurrentTexture].animGroup:Play()\n        \n        envTable.NextPercent = envTable.NextPercent + nextPercent \n        envTable.CurrentTexture = envTable.CurrentTexture + 1\n        \n        --print(envTable.NextPercent, envTable.CurrentTexture)\n        \n        if (envTable.CurrentTexture == #textures) then\n            envTable.NextPercent = 98\n        elseif (envTable.CurrentTexture > #textures) then\n            envTable.NextPercent = 999\n        end\n    end\n    \n    local normalizedPercent = envTable._CastPercent / 100\n    local textureStretched = unitFrame.felAnimation.textureStretched\n    local point = DetailsFramework:GetBezierPoint(normalizedPercent, 0, 0.001, 1)\n    textureStretched:SetPoint(\"left\", castBar, \"left\", point * envTable.castBarWidth, 0)\n    \n    self.ThrottleUpdate = 0\nend",
			["Time"] = 1672514185,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\media\\stop_64",
			["Enabled"] = true,
			["Revision"] = 506,
			["semver"] = "",
			["Author"] = "Terciob",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Just stop casting",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local castBar = unitFrame.castBar\n    envTable.castBarWidth = castBar:GetWidth()\n    castBar.Spark:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.sparkColor))\n    \n    local textureStretched = unitFrame.felAnimation.textureStretched\n    textureStretched:Show()\n    textureStretched:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.glowColor))\n    textureStretched:SetAtlas(\"XPBarAnim-OrangeTrail\")\n    textureStretched:ClearAllPoints()\n    textureStretched:SetPoint(\"right\", castBar.Spark, \"center\", 0, 0)\n    textureStretched:SetHeight(castBar:GetHeight())\n    textureStretched:SetBlendMode(\"ADD\") \n    textureStretched:SetAlpha(0.5)\n    textureStretched:SetDrawLayer(\"overlay\", 7)\n    \n    for i = 1, scriptTable.config.segmentsAmount  do\n        local texture = unitFrame.felAnimation.Textures[i]\n        texture:SetVertexColor(1, 1, 1, 1)\n        texture:SetDesaturated(true)\n        \n        local castBarPortion = castBar:GetWidth()/scriptTable.config.segmentsAmount\n        \n        texture:SetSize(castBarPortion+5, castBar:GetHeight())\n        texture:SetDrawLayer(\"overlay\", 6)\n        \n        texture:ClearAllPoints()\n        if (i == scriptTable.config.segmentsAmount) then\n            texture:SetPoint(\"right\", castBar, \"right\", 0, 0)\n        else\n            texture:SetPoint(\"left\", castBar, \"left\", (i-1)*castBarPortion, 2)\n        end\n        \n        texture:SetAlpha(0)\n        texture:Hide()\n        \n        texture.scale:SetOrder(1)\n        texture.scale:SetDuration(0.5)\n        texture.scale:SetScaleFrom(0.2, 1)\n        texture.scale:SetScaleTo(1, 1.5)\n        texture.scale:SetOrigin(\"right\", 0, 0)\n        \n        local durationTime = DetailsFramework:GetBezierPoint(i / scriptTable.config.segmentsAmount, 0.2, 0.01, 0.6)\n        local duration = abs(durationTime-0.6)\n        --local duration = 0.6 --debug\n        \n        texture.alpha:SetOrder(1)\n        texture.alpha:SetDuration(0.05)\n        texture.alpha:SetFromAlpha(0)\n        texture.alpha:SetToAlpha(0.4)\n        \n        texture.alpha2:SetOrder(1)\n        texture.alpha2:SetDuration(duration) --0.6\n        texture.alpha2:SetStartDelay(duration)\n        texture.alpha2:SetFromAlpha(0.5)\n        texture.alpha2:SetToAlpha(0)\n    end\n    \n    unitFrame.stopCastingX:Show()\n    \n    envTable.CurrentTexture = 1\n    envTable.NextPercent  = 100  / scriptTable.config.segmentsAmount\n    \n    self.Text:SetDrawLayer(\"artwork\", 7)\n    self.Spark:SetDrawLayer(\"artwork\", 7)\n    self.Spark:Hide()\nend\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				377004, -- [1]
				381516, -- [2]
				196543, -- [3]
				199726, -- [4]
				200291, -- [5]
				268202, -- [6]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Need a /reload",
					["Min"] = 5,
					["Fraction"] = false,
					["Value"] = 20,
					["Key"] = "segmentsAmount",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Amount of Segments",
				}, -- [1]
				{
					["Type"] = 1,
					["Key"] = "sparkColor",
					["Value"] = {
						0.9568627450980391, -- [1]
						1, -- [2]
						0.9882352941176471, -- [3]
						1, -- [4]
					},
					["Name"] = "Spark Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 1,
					["Key"] = "glowColor",
					["Value"] = {
						0.8588235294117647, -- [1]
						0.4313725490196079, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Glow Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [3]
			},
			["version"] = -1,
			["Name"] = "Cast - Stop Casting [P]",
			["NpcNames"] = {
			},
		}, -- [39]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n\n--Scorchling 194622\n--Scorchling 190205\n--197398  Hungry Lasher\n--77006 corpse skitterling\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --restoring and color state and scale even if disabled, maybe the player disabled during the combat\n    Plater.DenyColorChange(unitFrame, false)\n    unitFrame.healthBar:SetScale(unitFrame.healthBar._savedOriginalScale)\n    \nend\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.useNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n",
			["Time"] = 1670427838,
			["url"] = "",
			["Icon"] = "interface/addons/plater/media/duck_64",
			["Enabled"] = true,
			["Revision"] = 111,
			["semver"] = "",
			["Author"] = "Huugg-Valdrakken",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.useNameplateColor) then\n        envTable.NameplateColor = Plater.GetColorByPriority(unitFrame, scriptTable.config.nameplateColor)\n        Plater.DenyColorChange(unitFrame, true)\n    end    \n    \n    unitFrame.healthBar._savedOriginalScale = unitFrame.healthBar:GetScale()\n    \n    if (scriptTable.config.useNameplateScale) then\n        unitFrame.healthBar:SetScale(scriptTable.config.scale)\n    end\n    \nend\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 4,
					["Key"] = "useNameplateColor",
					["Value"] = false,
					["Name"] = "Change Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Change Nameplate Color",
				}, -- [1]
				{
					["Type"] = 1,
					["Name"] = "Nameplate Color",
					["Value"] = {
						0.062745101749897, -- [1]
						0.062745101749897, -- [2]
						0.0941176563501358, -- [3]
						1, -- [4]
					},
					["Key"] = "nameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Nameplate Color",
				}, -- [2]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Option 4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Change Nameplate Scale",
					["Value"] = true,
					["Key"] = "useNameplateScale",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Change Nameplate Scale",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Nameplate Scale",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 0.8,
					["Name"] = "Nameplate Scale",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "scale",
				}, -- [5]
			},
			["version"] = -1,
			["Name"] = "Add - Non Elite Trash [P]",
			["NpcNames"] = {
				"194622", -- [1]
				"190205", -- [2]
				"197398", -- [3]
				"77006", -- [4]
			},
		}, -- [40]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    local healthBar = unitFrame.healthBar\n    \n    if (not healthBar.absorbBar) then\n        healthBar.absorbBar = healthBar.FrameOverlay:CreateTexture(nil, \"overlay\")\n        healthBar.absorbBar:SetTexture([[Interface\\RaidFrame\\Shield-Fill]])\n        healthBar.absorbBar:Hide()\n    end\n    \n    if (not healthBar.absorbSpark) then\n        healthBar.absorbSpark = healthBar.FrameOverlay:CreateTexture(nil, \"overlay\")\n        healthBar.absorbSpark:SetTexture([[Interface\\CastingBar\\UI-CastingBar-Spark]])\n        healthBar.absorbSpark:SetBlendMode(\"ADD\")\n        healthBar.absorbSpark:Hide()\n    end\n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not UnitGetTotalAbsorbs) then\n        return\n    end\n    \n    local healthBar = unitFrame.healthBar\n    \n    healthBar.absorbBar:Hide()    \n    healthBar.absorbSpark:Hide()\n    \nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not UnitGetTotalAbsorbs) then\n        return\n    end\n    \n    local healthBar = unitFrame.healthBar\n    \n    healthBar.absorbBar:Show()\n    healthBar.absorbSpark:Show()\n    \n    local maxValue = healthBar.absorbBar.MaxValue\n    local currentValue = UnitGetTotalAbsorbs(unitId) or 0\n    \n    if (currentValue > 0) then\n        local minValue = 0\n        \n        local percent = currentValue / maxValue\n        healthBar.absorbBar:SetTexCoord(0, percent, 0, 1)\n        healthBar.absorbBar:SetWidth(percent * healthBar:GetWidth())\n        \n        healthBar.absorbSpark:SetPoint(\"left\", healthBar, \"left\", percent * healthBar:GetWidth() - 16, 0)\n        \n    else\n        healthBar.absorbBar:Hide()    \n        healthBar.absorbSpark:Hide()\n    end\n    \n    self.ThrottleUpdate = 0\n    \nend\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1669325411,
			["url"] = "",
			["Icon"] = "interface/addons/plater/images/cast_bar - absorb",
			["Enabled"] = true,
			["Revision"] = 101,
			["semver"] = "",
			["Author"] = "Huugg-Valdrakken",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "When the caster has a shield and only when the shield is removed the cast can be interrupted",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (not UnitGetTotalAbsorbs) then\n        return\n    end\n    \n    local healthBar = unitFrame.healthBar\n    \n    healthBar.absorbBar:Show()\n    healthBar.absorbSpark:Show()\n    \n    healthBar.absorbBar:SetTexture([[Interface\\RaidFrame\\Shield-Fill]])\n    \n    healthBar.absorbBar:ClearAllPoints()    \n    healthBar.absorbBar:SetPoint(\"topleft\", healthBar, \"topleft\", 0, 0)\n    healthBar.absorbBar:SetPoint(\"bottomleft\", healthBar, \"bottomleft\", 0, 0)\n    \n    healthBar.absorbBar:SetAlpha(1)\n    \n    healthBar.absorbBar.MaxValue = UnitGetTotalAbsorbs(unitId) or 0\n    healthBar.absorbBar.MinValue = 0\nend\n\n\n",
			["SpellIds"] = {
				373688, -- [1]
				391050, -- [2]
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Cast - Shield Interrupt [P]",
			["NpcNames"] = {
			},
		}, -- [41]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    function envTable.PlaySwipeAnimation(unitFrame)\n        unitFrame.CastSwipeTexture:Show()\n        unitFrame.CastSwipeAnimation:Play()\n        unitFrame.StartSwipeAnimation:Play()\n    end\n    \n    function envTable.StopSwipeAnimation(unitFrame)\n        unitFrame.EndSwipeAnimation:Play()\n        C_Timer.After(0.21, function()\n                unitFrame.CastSwipeAnimation:Stop()\n                unitFrame.CastSwipeTexture:Hide()\n        end)\n    end\n    \n    function envTable.CreateSwipeTextureAndAnimations(unitFrame)\n        if (unitFrame.CastSwipeTexture) then\n            return\n        end\n        \n        local swipeTexture = unitFrame:CreateTexture(nil, \"overlay\")\n        swipeTexture:SetTexture([[Interface\\AddOns\\Plater\\images\\circular_swipe]])\n        swipeTexture:SetPoint(\"center\", 0, 0)\n        swipeTexture:SetSize(64, 64)\n        swipeTexture:Hide()\n        \n        unitFrame.CastSwipeTexture = swipeTexture\n        \n        --rotation animation\n        unitFrame.CastSwipeAnimation = Plater:CreateAnimationHub(swipeTexture)\n        unitFrame.CastSwipeAnimation:SetLooping(\"repeat\")\n        unitFrame.CastSwipeAnimation.Rotation = Plater:CreateAnimation(unitFrame.CastSwipeAnimation, \"rotation\", 1, 1, 360)\n        \n        --starting animation\n        unitFrame.StartSwipeAnimation = Plater:CreateAnimationHub(swipeTexture, function()swipeTexture:Show() end)\n        unitFrame.StartSwipeAnimation.Alpha = Plater:CreateAnimation(unitFrame.StartSwipeAnimation, \"alpha\", 1, 0.2, 0, 1)\n        unitFrame.StartSwipeAnimation.Scale = Plater:CreateAnimation(unitFrame.StartSwipeAnimation, \"scale\", 1, 0.2, 1.3, 1.3, 1, 1)        \n        \n        --finished animation\n        unitFrame.EndSwipeAnimation = Plater:CreateAnimationHub(swipeTexture, nil, function()swipeTexture:Hide() end)\n        unitFrame.EndSwipeAnimation.Alpha = Plater:CreateAnimation(unitFrame.EndSwipeAnimation, \"alpha\", 1, 0.2, 1, 0)\n        unitFrame.EndSwipeAnimation.Scale = Plater:CreateAnimation(unitFrame.EndSwipeAnimation, \"scale\", 1, 0.2, 1, 1, 1.3, 1.3)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.StopSwipeAnimation(unitFrame)\nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
			["Time"] = 1670428019,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\circular_swipe",
			["Enabled"] = true,
			["Revision"] = 162,
			["semver"] = "",
			["Author"] = "Butazzul-Valdrakken",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["Desc"] = "Play a animation when the spell effect is an circular AoE around the caster.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.CreateSwipeTextureAndAnimations(unitFrame)\n    \n    local options = scriptTable.config\n    \n    local targetScale = scriptTable.config.textureScale\n    \n    --swipe rotation duration    \n    unitFrame.CastSwipeAnimation.Rotation:SetDuration(scriptTable.config.rotationDuration)\n    \n    --swipe texture settings\n    unitFrame.CastSwipeTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.textureColor))\n    unitFrame.CastSwipeTexture:SetScale(targetScale)\n    unitFrame.CastSwipeTexture:SetAlpha(scriptTable.config.textureAlpha)  \n    \n    unitFrame.StartSwipeAnimation.Alpha:SetDuration(scriptTable.config.animStartDuration)\n    unitFrame.StartSwipeAnimation.Alpha:SetFromAlpha(scriptTable.config.textureStartAlpha)\n    unitFrame.StartSwipeAnimation.Alpha:SetToAlpha(scriptTable.config.textureAlpha)\n    \n    unitFrame.StartSwipeAnimation.Scale:SetDuration(scriptTable.config.animStartDuration)\n    unitFrame.StartSwipeAnimation.Scale:SetScaleTo(targetScale, targetScale)\n    \n    unitFrame.EndSwipeAnimation.Scale:SetDuration(0.1)\n    unitFrame.EndSwipeAnimation.Alpha:SetDuration(0.1)\n    \n    --start playing\n    envTable.PlaySwipeAnimation(unitFrame)    \n    \nend\n\n\n",
			["SpellIds"] = {
				385916, -- [1]
				386063, -- [2]
				388822, -- [3]
				373087, -- [4]
				397785, -- [5]
				106864, -- [6]
				193660, -- [7]
				198263, -- [8]
				387910, -- [9]
				370766, -- [10]
				375591, -- [11]
				384336, -- [12]
				209404, -- [13]
				209378, -- [14]
				210875, -- [15]
				396001, -- [16]
				397899, -- [17]
				386559, -- [18]
				382555, -- [19]
				258672, -- [20]
				258777, -- [21]
				257756, -- [22]
				257784, -- [23]
				256405, -- [24]
				256589, -- [25]
				393793, -- [26]
				388046, -- [27]
				375079, -- [28]
				390290, -- [29]
				369811, -- [30]
				369703, -- [31]
				226287, -- [32]
				410999, -- [33]
				372561, -- [34]
				256882, -- [35]
				172578, -- [36]
				412063, -- [37]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 2,
					["Max"] = 0.3,
					["Desc"] = "Rotation Duration",
					["Min"] = 0.1,
					["Fraction"] = true,
					["Value"] = 0.15,
					["Key"] = "rotationDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Rotation Duration",
				}, -- [1]
				{
					["Type"] = 6,
					["Name"] = "Option 5",
					["Value"] = 0,
					["Key"] = "option5",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 2,
					["Max"] = 1.5,
					["Desc"] = "Animation Start Duration",
					["Min"] = 0,
					["Name"] = "Animation Start Duration",
					["Value"] = 0.3,
					["Key"] = "animStartDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Texture Alpha when the animation start playing, this effect in intended to catch the player attention",
					["Min"] = 0,
					["Key"] = "textureStartAlpha",
					["Value"] = 1,
					["Name"] = "Texture Start Alpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [4]
				{
					["Type"] = 6,
					["Key"] = "option5",
					["Value"] = 0,
					["Name"] = "Option 5",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "Texture Scale",
					["Min"] = 0.6,
					["Fraction"] = true,
					["Value"] = 0.8,
					["Key"] = "textureScale",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Texture Scale",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Texture Alpha",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 1,
					["Key"] = "textureAlpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Texture Alpha",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Texture Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "textureColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Texture Color",
				}, -- [8]
			},
			["version"] = -1,
			["Name"] = "Cast - Circle AoE [P]",
			["NpcNames"] = {
			},
		}, -- [42]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --create a flash texture which keep blinking while the cast in going on\n    self.OGC_BlinkTexture = self.OGC_BlinkTexture or self:CreateTexture(nil, \"overlay\")\n    self.OGC_BlinkTexture:SetColorTexture(1, 1, 1)\n    self.OGC_BlinkTexture:SetAlpha(0)\n    \n    --create the animation group for the blinking texture\n    self.OGC_BlinkAnimation = self.OGC_BlinkAnimation or Plater:CreateAnimationHub(self.OGC_BlinkTexture, function() self.OGC_BlinkTexture:Show() end, function() self.OGC_BlinkTexture:Hide() end)\n    \n    self.OGC_BlinkAnimation.In = self.OGC_BlinkAnimation.In or Plater:CreateAnimation(self.OGC_BlinkAnimation, \"alpha\", 1, 0.5, 0.3, 1)\n    \n    self.OGC_BlinkAnimation.Out = self.OGC_BlinkAnimation.Out or Plater:CreateAnimation(self.OGC_BlinkAnimation, \"alpha\", 2, 0.5, 1, 0.2)    \n    \n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    self.OGC_BlinkAnimation:Stop()\n    \n    Plater.StopDotAnimation(self, envTable.dotAnimation1)    \n    Plater.StopDotAnimation(self, envTable.dotAnimation2)   \n    \nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Time"] = 1676905232,
			["url"] = "",
			["Icon"] = 4038101,
			["Enabled"] = true,
			["Revision"] = 73,
			["semver"] = "",
			["Author"] = "Ditador-Azralon",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["Desc"] = "The background of the nameplate blinks a red color indicating the cast is being performed. Useful to indicate channeling spells doing damage overtime.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    self.OGC_BlinkTexture:ClearAllPoints()\n    self.OGC_BlinkTexture:SetPoint(\"topleft\", self, \"topleft\", 0, 0)\n    self.OGC_BlinkTexture:SetPoint(\"bottomright\", self, \"bottomright\", 0, 0)\n    \n    local red, green, blue = Plater:ParseColors(scriptTable.config.blinkColor)\n    self.OGC_BlinkTexture:SetVertexColor(red, green, blue)\n    \n    local blinkSpeed = scriptTable.config.speed\n    \n    self.OGC_BlinkAnimation.In:SetDuration(blinkSpeed)\n    self.OGC_BlinkAnimation.Out:SetDuration(blinkSpeed)\n    \n    local minBlinkAlpha = scriptTable.config.minAlpha\n    local maxBlinkAlpha = scriptTable.config.maxAlpha\n    \n    self.OGC_BlinkAnimation.In:SetFromAlpha(minBlinkAlpha)\n    self.OGC_BlinkAnimation.In:SetToAlpha(maxBlinkAlpha)\n    self.OGC_BlinkAnimation.Out:SetFromAlpha(maxBlinkAlpha)    \n    self.OGC_BlinkAnimation.Out:SetToAlpha(minBlinkAlpha)\n    \n    self.OGC_BlinkAnimation:SetLooping(\"repeat\")\n    self.OGC_BlinkAnimation:Play()\n    \n    envTable.dotAnimation1 = Plater.PlayDotAnimation(self, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    envTable.dotAnimation1.textureInfo.speedMultiplier = 0.3\n    \n    envTable.dotAnimation2 = Plater.PlayDotAnimation(self, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    envTable.dotAnimation2.textureInfo.speedMultiplier = 1\n    \nend",
			["SpellIds"] = {
				388886, -- [1]
				209676, -- [2]
				377912, -- [3]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 1,
					["Name"] = "Dots Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						0.4166216850280762, -- [4]
					},
					["Key"] = "dotColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Dots Color",
				}, -- [1]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dots X Offset",
					["Min"] = -10,
					["Key"] = "xOffset",
					["Value"] = 0,
					["Name"] = "Dots X Offset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [2]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dots Y Offset",
					["Min"] = -10,
					["Fraction"] = false,
					["Value"] = 0,
					["Key"] = "yOffset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Dots Y Offset",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Option 4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Adjust how fast the blinking occurs",
					["Min"] = 0.2,
					["Name"] = "Blink Speed",
					["Value"] = 0.4,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "speed",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Min amount of transparency the blink can have",
					["Min"] = 0,
					["Name"] = "Blink Min Alpha",
					["Value"] = 0,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "minAlpha",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Max amount of transparency the blink can have",
					["Min"] = 0,
					["Key"] = "maxAlpha",
					["Value"] = 0.5,
					["Name"] = "Blink Max Alpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [7]
				{
					["Type"] = 1,
					["Key"] = "blinkColor",
					["Value"] = {
						1, -- [1]
						0.01960784383118153, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Blink Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the blinking texture",
				}, -- [8]
			},
			["version"] = -1,
			["Name"] = "Cast - On Going Cast [P]",
			["NpcNames"] = {
			},
		}, -- [43]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    function envTable.CreateWidgets()\n        --create a camera shake for the nameplate\n        if (not unitFrame.AddExplosionOnDieShake) then\n            unitFrame.AddExplosionOnDieShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n        end\n        \n        if (not unitFrame.AddExplosionOnDieBackground) then\n            unitFrame.AddExplosionOnDieBackground = unitFrame.healthBar:CreateTexture(nil, \"background\")\n            unitFrame.AddExplosionOnDieBackground:SetAllPoints(unitFrame.healthBar)\n            unitFrame.AddExplosionOnDieBackground:SetColorTexture(1, 0, 0, 1)\n        end\n    end\n    \nend\n\n--194895 = unstable squall\n--105703 = mana wyrm\n--59598 = lesser sha\n--58319 = lesser sha\n\n\n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    local healthBar = unitFrame.healthBar\n    healthBar:SetReverseFill(false)\n    \n    if (unitFrame.AddExplosionOnDieShake) then\n        unitFrame:StopFrameShake (unitFrame.AddExplosionOnDieShake)    \n    end\n    \n    if (unitFrame.AddExplosionOnDieBackground) then\n        unitFrame.AddExplosionOnDieBackground:Hide()\n    end\nend\n\n\n\n\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (envTable._HealthPercent < 50) then\n        local alpha = DetailsFramework:MapRangeClamped(0, 50, 0.5, 0, envTable._HealthPercent)\n        \n        unitFrame.AddExplosionOnDieBackground:SetAlpha(alpha)\n    else\n        unitFrame.AddExplosionOnDieBackground:SetAlpha(0)\n    end\n    \n    if (envTable._HealthPercent < 15 and scriptTable.config.useShake) then\n        local shakeAmpliture = DetailsFramework:MapRangeClamped(0.001, 15, 10, 1, envTable._HealthPercent)\n        \n        unitFrame.AddExplosionOnDieShake.OriginalAmplitude = scriptTable.config.shakeAmplitude * shakeAmpliture\n        unitFrame.AddExplosionOnDieShake.OriginalFrequency = scriptTable.config.shakeFrequency\n        \n        unitFrame:PlayFrameShake (unitFrame.AddExplosionOnDieShake)\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1669340350,
			["url"] = "",
			["Icon"] = "interface/addons/plater/media/radio_64",
			["Enabled"] = true,
			["Revision"] = 106,
			["semver"] = "",
			["Author"] = "Huugg-Valdrakken",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    local healthBar = unitFrame.healthBar\n    \n    if (scriptTable.config.useReverse) then\n        healthBar:SetReverseFill(true)\n    end\n    \n    --unitFrame.AddExplosionOnDieShake\n    \n    envTable.CreateWidgets()\n    \n    unitFrame.AddExplosionOnDieShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    unitFrame.AddExplosionOnDieShake.OriginalDuration = 0.120\n    unitFrame.AddExplosionOnDieShake.OriginalFrequency = scriptTable.config.shakeFrequency\n    \n    if (scriptTable.config.useBackground) then\n        unitFrame.AddExplosionOnDieBackground:Show()\n        unitFrame.AddExplosionOnDieBackground:SetAlpha(0)\n    else\n        unitFrame.AddExplosionOnDieBackground:Hide()\n    end\nend\n\n\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 4,
					["Key"] = "useReverse",
					["Value"] = false,
					["Name"] = "Reverse Health Bar",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 6,
					["Key"] = "option6",
					["Value"] = 0,
					["Name"] = "Option 6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 4,
					["Key"] = "useShake",
					["Value"] = false,
					["Name"] = "Enable Shake",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "How strong is the shake.",
					["Min"] = 0.05,
					["Key"] = "shakeAmplitude",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Amplitude",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Key"] = "shakeFrequency",
					["Value"] = 70,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Frequency",
				}, -- [5]
				{
					["Type"] = 6,
					["Key"] = "option7",
					["Value"] = 0,
					["Name"] = "Option 7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Key"] = "useBackground",
					["Value"] = true,
					["Name"] = "Show Red Background",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show Red Background",
				}, -- [7]
			},
			["version"] = -1,
			["Name"] = "Add - Explode on Die [P]",
			["NpcNames"] = {
				"194895", -- [1]
				"105703", -- [2]
				"59598", -- [3]
				"58319", -- [4]
				200388, -- [5]
				189299, -- [6]
				131402, -- [7]
				135052, -- [8]
			},
		}, -- [44]
	},
	["saved_cvars_last_change"] = {
		["ShowClassColorInNameplate"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateOverlapV"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateLargeTopInset"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowEnemyMinus"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["NamePlateClassificationScale"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowFriendlyTotems"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplatePersonalHideDelaySeconds"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowFriendlyPets"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplatePersonalShowInCombat"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplatePersonalShowWithTarget"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["clampTargetNameplateToScreen"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowAll"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateMaxDistance"] = "Interface\\FrameXML\\OptionsPanelTemplates.lua:69",
		["nameplateShowFriendlyMinions"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateTargetBehindMaxDistance"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowEnemies"] = "[string \"=[C]\"]: in function `SetCVar'\n[string \"NAMEPLATES\"]:6: in function <[string \"NAMEPLATES\"]:1>\n",
		["NamePlateVerticalScale"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateSelectedAlpha"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplatePersonalShowAlways"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateMotionSpeed"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateGlobalScale"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowEnemyMinions"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowEnemyPets"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowFriendlyNPCs"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateSelectedScale"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowFriends"] = "[string \"=[C]\"]: ?\n[string \"=[C]\"]: in function `SetCVar'\n[string \"ALLNAMEPLATES\"]:13: in function <[string \"ALLNAMEPLATES\"]:1>\n",
		["nameplateMotion"] = "[string \"=[C]\"]: in function `SetCVar'\n[string \"@Interface/AddOns/Plater/Plater.lua\"]:8600: in function `RefreshAutoToggle'\n[string \"@Interface/AddOns/Plater/Plater.lua\"]:2341: in function `func'\n[string \"@Interface/AddOns/Plater/Plater.lua\"]:3965: in function `EventHandler'\n[string \"@Interface/AddOns/Plater/Plater.lua\"]:3976: in function `RunFunctionForEvent'\n[string \"@Interface/AddOns/Plater/Plater.lua\"]:3982: in function <Interface/AddOns/Plater/Plater.lua:3979>\n",
		["nameplateMinScale"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateOtherTopInset"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateTargetRadialPosition"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowEnemyTotems"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowFriendlyGuardians"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowEnemyGuardians"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["NamePlateHorizontalScale"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateOccludedAlphaMult"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["ShowNamePlateLoseAggroFlash"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
		["nameplateShowOnlyNames"] = "Interface\\AddOns\\Plater\\Plater.lua:1981",
	},
	["aura_cache_by_name"] = {
		["ebon plague"] = {
			51726, -- [1]
			51734, -- [2]
			51735, -- [3]
		},
		["unholy blight"] = {
			49194, -- [1]
			50536, -- [2]
			53640, -- [3]
			53641, -- [4]
			55855, -- [5]
		},
	},
	["url"] = "https://wago.io/sITMrlX9-/6",
	["aura2_y_offset"] = 31.09999084472656,
	["aura_timer_text_anchor"] = {
		["y"] = -0.6000003814697266,
	},
	["buffs_on_aura2"] = true,
	["health_selection_overlay"] = "Melli Dark",
	["expansion_triggerwipe"] = {
		[2] = true,
		[3] = true,
	},
	["npc_cache"] = {
		[24560] = {
			"Priestess Delrissa", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26639] = {
			"Drakkari Shaman", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[16468] = {
			"Spectral Patron", -- [1]
			"Karazhan", -- [2]
		},
		[24688] = {
			"Wretched Skulker", -- [1]
			"Magister's Terrace", -- [2]
		},
		[30893] = {
			"Portal Keeper", -- [1]
			"Violet Hold", -- [2]
		},
		[28878] = {
			"Skeletal Minion", -- [1]
			"Utgarde Keep", -- [2]
		},
		[184263] = {
			"Zealous Consort", -- [1]
			"Karazhan", -- [2]
		},
		[6224] = {
			"Leprous Machinesmith", -- [1]
			"Gnomeregan", -- [2]
		},
		[6232] = {
			"Arcane Nullifier X-21", -- [1]
			"Gnomeregan", -- [2]
		},
		[22897] = {
			"Summoned Windfury Totem", -- [1]
			"Black Temple", -- [2]
		},
		[20882] = {
			"Skulking Witch", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[164562] = {
			"Depraved Houndmaster", -- [1]
			"Halls of Atonement", -- [2]
		},
		[19219] = {
			"Mechano-Lord Capacitus", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[21298] = {
			"Coilfang Serpentguard", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[32857] = {
			"Stormcaller Brundir", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29774] = {
			"Spitting Cobra", -- [1]
			"Gundrak", -- [2]
		},
		[168658] = {
			"Forsworn Devastator", -- [1]
			"Spires of Ascension", -- [2]
		},
		[25744] = {
			"Dark Fiend", -- [1]
			"The Sunwell", -- [2]
		},
		[165076] = {
			"Gluttonous Tick", -- [1]
			"Sanguine Depths", -- [2]
		},
		[25840] = {
			"Entropius", -- [1]
			"The Sunwell", -- [2]
		},
		[27983] = {
			"Dark Rune Protector", -- [1]
			"Halls of Stone", -- [2]
		},
		[23953] = {
			"Prince Keleseth", -- [1]
			"Utgarde Keep", -- [2]
		},
		[17908] = {
			"Giant Infernal", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[17940] = {
			"Coilfang Technician", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[30286] = {
			"Frostbringer", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[24241] = {
			"Thurg", -- [1]
			"Zul'Aman", -- [2]
		},
		[30414] = {
			"Forgotten One", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[151773] = {
			"Junkyard D.0.G.", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[24561] = {
			"Yazzai", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26672] = {
			"Bloodthirsty Tundra Wolf", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[24689] = {
			"Wretched Bruiser", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26800] = {
			"Alliance Berserker", -- [1]
			"The Nexus", -- [2]
		},
		[15483] = {
			"Fire Nova Totem VII", -- [1]
			"Magister's Terrace", -- [2]
		},
		[18708] = {
			"Murmur", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[180433] = {
			"Wandering Pulsar", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[22898] = {
			"Supremus", -- [1]
			"Black Temple", -- [2]
		},
		[20883] = {
			"Spiteful Temptress", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22962] = {
			"Mistress of Woe", -- [1]
			"Black Temple", -- [2]
		},
		[31214] = {
			"Sartharion Twilight Whelp", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[33818] = {
			"Twilight Adherent", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[15691] = {
			"The Curator", -- [1]
			"Karazhan", -- [2]
		},
		[19220] = {
			"Pathaleon the Calculator", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[21299] = {
			"Coilfang Fathom-Witch", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[21395] = {
			"Protean Spawn", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[27600] = {
			"Risen Shadowcaster", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[17397] = {
			"Shadowmoon Adept", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[17429] = {
			"Fel Orc Neophyte", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[15931] = {
			"Grobbulus", -- [1]
			"Naxxramas", -- [2]
		},
		[173016] = {
			"Corpse Collector", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[15979] = {
			"Tomb Horror", -- [1]
			"Naxxramas", -- [2]
		},
		[17653] = {
			"Shadowmoon Channeler", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[16011] = {
			"Loatheb", -- [1]
			"Naxxramas", -- [2]
		},
		[27984] = {
			"Dark Rune Stormcaller", -- [1]
			"Halls of Stone", -- [2]
		},
		[21875] = {
			"Shadow of Leotheras", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[23954] = {
			"Ingvar the Plunderer", -- [1]
			"Utgarde Keep", -- [2]
		},
		[33755] = {
			"Dark Rune Ravager", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24082] = {
			"Proto-Drake Handler", -- [1]
			"Utgarde Keep", -- [2]
		},
		[30287] = {
			"Plundering Geist", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[30319] = {
			"Twilight Darkcaster", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[24242] = {
			"Slither", -- [1]
			"Zul'Aman", -- [2]
		},
		[28368] = {
			"Ymirjar Necromancer", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[178392] = {
			"Gatewarden Zo'mazz", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[24530] = {
			"Amani Elder Lynx", -- [1]
			"Zul'Aman", -- [2]
		},
		[26641] = {
			"Drakkari Gutripper", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[16470] = {
			"Ghostly Philanthropist", -- [1]
			"Karazhan", -- [2]
		},
		[26737] = {
			"Crazed Mana-Surge", -- [1]
			"The Nexus", -- [2]
		},
		[146409] = {
			"Lady Jaina Proudmoore", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[24850] = {
			"Kalecgos", -- [1]
			"The Sunwell", -- [2]
		},
		[24882] = {
			"Brutallus", -- [1]
			"The Sunwell", -- [2]
		},
		[18805] = {
			"High Astromancer Solarian", -- [1]
			"Tempest Keep", -- [2]
		},
		[22963] = {
			"Bonechewer Worker", -- [1]
			"Black Temple", -- [2]
		},
		[33820] = {
			"Twilight Pyromancer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21140] = {
			"Rift Lord", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[21268] = {
			"Netherstrand Longbow", -- [1]
			"Tempest Keep", -- [2]
		},
		[34460] = {
			"Kavina Grovesong", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[150250] = {
			"Pistonhead Blaster", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[27633] = {
			"Azure Inquisitor", -- [1]
			"The Oculus", -- [2]
		},
		[178141] = {
			"Murkbrine Scalebinder", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[27729] = {
			"Enraging Ghoul", -- [1]
			"UNKNOWN", -- [2]
		},
		[150251] = {
			"Pistonhead Mechanic", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[178142] = {
			"Murkbrine Fishmancer", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[27985] = {
			"Iron Golem Custodian", -- [1]
			"Halls of Stone", -- [2]
		},
		[17814] = {
			"Lordaeron Watchman", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[17846] = {
			"Pit Spectator", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[24083] = {
			"Enslaved Proto-Drake", -- [1]
			"Utgarde Keep", -- [2]
		},
		[168420] = {
			"Forsworn Champion", -- [1]
			"Spires of Ascension", -- [2]
		},
		[24179] = {
			"Amani'shi Wind Walker", -- [1]
			"Zul'Aman", -- [2]
		},
		[24243] = {
			"Lord Raadan", -- [1]
			"Zul'Aman", -- [2]
		},
		[30416] = {
			"Bound Fire Elemental", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[34461] = {
			"Tyrius Duskblade", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[150254] = {
			"Scraphound", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[177889] = {
			"Mawforged Souljudge", -- [1]
			"Sanctum of Domination", -- [2]
		},
		[16407] = {
			"Spectral Servant", -- [1]
			"Karazhan", -- [2]
		},
		[16471] = {
			"Skeletal Usher", -- [1]
			"Karazhan", -- [2]
		},
		[24723] = {
			"Selin Fireheart", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26802] = {
			"Alliance Ranger", -- [1]
			"The Nexus", -- [2]
		},
		[26930] = {
			"Grand Magus Telestra", -- [1]
			"The Nexus", -- [2]
		},
		[15548] = {
			"Spectral Stallion", -- [1]
			"Karazhan", -- [2]
		},
		[20885] = {
			"Dalliah the Doomsayer", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22964] = {
			"Priestess of Delight", -- [1]
			"Black Temple", -- [2]
		},
		[177891] = {
			"Mawforged Summoner", -- [1]
			"Sanctum of Domination", -- [2]
		},
		[33822] = {
			"Twilight Guardian", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16983] = {
			"Plagued Champion", -- [1]
			"Naxxramas", -- [2]
		},
		[34014] = {
			"Sanctum Sentry", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[206038] = {
			"Immortal Crusher Tentacle", -- [1]
			"Halls of Lightning", -- [2]
			"enUS", -- [3]
		},
		[177892] = {
			"Mawforged Goliath", -- [1]
			"Sanctum of Domination", -- [2]
		},
		[25363] = {
			"Sunblade Cabalist", -- [1]
			"The Sunwell", -- [2]
		},
		[21301] = {
			"Coilfang Shatterer", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[168681] = {
			"Forsworn Helion", -- [1]
			"Spires of Ascension", -- [2]
		},
		[17399] = {
			"Seductress", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[29713] = {
			"Slad'ran Constrictor", -- [1]
			"Gundrak", -- [2]
		},
		[19510] = {
			"Bloodwarder Centurion", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[32927] = {
			"Runemaster Molgeim", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[15932] = {
			"Gluth", -- [1]
			"Naxxramas", -- [2]
		},
		[15980] = {
			"Naxxramas Cultist", -- [1]
			"Naxxramas", -- [2]
		},
		[172265] = {
			"Remnant of Fury", -- [1]
			"Sanguine Depths", -- [2]
		},
		[160495] = {
			"Maniacal Soulbinder", -- [1]
			"Theater of Pain", -- [2]
		},
		[23956] = {
			"Dragonflayer Strategist", -- [1]
			"Utgarde Keep", -- [2]
		},
		[16124] = {
			"Unrelenting Trainee", -- [1]
			"Naxxramas", -- [2]
		},
		[24084] = {
			"Tunneling Ghoul", -- [1]
			"Utgarde Keep", -- [2]
		},
		[16156] = {
			"Dark Touched Warrior", -- [1]
			"Naxxramas", -- [2]
		},
		[24180] = {
			"Amani'shi Protector", -- [1]
			"Zul'Aman", -- [2]
		},
		[24244] = {
			"Gazakroth", -- [1]
			"Zul'Aman", -- [2]
		},
		[16236] = {
			"Eye Stalk", -- [1]
			"Naxxramas", -- [2]
		},
		[30449] = {
			"Vesperon", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[34463] = {
			"Shaabad", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[114312] = {
			"Moroes", -- [1]
			"Return to Karazhan", -- [2]
		},
		[16408] = {
			"Phantom Valet", -- [1]
			"Karazhan", -- [2]
		},
		[16472] = {
			"Phantom Stagehand", -- [1]
			"Karazhan", -- [2]
		},
		[16504] = {
			"Arcane Protector", -- [1]
			"Karazhan", -- [2]
		},
		[168942] = {
			"Death Speaker", -- [1]
			"De Other Side", -- [2]
		},
		[30961] = {
			"Azure Invader", -- [1]
			"Violet Hold", -- [2]
		},
		[165872] = {
			"Flesh Crafter", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[6225] = {
			"Mechano-Tank", -- [1]
			"Gnomeregan", -- [2]
		},
		[6233] = {
			"Mechanized Sentry", -- [1]
			"Gnomeregan", -- [2]
		},
		[20886] = {
			"Wrath-Scryer Soccothrates", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22965] = {
			"Devoted Steward", -- [1]
			"Black Temple", -- [2]
		},
		[22997] = {
			"Flame of Azzinoth", -- [1]
			"Black Temple", -- [2]
		},
		[33824] = {
			"Twilight Shadowblade", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29266] = {
			"Xevozz", -- [1]
			"Violet Hold", -- [2]
		},
		[25268] = {
			"Unyielding Dead", -- [1]
			"The Sunwell", -- [2]
		},
		[6329] = {
			"Irradiated Pillager", -- [1]
			"Gnomeregan", -- [2]
		},
		[4306] = {
			"Scarlet Torturer", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[27635] = {
			"Azure Spellbinder", -- [1]
			"The Oculus", -- [2]
		},
		[32865] = {
			"Thorim", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[27731] = {
			"Acolyte", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[29874] = {
			"Drakkari Inciter", -- [1]
			"Gundrak", -- [2]
		},
		[17624] = {
			"Laughing Skull Warden", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[19735] = {
			"Tempest-Forge Destroyer", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[162038] = {
			"Regal Mistdancer", -- [1]
			"Sanguine Depths", -- [2]
		},
		[17816] = {
			"Bogstrok", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[17848] = {
			"Lieutenant Drake", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[17880] = {
			"Temporus", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[24085] = {
			"Dragonflayer Overseer", -- [1]
			"Utgarde Keep", -- [2]
		},
		[30258] = {
			"Amanitar", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[30418] = {
			"Bound Air Elemental", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[162040] = {
			"Grand Overseer", -- [1]
			"Sanguine Depths", -- [2]
		},
		[32593] = {
			"Skittering Swarmer", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[114316] = {
			"Baroness Dorothea Millstipe", -- [1]
			"Return to Karazhan", -- [2]
		},
		[16409] = {
			"Phantom Guest", -- [1]
			"Karazhan", -- [2]
		},
		[16441] = {
			"Guardian of Icecrown", -- [1]
			"Naxxramas", -- [2]
		},
		[16473] = {
			"Spectral Performer", -- [1]
			"Karazhan", -- [2]
		},
		[16505] = {
			"Naxxramas Follower", -- [1]
			"Naxxramas", -- [2]
		},
		[173044] = {
			"Stitching Assistant", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[33186] = {
			"Razorscale", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[2350] = {
			"Forest Moss Creeper", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[2354] = {
			"Vicious Gray Bear", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[114317] = {
			"Lady Catriona Von'Indi", -- [1]
			"Return to Karazhan", -- [2]
		},
		[23030] = {
			"Dragonmaw Sky Stalker", -- [1]
			"Black Temple", -- [2]
		},
		[33890] = {
			"Brain of Yogg-Saron", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[23222] = {
			"Bonechewer Brawler", -- [1]
			"Black Temple", -- [2]
		},
		[29395] = {
			"Erekem Guard", -- [1]
			"Violet Hold", -- [2]
		},
		[23318] = {
			"Ashtongue Rogue", -- [1]
			"Black Temple", -- [2]
		},
		[34466] = {
			"Anthar Forgemender", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[83613] = {
			"Koramar", -- [1]
			"Iron Docks", -- [2]
		},
		[27636] = {
			"Azure Ley-Whelp", -- [1]
			"The Oculus", -- [2]
		},
		[23574] = {
			"Akil'zon", -- [1]
			"Zul'Aman", -- [2]
		},
		[32867] = {
			"Steelbreaker", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[27732] = {
			"Master Necromancer", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[35042] = {
			"Memory of Illidan", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[82590] = {
			"Grimrail Scout", -- [1]
			"Grimrail Depot", -- [2]
		},
		[15981] = {
			"Naxxramas Acolyte", -- [1]
			"Naxxramas", -- [2]
		},
		[17721] = {
			"Coilfang Engineer", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[170490] = {
			"Atal'ai High Priest", -- [1]
			"De Other Side", -- [2]
		},
		[150276] = {
			"Heavy Scrapbot", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[17817] = {
			"Greater Bogstrok", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[114319] = {
			"Lady Keira Berrybuck", -- [1]
			"Return to Karazhan", -- [2]
		},
		[17881] = {
			"Aeonus", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[26101] = {
			"Fire Fiend", -- [1]
			"The Sunwell", -- [2]
		},
		[162047] = {
			"Insatiable Brute", -- [1]
			"Sanguine Depths", -- [2]
		},
		[28276] = {
			"Greater Ley-Whelp", -- [1]
			"The Oculus", -- [2]
		},
		[28340] = {
			"Stratholme Citizen", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[30419] = {
			"Bound Water Elemental", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[30451] = {
			"Shadron", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[24374] = {
			"Amani'shi Berserker", -- [1]
			"Zul'Aman", -- [2]
		},
		[34467] = {
			"Alyssia Moonstalker", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[30643] = {
			"Lava Blaze", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[22487] = {
			"Greater Poison Cleansing Totem", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[16410] = {
			"Spectral Retainer", -- [1]
			"Karazhan", -- [2]
		},
		[162049] = {
			"Vestige of Doubt", -- [1]
			"Sanguine Depths", -- [2]
		},
		[168446] = {
			"Skeletal Monstrosity", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[16506] = {
			"Naxxramas Worshipper", -- [1]
			"Naxxramas", -- [2]
		},
		[26805] = {
			"Alliance Cleric", -- [1]
			"The Nexus", -- [2]
		},
		[30963] = {
			"Azure Mage Slayer", -- [1]
			"Violet Hold", -- [2]
		},
		[22871] = {
			"Teron Gorefiend", -- [1]
			"Black Temple", -- [2]
		},
		[33572] = {
			"Steelforged Defender", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[31219] = {
			"Acolyte of Vesperon", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[2630] = {
			"Earthbind Totem", -- [1]
			"Magister's Terrace", -- [2]
		},
		[183033] = {
			"Grim Reflection", -- [1]
			"Sepulcher of the First Ones", -- [2]
		},
		[23223] = {
			"Bonechewer Spectator", -- [1]
			"Black Temple", -- [2]
		},
		[34468] = {
			"Noozle Whizzlestick", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[17370] = {
			"Laughing Skull Enforcer", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[27733] = {
			"Ghoul Minion", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[35044] = {
			"Memory of Entropius", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[17626] = {
			"Laughing Skull Legionnaire", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[17722] = {
			"Coilfang Sorceress", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[34085] = {
			"Forge Construct", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24247] = {
			"Koragg", -- [1]
			"Zul'Aman", -- [2]
		},
		[18170] = {
			"Infinite Slayer", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[34469] = {
			"Melador Valestrider", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[26550] = {
			"Dragonflayer Deathseeker", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[32934] = {
			"Right Arm", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16539] = {
			"Homunculus", -- [1]
			"Karazhan", -- [2]
		},
		[20857] = {
			"Arcatraz Defender", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[7849] = {
			"Mobile Alert System", -- [1]
			"Gnomeregan", -- [2]
		},
		[82597] = {
			"Grom'kar Captain", -- [1]
			"Grimrail Depot", -- [2]
		},
		[25367] = {
			"Sunblade Arch Mage", -- [1]
			"The Sunwell", -- [2]
		},
		[34470] = {
			"Saamul", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[17371] = {
			"Shadowmoon Warlock", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[27638] = {
			"Azure Ring Guardian", -- [1]
			"The Oculus", -- [2]
		},
		[23576] = {
			"Nalorakk", -- [1]
			"Zul'Aman", -- [2]
		},
		[19514] = {
			"Al'ar", -- [1]
			"Tempest Keep", -- [2]
		},
		[162317] = {
			"Gorechop", -- [1]
			"Theater of Pain", -- [2]
		},
		[80935] = {
			"Grom'kar Boomer", -- [1]
			"Grimrail Depot", -- [2]
		},
		[150292] = {
			"Mechagon Cavalry", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[23960] = {
			"Dragonflayer Runecaster", -- [1]
			"Utgarde Keep", -- [2]
		},
		[163086] = {
			"Rancid Gasbag", -- [1]
			"Theater of Pain", -- [2]
		},
		[16126] = {
			"Unrelenting Rider", -- [1]
			"Naxxramas", -- [2]
		},
		[16142] = {
			"Bile Sludge", -- [1]
			"Naxxramas", -- [2]
		},
		[36070] = {
			"Treant", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[18171] = {
			"Infinite Defiler", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[80936] = {
			"Grom'kar Grenadier", -- [1]
			"Grimrail Depot", -- [2]
		},
		[16286] = {
			"Spore", -- [1]
			"Naxxramas", -- [2]
		},
		[30549] = {
			"Baron Rivendare", -- [1]
			"Naxxramas", -- [2]
		},
		[168717] = {
			"Forsworn Justicar", -- [1]
			"Spires of Ascension", -- [2]
		},
		[24504] = {
			"Amani'shi Hatcher", -- [1]
			"Zul'Aman", -- [2]
		},
		[24664] = {
			"Kael'thas Sunstrider", -- [1]
			"Magister's Terrace", -- [2]
		},
		[150295] = {
			"Tank Buster MK1", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[16540] = {
			"Shadow Pillager", -- [1]
			"Karazhan", -- [2]
		},
		[80937] = {
			"Grom'kar Gunner", -- [1]
			"Grimrail Depot", -- [2]
		},
		[22841] = {
			"Shade of Akama", -- [1]
			"Black Temple", -- [2]
		},
		[22873] = {
			"Coilskar General", -- [1]
			"Black Temple", -- [2]
		},
		[31125] = {
			"Archavon the Stone Watcher", -- [1]
			"Vault of Archavon", -- [2]
		},
		[77483] = {
			"Grom'kar Gunner", -- [1]
			"Grimrail Depot", -- [2]
		},
		[33768] = {
			"Rubble", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[176396] = {
			"Defective Sorter", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[150297] = {
			"Mechagon Renormalizer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[4283] = {
			"Scarlet Sentry", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[25368] = {
			"Sunblade Slayer", -- [1]
			"The Sunwell", -- [2]
		},
		[27447] = {
			"Varos Cloudstrider", -- [1]
			"The Oculus", -- [2]
		},
		[34472] = {
			"Irieth Shadowstep", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[25592] = {
			"Doomfire Destroyer", -- [1]
			"The Sunwell", -- [2]
		},
		[23577] = {
			"Halazzi", -- [1]
			"Zul'Aman", -- [2]
		},
		[6426] = {
			"Anguished Dead", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[17820] = {
			"Durnholde Rifleman", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[17916] = {
			"Fel Stalker", -- [1]
			"UNKNOWN", -- [2]
		},
		[163862] = {
			"Defender of Many Eyes", -- [1]
			"Plaguefall", -- [2]
		},
		[20059] = {
			"Sunseeker Netherbinder", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[24217] = {
			"Amani Bear Mount", -- [1]
			"Zul'Aman", -- [2]
		},
		[18172] = {
			"Infinite Saboteur", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[34473] = {
			"Brienna Nightfell", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[28695] = {
			"Molten Golem", -- [1]
			"Halls of Lightning", -- [2]
		},
		[32938] = {
			"Flash Freeze", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24697] = {
			"Sister of Torment", -- [1]
			"Magister's Terrace", -- [2]
		},
		[24761] = {
			"Brightscale Wyrm", -- [1]
			"Magister's Terrace", -- [2]
		},
		[35305] = {
			"Argent Monk", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[22874] = {
			"Coilskar Harpooner", -- [1]
			"Black Temple", -- [2]
		},
		[20859] = {
			"Arcatraz Warder", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[29271] = {
			"Ethereal Sphere", -- [1]
			"Violet Hold", -- [2]
		},
		[29335] = {
			"Anub'ar Webspinner", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[171799] = {
			"Depths Warden", -- [1]
			"Sanguine Depths", -- [2]
		},
		[25369] = {
			"Sunblade Vindicator", -- [1]
			"The Sunwell", -- [2]
		},
		[21339] = {
			"Coilfang Hate-Screamer", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[23418] = {
			"Essence of Suffering", -- [1]
			"Black Temple", -- [2]
		},
		[27640] = {
			"Ring-Lord Conjurer", -- [1]
			"The Oculus", -- [2]
		},
		[23578] = {
			"Jan'alai", -- [1]
			"Zul'Aman", -- [2]
		},
		[19516] = {
			"Void Reaver", -- [1]
			"Tempest Keep", -- [2]
		},
		[27736] = {
			"Patchwork Construct", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[17533] = {
			"Romulo", -- [1]
			"Karazhan", -- [2]
		},
		[179733] = {
			"Invigorating Fish Stick", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[23834] = {
			"Amani Dragonhawk", -- [1]
			"Zul'Aman", -- [2]
		},
		[27960] = {
			"Dark Rune Warrior", -- [1]
			"Northrend", -- [2]
		},
		[16063] = {
			"Sir Zeliek", -- [1]
			"Naxxramas", -- [2]
		},
		[16127] = {
			"Spectral Trainee", -- [1]
			"Naxxramas", -- [2]
		},
		[20060] = {
			"Lord Sanguinar", -- [1]
			"Tempest Keep", -- [2]
		},
		[30391] = {
			"Healthy Mushroom", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[80816] = {
			"Ahri'ok Dugru", -- [1]
			"Iron Docks", -- [2]
		},
		[167965] = {
			"Lubricator", -- [1]
			"De Other Side", -- [2]
		},
		[34475] = {
			"Shocuul", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[26553] = {
			"Dragonflayer Fanatic", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[165919] = {
			"Skeletal Marauder", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[32876] = {
			"Dark Rune Champion", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24698] = {
			"Ethereum Smuggler", -- [1]
			"Magister's Terrace", -- [2]
		},
		[24762] = {
			"Sunblade Keeper", -- [1]
			"Magister's Terrace", -- [2]
		},
		[115488] = {
			"Infused Pyromancer", -- [1]
			"Return to Karazhan", -- [2]
		},
		[28920] = {
			"Stormforged Giant", -- [1]
			"Halls of Lightning", -- [2]
		},
		[33388] = {
			"Dark Rune Guardian", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[22875] = {
			"Coilskar Sea-Caller", -- [1]
			"Black Temple", -- [2]
		},
		[22939] = {
			"Temple Acolyte", -- [1]
			"Black Temple", -- [2]
		},
		[20988] = {
			"Sunseeker Engineer", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[33836] = {
			"Bomb Bot", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29240] = {
			"Stormforged Lieutenant", -- [1]
			"Halls of Lightning", -- [2]
		},
		[29304] = {
			"Slad'ran", -- [1]
			"Gundrak", -- [2]
		},
		[168992] = {
			"Risen Cultist", -- [1]
			"De Other Side", -- [2]
		},
		[21212] = {
			"Lady Vashj", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[163619] = {
			"Zolramus Bonecarver", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[25370] = {
			"Sunblade Dusk Priest", -- [1]
			"The Sunwell", -- [2]
		},
		[23419] = {
			"Essence of Desire", -- [1]
			"Black Temple", -- [2]
		},
		[114338] = {
			"Mana Confluence", -- [1]
			"Return to Karazhan", -- [2]
		},
		[83761] = {
			"Ogron Laborer", -- [1]
			"Iron Docks", -- [2]
		},
		[163620] = {
			"Rotspew", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[32877] = {
			"Dark Rune Warbringer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[27737] = {
			"Risen Zombie", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[17534] = {
			"Julianne", -- [1]
			"Karazhan", -- [2]
		},
		[155433] = {
			"Void-Touched Emissary", -- [1]
			"Freehold", -- [2]
		},
		[27961] = {
			"Dark Rune Worker", -- [1]
			"Halls of Stone", -- [2]
		},
		[33453] = {
			"Dark Rune Watcher", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[155434] = {
			"Emissary of the Tides", -- [1]
			"Freehold", -- [2]
		},
		[28249] = {
			"Devouring Ghoul", -- [1]
			"UNKNOWN", -- [2]
		},
		[165414] = {
			"Depraved Obliterator", -- [1]
			"Halls of Atonement", -- [2]
		},
		[34605] = {
			"Swarm Scarab", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[26554] = {
			"Dragonflayer Seer", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[83763] = {
			"Grom'kar Technician", -- [1]
			"Iron Docks", -- [2]
		},
		[34797] = {
			"Icehowl", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[16415] = {
			"Skeletal Waiter", -- [1]
			"Karazhan", -- [2]
		},
		[28729] = {
			"Watcher Narjil", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[26746] = {
			"Crazed Mana-Wraith", -- [1]
			"The Nexus", -- [2]
		},
		[28825] = {
			"Cyclone", -- [1]
			"Halls of Lightning", -- [2]
		},
		[33134] = {
			"Sara", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[28921] = {
			"Hadronox", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[22844] = {
			"Ashtongue Battlelord", -- [1]
			"Black Temple", -- [2]
		},
		[22876] = {
			"Coilskar Soothsayer", -- [1]
			"Black Temple", -- [2]
		},
		[163882] = {
			"Decaying Flesh Giant", -- [1]
			"Plaguefall", -- [2]
		},
		[33966] = {
			"Crusher Tentacle", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29305] = {
			"Moorabi", -- [1]
			"Gundrak", -- [2]
		},
		[23196] = {
			"Bonechewer Behemoth", -- [1]
			"Black Temple", -- [2]
		},
		[21213] = {
			"Morogrim Tidewalker", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[27386] = {
			"Avenging Spirit", -- [1]
			"Utgarde Pinnacle", -- [2]
			"enUS", -- [3]
		},
		[25371] = {
			"Sunblade Dawn Priest", -- [1]
			"The Sunwell", -- [2]
		},
		[23420] = {
			"Essence of Anger", -- [1]
			"Black Temple", -- [2]
		},
		[83765] = {
			"Grom'kar Footsoldier", -- [1]
			"Iron Docks", -- [2]
		},
		[25595] = {
			"Chaos Gazer", -- [1]
			"The Sunwell", -- [2]
		},
		[23580] = {
			"Amani'shi Warbringer", -- [1]
			"Zul'Aman", -- [2]
		},
		[15936] = {
			"Heigan the Unclean", -- [1]
			"Naxxramas", -- [2]
		},
		[15952] = {
			"Maexxna", -- [1]
			"Naxxramas", -- [2]
		},
		[89011] = {
			"Rylak Skyterror", -- [1]
			"Iron Docks", -- [2]
		},
		[27962] = {
			"Dark Rune Elementalist", -- [1]
			"Halls of Stone", -- [2]
		},
		[16064] = {
			"Thane Korth'azz", -- [1]
			"Naxxramas", -- [2]
		},
		[20062] = {
			"Grand Astromancer Capernian", -- [1]
			"Tempest Keep", -- [2]
		},
		[30329] = {
			"Savage Cave Beast", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[28410] = {
			"Dragonflayer Spiritualist", -- [1]
			"Utgarde Keep", -- [2]
		},
		[34607] = {
			"Nerubian Burrower", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[26555] = {
			"Scourge Hulk", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[30681] = {
			"Onyx Blaze Mistress", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[20478] = {
			"Arcane Servant", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[28730] = {
			"Watcher Gashra", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[28826] = {
			"Stormfury Revenant", -- [1]
			"Halls of Lightning", -- [2]
		},
		[163121] = {
			"Stitched Vanguard", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[28922] = {
			"Anub'ar Crusher", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[6219] = {
			"Corrosive Lurker", -- [1]
			"Gnomeregan", -- [2]
		},
		[22845] = {
			"Ashtongue Mystic", -- [1]
			"Black Temple", -- [2]
		},
		[6235] = {
			"Electrocutioner 6000", -- [1]
			"Gnomeregan", -- [2]
		},
		[20990] = {
			"Bloodwarder Physician", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[29306] = {
			"Gal'darah", -- [1]
			"Gundrak", -- [2]
		},
		[21214] = {
			"Fathom-Lord Karathress", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[21246] = {
			"Serpentshrine Sporebat", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[163891] = {
			"Rotmarrow Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[4308] = {
			"Unfettered Spirit", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[27483] = {
			"King Dred", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[23421] = {
			"Ashtongue Channeler", -- [1]
			"Black Temple", -- [2]
		},
		[34800] = {
			"Snobold Vassal", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[23581] = {
			"Amani'shi Medicine Man", -- [1]
			"Zul'Aman", -- [2]
		},
		[14881] = {
			"Spider", -- [1]
			"Outland", -- [2]
		},
		[19551] = {
			"Ember of Al'ar", -- [1]
			"Tempest Keep", -- [2]
		},
		[29818] = {
			"Deathcharger Steed", -- [1]
			"Naxxramas", -- [2]
		},
		[21694] = {
			"Bog Overlord", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[33329] = {
			"Heart of the Deconstructor", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[27963] = {
			"Dark Rune Theurgist", -- [1]
			"Northrend", -- [2]
		},
		[25948] = {
			"Doomfire Shard", -- [1]
			"The Sunwell", -- [2]
		},
		[23965] = {
			"Frost Tomb", -- [1]
			"Utgarde Keep", -- [2]
		},
		[163126] = {
			"Brittlebone Mage", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[17888] = {
			"Kaz'rogal", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[163894] = {
			"Blighted Spinebreaker", -- [1]
			"Plaguefall", -- [2]
		},
		[162103] = {
			"Executor Tarvold", -- [1]
			"Sanguine Depths", -- [2]
		},
		[20063] = {
			"Master Engineer Telonicus", -- [1]
			"Tempest Keep", -- [2]
		},
		[34097] = {
			"Unleashed Dark Matter", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[2267] = {
			"Hillsbrad Peasant", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[165430] = {
			"Malignant Spawn", -- [1]
			"Plaguefall", -- [2]
		},
		[18176] = {
			"Tainted Earthgrab Totem", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[81212] = {
			"Grimrail Overseer", -- [1]
			"Grimrail Depot", -- [2]
		},
		[32665] = {
			"Crystalline Tangler", -- [1]
			"The Nexus", -- [2]
		},
		[163128] = {
			"Zolramus Sorcerer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[30682] = {
			"Onyx Flight Captain", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[26620] = {
			"Drakkari Guardian", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[28731] = {
			"Watcher Silthik", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[16481] = {
			"Ghastly Haunt", -- [1]
			"Karazhan", -- [2]
		},
		[16545] = {
			"Ethereal Spellfilcher", -- [1]
			"Karazhan", -- [2]
		},
		[146753] = {
			"Kul Tiran Marine", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[33202] = {
			"Ancient Water Spirit", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[28923] = {
			"Loken", -- [1]
			"Halls of Lightning", -- [2]
		},
		[22846] = {
			"Ashtongue Stormcaller", -- [1]
			"Black Temple", -- [2]
		},
		[22878] = {
			"Aqueous Lord", -- [1]
			"Black Temple", -- [2]
		},
		[29051] = {
			"Anub'ar Crypt Fiend", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[164921] = {
			"Drust Harvester", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[29307] = {
			"Drakkari Colossus", -- [1]
			"Gundrak", -- [2]
		},
		[21215] = {
			"Leotheras the Blind", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[165946] = {
			"Mordretha, the Endless Empress", -- [1]
			"Theater of Pain", -- [2]
		},
		[83389] = {
			"Ironwing Flamespitter", -- [1]
			"Iron Docks", -- [2]
		},
		[17377] = {
			"Keli'dan the Breaker", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[25597] = {
			"Oblivion Mage", -- [1]
			"The Sunwell", -- [2]
		},
		[23582] = {
			"Amani'shi Tribesman", -- [1]
			"Zul'Aman", -- [2]
		},
		[29819] = {
			"Drakkari Lancer", -- [1]
			"Gundrak", -- [2]
		},
		[15953] = {
			"Grand Widow Faerlina", -- [1]
			"Naxxramas", -- [2]
		},
		[21695] = {
			"Tidal Surger", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[23774] = {
			"Amani'shi Trainer", -- [1]
			"Zul'Aman", -- [2]
		},
		[19712] = {
			"Mechanar Driller", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[16017] = {
			"Patchwork Golem", -- [1]
			"Naxxramas", -- [2]
		},
		[27964] = {
			"Dark Rune Scholar", -- [1]
			"Halls of Stone", -- [2]
		},
		[16065] = {
			"Lady Blaumeux", -- [1]
			"Naxxramas", -- [2]
		},
		[33651] = {
			"VX-001", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[33715] = {
			"Charged Sphere", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16145] = {
			"Death Knight Captain", -- [1]
			"Naxxramas", -- [2]
		},
		[20032] = {
			"Bloodwarder Vindicator", -- [1]
			"Tempest Keep", -- [2]
		},
		[164414] = {
			"Reanimated Mage", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[16193] = {
			"Skeletal Smith", -- [1]
			"Naxxramas", -- [2]
		},
		[18177] = {
			"Tainted Stoneskin Totem", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[26621] = {
			"Ghoul Tormentor", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[167998] = {
			"Portal Guardian", -- [1]
			"Theater of Pain", -- [2]
		},
		[28732] = {
			"Anub'ar Warrior", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[16482] = {
			"Trapped Soul", -- [1]
			"Karazhan", -- [2]
		},
		[28860] = {
			"Sartharion", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[28924] = {
			"Anub'ar Champion", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[22847] = {
			"Ashtongue Primalist", -- [1]
			"Black Temple", -- [2]
		},
		[22879] = {
			"Shadowmoon Reaver", -- [1]
			"Black Temple", -- [2]
		},
		[83392] = {
			"Rampaging Clefthoof", -- [1]
			"Iron Docks", -- [2]
		},
		[164929] = {
			"Tirnenn Villager", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[104246] = {
			"Duskwatch Guard", -- [1]
			"Court of Stars", -- [2]
		},
		[29308] = {
			"Prince Taldaram", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[29340] = {
			"Anub'ar Brood Keeper", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[21216] = {
			"Hydross the Unstable", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[27389] = {
			"Dalronn the Controller", -- [1]
			"Utgarde Keep", -- [2]
		},
		[25502] = {
			"Shield Orb", -- [1]
			"The Sunwell", -- [2]
		},
		[25598] = {
			"Volatile Felfire Fiend", -- [1]
			"The Sunwell", -- [2]
		},
		[27709] = {
			"Drakkari Invader", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[29820] = {
			"Drakkari God Hunter", -- [1]
			"Gundrak", -- [2]
		},
		[21696] = {
			"Steam Surger", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[23775] = {
			"Head of the Horseman", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[19713] = {
			"Mechanar Wrecker", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[27965] = {
			"Dark Rune Shaper", -- [1]
			"Halls of Stone", -- [2]
		},
		[33525] = {
			"Mangrove Ent", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21920] = {
			"Tidewalker Lurker", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[81603] = {
			"Champion Druna", -- [1]
			"Iron Docks", -- [2]
		},
		[20033] = {
			"Astromancer", -- [1]
			"Tempest Keep", -- [2]
		},
		[24159] = {
			"Amani Eagle", -- [1]
			"Zul'Aman", -- [2]
		},
		[7603] = {
			"Leprous Assistant", -- [1]
			"Gnomeregan", -- [2]
		},
		[167493] = {
			"Venomous Sniper", -- [1]
			"Plaguefall", -- [2]
		},
		[26622] = {
			"Drakkari Bat", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[28733] = {
			"Anub'ar Shadowcaster", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[26782] = {
			"Crystalline Keeper", -- [1]
			"The Nexus", -- [2]
		},
		[33142] = {
			"Leviathan Defense Turret", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[28925] = {
			"Anub'ar Necromancer", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[22848] = {
			"Storm Fury", -- [1]
			"Black Temple", -- [2]
		},
		[22880] = {
			"Shadowmoon Champion", -- [1]
			"Black Temple", -- [2]
		},
		[20865] = {
			"Protean Horror", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[20897] = {
			"Ethereum Wave-Caster", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[29117] = {
			"Anub'ar Champion", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[29213] = {
			"Anub'ar Darter", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[29309] = {
			"Elder Nadox", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[23232] = {
			"Mutant War Hound", -- [1]
			"Black Temple", -- [2]
		},
		[21217] = {
			"The Lurker Below", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[27390] = {
			"Skarvald the Constructor", -- [1]
			"Utgarde Keep", -- [2]
		},
		[115765] = {
			"Abstract Nullifier", -- [1]
			"Return to Karazhan", -- [2]
		},
		[25599] = {
			"Cataclysm Hound", -- [1]
			"The Sunwell", -- [2]
		},
		[23584] = {
			"Amani Bear", -- [1]
			"Zul'Aman", -- [2]
		},
		[27742] = {
			"Infinite Adversary", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[179269] = {
			"Oasis Security", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[33271] = {
			"General Vezax", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16018] = {
			"Bile Retcher", -- [1]
			"Naxxramas", -- [2]
		},
		[27966] = {
			"Dark Rune Controller", -- [1]
			"Halls of Stone", -- [2]
		},
		[33527] = {
			"Nature's Blade", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[19874] = {
			"Baron Rafe Dreuger", -- [1]
			"Karazhan", -- [2]
		},
		[165197] = {
			"Skeletal Monstrosity", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[24064] = {
			"Amani Lynx Cub", -- [1]
			"Zul'Aman", -- [2]
		},
		[16146] = {
			"Death Knight", -- [1]
			"Naxxramas", -- [2]
		},
		[20034] = {
			"Star Scryer", -- [1]
			"Tempest Keep", -- [2]
		},
		[16194] = {
			"Unholy Axe", -- [1]
			"Naxxramas", -- [2]
		},
		[24224] = {
			"Corrupted Lightning Totem", -- [1]
			"Zul'Aman", -- [2]
		},
		[18179] = {
			"Corrupted Nova Totem", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[16290] = {
			"Fallout Slime", -- [1]
			"Naxxramas", -- [2]
		},
		[170572] = {
			"Atal'ai Hoodoo Hexxer", -- [1]
			"De Other Side", -- [2]
		},
		[30621] = {
			"Zylien", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[26623] = {
			"Scourge Brute", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[28734] = {
			"Anub'ar Skirmisher", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[28926] = {
			"Spark of Ionar", -- [1]
			"Halls of Lightning", -- [2]
		},
		[6220] = {
			"Irradiated Horror", -- [1]
			"Gnomeregan", -- [2]
		},
		[6228] = {
			"Dark Iron Ambassador", -- [1]
			"Gnomeregan", -- [2]
		},
		[20866] = {
			"Soul Devourer", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22945] = {
			"Shadowmoon Blood Mage", -- [1]
			"Black Temple", -- [2]
		},
		[29118] = {
			"Anub'ar Crypt Fiend", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[29214] = {
			"Anub'ar Assassin", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[29310] = {
			"Jedoga Shadowseeker", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[171343] = {
			"Bladebeak Matriarch", -- [1]
			"De Other Side", -- [2]
		},
		[21218] = {
			"Vashj'ir Honor Guard", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[4293] = {
			"Scarlet Scryer", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[21346] = {
			"Sightless Eye", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[29630] = {
			"Fanged Pit Viper", -- [1]
			"Gundrak", -- [2]
		},
		[17380] = {
			"Broggok", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[27647] = {
			"Phantasmal Ogre", -- [1]
			"The Oculus", -- [2]
		},
		[27743] = {
			"Infinite Hunter", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[29822] = {
			"Drakkari Fire Weaver", -- [1]
			"Gundrak", -- [2]
		},
		[163157] = {
			"Amarth", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[27871] = {
			"Flesheating Ghoul", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[29982] = {
			"Drakkari Raider", -- [1]
			"Gundrak", -- [2]
		},
		[19875] = {
			"Baroness Dorothea Millstipe", -- [1]
			"Karazhan", -- [2]
		},
		[17860] = {
			"Durnholde Veteran", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[24065] = {
			"Amani'shi Handler", -- [1]
			"Zul'Aman", -- [2]
		},
		[20035] = {
			"Bloodwarder Marshal", -- [1]
			"Tempest Keep", -- [2]
		},
		[184908] = {
			"Vy Interceptor", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[30622] = {
			"Táy", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[26624] = {
			"Wretched Belcher", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[16485] = {
			"Arcane Watchman", -- [1]
			"Karazhan", -- [2]
		},
		[164185] = {
			"Echelon", -- [1]
			"Halls of Atonement", -- [2]
		},
		[22882] = {
			"Shadowmoon Deathshaper", -- [1]
			"Black Temple", -- [2]
		},
		[20867] = {
			"Death Watcher", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22946] = {
			"Shadowmoon War Hound", -- [1]
			"Black Temple", -- [2]
		},
		[29119] = {
			"Anub'ar Necromancer", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[33722] = {
			"Storm Tempered Keeper", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29311] = {
			"Herald Volazj", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[185680] = {
			"Vy Relic", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[21251] = {
			"Underbog Colossus", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[151649] = {
			"Defense Bot Mk I", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[23394] = {
			"Promenade Sentinel", -- [1]
			"Black Temple", -- [2]
		},
		[17381] = {
			"The Maker", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[27648] = {
			"Phantasmal Naga", -- [1]
			"The Oculus", -- [2]
		},
		[23586] = {
			"Amani'shi Scout", -- [1]
			"Zul'Aman", -- [2]
		},
		[17477] = {
			"Hellfire Imp", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[27744] = {
			"Infinite Agent", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[23682] = {
			"Headless Horseman", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[19716] = {
			"Mechanar Tinkerer", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[16067] = {
			"Deathcharger Steed", -- [1]
			"Naxxramas", -- [2]
		},
		[30111] = {
			"Twilight Worshipper", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[185683] = {
			"Wo Relic", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[17893] = {
			"Naturalist Bite", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[17957] = {
			"Coilfang Champion", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[20036] = {
			"Bloodwarder Squire", -- [1]
			"Tempest Keep", -- [2]
		},
		[28384] = {
			"Lesser Air Elemental", -- [1]
			"Halls of Stone", -- [2]
		},
		[26529] = {
			"Meathook", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[185685] = {
			"Urh Relic", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[114624] = {
			"Arcane Warden", -- [1]
			"Return to Karazhan", -- [2]
		},
		[28736] = {
			"Skittering Infector", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[24674] = {
			"Phoenix", -- [1]
			"Magister's Terrace", -- [2]
		},
		[30879] = {
			"Planar Anomaly", -- [1]
			"The Oculus", -- [2]
		},
		[31007] = {
			"Azure Binder", -- [1]
			"Violet Hold", -- [2]
		},
		[35451] = {
			"The Black Knight", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[22883] = {
			"Aqueous Spawn", -- [1]
			"Black Temple", -- [2]
		},
		[20868] = {
			"Entropic Eye", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22947] = {
			"Mother Shahraz", -- [1]
			"Black Temple", -- [2]
		},
		[29120] = {
			"Anub'arak", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[29216] = {
			"Anub'ar Guardian", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[29312] = {
			"Lavanthor", -- [1]
			"Violet Hold", -- [2]
		},
		[23235] = {
			"Bonechewer Blade Fury", -- [1]
			"Black Temple", -- [2]
		},
		[21220] = {
			"Coilfang Priestess", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[83025] = {
			"Grom'kar Battlemaster", -- [1]
			"Iron Docks", -- [2]
		},
		[25506] = {
			"Shadowsword Lifeshaper", -- [1]
			"The Sunwell", -- [2]
		},
		[23523] = {
			"Ashtongue Elementalist", -- [1]
			"Black Temple", -- [2]
		},
		[114626] = {
			"Forlorn Spirit", -- [1]
			"Return to Karazhan", -- [2]
		},
		[174175] = {
			"Loyal Stoneborn", -- [1]
			"Halls of Atonement", -- [2]
		},
		[7484] = {
			"Windfury Totem III", -- [1]
			"Magister's Terrace", -- [2]
		},
		[83026] = {
			"Siegemaster Olugar", -- [1]
			"Iron Docks", -- [2]
		},
		[19781] = {
			"Astral Flare", -- [1]
			"Karazhan", -- [2]
		},
		[81235] = {
			"Grimrail Laborer", -- [1]
			"Grimrail Depot", -- [2]
		},
		[170850] = {
			"Raging Bloodhorn", -- [1]
			"Theater of Pain", -- [2]
		},
		[17862] = {
			"Captain Skarloc", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[30176] = {
			"Ahn'kahar Guardian", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[17958] = {
			"Coilfang Defender", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[20037] = {
			"Tempest Falconer", -- [1]
			"Tempest Keep", -- [2]
		},
		[165222] = {
			"Zolramus Bonemender", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[81236] = {
			"Grimrail Technician", -- [1]
			"Grimrail Depot", -- [2]
		},
		[26530] = {
			"Salramm the Fleshcrafter", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[30688] = {
			"Disciple of Shadron", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[114628] = {
			"Skeletal Waiter", -- [1]
			"Return to Karazhan", -- [2]
		},
		[26690] = {
			"Ymirjar Warrior", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[26722] = {
			"Azure Magus", -- [1]
			"The Nexus", -- [2]
		},
		[28961] = {
			"Titanium Siegebreaker", -- [1]
			"Halls of Lightning", -- [2]
		},
		[33567] = {
			"Deathsworn Zealot", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[22884] = {
			"Leviathan", -- [1]
			"Black Temple", -- [2]
		},
		[20869] = {
			"Arcatraz Sentinel", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22948] = {
			"Gurtogg Bloodboil", -- [1]
			"Black Temple", -- [2]
		},
		[33203] = {
			"Ancient Conservator", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29153] = {
			"Animated Bones", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[114629] = {
			"Spectral Retainer", -- [1]
			"Return to Karazhan", -- [2]
		},
		[18982] = {
			"Sable Jaguar", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[26683] = {
			"Frenzied Worgen", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[33528] = {
			"Guardian of Life", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[23172] = {
			"Hand of Gorefiend", -- [1]
			"Black Temple", -- [2]
		},
		[35545] = {
			"Risen Jaeren Sunsworn", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[23236] = {
			"Bonechewer Shield Disciple", -- [1]
			"Black Temple", -- [2]
		},
		[25315] = {
			"Kil'jaeden", -- [1]
			"The Sunwell", -- [2]
		},
		[21253] = {
			"Tainted Water Elemental", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[35763] = {
			"Skittering Scarab", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[35307] = {
			"Argent Priestess", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[34135] = {
			"Winter Rumbler", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[34137] = {
			"Winter Jormungar", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[25507] = {
			"Sunblade Protector", -- [1]
			"The Sunwell", -- [2]
		},
		[34686] = {
			"Healing Stream Totem", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[23524] = {
			"Ashtongue Spiritbinder", -- [1]
			"Black Temple", -- [2]
		},
		[27650] = {
			"Phantasmal Air", -- [1]
			"The Oculus", -- [2]
		},
		[25824] = {
			"Void Spawn", -- [1]
			"The Sunwell", -- [2]
		},
		[30285] = {
			"Eye of Taldaram", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[3983] = {
			"Interrogator Vishas", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[5925] = {
			"Grounding Totem", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[19622] = {
			"Kael'thas Sunstrider", -- [1]
			"Tempest Keep", -- [2]
		},
		[33121] = {
			"Iron Construct", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[33118] = {
			"Ignis the Furnace Master", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[34086] = {
			"Magma Rager", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16020] = {
			"Mad Scientist", -- [1]
			"Naxxramas", -- [2]
		},
		[27970] = {
			"Raging Construct", -- [1]
			"Halls of Stone", -- [2]
		},
		[17767] = {
			"Rage Winterchill", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[34465] = {
			"Velanaa", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[34275] = {
			"Ward of Life", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[33387] = {
			"Writhing Lasher", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[17895] = {
			"Ghoul", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[5913] = {
			"Tremor Totem", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[17959] = {
			"Coilfang Slavehandler", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[20038] = {
			"Phoenix-Hawk Hatchling", -- [1]
			"Tempest Keep", -- [2]
		},
		[33983] = {
			"Constrictor Tentacle", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[33431] = {
			"Forest Swarmer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[34015] = {
			"Tempest Warder", -- [1]
			"Vault of Archavon", -- [2]
			"enUS", -- [3]
		},
		[16148] = {
			"Spectral Death Knight", -- [1]
			"Naxxramas", -- [2]
		},
		[167533] = {
			"Advent Nevermore", -- [1]
			"Theater of Pain", -- [2]
		},
		[29313] = {
			"Ichoron", -- [1]
			"Violet Hold", -- [2]
			"enUS", -- [3]
		},
		[34034] = {
			"Swarming Guardian", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[34928] = {
			"Argent Confessor Paletress", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[35311] = {
			"Fountain of Light", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[28546] = {
			"Ionar", -- [1]
			"Halls of Lightning", -- [2]
		},
		[30625] = {
			"Zylien", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[34687] = {
			"Searing Totem", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[32933] = {
			"Left Arm", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[114632] = {
			"Spectral Attendant", -- [1]
			"Return to Karazhan", -- [2]
		},
		[16424] = {
			"Spectral Sentry", -- [1]
			"Karazhan", -- [2]
		},
		[26691] = {
			"Ymirjar Witch Doctor", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[26723] = {
			"Keristrasza", -- [1]
			"The Nexus", -- [2]
		},
		[17491] = {
			"Laughing Skull Rogue", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[17991] = {
			"Rokmar the Crackler", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[18631] = {
			"Cabal Cultist", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[18663] = {
			"Maiden of Discipline", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[33433] = {
			"Suit of Armor", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[31009] = {
			"Azure Spellbreaker", -- [1]
			"Violet Hold", -- [2]
		},
		[22853] = {
			"Illidari Defiler", -- [1]
			"Black Temple", -- [2]
		},
		[22885] = {
			"Dragon Turtle", -- [1]
			"Black Temple", -- [2]
		},
		[22917] = {
			"Illidan Stormrage", -- [1]
			"Black Temple", -- [2]
		},
		[22949] = {
			"Gathios the Shatterer", -- [1]
			"Black Temple", -- [2]
		},
		[32871] = {
			"Algalon the Observer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[167536] = {
			"Harugia the Bloodthirsty", -- [1]
			"Theater of Pain", -- [2]
		},
		[114633] = {
			"Spectral Valet", -- [1]
			"Return to Karazhan", -- [2]
		},
		[18983] = {
			"Blackfang Tarantula", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[34224] = {
			"Ice Turret", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[33136] = {
			"Guardian of Yogg-Saron", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21126] = {
			"Coilfang Scale-Healer", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[33052] = {
			"Living Constellation", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[23237] = {
			"Bonechewer Blood Prophet", -- [1]
			"Black Temple", -- [2]
		},
		[15550] = {
			"Attumen the Huntsman", -- [1]
			"Karazhan", -- [2]
		},
		[111563] = {
			"Duskwatch Guard", -- [1]
			"Court of Stars", -- [2]
		},
		[16385] = {
			"Lightning Totem", -- [1]
			"Naxxramas", -- [2]
		},
		[34496] = {
			"Eydis Darkbane", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[23397] = {
			"Illidari Blood Lord", -- [1]
			"Black Temple", -- [2]
		},
		[34780] = {
			"Lord Jaraxxus", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[25508] = {
			"Shadowsword Guardian", -- [1]
			"The Sunwell", -- [2]
		},
		[171376] = {
			"Head Custodian Javlin", -- [1]
			"Sanguine Depths", -- [2]
		},
		[33772] = {
			"Faceless Horror", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[114634] = {
			"Undying Servant", -- [1]
			"Return to Karazhan", -- [2]
		},
		[16596] = {
			"Greater Fleshbeast", -- [1]
			"Karazhan", -- [2]
		},
		[34134] = {
			"Winter Revenant", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21137] = {
			"Infinite Assassin", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[29826] = {
			"Drakkari Medicine Man", -- [1]
			"Gundrak", -- [2]
		},
		[33089] = {
			"Dark Matter", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21702] = {
			"Ethereum Life-Binder", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[179821] = {
			"Commander Zo'far", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[35328] = {
			"Stormwind Champion", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[16164] = {
			"Shade of Naxxramas", -- [1]
			"Naxxramas", -- [2]
		},
		[27971] = {
			"Unrelenting Construct", -- [1]
			"Halls of Stone", -- [2]
		},
		[16803] = {
			"Death Knight Understudy", -- [1]
			"Naxxramas", -- [2]
		},
		[17800] = {
			"Coilfang Myrmidon", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[30114] = {
			"Twilight Initiate", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[21958] = {
			"Enchanted Elemental", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[30178] = {
			"Ahn'kahar Swarmer ", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[24069] = {
			"Dragonflayer Bonecrusher", -- [1]
			"Utgarde Keep", -- [2]
		},
		[17960] = {
			"Coilfang Soothsayer", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[20039] = {
			"Phoenix-Hawk", -- [1]
			"Tempest Keep", -- [2]
		},
		[32353] = {
			"Archavon Warder", -- [1]
			"Vault of Archavon", -- [2]
		},
		[30338] = {
			"Ahn'kahar Swarmer", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[33823] = {
			"Twilight Slayer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16061] = {
			"Instructor Razuvious", -- [1]
			"Naxxramas", -- [2]
		},
		[115757] = {
			"Wrathguard Flamebringer", -- [1]
			"Return to Karazhan", -- [2]
		},
		[28419] = {
			"Frenzied Geist", -- [1]
			"Utgarde Keep", -- [2]
		},
		[180335] = {
			"Cartel Smuggler", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[33754] = {
			"Dark Rune Thunderer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[34497] = {
			"Fjola Lightbane", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[28547] = {
			"Storming Vortex", -- [1]
			"Halls of Lightning", -- [2]
		},
		[26532] = {
			"Chrono-Lord Epoch", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[32882] = {
			"Jormungar Behemoth", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24549] = {
			"Amani'shi Tempest", -- [1]
			"Zul'Aman", -- [2]
		},
		[26628] = {
			"Drakkari Scytheclaw", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[16425] = {
			"Phantom Guardsman", -- [1]
			"Karazhan", -- [2]
		},
		[16457] = {
			"Maiden of Virtue", -- [1]
			"Karazhan", -- [2]
		},
		[16489] = {
			"Chaotic Sentience", -- [1]
			"Karazhan", -- [2]
		},
		[32878] = {
			"Dark Rune Evoker", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[28835] = {
			"Stormforged Construct", -- [1]
			"Halls of Lightning", -- [2]
		},
		[18632] = {
			"Cabal Executioner", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[33346] = {
			"XE-321 Boombot", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[35329] = {
			"Ironforge Champion", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[31010] = {
			"Azure Mage Slayer", -- [1]
			"Violet Hold", -- [2]
		},
		[30680] = {
			"Onyx Brood General", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[34799] = {
			"Dreadscale", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[34035] = {
			"Feral Defender", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[22950] = {
			"High Nethermancer Zerevor", -- [1]
			"Black Temple", -- [2]
		},
		[16034] = {
			"Plague Beast", -- [1]
			"Naxxramas", -- [2]
		},
		[16595] = {
			"Fleshbeast", -- [1]
			"Karazhan", -- [2]
		},
		[114637] = {
			"Spectral Sentry", -- [1]
			"Return to Karazhan", -- [2]
		},
		[174197] = {
			"Battlefield Ritualist", -- [1]
			"Theater of Pain", -- [2]
		},
		[19016] = {
			"Hellfire Familiar", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[33110] = {
			"Dark Rune Acolyte", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21127] = {
			"Coilfang Tempest", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[33515] = {
			"Auriaya", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24687] = {
			"Sunblade Physician", -- [1]
			"Magister's Terrace", -- [2]
		},
		[16060] = {
			"Gothik the Harvester", -- [1]
			"Naxxramas", -- [2]
		},
		[114804] = {
			"Spectral Charger", -- [1]
			"Return to Karazhan", -- [2]
		},
		[2408] = {
			"Snapjaw", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[17225] = {
			"Nightbane", -- [1]
			"Karazhan", -- [2]
		},
		[23398] = {
			"Angered Soul Fragment", -- [1]
			"Black Temple", -- [2]
		},
		[34813] = {
			"Infernal Volcano", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[25509] = {
			"Priestess of Torment", -- [1]
			"The Sunwell", -- [2]
		},
		[16244] = {
			"Infectious Ghoul", -- [1]
			"Naxxramas", -- [2]
		},
		[120651] = {
			"Explosives", -- [1]
			"Atal'Dazar", -- [2]
		},
		[33838] = {
			"Enslaved Fire Elemental", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[32955] = {
			"Collapsing Star", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[12129] = {
			"Onyxian Warder", -- [1]
			"Onyxia's Lair", -- [2]
			"enUS", -- [3]
		},
		[11262] = {
			"Onyxian Whelp", -- [1]
			"Onyxia's Lair", -- [2]
			"enUS", -- [3]
		},
		[28859] = {
			"Malygos", -- [1]
			"The Eye of Eternity", -- [2]
		},
		[27645] = {
			"Phantasmal Cloudscraper", -- [1]
			"The Oculus", -- [2]
		},
		[17801] = {
			"Coilfang Siren", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[15989] = {
			"Sapphiron", -- [1]
			"Naxxramas", -- [2]
		},
		[35330] = {
			"Exodar Champion", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[16021] = {
			"Living Monstrosity", -- [1]
			"Naxxramas", -- [2]
		},
		[27972] = {
			"Lightning Construct", -- [1]
			"Halls of Stone", -- [2]
		},
		[21863] = {
			"Serpentshrine Lurker", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[30083] = {
			"Marauding Geist", -- [1]
			"Naxxramas", -- [2]
		},
		[17833] = {
			"Durnholde Warden", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[30179] = {
			"Twilight Apostle", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[17897] = {
			"Crypt Fiend", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[16149] = {
			"Spectral Horse", -- [1]
			"Naxxramas", -- [2]
		},
		[22055] = {
			"Coilfang Elite", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[20040] = {
			"Crystalcore Devastator", -- [1]
			"Tempest Keep", -- [2]
		},
		[168572] = {
			"Fungi Stormer", -- [1]
			"Plaguefall", -- [2]
		},
		[34133] = {
			"Champion of Hodir", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[31218] = {
			"Acolyte of Shadron", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[30071] = {
			"Stitched Colossus", -- [1]
			"Naxxramas", -- [2]
		},
		[30435] = {
			"Poisonous Mushroom", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[24143] = {
			"Spirit of the Lynx", -- [1]
			"Zul'Aman", -- [2]
		},
		[33855] = {
			"Junk Bot", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[17938] = {
			"Coilfang Observer", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[17906] = {
			"Gargoyle", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[10184] = {
			"Onyxia", -- [1]
			"Onyxia's Lair", -- [2]
			"enUS", -- [3]
		},
		[26533] = {
			"Mal'Ganis", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[26687] = {
			"Gortok Palehoof", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[24892] = {
			"Sathrovarr the Corruptor", -- [1]
			"The Sunwell", -- [2]
		},
		[26693] = {
			"Skadi the Ruthless", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[81283] = {
			"Grom'kar Footsoldier", -- [1]
			"Iron Docks", -- [2]
		},
		[168318] = {
			"Forsworn Goliath", -- [1]
			"Spires of Ascension", -- [2]
		},
		[15956] = {
			"Anub'Rekhan", -- [1]
			"Naxxramas", -- [2]
		},
		[162689] = {
			"Surgeon Stitchflesh", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[28836] = {
			"Stormforged Runeshaper", -- [1]
			"Halls of Lightning", -- [2]
		},
		[18633] = {
			"Cabal Acolyte", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[16243] = {
			"Plague Slime", -- [1]
			"Naxxramas", -- [2]
		},
		[35331] = {
			"Gnomeregan Champion", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[22877] = {
			"Coilskar Wrangler", -- [1]
			"Black Temple", -- [2]
		},
		[22855] = {
			"Illidari Nightlord", -- [1]
			"Black Temple", -- [2]
		},
		[22887] = {
			"High Warlord Naj'entus", -- [1]
			"Black Temple", -- [2]
		},
		[33237] = {
			"Ulduar Colossus", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[22951] = {
			"Lady Malande", -- [1]
			"Black Temple", -- [2]
		},
		[16028] = {
			"Patchwerk", -- [1]
			"Naxxramas", -- [2]
		},
		[163458] = {
			"Forsworn Castigator", -- [1]
			"Spires of Ascension", -- [2]
		},
		[23047] = {
			"Shadowmoon Soldier", -- [1]
			"Black Temple", -- [2]
		},
		[23175] = {
			"Tarren Mill Guardsman", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[23111] = {
			"Shadowy Construct", -- [1]
			"Black Temple", -- [2]
		},
		[33988] = {
			"Immortal Guardian", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29316] = {
			"Moragg", -- [1]
			"Violet Hold", -- [2]
		},
		[31134] = {
			"Cyanigosa", -- [1]
			"Violet Hold", -- [2]
		},
		[23239] = {
			"Bonechewer Combatant", -- [1]
			"Black Temple", -- [2]
		},
		[21224] = {
			"Tidewalker Depth-Seer", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[165762] = {
			"Soul Infuser", -- [1]
			"Castle Nathria", -- [2]
		},
		[30452] = {
			"Tenebron", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[34815] = {
			"Felflame Infernal", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[23399] = {
			"Suffering Soul Fragment", -- [1]
			"Black Temple", -- [2]
		},
		[34564] = {
			"Anub'arak", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[24059] = {
			"Amani'shi Beast Tamer", -- [1]
			"Zul'Aman", -- [2]
		},
		[27644] = {
			"Phantasmal Wolf", -- [1]
			"The Oculus", -- [2]
		},
		[27642] = {
			"Phantasmal Mammoth", -- [1]
			"The Oculus", -- [2]
		},
		[27653] = {
			"Phantasmal Water", -- [1]
			"The Oculus", -- [2]
		},
		[26686] = {
			"Ferocious Rhino", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[166275] = {
			"Mistveil Shaper", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[168578] = {
			"Fungalmancer", -- [1]
			"Plaguefall", -- [2]
		},
		[205999] = {
			"Mirror Image", -- [1]
			"Violet Hold", -- [2]
			"enUS", -- [3]
		},
		[154744] = {
			"Toxic Monstrosity", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[25798] = {
			"Shadowsword Berserker", -- [1]
			"The Sunwell", -- [2]
		},
		[19166] = {
			"Tempest-Forge Patroller", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[35332] = {
			"Darnassus Champion", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[29315] = {
			"Erekem", -- [1]
			"Violet Hold", -- [2]
		},
		[166276] = {
			"Mistveil Guardian", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[17802] = {
			"Coilfang Warrior", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[170882] = {
			"Bone Magus", -- [1]
			"Theater of Pain", -- [2]
		},
		[16984] = {
			"Plagued Warrior", -- [1]
			"Naxxramas", -- [2]
		},
		[16165] = {
			"Necro Knight", -- [1]
			"Naxxramas", -- [2]
		},
		[17898] = {
			"Abomination", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[24071] = {
			"Dragonflayer Heartsplitter", -- [1]
			"Utgarde Keep", -- [2]
		},
		[17962] = {
			"Coilfang Collaborator", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[20041] = {
			"Crystalcore Sentinel", -- [1]
			"Tempest Keep", -- [2]
		},
		[22120] = {
			"Fathom Sporebat", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[32191] = {
			"Azure Stalker", -- [1]
			"Violet Hold", -- [2]
		},
		[205998] = {
			"Mirror Image", -- [1]
			"Violet Hold", -- [2]
			"enUS", -- [3]
		},
		[17819] = {
			"Durnholde Sentry", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[26626] = {
			"Scourge Reanimator", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[17400] = {
			"Felguard Annihilator", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[174210] = {
			"Blighted Sludge-Spewer", -- [1]
			"Theater of Pain", -- [2]
		},
		[33699] = {
			"Storm Tempered Keeper", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[19167] = {
			"Bloodwarder Slayer", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[26630] = {
			"Trollgore", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[28581] = {
			"Stormforged Tactician", -- [1]
			"Halls of Lightning", -- [2]
		},
		[30660] = {
			"Portal Guardian", -- [1]
			"Violet Hold", -- [2]
		},
		[16491] = {
			"Mana Feeder", -- [1]
			"Karazhan", -- [2]
		},
		[169861] = {
			"Ickor Bileflesh", -- [1]
			"Plaguefall", -- [2]
		},
		[16427] = {
			"Soldier of the Frozen Wastes", -- [1]
			"Naxxramas", -- [2]
		},
		[26694] = {
			"Ymirjar Dusk Shaman", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[35013] = {
			"Koralon the Flame Watcher", -- [1]
			"Vault of Archavon", -- [2]
			"enUS", -- [3]
		},
		[205997] = {
			"Mirror Image", -- [1]
			"Violet Hold", -- [2]
			"enUS", -- [3]
		},
		[28837] = {
			"Stormforged Sentinel", -- [1]
			"Halls of Lightning", -- [2]
		},
		[18634] = {
			"Cabal Summoner", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[179841] = {
			"Veteran Sparkcaster", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[184910] = {
			"Wo Drifter", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[28965] = {
			"Titanium Thunderer", -- [1]
			"Halls of Lightning", -- [2]
		},
		[23542] = {
			"Amani'shi Axe Thrower", -- [1]
			"Zul'Aman", -- [2]
		},
		[18794] = {
			"Cabal Ritualist", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[20873] = {
			"Negaton Warp-Master", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22952] = {
			"Veras Darkshadow", -- [1]
			"Black Temple", -- [2]
		},
		[33670] = {
			"Aerial Command Unit", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[179842] = {
			"Commerce Enforcer", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[29680] = {
			"Slad'ran Viper", -- [1]
			"Gundrak", -- [2]
		},
		[27649] = {
			"Phantasmal Murloc", -- [1]
			"The Oculus", -- [2]
		},
		[16036] = {
			"Frenzied Bat", -- [1]
			"Naxxramas", -- [2]
		},
		[33236] = {
			"Steelforged Defender", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[165764] = {
			"Rockbound Vanquisher", -- [1]
			"Castle Nathria", -- [2]
		},
		[17067] = {
			"Phantom Hound", -- [1]
			"Karazhan", -- [2]
		},
		[16163] = {
			"Death Knight Cavalier", -- [1]
			"Naxxramas", -- [2]
		},
		[21225] = {
			"Tidewalker Warrior", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[16530] = {
			"Mana Warp", -- [1]
			"Karazhan", -- [2]
		},
		[32273] = {
			"Infinite Corruptor", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[28341] = {
			"Stratholme Resident", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[23400] = {
			"Illidari Archon", -- [1]
			"Black Temple", -- [2]
		},
		[29573] = {
			"Drakkari Elemental", -- [1]
			"Gundrak", -- [2]
		},
		[22869] = {
			"Illidari Boneslicer", -- [1]
			"Black Temple", -- [2]
		},
		[173447] = {
			"Mushroom Mine", -- [1]
			"Plaguefall", -- [2]
		},
		[28684] = {
			"Krik'thir the Gatewatcher", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[27654] = {
			"Drakos the Interrogator", -- [1]
			"The Oculus", -- [2]
		},
		[88163] = {
			"Grom'kar Cinderseer", -- [1]
			"Grimrail Depot", -- [2]
		},
		[163520] = {
			"Forsworn Squad-Leader", -- [1]
			"Spires of Ascension", -- [2]
		},
		[32885] = {
			"Captured Mercenary Soldier", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29829] = {
			"Drakkari Earthshaker", -- [1]
			"Gundrak", -- [2]
		},
		[25799] = {
			"Shadowsword Fury Mage", -- [1]
			"The Sunwell", -- [2]
		},
		[15974] = {
			"Dread Creeper", -- [1]
			"Naxxramas", -- [2]
		},
		[15990] = {
			"Kel'Thuzad", -- [1]
			"Naxxramas", -- [2]
		},
		[35590] = {
			"Risen Champion", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[16022] = {
			"Surgical Assistant", -- [1]
			"Naxxramas", -- [2]
		},
		[27974] = {
			"Eroded Shardling", -- [1]
			"Halls of Stone", -- [2]
		},
		[17835] = {
			"Infinite Assassin", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[17803] = {
			"Coilfang Oracle", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[179334] = {
			"Portalmancer Zo'nyy", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[17899] = {
			"Shadowy Necromancer", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[79720] = {
			"Grom'kar Boomer", -- [1]
			"Grimrail Depot", -- [2]
		},
		[17963] = {
			"Wastewalker Slave", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[16150] = {
			"Spectral Rider", -- [1]
			"Naxxramas", -- [2]
		},
		[20042] = {
			"Tempest-Smith", -- [1]
			"Tempest Keep", -- [2]
		},
		[150165] = {
			"Slime Elemental", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[24200] = {
			"Skarvald the Constructor", -- [1]
			"Utgarde Keep", -- [2]
		},
		[28580] = {
			"Hardened Steel Skycaller", -- [1]
			"Halls of Lightning", -- [2]
		},
		[34183] = {
			"Arachnopod Destroyer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[150160] = {
			"Scrapbone Bully", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[17096] = {
			"Astral Flare", -- [1]
			"Karazhan", -- [2]
		},
		[16460] = {
			"Night Mistress", -- [1]
			"Karazhan", -- [2]
		},
		[148120] = {
			"Kul Tiran Marine", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[28838] = {
			"Titanium Vanguard", -- [1]
			"Halls of Lightning", -- [2]
		},
		[28236] = {
			"Azure Ring Captain", -- [1]
			"The Oculus", -- [2]
		},
		[28582] = {
			"Stormforged Mender", -- [1]
			"Halls of Lightning", -- [2]
		},
		[30661] = {
			"Azure Invader", -- [1]
			"Violet Hold", -- [2]
		},
		[24552] = {
			"Sliver", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26631] = {
			"Novos the Summoner", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[16428] = {
			"Unstoppable Abomination", -- [1]
			"Naxxramas", -- [2]
		},
		[32904] = {
			"Dark Rune Commoner", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16492] = {
			"Syphoner", -- [1]
			"Karazhan", -- [2]
		},
		[16524] = {
			"Shade of Aran", -- [1]
			"Karazhan", -- [2]
		},
		[35143] = {
			"Flame Warder", -- [1]
			"Vault of Archavon", -- [2]
			"enUS", -- [3]
		},
		[18635] = {
			"Cabal Deathsworn", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[18667] = {
			"Blackheart the Inciter", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[33288] = {
			"Yogg-Saron", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[6222] = {
			"Leprous Technician", -- [1]
			"Gnomeregan", -- [2]
		},
		[6230] = {
			"Peacekeeper Security Suit", -- [1]
			"Gnomeregan", -- [2]
		},
		[150168] = {
			"Toxic Monstrosity", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[29062] = {
			"Anub'ar Champion", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[22953] = {
			"Wrathbone Flayer", -- [1]
			"Black Temple", -- [2]
		},
		[22119] = {
			"Fathom Lurker", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[77803] = {
			"Railmaster Rocketspark", -- [1]
			"Grimrail Depot", -- [2]
		},
		[23049] = {
			"Shadowmoon Weapon Master", -- [1]
			"Black Temple", -- [2]
		},
		[167612] = {
			"Stoneborn Reaver", -- [1]
			"Halls of Atonement", -- [2]
		},
		[6218] = {
			"Irradiated Slime", -- [1]
			"Gnomeregan", -- [2]
		},
		[150169] = {
			"Toxic Lurker", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[23177] = {
			"Tarren Mill Lookout", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[115020] = {
			"Arcanid", -- [1]
			"Return to Karazhan", -- [2]
		},
		[34184] = {
			"Clockwork Mechanic", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21226] = {
			"Tidewalker Shaman", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[27431] = {
			"Drakkari Commander", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[23337] = {
			"Illidari Centurion", -- [1]
			"Black Temple", -- [2]
		},
		[26684] = {
			"Ravenous Furbolg", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[23401] = {
			"Hungering Soul Fragment", -- [1]
			"Black Temple", -- [2]
		},
		[163459] = {
			"Forsworn Mender", -- [1]
			"Spires of Ascension", -- [2]
		},
		[31008] = {
			"Azure Invader", -- [1]
			"Violet Hold", -- [2]
		},
		[25593] = {
			"Apocalypse Guard", -- [1]
			"The Sunwell", -- [2]
		},
		[25837] = {
			"Shadowsword Commander", -- [1]
			"The Sunwell", -- [2]
		},
		[23561] = {
			"Soldier of the Frozen Wastes", -- [1]
			"Naxxramas", -- [2]
		},
		[183425] = {
			"Wholesome Host", -- [1]
			"Return to Karazhan", -- [2]
		},
		[180431] = {
			"Focused Ritualist", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[25741] = {
			"M'uru", -- [1]
			"The Sunwell", -- [2]
		},
		[29830] = {
			"Living Mojo", -- [1]
			"Gundrak", -- [2]
		},
		[35144] = {
			"Acidmaw", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[115418] = {
			"Spider", -- [1]
			"Return to Karazhan", -- [2]
		},
		[17055] = {
			"Maexxna Spiderling", -- [1]
			"Naxxramas", -- [2]
		},
		[20870] = {
			"Zereketh the Unbound", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[21128] = {
			"Coilfang Ray", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[27975] = {
			"Maiden of Grief", -- [1]
			"Halls of Stone", -- [2]
		},
		[135246] = {
			"\"Stabby\" Lottie", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[27973] = {
			"Crystalline Shardling", -- [1]
			"Halls of Stone", -- [2]
		},
		[28231] = {
			"Crystalline Tender", -- [1]
			"The Nexus", -- [2]
		},
		[24201] = {
			"Dalronn the Controller", -- [1]
			"Utgarde Keep", -- [2]
		},
		[26536] = {
			"Mindless Servant", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[28167] = {
			"Stratholme Citizen", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[17964] = {
			"Wastewalker Worker", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[20043] = {
			"Apprentice Star Scryer", -- [1]
			"Tempest Keep", -- [2]
		},
		[33993] = {
			"Emalon the Storm Watcher", -- [1]
			"Vault of Archavon", -- [2]
			"enUS", -- [3]
		},
		[34057] = {
			"Assault Bot", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[18092] = {
			"Tarren Mill Guardsman", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[115419] = {
			"Ancient Tome", -- [1]
			"Return to Karazhan", -- [2]
		},
		[22250] = {
			"Rancid Mushroom", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[26632] = {
			"The Prophet Tharon'ja", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[176565] = {
			"Disruptive Patron", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[16461] = {
			"Zealous Paramour", -- [1]
			"Karazhan", -- [2]
		},
		[24745] = {
			"Pure Energy", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26824] = {
			"Drakkari Raptor Mount", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[28583] = {
			"Blistering Steamrager", -- [1]
			"Halls of Lightning", -- [2]
		},
		[30662] = {
			"Azure Spellbreaker", -- [1]
			"Violet Hold", -- [2]
			"enUS", -- [3]
		},
		[24553] = {
			"Apoko", -- [1]
			"Magister's Terrace", -- [2]
		},
		[34825] = {
			"Nether Portal", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[16429] = {
			"Soul Weaver", -- [1]
			"Naxxramas", -- [2]
		},
		[26696] = {
			"Ymirjar Berserker", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[26728] = {
			"Mage Hunter Initiate", -- [1]
			"The Nexus", -- [2]
		},
		[16525] = {
			"Spell Shade", -- [1]
			"Karazhan", -- [2]
		},
		[26792] = {
			"Crystalline Protector", -- [1]
			"The Nexus", -- [2]
		},
		[24777] = {
			"Sunblade Sentinel", -- [1]
			"Magister's Terrace", -- [2]
		},
		[17401] = {
			"Felhound Manastalker", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[29063] = {
			"Anub'ar Crypt Fiend", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[18732] = {
			"Grandmaster Vorpil", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[35465] = {
			"Zhaagrym", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[18796] = {
			"Fel Overseer", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[20875] = {
			"Negaton Screamer", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22954] = {
			"Illidari Fearbringer", -- [1]
			"Black Temple", -- [2]
		},
		[23018] = {
			"Shadowmoon Houndmaster", -- [1]
			"Black Temple", -- [2]
		},
		[165529] = {
			"Depraved Collector", -- [1]
			"Halls of Atonement", -- [2]
		},
		[2385] = {
			"Feral Mountain Lion", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[20064] = {
			"Thaladred the Darkener", -- [1]
			"Tempest Keep", -- [2]
		},
		[161895] = {
			"Thing From Beyond", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[164506] = {
			"Ancient Captain", -- [1]
			"Theater of Pain", -- [2]
		},
		[15687] = {
			"Moroes", -- [1]
			"Karazhan", -- [2]
		},
		[30623] = {
			"Lopemage", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[166396] = {
			"Noble Skirmisher", -- [1]
			"Sanguine Depths", -- [2]
		},
		[21227] = {
			"Tidewalker Harpooner", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[27655] = {
			"Mage-Lord Urom", -- [1]
			"The Oculus", -- [2]
		},
		[23562] = {
			"Unstoppable Abomination", -- [1]
			"Naxxramas", -- [2]
		},
		[17229] = {
			"Kil'rek", -- [1]
			"Karazhan", -- [2]
		},
		[17261] = {
			"Restless Skeleton", -- [1]
			"Karazhan", -- [2]
		},
		[144293] = {
			"Waste Processing Unit", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[20879] = {
			"Eredar Soul-Eater", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[23498] = {
			"Parasitic Shadowfiend", -- [1]
			"Black Temple", -- [2]
		},
		[114526] = {
			"Ghostly Understudy", -- [1]
			"Return to Karazhan", -- [2]
		},
		[27656] = {
			"Ley-Guardian Eregos", -- [1]
			"The Oculus", -- [2]
		},
		[29735] = {
			"Savage Worg", -- [1]
			"Utgarde Keep", -- [2]
		},
		[166299] = {
			"Mistveil Tender", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[15690] = {
			"Prince Malchezaar", -- [1]
			"Karazhan", -- [2]
		},
		[144294] = {
			"Mechagon Tinkerer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[24675] = {
			"Phoenix Egg", -- [1]
			"Magister's Terrace", -- [2]
		},
		[15975] = {
			"Carrion Spinner", -- [1]
			"Naxxramas", -- [2]
		},
		[15954] = {
			"Noth the Plaguebringer", -- [1]
			"Naxxramas", -- [2]
		},
		[23818] = {
			"Amani'shi Hatcher", -- [1]
			"Zul'Aman", -- [2]
		},
		[25591] = {
			"Painbringer", -- [1]
			"The Sunwell", -- [2]
		},
		[17942] = {
			"Quagmirran", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[23402] = {
			"Illidari Battle-mage", -- [1]
			"Black Temple", -- [2]
		},
		[144295] = {
			"Mechagon Mechanic", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[29637] = {
			"Crafty Snake", -- [1]
			"Gundrak", -- [2]
		},
		[168886] = {
			"Virulax Blightweaver", -- [1]
			"Plaguefall", -- [2]
		},
		[19221] = {
			"Nethermancer Sepethrea", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[20044] = {
			"Novice Astromancer", -- [1]
			"Tempest Keep", -- [2]
		},
		[28200] = {
			"Dark Necromancer", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[30279] = {
			"Deep Crawler", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[164510] = {
			"Shambling Arbalest", -- [1]
			"Theater of Pain", -- [2]
		},
		[16215] = {
			"Unholy Staff", -- [1]
			"Naxxramas", -- [2]
		},
		[18093] = {
			"Tarren Mill Protector", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[26636] = {
			"Risen Drakkari Soulmage", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[177816] = {
			"Interrogation Specialist", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[24744] = {
			"Vexallus", -- [1]
			"Magister's Terrace", -- [2]
		},
		[34705] = {
			"Marshal Jacob Alerius", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[32582] = {
			"Ethereal Sphere ", -- [1]
			"Violet Hold", -- [2]
			"enUS", -- [3]
		},
		[16375] = {
			"Sewage Slime", -- [1]
			"Naxxramas", -- [2]
		},
		[177817] = {
			"Support Officer", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[28584] = {
			"Unbound Firestorm", -- [1]
			"Halls of Lightning", -- [2]
		},
		[30663] = {
			"Azure Binder", -- [1]
			"Northrend", -- [2]
			"enUS", -- [3]
		},
		[30695] = {
			"Portal Keeper", -- [1]
			"Violet Hold", -- [2]
		},
		[27639] = {
			"Ring-Lord Sorceress", -- [1]
			"The Oculus", -- [2]
		},
		[16526] = {
			"Sorcerous Shade", -- [1]
			"Karazhan", -- [2]
		},
		[32908] = {
			"Captured Mercenary Captain", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[26729] = {
			"Steward", -- [1]
			"The Nexus", -- [2]
		},
		[144298] = {
			"Defense Bot Mk III", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[26793] = {
			"Crystalline Frayer", -- [1]
			"The Nexus", -- [2]
		},
		[18637] = {
			"Cabal Shadow Priest", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[33228] = {
			"Eonar's Gift", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[19782] = {
			"Astral Flare", -- [1]
			"Karazhan", -- [2]
		},
		[27909] = {
			"Darkweb Victim", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[20031] = {
			"Bloodwarder Legionnaire", -- [1]
			"Tempest Keep", -- [2]
		},
		[18797] = {
			"Tortured Skeleton", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[29064] = {
			"Anub'ar Necromancer", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[22955] = {
			"Charming Patron", -- [1]
			"Black Temple", -- [2]
		},
		[29128] = {
			"Anub'ar Prime Guard", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[114636] = {
			"Phantom Guardsman", -- [1]
			"Return to Karazhan", -- [2]
		},
		[80808] = {
			"Neesa Nox", -- [1]
			"Iron Docks", -- [2]
		},
		[23083] = {
			"Shadowmoon Riding Hound", -- [1]
			"Black Temple", -- [2]
		},
		[6226] = {
			"Mechano-Flamewalker", -- [1]
			"Gnomeregan", -- [2]
		},
		[23147] = {
			"Shadowmoon Grunt", -- [1]
			"Black Temple", -- [2]
		},
		[23179] = {
			"Tarren Mill Protector", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[30276] = {
			"Ahn'kahar Web Winder", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[34826] = {
			"Mistress of Pain", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[21228] = {
			"Tidewalker Hydromancer", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[29209] = {
			"Carrion Beetle", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[23339] = {
			"Illidari Heartseeker", -- [1]
			"Black Temple", -- [2]
		},
		[23371] = {
			"Shadowmoon Fallen", -- [1]
			"Black Temple", -- [2]
		},
		[23403] = {
			"Illidari Assassin", -- [1]
			"Black Temple", -- [2]
		},
		[24690] = {
			"Wretched Husk", -- [1]
			"Magister's Terrace", -- [2]
		},
		[19168] = {
			"Sunseeker Astromage", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[18848] = {
			"Malicious Instructor", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[17840] = {
			"Durnholde Tracking Hound", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[23563] = {
			"Soul Weaver", -- [1]
			"Naxxramas", -- [2]
		},
		[32845] = {
			"Hodir", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29768] = {
			"Unyielding Constrictor", -- [1]
			"Gundrak", -- [2]
		},
		[27753] = {
			"Drakkari Invader", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[29832] = {
			"Drakkari Golem", -- [1]
			"Gundrak", -- [2]
		},
		[26727] = {
			"Mage Hunter Ascendant", -- [1]
			"The Nexus", -- [2]
		},
		[24722] = {
			"Fel Crystal", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26735] = {
			"Azure Scale-Binder", -- [1]
			"The Nexus", -- [2]
		},
		[33293] = {
			"XT-002 Deconstructor", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[26918] = {
			"Chaotic Rift", -- [1]
			"The Nexus", -- [2]
		},
		[27977] = {
			"Krystallus", -- [1]
			"Halls of Stone", -- [2]
		},
		[15551] = {
			"Spectral Stable Hand", -- [1]
			"Karazhan", -- [2]
		},
		[25588] = {
			"Hand of the Deceiver", -- [1]
			"The Sunwell", -- [2]
		},
		[166302] = {
			"Corpse Harvester", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[21964] = {
			"Fathom-Guard Caribdis", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[24043] = {
			"Amani Lynx", -- [1]
			"Zul'Aman", -- [2]
		},
		[28169] = {
			"Stratholme Resident", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[28201] = {
			"Bile Golem", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[20045] = {
			"Nether Scryer", -- [1]
			"Tempest Keep", -- [2]
		},
		[82579] = {
			"Grom'kar Far Seer", -- [1]
			"Grimrail Depot", -- [2]
		},
		[27641] = {
			"Centrifuge Construct", -- [1]
			"The Oculus", -- [2]
		},
		[18094] = {
			"Tarren Mill Lookout", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[22056] = {
			"Coilfang Strider", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[20481] = {
			"Raging Flames", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[24849] = {
			"Proto-Drake Rider", -- [1]
			"Utgarde Keep", -- [2]
		},
		[162039] = {
			"Wicked Oppressor", -- [1]
			"Sanguine Depths", -- [2]
		},
		[168357] = {
			"Zolramus Sorcerer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[17941] = {
			"Mennu the Betrayer", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[17414] = {
			"Shadowmoon Technician", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[28585] = {
			"Slag", -- [1]
			"Halls of Lightning", -- [2]
		},
		[34701] = {
			"Colosos", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[24555] = {
			"Garaxxas", -- [1]
			"Magister's Terrace", -- [2]
		},
		[169893] = {
			"Nefarious Darkspeaker", -- [1]
			"Theater of Pain", -- [2]
		},
		[28578] = {
			"Hardened Steel Reaver", -- [1]
			"Halls of Lightning", -- [2]
		},
		[26730] = {
			"Mage Slayer", -- [1]
			"The Nexus", -- [2]
		},
		[24683] = {
			"Sunblade Mage Guard", -- [1]
			"Magister's Terrace", -- [2]
		},
		[24715] = {
			"High Explosive Sheep", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26794] = {
			"Ormorok the Tree-Shaper", -- [1]
			"The Nexus", -- [2]
		},
		[18638] = {
			"Cabal Zealot", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[30624] = {
			"Táy", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[163621] = {
			"Goregrind", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[30278] = {
			"Ahn'kahar Spell Flinger", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[105705] = {
			"Bound Energy", -- [1]
			"Court of Stars", -- [2]
		},
		[22236] = {
			"Water Elemental Totem", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[18830] = {
			"Cabal Fanatic", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[22956] = {
			"Priestess of Torment", -- [1]
			"Black Temple", -- [2]
		},
		[18894] = {
			"Felguard Brute", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[17007] = {
			"Lady Keira Berrybuck", -- [1]
			"Karazhan", -- [2]
		},
		[33806] = {
			"Void Beast", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29321] = {
			"Ichor Globule", -- [1]
			"Violet Hold", -- [2]
			"enUS", -- [3]
		},
		[164266] = {
			"Domina Venomblade", -- [1]
			"Plaguefall", -- [2]
		},
		[33998] = {
			"Tempest Minion", -- [1]
			"Vault of Archavon", -- [2]
			"enUS", -- [3]
		},
		[15688] = {
			"Terestian Illhoof", -- [1]
			"Karazhan", -- [2]
		},
		[20048] = {
			"Crimson Hand Centurion", -- [1]
			"Tempest Keep", -- [2]
		},
		[34190] = {
			"Hardened Iron Golem", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21229] = {
			"Greyheart Tidecaller", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[17167] = {
			"Conjured Elemental", -- [1]
			"Karazhan", -- [2]
		},
		[16151] = {
			"Midnight", -- [1]
			"Karazhan", -- [2]
		},
		[30666] = {
			"Azure Captain", -- [1]
			"Violet Hold", -- [2]
		},
		[25483] = {
			"Shadowsword Manafiend", -- [1]
			"The Sunwell", -- [2]
		},
		[23436] = {
			"Image of Dementia", -- [1]
			"Black Temple", -- [2]
		},
		[173729] = {
			"Manifestation of Pride", -- [1]
			"Theater of Pain", -- [2]
		},
		[34702] = {
			"Ambrose Boltspark", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[30385] = {
			"Twilight Volunteer", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[183424] = {
			"Virtuous Gentleman", -- [1]
			"Return to Karazhan", -- [2]
		},
		[114790] = {
			"Viz'aduum the Watcher", -- [1]
			"Return to Karazhan", -- [2]
		},
		[24079] = {
			"Dragonflayer Forge Master", -- [1]
			"Utgarde Keep", -- [2]
		},
		[15928] = {
			"Thaddius", -- [1]
			"Naxxramas", -- [2]
		},
		[22957] = {
			"Mistress of Dementia", -- [1]
			"Black Temple", -- [2]
		},
		[22347] = {
			"Colossus Lurker", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[15976] = {
			"Venom Stalker", -- [1]
			"Naxxramas", -- [2]
		},
		[116549] = {
			"Backup Singer", -- [1]
			"Return to Karazhan", -- [2]
		},
		[25867] = {
			"Sunblade Dragonhawk", -- [1]
			"The Sunwell", -- [2]
		},
		[16024] = {
			"Embalming Slime", -- [1]
			"Naxxramas", -- [2]
		},
		[27978] = {
			"Sjonnir The Ironshaper", -- [1]
			"Halls of Stone", -- [2]
		},
		[16056] = {
			"Diseased Maggot", -- [1]
			"Naxxramas", -- [2]
		},
		[16488] = {
			"Arcane Anomaly", -- [1]
			"Karazhan", -- [2]
		},
		[17839] = {
			"Rift Lord", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[21965] = {
			"Fathom-Guard Tidalvess", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[30277] = {
			"Ahn'kahar Slasher", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[16168] = {
			"Stoneskin Gargoyle", -- [1]
			"Naxxramas", -- [2]
		},
		[16152] = {
			"Attumen the Huntsman", -- [1]
			"Karazhan", -- [2]
		},
		[20046] = {
			"Astromancer Lord", -- [1]
			"Tempest Keep", -- [2]
		},
		[178165] = {
			"Coastwalker Goliath", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[18639] = {
			"Cabal Spellbinder", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[16216] = {
			"Unholy Swords", -- [1]
			"Naxxramas", -- [2]
		},
		[34191] = {
			"Trash", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[176395] = {
			"Overloaded Mailemental", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[28153] = {
			"Snowflake", -- [1]
			"The Oculus", -- [2]
		},
		[24684] = {
			"Sunblade Blood Knight", -- [1]
			"Magister's Terrace", -- [2]
		},
		[24396] = {
			"Forest Frog", -- [1]
			"Zul'Aman", -- [2]
		},
		[24246] = {
			"Darkheart", -- [1]
			"Zul'Aman", -- [2]
		},
		[34703] = {
			"Lana Stouthammer", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[28586] = {
			"General Bjarngrim", -- [1]
			"Halls of Lightning", -- [2]
		},
		[16360] = {
			"Zombie Chow", -- [1]
			"Naxxramas", -- [2]
		},
		[24556] = {
			"Zelfan", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26635] = {
			"Risen Drakkari Warrior", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[114792] = {
			"Virtuous Lady", -- [1]
			"Return to Karazhan", -- [2]
		},
		[23596] = {
			"Amani'shi Flame Caster", -- [1]
			"Zul'Aman", -- [2]
		},
		[26731] = {
			"Grand Magus Telestra", -- [1]
			"The Nexus", -- [2]
		},
		[26763] = {
			"Anomalus", -- [1]
			"The Nexus", -- [2]
		},
		[6212] = {
			"Dark Iron Agent", -- [1]
			"Gnomeregan", -- [2]
		},
		[33168] = {
			"Strengthened Iron Roots", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[6207] = {
			"Caverndeep Ambusher", -- [1]
			"Gnomeregan", -- [2]
		},
		[30249] = {
			"Scion of Eternity", -- [1]
			"The Eye of Eternity", -- [2]
		},
		[6223] = {
			"Leprous Defender", -- [1]
			"Gnomeregan", -- [2]
		},
		[180336] = {
			"Cartel Wiseguy", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[33488] = {
			"Saronite Vapors", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[177787] = {
			"Mawsworn Hopebreaker", -- [1]
			"Sanctum of Domination", -- [2]
		},
		[29098] = {
			"Anub'ar Necromancer", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[150712] = {
			"Trixie Tazer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[29097] = {
			"Anub'ar Crypt Fiend", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[23889] = {
			"Amani'shi Savage", -- [1]
			"Zul'Aman", -- [2]
		},
		[23863] = {
			"Zul'jin", -- [1]
			"Zul'Aman", -- [2]
		},
		[25373] = {
			"Shadowsword Soulbinder", -- [1]
			"The Sunwell", -- [2]
		},
		[25372] = {
			"Sunblade Scout", -- [1]
			"The Sunwell", -- [2]
		},
		[17815] = {
			"Lordaeron Sentry", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[6227] = {
			"Mechano-Frostwalker", -- [1]
			"Gnomeregan", -- [2]
		},
		[34192] = {
			"Boomer XP-500", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21230] = {
			"Greyheart Nether-Mage", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[16529] = {
			"Magical Horror", -- [1]
			"Karazhan", -- [2]
		},
		[162691] = {
			"Blightbone", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[16389] = {
			"Spectral Apprentice", -- [1]
			"Karazhan", -- [2]
		},
		[22849] = {
			"Ashtongue Feral Spirit", -- [1]
			"Black Temple", -- [2]
		},
		[25484] = {
			"Shadowsword Assassin", -- [1]
			"The Sunwell", -- [2]
		},
		[23469] = {
			"Enslaved Soul", -- [1]
			"Black Temple", -- [2]
		},
		[30664] = {
			"Azure Mage Slayer", -- [1]
			"Violet Hold", -- [2]
		},
		[17398] = {
			"Nascent Fel Orc", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[169905] = {
			"Risen Warlord", -- [1]
			"De Other Side", -- [2]
		},
		[23597] = {
			"Amani'shi Guardian", -- [1]
			"Zul'Aman", -- [2]
		},
		[24138] = {
			"Tamed Amani Crocolisk", -- [1]
			"Zul'Aman", -- [2]
		},
		[25708] = {
			"Sinister Reflection", -- [1]
			"The Sunwell", -- [2]
		},
		[29834] = {
			"Drakkari Frenzy", -- [1]
			"Gundrak", -- [2]
		},
		[25772] = {
			"Void Sentinel", -- [1]
			"The Sunwell", -- [2]
		},
		[23757] = {
			"Amani Healing Ward", -- [1]
			"Zul'Aman", -- [2]
		},
		[26929] = {
			"Grand Magus Telestra", -- [1]
			"The Nexus", -- [2]
		},
		[19873] = {
			"Lord Crispin Ference", -- [1]
			"Karazhan", -- [2]
		},
		[21806] = {
			"Greyheart Spellbinder", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[27979] = {
			"Forged Iron Trogg", -- [1]
			"Halls of Stone", -- [2]
		},
		[168627] = {
			"Plaguebinder", -- [1]
			"Plaguefall", -- [2]
		},
		[17808] = {
			"Anetheron", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[83578] = {
			"Ogron Laborer", -- [1]
			"Iron Docks", -- [2]
		},
		[21966] = {
			"Fathom-Guard Sharkkis", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[31104] = {
			"Ahn'kahar Watcher", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[168443] = {
			"Zolramus Necromancer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[17968] = {
			"Archimonde", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[20047] = {
			"Crimson Hand Battle Mage", -- [1]
			"Tempest Keep", -- [2]
		},
		[150146] = {
			"Scrapbone Shaman", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[21148] = {
			"Rift Keeper", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[18096] = {
			"Epoch Hunter", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[34193] = {
			"Clockwork Sapper", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[29096] = {
			"Anub'ar Champion", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[22959] = {
			"Ardent Host", -- [1]
			"Black Temple", -- [2]
		},
		[17952] = {
			"Darkwater Crocolisk", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[163618] = {
			"Zolramus Necromancer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[154758] = {
			"Toxic Monstrosity", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[162744] = {
			"Nekthara the Mangler", -- [1]
			"Theater of Pain", -- [2]
		},
		[28587] = {
			"Volkhan", -- [1]
			"Halls of Lightning", -- [2]
		},
		[28619] = {
			"Web Wrap", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[24557] = {
			"Kagani Nightstrike", -- [1]
			"Magister's Terrace", -- [2]
		},
		[32786] = {
			"Rotted Troll Corpse", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[26668] = {
			"Svala Sorrowgrave", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[22091] = {
			"Spitfire Totem", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[24685] = {
			"Sunblade Magister", -- [1]
			"Magister's Terrace", -- [2]
		},
		[30858] = {
			"Disciple of Vesperon", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[26796] = {
			"Commander Stoutbeard", -- [1]
			"The Nexus", -- [2]
		},
		[18640] = {
			"Cabal Warlock", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[167607] = {
			"Stoneborn Slasher", -- [1]
			"Halls of Atonement", -- [2]
		},
		[28579] = {
			"Hardened Steel Berserker", -- [1]
			"Halls of Lightning", -- [2]
		},
		[6234] = {
			"Mechanized Guardian", -- [1]
			"Gnomeregan", -- [2]
		},
		[21221] = {
			"Coilfang Beast-Tamer", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[26627] = {
			"Crystal Handler", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[172981] = {
			"Kyrian Stitchwerk", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[28199] = {
			"Tomb Stalker", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[17864] = {
			"Lesser Doomguard", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[27734] = {
			"Crypt Fiend", -- [1]
			"The Culling of Stratholme", -- [2]
		},
		[30284] = {
			"Bonegrinder", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[115486] = {
			"Erudite Slayer", -- [1]
			"Return to Karazhan", -- [2]
		},
		[25165] = {
			"Lady Sacrolash", -- [1]
			"The Sunwell", -- [2]
		},
		[174773] = {
			"Spiteful Shade", -- [1]
			"Sanguine Depths", -- [2]
		},
		[15689] = {
			"Netherspite", -- [1]
			"Karazhan", -- [2]
		},
		[6206] = {
			"Caverndeep Burrower", -- [1]
			"Gnomeregan", -- [2]
		},
		[16544] = {
			"Ethereal Thief", -- [1]
			"Karazhan", -- [2]
		},
		[21231] = {
			"Greyheart Shield-Bearer", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[21263] = {
			"Greyheart Technician", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[32906] = {
			"Freya", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[23374] = {
			"Ashtongue Stalker", -- [1]
			"Black Temple", -- [2]
		},
		[36561] = {
			"Onyxian Lair Guard", -- [1]
			"Onyxia's Lair", -- [2]
			"enUS", -- [3]
		},
		[25485] = {
			"Shadowsword Deathbringer", -- [1]
			"The Sunwell", -- [2]
		},
		[151657] = {
			"Bomb Tonk", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[24696] = {
			"Coilskar Witch", -- [1]
			"Magister's Terrace", -- [2]
		},
		[114542] = {
			"Ghostly Philanthropist", -- [1]
			"Return to Karazhan", -- [2]
		},
		[29217] = {
			"Anub'ar Venomancer", -- [1]
			"Azjol-Nerub", -- [2]
		},
		[23598] = {
			"Amani Dragonhawk Hatchling", -- [1]
			"Zul'Aman", -- [2]
		},
		[20864] = {
			"Protean Nightmare", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[29920] = {
			"Ruins Dweller", -- [1]
			"Gundrak", -- [2]
		},
		[23694] = {
			"Pulsing Pumpkin", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[19710] = {
			"Gatewatcher Iron-Hand", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[15977] = {
			"Poisonous Skitterer", -- [1]
			"Naxxramas", -- [2]
		},
		[29931] = {
			"Drakkari Rhino", -- [1]
			"Gundrak", -- [2]
		},
		[23822] = {
			"Amani Protective Ward", -- [1]
			"Zul'Aman", -- [2]
		},
		[16025] = {
			"Stitched Giant", -- [1]
			"Naxxramas", -- [2]
		},
		[184911] = {
			"Urh Dismantler", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[16057] = {
			"Rotting Maggot", -- [1]
			"Naxxramas", -- [2]
		},
		[81407] = {
			"Grimrail Bombardier", -- [1]
			"Grimrail Depot", -- [2]
		},
		[20052] = {
			"Crystalcore Mechanic", -- [1]
			"Tempest Keep", -- [2]
		},
		[23961] = {
			"Dragonflayer Ironhelm", -- [1]
			"Utgarde Keep", -- [2]
		},
		[17905] = {
			"Banshee", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[24078] = {
			"Dragonflayer Metalworker", -- [1]
			"Utgarde Keep", -- [2]
		},
		[20896] = {
			"Ethereum Slayer", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[30283] = {
			"Plague Walker", -- [1]
			"Ahn'kahet: The Old Kingdom", -- [2]
		},
		[166589] = {
			"Animated Weapon", -- [1]
			"Sanguine Depths", -- [2]
		},
		[7079] = {
			"Viscous Fallout", -- [1]
			"Gnomeregan", -- [2]
		},
		[29838] = {
			"Drakkari Rhino", -- [1]
			"Gundrak", -- [2]
		},
		[30085] = {
			"Vigilant Shade", -- [1]
			"Naxxramas", -- [2]
		},
		[20208] = {
			"Mennu's Healing Ward", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[33350] = {
			"Mimiron", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[30245] = {
			"Nexus Lord", -- [1]
			"The Eye of Eternity", -- [2]
		},
		[16297] = {
			"Mutated Grub", -- [1]
			"Naxxramas", -- [2]
		},
		[15547] = {
			"Spectral Charger", -- [1]
			"Karazhan", -- [2]
		},
		[22238] = {
			"Serpentshrine Tidecaller", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[81297] = {
			"Dreadfang", -- [1]
			"Iron Docks", -- [2]
		},
		[30667] = {
			"Azure Sorcerer", -- [1]
			"Violet Hold", -- [2]
		},
		[114544] = {
			"Skeletal Usher", -- [1]
			"Return to Karazhan", -- [2]
		},
		[26637] = {
			"Risen Drakkari Handler", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[26669] = {
			"Ymirjar Savage", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[32916] = {
			"Snaplasher", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24686] = {
			"Sunblade Warlock", -- [1]
			"Magister's Terrace", -- [2]
		},
		[86526] = {
			"Grom'kar Chainmaster", -- [1]
			"Iron Docks", -- [2]
		},
		[150253] = {
			"Weaponized Crawler", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[18641] = {
			"Cabal Familiar", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[26861] = {
			"King Ymiron", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[165824] = {
			"Nar'zudah", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[18934] = {
			"Durnholde Mage", -- [1]
			"The Escape From Durnholde", -- [2]
		},
		[26685] = {
			"Massive Jormungar", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[17961] = {
			"Coilfang Enchantress", -- [1]
			"Coilfang: The Slave Pens", -- [2]
		},
		[20880] = {
			"Eredar Deathbringer", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[179386] = {
			"Corsair Officer", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[25038] = {
			"Felmyst", -- [1]
			"The Sunwell", -- [2]
		},
		[16459] = {
			"Wanton Hostess", -- [1]
			"Karazhan", -- [2]
		},
		[23970] = {
			"Vrykul Skeleton", -- [1]
			"Utgarde Keep", -- [2]
		},
		[29364] = {
			"Void Sentry", -- [1]
			"Violet Hold", -- [2]
		},
		[25166] = {
			"Grand Warlock Alythess", -- [1]
			"The Sunwell", -- [2]
		},
		[34004] = {
			"Life Spark", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[168418] = {
			"Forsworn Inquisitor", -- [1]
			"Spires of Ascension", -- [2]
		},
		[23215] = {
			"Ashtongue Sorcerer", -- [1]
			"Black Temple", -- [2]
		},
		[34196] = {
			"Rune Etched Sentry", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[21232] = {
			"Greyheart Skulker", -- [1]
			"Coilfang: Serpentshrine Cavern", -- [2]
		},
		[35610] = {
			"Cat", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[30084] = {
			"Power Spark", -- [1]
			"The Eye of Eternity", -- [2]
		},
		[152009] = {
			"Malfunctioning Scrapbot", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[16037] = {
			"Plagued Bat", -- [1]
			"Naxxramas", -- [2]
		},
		[25486] = {
			"Shadowsword Vanquisher", -- [1]
			"The Sunwell", -- [2]
		},
		[179388] = {
			"Hourglass Tidesage", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[27597] = {
			"Hulking Corpse", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[163524] = {
			"Kyrian Dark-Praetor", -- [1]
			"Spires of Ascension", -- [2]
		},
		[6427] = {
			"Haunting Phantasm", -- [1]
			"Scarlet Monastery", -- [2]
		},
		[26928] = {
			"Grand Magus Telestra", -- [1]
			"The Nexus", -- [2]
		},
		[162692] = {
			"Amarth", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[23028] = {
			"Bonechewer Taskmaster", -- [1]
			"Black Temple", -- [2]
		},
		[29836] = {
			"Drakkari Battle Rider", -- [1]
			"Gundrak", -- [2]
		},
		[27651] = {
			"Phantasmal Fire", -- [1]
			"The Oculus", -- [2]
		},
		[30453] = {
			"Onyx Sanctum Guardian", -- [1]
			"The Obsidian Sanctum", -- [2]
		},
		[29932] = {
			"Eck the Ferocious", -- [1]
			"Gundrak", -- [2]
		},
		[15438] = {
			"Greater Fire Elemental", -- [1]
			"The Sunwell", -- [2]
		},
		[27949] = {
			"Alliance Commander", -- [1]
			"The Nexus", -- [2]
		},
		[27981] = {
			"Malformed Ooze", -- [1]
			"Halls of Stone", -- [2]
		},
		[170690] = {
			"Diseased Horror", -- [1]
			"Theater of Pain", -- [2]
		},
		[16573] = {
			"Crypt Guard", -- [1]
			"Naxxramas", -- [2]
		},
		[17842] = {
			"Azgalor", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[167111] = {
			"Spinemaw Staghorn", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[24047] = {
			"Amani Crocolisk", -- [1]
			"Zul'Aman", -- [2]
		},
		[167876] = {
			"Inquisitor Sigar", -- [1]
			"Halls of Atonement", -- [2]
		},
		[29314] = {
			"Zuramat the Obliterator", -- [1]
			"Violet Hold", -- [2]
		},
		[20049] = {
			"Crimson Hand Blood Knight", -- [1]
			"Tempest Keep", -- [2]
		},
		[24175] = {
			"Amani'shi Lookout", -- [1]
			"Zul'Aman", -- [2]
		},
		[34069] = {
			"Molten Colossus", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24239] = {
			"Hex Lord Malacrass", -- [1]
			"Zul'Aman", -- [2]
		},
		[34197] = {
			"Chamber Overseer", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[26625] = {
			"Darkweb Recluse", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[16390] = {
			"Deathchill Servant", -- [1]
			"Naxxramas", -- [2]
		},
		[26716] = {
			"Azure Warder", -- [1]
			"The Nexus", -- [2]
		},
		[27969] = {
			"Dark Rune Giant", -- [1]
			"Halls of Stone", -- [2]
		},
		[20050] = {
			"Crimson Hand Inquisitor", -- [1]
			"Tempest Keep", -- [2]
		},
		[168718] = {
			"Forsworn Warden", -- [1]
			"Spires of Ascension", -- [2]
		},
		[16029] = {
			"Sludge Belcher", -- [1]
			"Naxxramas", -- [2]
		},
		[30668] = {
			"Azure Raider", -- [1]
			"Violet Hold", -- [2]
		},
		[24559] = {
			"Warlord Salaris", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26638] = {
			"Risen Drakkari Bat Rider", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[26670] = {
			"Ymirjar Flesh Hunter", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[32918] = {
			"Detonating Lasher", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[26734] = {
			"Azure Enforcer", -- [1]
			"The Nexus", -- [2]
		},
		[26830] = {
			"Risen Drakkari Death Knight", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[30892] = {
			"Portal Guardian", -- [1]
			"Violet Hold", -- [2]
		},
		[18642] = {
			"Fel Guardhound", -- [1]
			"Auchindoun: Shadow Labyrinth", -- [2]
		},
		[24815] = {
			"Sunblade Imp", -- [1]
			"Magister's Terrace", -- [2]
		},
		[26692] = {
			"Ymirjar Harpooner", -- [1]
			"Utgarde Pinnacle", -- [2]
		},
		[34796] = {
			"Gormok the Impaler", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[33430] = {
			"Guardian Lasher", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[22896] = {
			"Ashtongue Searing Totem", -- [1]
			"Black Temple", -- [2]
		},
		[20881] = {
			"Unbound Devastator", -- [1]
			"Tempest Keep: The Arcatraz", -- [2]
		},
		[22960] = {
			"Dragonmaw Wyrmcaller", -- [1]
			"Black Temple", -- [2]
		},
		[35309] = {
			"Argent Lightwielder", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[34474] = {
			"Serissa Grimdabbler", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[169927] = {
			"Putrid Butcher", -- [1]
			"Theater of Pain", -- [2]
		},
		[18994] = {
			"Infinite Executioner", -- [1]
			"Opening of the Dark Portal", -- [2]
		},
		[34049] = {
			"Tempest Minion", -- [1]
			"Vault of Archavon", -- [2]
			"enUS", -- [3]
		},
		[33985] = {
			"Corruptor Tentacle", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[162763] = {
			"Soulforged Bonereaver", -- [1]
			"Theater of Pain", -- [2]
		},
		[23216] = {
			"Ashtongue Defender", -- [1]
			"Black Temple", -- [2]
		},
		[34198] = {
			"Iron Mender", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[178133] = {
			"Murkbrine Wavejumper", -- [1]
			"Tazavesh, the Veiled Market", -- [2]
		},
		[19218] = {
			"Gatewatcher Gyro-Kill", -- [1]
			"Tempest Keep: The Mechanar", -- [2]
		},
		[16125] = {
			"Unrelenting Death Knight", -- [1]
			"Naxxramas", -- [2]
		},
		[168393] = {
			"Plaguebelcher", -- [1]
			"Plaguefall", -- [2]
		},
		[17267] = {
			"Fiendish Imp", -- [1]
			"Karazhan", -- [2]
		},
		[34657] = {
			"Jaelyne Evensong", -- [1]
			"Trial of the Champion", -- [2]
			"enUS", -- [3]
		},
		[25851] = {
			"Volatile Fiend", -- [1]
			"The Sunwell", -- [2]
		},
		[27598] = {
			"Fetid Troll Corpse", -- [1]
			"Drak'Tharon Keep", -- [2]
		},
		[17395] = {
			"Shadowmoon Summoner", -- [1]
			"Hellfire Citadel: The Blood Furnace", -- [2]
		},
		[6229] = {
			"Crowd Pummeler 9-60", -- [1]
			"Gnomeregan", -- [2]
		},
		[33343] = {
			"XS-013 Scrapbot", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[32919] = {
			"Storm Lasher", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[15930] = {
			"Feugen", -- [1]
			"Naxxramas", -- [2]
		},
		[32930] = {
			"Kologarn", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[34471] = {
			"Baelnor Lightbearer", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[15978] = {
			"Crypt Reaver", -- [1]
			"Naxxramas", -- [2]
		},
		[33432] = {
			"Leviathan Mk II", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[184259] = {
			"Night Lord", -- [1]
			"Karazhan", -- [2]
		},
		[34147] = {
			"Emergency Fire Bot", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[27982] = {
			"Forged Iron Dwarf", -- [1]
			"Halls of Stone", -- [2]
		},
		[164557] = {
			"Shard of Halkias", -- [1]
			"Halls of Atonement", -- [2]
		},
		[32886] = {
			"Dark Rune Acolyte", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[33113] = {
			"Flame Leviathan", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[155090] = {
			"Anodized Coilbearer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[17907] = {
			"Frost Wyrm", -- [1]
			"The Battle for Mount Hyjal", -- [2]
		},
		[24080] = {
			"Dragonflayer Weaponsmith", -- [1]
			"Utgarde Keep", -- [2]
		},
		[16154] = {
			"Risen Squire", -- [1]
			"Naxxramas", -- [2]
		},
		[168396] = {
			"Plaguebelcher", -- [1]
			"Plaguefall", -- [2]
		},
		[165137] = {
			"Zolramus Gatekeeper", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[33819] = {
			"Twilight Frost Mage", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[24240] = {
			"Alyson Antille", -- [1]
			"Zul'Aman", -- [2]
		},
		[34199] = {
			"Lightning Charged Iron Dwarf", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[32926] = {
			"Flash Freeze", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[184261] = {
			"Wanton Host", -- [1]
			"Karazhan", -- [2]
		},
		[33526] = {
			"Ironroot Lasher", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
		[16406] = {
			"Phantom Attendant", -- [1]
			"Karazhan", -- [2]
		},
		[6112] = {
			"Windfury Totem", -- [1]
			"Trial of the Crusader", -- [2]
			"enUS", -- [3]
		},
		[33524] = {
			"Saronite Animus", -- [1]
			"Ulduar", -- [2]
			"enUS", -- [3]
		},
	},
	["aura_grow_direction"] = 1,
	["indicator_anchor"] = {
		["x"] = 0,
	},
	["health_selection_overlay_alpha"] = 0.199999988079071,
	["minor_height_scale"] = 0.9999999403953552,
	["aura_padding"] = 0.7999999523162842,
	["last_news_time"] = 1550158598,
	["aura_width2"] = 22,
	["aura_stack_size"] = 9,
	["aura_height2"] = 14,
	["aura_show_crowdcontrol"] = true,
	["extra_icon_timer_outline"] = "OUTLINE",
	["aura_border_colors"] = {
		["enrage"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["steal_or_purge"] = {
			0.27843137254902, -- [1]
			0.92156862745098, -- [2]
			0.98039215686275, -- [3]
		},
		["crowdcontrol"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["offensive"] = {
			nil, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["is_show_all"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["defensive"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["is_buff"] = {
			nil, -- [1]
			0, -- [2]
			0, -- [3]
		},
	},
	["class_colors"] = {
		["DEATHKNIGHT"] = {
			["colorStr"] = "ffc31d3a",
		},
		["WARRIOR"] = {
			["colorStr"] = "ffc69a6d",
		},
		["PALADIN"] = {
			["colorStr"] = "fff48bb9",
		},
		["WARLOCK"] = {
			["colorStr"] = "ff8687ed",
		},
		["DEMONHUNTER"] = {
			["colorStr"] = "ffa22fc8",
		},
		["SHAMAN"] = {
			["colorStr"] = "ff006fdd",
		},
		["DRUID"] = {
			["colorStr"] = "ffff7c09",
		},
		["EVOKER"] = {
			["colorStr"] = "ff33937e",
		},
		["ROGUE"] = {
			["colorStr"] = "fffff467",
		},
	},
	["extra_icon_anchor"] = {
		["y"] = -13,
		["x"] = 0,
		["side"] = 8,
	},
	["extra_icon_wide_icon"] = false,
	["range_check_alpha"] = 1,
	["semver"] = "1.0.5",
	["aura_frame2_anchor"] = {
		["y"] = 31.09999084472656,
		["x"] = -0.600006103515625,
		["side"] = 3,
	},
	["cast_statusbar_texture"] = "Melli",
	["indicator_faction"] = false,
	["debuff_show_cc"] = false,
	["transparency_behavior"] = 3,
	["spell_animations"] = false,
	["debuff_show_cc_border"] = {
		0, -- [1]
		0, -- [2]
		0, -- [3]
	},
	["aura_consolidate"] = true,
	["extra_icon_width"] = 26,
	["health_statusbar_texture"] = "Melli",
	["hook_auto_imported"] = {
		["Targetting Alpha"] = 3,
		["Reorder Nameplate"] = 4,
		["Dont Have Aura"] = 1,
		["Players Targetting Amount"] = 4,
		["Color Automation"] = 1,
		["Bwonsamdi Reaping"] = 1,
		["Execute Range"] = 1,
		["Jaina Encounter"] = 6,
		["Blockade Encounter"] = 1,
		["Cast Bar Icon Config"] = 2,
		["Extra Border"] = 2,
		["Combo Points"] = 6,
		["Hide Neutral Units"] = 1,
		["Target Color"] = 3,
		["Attacking Specific Unit"] = 2,
		["Aura Reorder"] = 3,
	},
	["minor_width_scale"] = 0.9999999403953552,
	["indicator_pet"] = false,
	["color_lerp_speed"] = 7,
	["aura_frame1_anchor"] = {
		["y"] = 7.5,
		["x"] = 0.8699951171875,
		["side"] = 7,
	},
	["honor_blizzard_plate_alpha"] = true,
	["aura_timer_text_font"] = "Naowh",
	["extra_icon_stack_font"] = "GothamNarrowUltra",
	["aura_height"] = 14,
	["non_targeted_alpha_enabled"] = true,
	["cast_statusbar_bgtexture"] = "Melli",
	["aura2_x_offset"] = -0.600006103515625,
	["target_indicator"] = "Double Arrows",
	["saved_cvars"] = {
		["ShowClassColorInNameplate"] = "1",
		["nameplateOverlapV"] = "1.1",
		["nameplateLargeTopInset"] = "0.089999996125698",
		["nameplateShowEnemyMinus"] = "1",
		["NamePlateClassificationScale"] = "1",
		["nameplateShowFriendlyTotems"] = "0",
		["nameplatePersonalHideDelaySeconds"] = "0.2",
		["nameplateShowFriendlyPets"] = "0",
		["nameplatePersonalShowInCombat"] = "1",
		["nameplateTargetRadialPosition"] = "1",
		["nameplateResourceOnTarget"] = "0",
		["clampTargetNameplateToScreen"] = "1",
		["nameplateShowAll"] = "1",
		["nameplateMaxDistance"] = "41",
		["nameplateShowFriendlyMinions"] = "0",
		["nameplateSelfScale"] = "1",
		["nameplateTargetBehindMaxDistance"] = "30",
		["nameplateShowEnemies"] = "1",
		["NamePlateVerticalScale"] = "1",
		["nameplateSelectedAlpha"] = "1",
		["nameplateShowSelf"] = "0",
		["nameplatePersonalShowAlways"] = "0",
		["nameplateMotionSpeed"] = "0.049999997019768",
		["nameplateGlobalScale"] = "1",
		["nameplateShowEnemyMinions"] = "1",
		["nameplateShowEnemyPets"] = "0",
		["nameplateShowFriendlyNPCs"] = "0",
		["nameplateSelectedScale"] = "1.1499999761581",
		["nameplateShowFriends"] = "0",
		["nameplateMotion"] = "1",
		["nameplateShowOnlyNames"] = "1",
		["nameplateMinScale"] = "1",
		["ShowNamePlateLoseAggroFlash"] = "1",
		["nameplateOtherTopInset"] = "0.089999996125698",
		["nameplateSelfTopInset"] = "0.5",
		["nameplateSelfBottomInset"] = "0.2",
		["nameplateShowEnemyTotems"] = "0",
		["nameplateShowFriendlyGuardians"] = "0",
		["nameplateOccludedAlphaMult"] = "0.4",
		["nameplateSelfAlpha"] = "1",
		["NamePlateHorizontalScale"] = "1",
		["nameplateShowEnemyGuardians"] = "0",
		["nameplatePersonalShowWithTarget"] = "0",
	},
	["login_counter"] = 19844,
	["extra_icon_caster_name"] = false,
	["aura_cooldown_show_swipe"] = false,
	["aura_stack_font"] = "Naowh",
	["auto_toggle_combat"] = {
		["blizz_healthbar_ic"] = true,
		["blizz_healthbar_ooc"] = true,
	},
	["hide_friendly_castbars"] = true,
	["OptionsPanelDB"] = {
		["PlaterOptionsPanelFrame"] = {
			["scale"] = 1,
		},
	},
	["auras_per_row_amount"] = 4,
	["hover_highlight_alpha"] = 0.199999988079071,
	["plate_config"] = {
		["player"] = {
			["spellpercent_text_font"] = "10089",
			["level_text_size"] = 11,
			["cast"] = {
				115, -- [1]
				8, -- [2]
			},
			["spellpercent_text_anchor"] = {
				["x"] = 2,
				["side"] = 5,
			},
			["big_actorname_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["level_text_font"] = "10089",
			["actorname_text_font"] = "10089",
			["big_actorname_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["mana_incombat"] = {
				100, -- [1]
				4, -- [2]
			},
			["all_names"] = true,
			["big_actortitle_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 12,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["big_actortitle_text_font"] = "10089",
			["spellpercent_text_size"] = 11,
			["big_actortitle_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["percent_text_color"] = {
				0.93725490196078, -- [1]
				0.97647058823529, -- [2]
				1, -- [3]
			},
			["cast_incombat"] = {
				115, -- [1]
				8, -- [2]
			},
			["big_actortitle_text_size"] = 10,
			["big_actorname_text_size"] = 10,
			["spellname_text_anchor"] = {
				["side"] = 3,
			},
			["big_actortitle_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["spellname_text_font"] = "10089",
			["big_actorname_text_outline"] = "OUTLINE",
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["actorname_text_size"] = 13,
			["big_actorname_text_font"] = "10089",
			["level_text_alpha"] = 1,
			["percent_text_size"] = 11,
			["percent_text_font"] = "10089",
			["health_incombat"] = {
				115, -- [1]
				15, -- [2]
			},
			["quest_enabled"] = true,
			["actorname_text_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.86789692938328, -- [4]
			},
			["power_percent_text_font"] = "Accidental Presidency",
			["spellname_text_size"] = 12,
			["health"] = {
				115, -- [1]
				15, -- [2]
			},
			["power_percent_text_size"] = 8,
			["actorname_text_anchor"] = {
				["y"] = 1,
				["side"] = 1,
			},
			["mana"] = {
				100, -- [1]
				4, -- [2]
			},
			["level_text_enabled"] = true,
		},
		["friendlyplayer"] = {
			["actorname_use_friends_color"] = false,
			["spellpercent_text_font"] = "AvantGarde",
			["level_text_size"] = 9,
			["actorname_use_class_color"] = true,
			["cast"] = {
				50, -- [1]
				7, -- [2]
			},
			["spellpercent_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = 1.009994506835938,
			},
			["spellname_text_outline"] = "OUTLINE",
			["big_actorname_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["level_text_font"] = "AvantGarde",
			["percent_text_color"] = {
				0.93725490196078, -- [1]
				0.97647058823529, -- [2]
				1, -- [3]
			},
			["actorname_text_font"] = "Naowh",
			["big_actorname_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["mana_incombat"] = {
				nil, -- [1]
				4, -- [2]
			},
			["actorname_use_guild_color"] = false,
			["all_names"] = true,
			["big_actortitle_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 9,
			["only_damaged"] = false,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["only_thename"] = true,
			["big_actortitle_text_font"] = "AvantGarde",
			["percent_text_ooc"] = true,
			["level_text_anchor"] = {
				["y"] = 2.519996643066406,
				["x"] = 1.489997863769531,
			},
			["big_actortitle_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["percent_text_size"] = 8,
			["cast_incombat"] = {
				105, -- [1]
				7, -- [2]
			},
			["actorname_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["spellname_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = -1.010002136230469,
				["side"] = 10,
			},
			["big_actortitle_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["percent_text_anchor"] = {
				["y"] = -0.4000015258789063,
				["x"] = 0.04000091552734375,
			},
			["big_actortitle_text_size"] = 9,
			["spellname_text_font"] = "AvantGarde",
			["big_actorname_text_outline"] = "OUTLINE",
			["big_actorname_text_size"] = 9,
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["mana"] = {
				nil, -- [1]
				4, -- [2]
			},
			["power_percent_text_font"] = "Accidental Presidency",
			["actorname_text_anchor"] = {
				["y"] = 9.799995422363281,
				["x"] = -0.8300018310546875,
				["side"] = 9,
			},
			["spellpercent_text_enabled"] = true,
			["spellpercent_text_size"] = 8,
			["percent_text_font"] = "Naowh",
			["buff_frame_y_offset"] = 0,
			["quest_enabled"] = true,
			["big_actorname_text_font"] = "AvantGarde",
			["actorname_text_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.87000000476837, -- [4]
			},
			["spellname_text_size"] = 8,
			["health"] = {
				124, -- [1]
				12, -- [2]
			},
			["percent_text_enabled"] = true,
			["level_text_alpha"] = 1,
			["health_incombat"] = {
				142, -- [1]
				16, -- [2]
			},
		},
		["friendlynpc"] = {
			["castbar_offset"] = -0.9000015258789062,
			["spellpercent_text_font"] = "Naowh",
			["actorname_friend_color"] = {
				0.71, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["level_text_size"] = 9,
			["actorname_use_class_color"] = false,
			["cast"] = {
				105, -- [1]
				6, -- [2]
			},
			["fixed_class_color"] = {
				0, -- [1]
				1, -- [2]
				0, -- [3]
			},
			["spellpercent_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = 1.009994506835938,
			},
			["enabled"] = false,
			["percent_text_show_decimals"] = false,
			["spellname_text_outline"] = "OUTLINE",
			["click_through"] = true,
			["level_text_font"] = "Naowh",
			["actorname_text_font"] = "Naowh",
			["actorname_use_guild_color"] = true,
			["actorname_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 8,
			["only_damaged"] = false,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["only_thename"] = true,
			["big_actortitle_text_font"] = "Naowh",
			["percent_text_ooc"] = true,
			["power_percent_text_font"] = "Accidental Presidency",
			["level_text_anchor"] = {
				["y"] = 2.519996643066406,
				["x"] = 1.489997863769531,
			},
			["cast_incombat"] = {
				105, -- [1]
				6, -- [2]
			},
			["show_guild_name"] = false,
			["actorname_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["spellname_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = -1.010002136230469,
				["side"] = 10,
			},
			["percent_text_anchor"] = {
				["y"] = 4.699996948242188,
				["x"] = -0.3600006103515625,
				["side"] = 5,
			},
			["spellname_text_font"] = "Naowh",
			["only_names"] = false,
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["actorname_text_size"] = 9,
			["big_actorname_text_font"] = "Naowh",
			["spellpercent_text_size"] = 8,
			["level_text_alpha"] = 1,
			["spellpercent_text_enabled"] = true,
			["actorname_use_friends_color"] = true,
			["percent_text_font"] = "Naowh",
			["actorname_guild_color"] = {
				0.498039, -- [1]
				1, -- [2]
				0.2, -- [3]
				1, -- [4]
			},
			["big_actortitle_text_size"] = 9,
			["actorname_text_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.87000000476837, -- [4]
			},
			["health_incombat"] = {
				nil, -- [1]
				10, -- [2]
			},
			["health"] = {
				122, -- [1]
				10, -- [2]
			},
			["percent_text_color"] = {
				0.93725490196078, -- [1]
				0.97647058823529, -- [2]
				1, -- [3]
			},
			["percent_text_enabled"] = true,
			["actorname_text_anchor"] = {
				["y"] = 0.9000015258789062,
				["x"] = 0.6999969482421875,
				["side"] = 1,
			},
			["spellname_text_size"] = 8,
		},
		["enemynpc"] = {
			["castbar_offset"] = -0.9000015258789062,
			["spellpercent_text_font"] = "Naowh",
			["level_text_size"] = 10,
			["cast"] = {
				120, -- [1]
				14, -- [2]
			},
			["spellpercent_text_anchor"] = {
				["y"] = 0.6699981689453125,
				["x"] = 0.0099945068359375,
			},
			["percent_text_show_decimals"] = false,
			["level_text_font"] = "Naowh",
			["percent_text_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
			},
			["actorname_text_font"] = "Naowh",
			["actorname_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 9,
			["big_actortitle_text_font"] = "Naowh",
			["spellpercent_text_size"] = 8,
			["level_text_anchor"] = {
				["y"] = 1.199996948242188,
				["x"] = -1,
			},
			["spellname_text_anchor"] = {
				["y"] = -0.9000015258789062,
				["x"] = 0.5,
				["side"] = 10,
			},
			["percent_text_anchor"] = {
				["y"] = -3.700004577636719,
				["x"] = -1,
				["side"] = 7,
			},
			["spellname_text_font"] = "Naowh",
			["actorname_text_size"] = 10,
			["big_actorname_text_font"] = "Naowh",
			["big_actorname_text_size"] = 9,
			["level_text_outline"] = "OUTLINE",
			["big_actortitle_text_size"] = 9,
			["level_text_alpha"] = 1,
			["spellpercent_text_enabled"] = false,
			["percent_text_font"] = "Naowh",
			["health_incombat"] = {
				nil, -- [1]
				10, -- [2]
			},
			["health"] = {
				120, -- [1]
				10, -- [2]
			},
			["power_percent_text_font"] = "Accidental Presidency",
			["actorname_text_anchor"] = {
				["y"] = -3.800003051757813,
				["x"] = 2,
				["side"] = 1,
			},
			["spellname_text_size"] = 9,
			["percent_show_health"] = false,
			["level_text_enabled"] = false,
		},
		["global_health_width"] = 120,
		["enemyplayer"] = {
			["spellpercent_text_font"] = "Naowh",
			["cast"] = {
				120, -- [1]
				14, -- [2]
			},
			["spellpercent_text_anchor"] = {
				["y"] = 0.6699981689453125,
				["x"] = 0.0099945068359375,
			},
			["percent_text_show_decimals"] = false,
			["spellname_text_outline"] = "OUTLINE",
			["level_text_font"] = "Naowh",
			["actorname_text_font"] = "Naowh",
			["all_names"] = true,
			["actorname_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 9,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["big_actortitle_text_font"] = "Naowh",
			["spellpercent_text_size"] = 8,
			["level_text_anchor"] = {
				["y"] = 1.199996948242188,
				["x"] = -1,
			},
			["cast_incombat"] = {
				nil, -- [1]
				14, -- [2]
			},
			["spellname_text_anchor"] = {
				["y"] = -0.9000015258789062,
				["x"] = 0.5,
				["side"] = 10,
			},
			["percent_text_anchor"] = {
				["y"] = -3.700004577636719,
				["x"] = -1,
				["side"] = 7,
			},
			["percent_text_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
			},
			["spellname_text_font"] = "Naowh",
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["actorname_text_size"] = 10,
			["power_percent_text_font"] = "Accidental Presidency",
			["level_text_outline"] = "OUTLINE",
			["castbar_offset"] = -0.9000015258789062,
			["actorname_text_anchor"] = {
				["y"] = -3.800003051757813,
				["x"] = 2,
				["side"] = 1,
			},
			["spellpercent_text_enabled"] = false,
			["big_actortitle_text_size"] = 9,
			["percent_text_font"] = "Naowh",
			["quest_enabled"] = true,
			["health_incombat"] = {
				nil, -- [1]
				10, -- [2]
			},
			["health"] = {
				120, -- [1]
				10, -- [2]
			},
			["big_actorname_text_font"] = "Naowh",
			["percent_show_health"] = false,
			["spellname_text_size"] = 9,
			["level_text_alpha"] = 1,
			["level_text_enabled"] = false,
		},
		["global_health_height"] = 10,
	},
	["aura_y_offset"] = 7.5,
	["use_ui_parent"] = true,
	["cast_statusbar_bgcolor"] = {
		0.098039215686275, -- [1]
		0.098039215686275, -- [2]
		0.098039215686275, -- [3]
		0.60887169837952, -- [4]
	},
	["aura_width_personal"] = 23,
	["resources_settings"] = {
		["chr"] = {
			["Player-4476-04683257"] = "Runes",
			["Player-1084-0A698CF4"] = "Runes",
			["Player-1084-09D4BD91"] = "Chi",
			["Player-1084-09F19274"] = "HolyPower",
			["Player-1084-0A58A9E3"] = "SoulShards",
			["Player-4606-0049FD3E"] = "Runes",
			["Player-4618-00212028"] = "HolyPower",
			["Player-4476-04996675"] = "ComboPoints",
			["Player-1084-0961A181"] = "Runes",
			["Player-4606-004BBAC3"] = "Runes",
			["Player-4606-0030ACFA"] = "Runes",
			["Player-1084-0A5FA399"] = "HolyPower",
			["Player-4618-002963C3"] = "Runes",
			["Player-4467-044DF684"] = "HolyPower",
			["Player-4476-03BF1CCE"] = "HolyPower",
			["Player-4606-0031416A"] = "ComboPoints",
			["Player-1084-0A24293C"] = "ComboPoints",
			["Player-3674-09D96941"] = "Runes",
			["Player-1084-0A5C2A4F"] = "HolyPower",
		},
	},
	["indicator_scale"] = 0.99999994039536,
	["border_color"] = {
		nil, -- [1]
		nil, -- [2]
		nil, -- [3]
		1, -- [4]
	},
	["npc_colors"] = {
		[116549] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[150253] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[162047] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[177889] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[144293] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[114637] = {
			false, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[115418] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165076] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[179388] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[104246] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[151657] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[144294] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[115020] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[114526] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[114542] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[162049] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[114319] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[148120] = {
			false, -- [1]
			false, -- [2]
			"blue", -- [3]
		},
		[152009] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[115419] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[168393] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[177892] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167533] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[89011] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[173016] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[165430] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162689] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[169861] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[79720] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[170690] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[164921] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[144298] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[170850] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[170882] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[114544] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[146753] = {
			false, -- [1]
			false, -- [2]
			"blue", -- [3]
		},
		[86526] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162691] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[81235] = {
			false, -- [1]
			false, -- [2]
			"white", -- [3]
		},
		[163520] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[169927] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[81283] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[114624] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[82590] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[150165] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162692] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165529] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[179841] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[174773] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[135246] = {
			false, -- [1]
			false, -- [2]
			"white", -- [3]
		},
		[168717] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[164414] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[174197] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163458] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[81236] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[179842] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[114338] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[160495] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163618] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[115486] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[115757] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[81603] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[184911] = {
			true, -- [1]
			false, -- [2]
			"darksalmon", -- [3]
		},
		[154758] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[150295] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[168942] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163619] = {
			false, -- [1]
			false, -- [2]
			"white", -- [3]
		},
		[165946] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[150168] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[114626] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[177891] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163524] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[150292] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[150254] = {
			false, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163620] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163894] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[150169] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83389] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163862] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[120651] = {
			true, -- [1]
			false, -- [2]
			"darksalmon", -- [3]
		},
		[150297] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[80935] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[163621] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[183033] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[184908] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[150712] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[166299] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164510] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168658] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[80808] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[115488] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164929] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[179269] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[178142] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[185680] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[168627] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[169893] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[166396] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[173044] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[80936] = {
			false, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[170572] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[114628] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[144295] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162763] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[176565] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162317] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165919] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165824] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[166589] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[174175] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[166302] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[173729] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[114804] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[155433] = {
			false, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[81407] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[80937] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[185683] = {
			true, -- [1]
			false, -- [2]
			"palegreen", -- [3]
		},
		[114629] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83025] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[169905] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83613] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[155434] = {
			false, -- [1]
			false, -- [2]
			"violet", -- [3]
		},
		[82579] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[170490] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[165762] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83392] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[167876] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168886] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162744] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[172265] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163882] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83578] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[185685] = {
			true, -- [1]
			false, -- [2]
			"darksalmon", -- [3]
		},
		[105705] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[83026] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[167612] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[167493] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163086] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163891] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[179821] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[165222] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[165764] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[164266] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[114790] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[176395] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[114312] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[165414] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[150146] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[171343] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[166275] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[173447] = {
			false, -- [1]
			false, -- [2]
			"white", -- [3]
		},
		[183424] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168396] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168443] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167965] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[82597] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[166276] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[171376] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[151773] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[183425] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168572] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[150276] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163121] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167998] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83761] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[114632] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[165197] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[177816] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162038] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[178133] = {
			false, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[176396] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[178165] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[177817] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168318] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[180335] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[114792] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162039] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[180431] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162103] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168446] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[81212] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[114633] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[180336] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[77483] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162040] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[178392] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[151649] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[111563] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[115765] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[164557] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[177787] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[155090] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[184910] = {
			true, -- [1]
			false, -- [2]
			"palegreen", -- [3]
		},
		[180433] = {
			true, -- [1]
			false, -- [2]
			"orangered", -- [3]
		},
		[179334] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[163157] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83763] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[114634] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[168718] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168681] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[165872] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167536] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163126] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[179733] = {
			true, -- [1]
			false, -- [2]
			"orangered", -- [3]
		},
		[174210] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[167607] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[77803] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167111] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168418] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[114316] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168992] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[154744] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[172981] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168578] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[150250] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[164562] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[88163] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[178141] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163128] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[80816] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164506] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[146409] = {
			false, -- [1]
			false, -- [2]
			"darkgreen", -- [3]
		},
		[150251] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[81297] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168420] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[114317] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[171799] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165137] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[83765] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[114636] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168357] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163459] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[179386] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[150160] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[161895] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[164185] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
	},
	["transparency_behavior_on_friendlies"] = true,
	["extra_icon_show_enrage_border"] = {
		0, -- [1]
		0, -- [2]
		0, -- [3]
	},
	["hook_data"] = {
		{
			["Enabled"] = true,
			["Revision"] = 66,
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "",
			["Author"] = "Izimode-Azralon",
			["Options"] = {
			},
			["Desc"] = "Change the color for the heal absorb, heal prediction and shield amount indicators.",
			["Hooks"] = {
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --heal absorb\n    unitFrame.healthBar.healAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.HealAbsorbColor))\n    \n    --shield absorb\n    unitFrame.healthBar.shieldAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldsColor))\n    \n    --incoming heal\n    unitFrame.healthBar.incomingHealIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.IncomingHealColor))\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}           \n    \n    --make sure to enable the desired indicators at /plater options > Advanced tab > Show Heal/Shield Prediction\n    \n    --color when the heal absorb indicator\n    envTable.HealAbsorbColor = \"maroon\"\n    \n    --color of incoming heal indicator\n    envTable.IncomingHealColor = \"darkgreen\"\n    \n    --color of shield indicator\n    envTable.ShieldsColor = \"#C59000\"    \n    \nend\n\n\n",
			},
			["Prio"] = 99,
			["Time"] = 1664343718,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["HooksTemp"] = {
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}           \n    \n    --make sure to enable the desired indicators at /plater options > Advanced tab > Show Heal/Shield Prediction\n    \n    --color when the heal absorb indicator\n    envTable.HealAbsorbColor = \"maroon\"\n    \n    --color of incoming heal indicator\n    envTable.IncomingHealColor = \"darkgreen\"\n    \n    --color of shield indicator\n    envTable.ShieldsColor = \"#C59000\"    \n    \nend\n\n\n",
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --heal absorb\n    unitFrame.healthBar.healAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.HealAbsorbColor))\n    \n    --shield absorb\n    unitFrame.healthBar.shieldAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldsColor))\n    \n    --incoming heal\n    unitFrame.healthBar.incomingHealIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.IncomingHealColor))\n    \nend\n\n\n",
			},
			["PlaterCore"] = 1,
			["Icon"] = 1035048,
			["Name"] = "Change Prediction Color",
		}, -- [1]
		{
			["Enabled"] = true,
			["Revision"] = 66,
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "",
			["Author"] = "Izimode-Azralon",
			["Options"] = {
			},
			["Desc"] = "Adds a pixels perfect border around the cast bar.",
			["Hooks"] = {
				["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
				["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder:Hide()\n    end    \nend",
				["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    \n    --hide the icon of the spell, may require /reload after changing\n    envTable.HideIcon = false\n    \n    --border settings\n    envTable.BorderThickness = 1\n    envTable.BorderColor = \"black\"\n    \n    --private\n    --update the border\n    function envTable.UpdateBorder (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.CastBarBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.CastBarBorder:SetBorderSizes (size, size, size, size)\n        castBar.CastBarBorder:UpdateSizes()        \n        \n        if (envTable.HideIcon) then\n            castBar.Icon:Hide()\n        end\n        \n        castBar.CastBarBorder:Show()\n    end\n    \n    --create thee border\n    if (not unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder = CreateFrame (\"frame\", nil, unitFrame.castBar, \"NamePlateFullBorderTemplate\")\n    end\n    \nend\n\n\n\n\n",
			},
			["Prio"] = 99,
			["Time"] = 1645291542,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["HooksTemp"] = {
			},
			["PlaterCore"] = 1,
			["Icon"] = 133004,
			["Name"] = "Cast Bar Border",
		}, -- [2]
		{
			["Enabled"] = true,
			["Revision"] = 54,
			["Options"] = {
			},
			["HooksTemp"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OptionsValues"] = {
			},
			["Desc"] = "Adds a pixels perfect border around the cast bar spell icon.",
			["Hooks"] = {
				["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
				["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.castBar.IconOverlayFrame) then\n        unitFrame.castBar.IconOverlayFrame:Hide()\n    end\n    \nend\n\n\n\n\n",
				["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.AnchorSide = \"right\"\n    envTable.BorderThickness = 1\n    envTable.BorderColor = \"black\"\n    \n    --private\n    function envTable.BuildFrames (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.IconBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.IconBorder:SetBorderSizes (size, size, size, size)\n        castBar.IconBorder:UpdateSizes()\n        \n        local icon = castBar.Icon\n        if (envTable.AnchorSide == \"left\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\")\n            icon:SetPoint (\"bottomright\", castBar, \"bottomleft\")\n            icon:SetWidth (icon:GetHeight())\n            \n        elseif (envTable.AnchorSide == \"right\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\")\n            icon:SetPoint (\"bottomleft\", castBar, \"bottomright\")\n            icon:SetWidth (icon:GetHeight())\n            \n        end\n        \n        icon:Show()\n        castBar.IconOverlayFrame:Show()\n    end\n    \n    if (not unitFrame.castBar.IconOverlayFrame) then\n        --icon support frame\n        unitFrame.castBar.IconOverlayFrame = CreateFrame (\"frame\", nil, unitFrame.castBar)\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"topleft\", unitFrame.castBar.Icon, \"topleft\")\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"bottomright\", unitFrame.castBar.Icon, \"bottomright\")\n        \n        unitFrame.castBar.IconBorder = CreateFrame (\"frame\", nil,  unitFrame.castBar.IconOverlayFrame, \"NamePlateFullBorderTemplate\")\n    end    \n    \nend\n\n\n\n\n",
			},
			["Prio"] = 99,
			["Name"] = "Cast Icon Border",
			["PlaterCore"] = 1,
			["LastHookEdited"] = "",
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["Icon"] = 133004,
			["Time"] = 1645291656,
		}, -- [3]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Hooks"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateRaidMark (unitFrame, unitId)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --normal Marker\n    envTable.Size = 18\n    envTable.Anchor = {\n        side = 8, -- Right side\n        x = -2, \n        y = 0,\n    }\n    \n    --Name only Marker\n    envTable.SpecialSize = 22\n    envTable.SpecialAnchor = {\n        side = 8, -- Right side\n        x = -2, \n        y = 2,\n    }\n    \n    envTable.UpdateRaidMark = function (unitFrame, unitId)\n        local plateFrame = C_NamePlate.GetNamePlateForUnit (unitId)\n        local marker = plateFrame.unitFrame.PlaterRaidTargetFrame\n        if marker then\n            if plateFrame.IsFriendlyPlayerWithoutHealthBar or\n            plateFrame.IsNpcWithoutHealthBar then\n                marker:SetSize (envTable.SpecialSize, envTable.SpecialSize)\n                Plater.SetAnchor (marker, envTable.SpecialAnchor, unitFrame.ActorNameSpecial)\n            else\n                --marker:SetSize (envTable.Size, envTable.Size)\n                --Plater.SetAnchor (marker, envTable.Anchor, unitFrame.unitName)\n            end\n        end\n    end\n    \nend",
			},
			["Time"] = 1604708800,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "",
			["Icon"] = 878218,
			["Enabled"] = true,
			["Revision"] = 650,
			["semver"] = "",
			["Author"] = "호불-아즈샤라",
			["Desc"] = "Raidmark in the Unitname",
			["Prio"] = 99,
			["version"] = -1,
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["LastHookEdited"] = "",
			["Name"] = "Raidmark in the Unitname",
		}, -- [4]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Hooks"] = {
				["Nameplate Created"] = "function (self, unitId, unitFrame, envTable, modTable)\n    --insert code here\n    \nend",
				["Player Logon"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- /RELOAD AFTER IMPORTING OR CHANGING THE SCRIPT\n    -- SELECT THE INDICATOR AT THE TARGET TAB\n    \n    Plater.TargetIndicators    [\"Double Arrows\"] = {\n        path = [[Interface\\Addons\\SharedMedia_MyMedia\\background\\arrow_glow.tga]],\n        coords = {\n            {0, 1, 0, 1}, \n            {1, 0, 0, 1}\n        },\n        desaturated = false,\n        width = 18,\n        height = 16,\n        x = 16,\n        y = 0,\n        blend = \"ADD\",\n        color = \"#ffffff\",\n    }    \n    \nend",
				["Initialization"] = "function (modTable)\n    --insert code here\n    \nend",
				["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    --insert code here\n    \nend",
			},
			["Time"] = 1645295175,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "https://wago.io/4zFNU4AvR/1",
			["Icon"] = 236174,
			["Enabled"] = true,
			["Revision"] = 149,
			["semver"] = "1.0.0",
			["Author"] = "�r��ne-Kel'thuzad",
			["Desc"] = "Adds double arrow as a target indicators option",
			["Prio"] = 99,
			["version"] = 1,
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 1,
					["Name"] = "Option 1",
					["Value"] = {
						0.38823529411765, -- [1]
						0.83137254901961, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [1]
			},
			["LastHookEdited"] = "",
			["Name"] = "Naowh Arrow Target",
		}, -- [5]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Hooks"] = {
				["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    local mark = unitId and GetRaidTargetIndex(unitId)\n    envTable.namer(unitId, mark, true, false, false, \"Created\")\n    \nend",
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    -- Catch all \n    envTable.namer(unitId, GetRaidTargetIndex(unitId), true, false, false, \"Updated\")\n    \nend\n\n\n",
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    envTable.namer(unitId, GetRaidTargetIndex(unitId), true, false, false, \"Added\")\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    -- used for nameColouring\n    -- AARRGGBB\n    local markerToHex = {\n        [1] = \"FFEAEA0D\", -- Yellow 5 Point Star\n        [2] = \"FFEAB10D\", -- Orange Circle\n        [3] = \"FFCD00FF\", -- Purple Diamond\n        [4] = \"FF06D425\", -- Green Triangle\n        [5] = \"FFB3E3D8\", -- Light Blue Moon\n        [6] = \"FF0CD2EA\", -- Blue Square\n        [7] = \"FFD6210B\", -- Red Cross\n        [8] = \"FFFFFFFF\", -- White Skull\n    }\n    \n    -- Makes it so you take their first name e.g Jessie Howlis -> Jessie\n    -- Old way was some degen fucking shit this is easier\n    local nameBlacklist = {\n        [\"the\"] = true,\n        [\"of\"] = true,\n        [\"Tentacle\"] = true,\n        [\"Apprentice\"] = true,  \n        [\"Denizen\"] = true,\n        [\"Emissary\"] = true,\n        [\"Howlis\"] = true, \n        [\"Terror\"] = true, \n        [\"Totem\"] = true, \n        [\"Waycrest\"] = true,\n        [\"Dummy\"] = true, -- Testing Purposes\n        [\"Aspect\"] = true\n    }\n    \n    \n    -- Override for names, Thanks to Nnoggie for all of the dungeon ones\n    local renameTable = {\n        -- Testing\n        [\"Fleshripper Vulture\"] = \"Shit Bird\",\n        [\"Roaming Nibbler\"] = \"Roaming Saurid\",\n        -- Grand Delusions\n        [\"Thing From Beyond\"] = \"Ion Hazzikostas\",\n        -- Plaguefall\n        [\"Plagueroc\"] = \"Plaguecock\",\n        [\"Doctor Ickus\"] = \"Dickus\",\n        -- Sanguine Depths\n        [\"Animated Weapon\"] = \"Assclapper\",\n        [\"Kryxis the Voracious\"] = \"Steroid Stomper\",\n        [\"Frenzied Ghoul\"] = \"Death\",\n        [\"General Kaal\"] = \"Daddy Kaal\",\n        -- Mists of Tirna Scithe\n        [\"Droman Oulfarran\"] = \"Simp Tree\",\n        [\"Mistcaller\"] = \"Lady UwU\",\n        [\"Tred'ova\"] = \"Tred'killya\",\n        -- M+ Encrypted Affix\n        [\"Urh Relic\"] = \"CDR Relic\",\n        [\"Wo Relic\"] = \"Speed Relic\",\n        [\"Vy Relic\"] = \"Haste Relic\",\n        [\"Urh Dismantler\"] = \"CDR boi\",\n        [\"Wo Drifter\"] = \"Speed boi\",\n        [\"Vy Interceptor\"] = \"Haste boi\",\n        -- Pantheon\n        [\"Prototype of War\"] = \"Caster man\",\n        [\"Prototype of Duty\"] = \"Tank nuke\",\n        [\"Prototype of Renewal\"] = \"Caster lady\",\n        [\"Prototype of Absolution\"] = \"Frontal boi\",\n    }\n    \n    \n    \n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs, Do i want this?? no idea\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    function envTable.namer(unitId, marker, nameColouring, isBoss, debugMode, debugEntry)\n        if unitId then\n            \n            local name = UnitName(unitId)\n            local a, b, c, d, e, f = strsplit(' ', name, 5)\n            local unitName\n            -- Testing mode\n            if debugMode then\n                print(\"DebugMode: \"..debugEntry..\" - Checking for dummy name\")\n                if b == \"Dummy\" or c == \"Dummy\" or d == \"Dummy\" or e == \"Dummy\" or f == \"Dummy\" then\n                    local lastName = b:find(\"Dummy\") and b or c:find(\"Dummy\") and c or d:find(\"Dummy\") and d\n                    print(\"DebugMode: \"..debugEntry..\" - Dummy Found!\")\n                    unitName = name ~=nil and lastName\n                end\n            end\n            \n            \n            if nameBlacklist[b] then\n                unitName = name ~=nil and (a or b or c or d or e or f) or nil\n            else\n                unitName = name ~=nil and (f or e or d or c or b or a) or ni\n            end\n            \n            if unitId and marker == nil and nameColouring then\n                marker = 8\n            end\n            \n            \n            \n            if unitName == nil then\n                unitName = name\n            end\n            \n            \n            if renameTable[name] then\n                unitName = renameTable[name]\n            end\n            \n            if unitId and marker and nameColouring then\n                unitFrame.healthBar.unitName:SetText(WrapTextInColorCode(unitName, markerToHex[marker]))\n            elseif unitId then\n                unitFrame.healthBar.unitName:SetText(unitName)\n            end\n        end   \n    end\nend",
			},
			["Time"] = 1646989646,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "",
			["Icon"] = 629482,
			["Enabled"] = true,
			["Revision"] = 108,
			["semver"] = "",
			["Author"] = "Rhk-Tarren Mill",
			["Desc"] = "Aimed at making calls in dungeons simpler by using the last name of a mob or first name of certains ones i.e Jessie Howlis -> Jessie",
			["Prio"] = 99,
			["version"] = -1,
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["LastHookEdited"] = "Constructor",
			["Name"] = "M+ Renamer",
		}, -- [6]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Hooks"] = {
				["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
				["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Player Power Update"] = "function (self, unitId, unitFrame, envTable, modTable, ...)\n    local powerType = ...\n    \n    if (powerType and powerType == \"COMBO_POINTS\" and unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend",
				["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
				["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
				["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {0/128, 21/128, 101/128, 122/128},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {3/128, 18/128, 81/128, 96/128},\n    }\n    if WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE then\n        textures = {\n            backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n            backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n            \n            comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n            comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n        }\n    end\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = GetComboPoints(\"player\", \"target\")\n            --UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = (namePlateWidth - sizes.width * comboPoints)  / comboPoints \n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                if i == 1 then\n                    comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace/2, 0)\n                else\n                    comboPoint:SetPoint (\"left\", envTable.ComboPoints[i-1], \"right\", reservedSpace, 0)\n                end\n                \n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
			},
			["Time"] = 1621935143,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
					["Enabled"] = true,
					["DRUID"] = true,
					["ROGUE"] = true,
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
					["103"] = true,
					["Enabled"] = true,
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "",
			["Icon"] = 135426,
			["Enabled"] = false,
			["Revision"] = 284,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
			["version"] = -1,
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["LastHookEdited"] = "",
			["Name"] = "Combo Points [Plater]",
		}, -- [7]
		{
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "",
			["Hooks"] = {
				["Initialization"] = "function (modTable)\n    \n    --ATTENTION: after enabling this mod, you may have to adjust the anchor point at the Buff Settings tab\n    \n    local sortByTime = false\n    local invertSort = false\n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    local priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n        [\"Pistol Shot\"] = 50,\n        [\"Marked for Death\"] = 99,\n    }\n    \n    -- Sort function - do not touch\n    Plater.db.profile.aura_sort = true\n    \n    \n    function Plater.AuraIconsSortFunction (aura1, aura2)\n        local p1 = priority[aura1.SpellId] or priority[aura1.SpellName] or 1\n        local p2 = priority[aura2.SpellId] or priority[aura2.SpellName] or 1\n        \n        if sortByTime and p1 == p2 then\n            if invertSort then\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) > (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            else\n                return (aura1.Duration == 0 and 99999999 or aura1.RemainingTime or 0) < (aura2.Duration == 0 and 99999999 or aura2.RemainingTime or 0)\n            end\n        else\n            if invertSort then\n                 return p1 < p2\n            else\n                return p1 > p2\n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			},
			["Time"] = 1608663128,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
			["Enabled"] = false,
			["Revision"] = 356,
			["Options"] = {
			},
			["Author"] = "Ditador-Azralon",
			["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
			["Name"] = "Aura Reorder [Plater]",
			["PlaterCore"] = 1,
			["version"] = -1,
			["HooksTemp"] = {
			},
			["semver"] = "",
		}, -- [8]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Hooks"] = {
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.CheckForQuest (unitFrame)\n    \nend\n\n\n",
				["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.ExtraQuestMarker22154:Hide()\n    \nend\n\n\n",
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.CheckForQuest (unitFrame)\n    \nend\n\n\n",
				["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.ExtraQuestMarker22154) then\n        \n        unitFrame.ExtraQuestMarker22154:Hide()\n        \n    end    \n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.Texture = [[Interface\\OPTIONSFRAME\\UI-OptionsFrame-NewFeatureIcon]]\n    envTable.Size = 12\n    envTable.Anchor = {\n        side = 6, --right side\n        x = 2,\n        y = 0\n    }\n    \n    if (not unitFrame.ExtraQuestMarker22154) then\n        unitFrame.ExtraQuestMarker22154 = unitFrame:CreateTexture (nil, \"overlay\")\n        local texture = unitFrame.ExtraQuestMarker22154\n        \n        texture:SetTexture (envTable.Texture)\n        texture:SetSize (envTable.Size, envTable.Size)\n        Plater.SetAnchor (texture, envTable.Anchor)\n    end\n    \n    function envTable.CheckForQuest (unitFrame)\n        if (unitFrame.namePlateIsQuestObjective) then\n            unitFrame.ExtraQuestMarker22154:Show()\n            \n        else\n            unitFrame.ExtraQuestMarker22154:Hide()\n            \n        end\n    end\nend\n\n\n\n\n\n\n",
			},
			["Time"] = 1616360153,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "https://wago.io/platerquesticon/2",
			["Icon"] = "Interface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon",
			["Enabled"] = true,
			["Revision"] = 40,
			["semver"] = "1.0.1",
			["Author"] = "Izimode-Azralon",
			["Desc"] = "Show an extra icon if the unit is a part of a quest you're current doing. You may adjust where the exclamation mark is shown in the Constructor.",
			["Prio"] = 99,
			["version"] = 2,
			["PlaterCore"] = 1,
			["Name"] = "Extra Quest Icon",
			["LastHookEdited"] = "Constructor",
			["Options"] = {
			},
		}, -- [9]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
				["Initialization"] = "function (modTable)\n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    modTable.changeBarColor = modTable.config.changeBarColor\n    modTable.changeBorderColor = modTable.config.changeBorderColor\n    modTable.resetColors = modTable.config.resetColors\n    \n    modTable.ListOfNpcs = {\n        [61146] = modTable.config.color, --\"olive\", --monk statue npcID\n        [103822] = modTable.config.color, --\"olive\", --druid treant npcID\n        [15352] = modTable.config.color, --\"olive\", --shaman elemental\n        [95072] = modTable.config.color, --\"olive\", --shaman greater earth elemental npcID\n        [61056] = modTable.config.color, --\"olive\", --shaman primal earth elemental npcID\n        \n    }\nend\n\n\n",
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    if not unitId then\n        return\n    end\n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        local unitName = UnitName (unitId .. \"target\")\n        local unitNameLower = string.lower (unitName)\n        \n        --check if the npcID of this unit is in the npc list \n        local color = modTable.ListOfNpcs [npcID] or modTable.ListOfNpcs [unitName] or modTable.ListOfNpcs [unitNameLower]\n        \n        if color then\n            if modTable.changeBarColor then\n                Plater.SetNameplateColor (unitFrame, color)\n            end\n            if modTable.changeBorderColor then\n                Plater.SetBorderColor (unitFrame, color)\n            end\n            unitFrame.attackingSpecificUnitFromMod = true\n        elseif unitFrame.attackingSpecificUnitFromMod and modTable.resetColors then\n            if modTable.changeBorderColor then\n                Plater.SetBorderColor (unitFrame)\n            end\n            if modTable.changeBarColor then\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n            unitFrame.attackingSpecificUnitFromMod = false\n        end\n    end\nend",
			},
			["Hooks"] = {
				["Initialization"] = "function (modTable)\n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    modTable.changeBarColor = modTable.config.changeBarColor\n    modTable.changeBorderColor = modTable.config.changeBorderColor\n    modTable.resetColors = modTable.config.resetColors\n    \n    modTable.ListOfNpcs = {\n        [61146] = modTable.config.color, --\"olive\", --monk statue npcID\n        [103822] = modTable.config.color, --\"olive\", --druid treant npcID\n        [15352] = modTable.config.color, --\"olive\", --shaman elemental\n        [95072] = modTable.config.color, --\"olive\", --shaman greater earth elemental npcID\n        [61056] = modTable.config.color, --\"olive\", --shaman primal earth elemental npcID\n        \n    }\nend\n\n\n",
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable, modTable)\n    if not unitId then\n        return\n    end\n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        local unitName = UnitName (unitId .. \"target\")\n        local unitNameLower = string.lower (unitName)\n        \n        --check if the npcID of this unit is in the npc list \n        local color = modTable.ListOfNpcs [npcID] or modTable.ListOfNpcs [unitName] or modTable.ListOfNpcs [unitNameLower]\n        \n        if color then\n            if modTable.changeBarColor then\n                Plater.SetNameplateColor (unitFrame, color)\n            end\n            if modTable.changeBorderColor then\n                Plater.SetBorderColor (unitFrame, color)\n            end\n            unitFrame.attackingSpecificUnitFromMod = true\n        elseif unitFrame.attackingSpecificUnitFromMod and modTable.resetColors then\n            if modTable.changeBorderColor then\n                Plater.SetBorderColor (unitFrame)\n            end\n            if modTable.changeBarColor then\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n            unitFrame.attackingSpecificUnitFromMod = false\n        end\n    end\nend",
			},
			["Time"] = 1664343705,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "",
			["Icon"] = -4972,
			["Enabled"] = true,
			["Revision"] = 369,
			["semver"] = "",
			["Author"] = "Kastfall-Azralon",
			["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
			["Prio"] = 99,
			["version"] = -1,
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 1,
					["Name"] = "Color",
					["Value"] = {
						0.50196078431373, -- [1]
						0.50196078431373, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 4,
					["Name"] = "Change Bar Color",
					["Value"] = true,
					["Key"] = "changeBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 4,
					["Name"] = "Change Border Color",
					["Value"] = false,
					["Key"] = "changeBorderColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Reset Colors",
					["Value"] = true,
					["Key"] = "resetColors",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [4]
			},
			["LastHookEdited"] = "",
			["Name"] = "Attacking Specific Unit [Plater]",
		}, -- [10]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Hooks"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n    \n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        local auraContainer = auraContainers [containerID]\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsVisible()) then\n                if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                    Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                    \n                elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                    Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                    \n                else\n                    Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n                end \n            end\n            \n        end\n    end\n    \n    \n    for _, auraIcon in ipairs (unitFrame.ExtraIconFrame.IconPool) do\n        if auraIcon:IsShown() then\n            if (auraIcon:IsVisible()) then\n                local remainingTime = (auraIcon.startTime + auraIcon.duration - GetTime())\n                if (remainingTime < envTable.Timers.critical) then\n                    Plater:SetFontColor (auraIcon.CountdownText, envTable.Colors.critical)\n                    \n                elseif (remainingTime < envTable.Timers.warning) then\n                    Plater:SetFontColor (auraIcon.CountdownText, envTable.Colors.warning)\n                    \n                else\n                    Plater:SetFontColor (auraIcon.CountdownText, envTable.Colors.okay)\n                end\n            end\n        end\n    end\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"#b3ff00\",\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
			},
			["Time"] = 1645645058,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "https://wago.io/CjOSTakvH/1",
			["Icon"] = 629539,
			["Enabled"] = false,
			["Revision"] = 62,
			["semver"] = "1.0.0",
			["Author"] = "Ditador-Azralon",
			["Desc"] = "Change the color of the aura timer by it's time left",
			["Prio"] = 99,
			["version"] = 1,
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["LastHookEdited"] = "Nameplate Updated",
			["Name"] = "Paint Aura Timers - v2",
		}, -- [11]
		{
			["HooksTemp"] = {
			},
			["Hooks"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CheckAggro (unitFrame)\nend\n\n\n",
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CheckAggro (unitFrame)\nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    function envTable.CheckAggro (unitFrame)\n        --if the player isn't in combat, ignore this check\n        if (not Plater.IsInCombat()) then\n            return\n        end\n        \n        --if this unit is a player, ignore\n        if (UnitPlayerControlled(unitFrame.unit)) then\n            return\n        end\n        \n        --if this unit isn't in combat, ignore\n        if (not unitFrame.InCombat) then\n            return \n        end\n        \n        --player is a tank?\n        if (Plater.PlayerIsTank) then\n            --player isn't tanking this unit?\n            if (not unitFrame.namePlateThreatIsTanking) then\n                --check if a second tank is tanking it\n                if (Plater.ZoneInstanceType == \"raid\") then\n                    --return a list with the name of tanks in the raid\n                    local tankPlayersInTheRaid = Plater.GetTanks()\n                    \n                    --get the target name of this unit\n                    local unitTargetName = UnitName (unitFrame.targetUnitID)\n                    \n                    --check if the unit isn't targeting another tank in the raid and paint the color\n                    if (not tankPlayersInTheRaid [unitTargetName]) then\n                        Plater.SetNameplateColor (unitFrame, Plater.db.profile.tank.colors.noaggro)\n                    else\n                        --another tank is tanking this unit\n                        --do nothing\n                    end\n                    \n                else\n                    Plater.SetNameplateColor (unitFrame, Plater.db.profile.tank.colors.noaggro)\n                end\n            end\n            \n        else\n            --player is a dps or healer\n            if (unitFrame.namePlateThreatIsTanking) then\n                Plater.SetNameplateColor (unitFrame, Plater.db.profile.dps.colors.aggro)\n            end\n            \n        end        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			},
			["Time"] = 1645295003,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "https://wago.io/P35nCfDqx/1",
			["Icon"] = -5173,
			["Enabled"] = false,
			["Revision"] = 61,
			["semver"] = "1.0.0",
			["Author"] = "Kastfall-Azralon",
			["Desc"] = "When a mob is attacking you, force show the threat color. For tanks, force threat color if the mob is not attacking you.",
			["Prio"] = 99,
			["version"] = 1,
			["PlaterCore"] = 1,
			["LastHookEdited"] = "Constructor",
			["Options"] = {
			},
			["Name"] = "Force Threat Color NPC",
		}, -- [12]
		{
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
				["Cast Start"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateCastBarName(unitId, unitFrame.castBar)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Cast Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateCastBarName(unitId, unitFrame.castBar)\nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --percent of total cast bar size, default: 60% spell name\n    local spellNameSize = 0.60\n    \n    --update function\n    function envTable.UpdateCastBarName(unitId, castBar)\n        --do nothing if interrupted\n        if castBar.IsInterrupted then\n            return\n            \n        end\n        \n        --get the target's unitId \n        local targetUnitId = unitId .. \"target\"\n        \n        --does the unit exists?\n        if (UnitExists(targetUnitId)) then\n            \n            --get the target name\n            local targetName = UnitName(targetUnitId)\n            \n            --does the target name exists?\n            if (targetName) then\n                --get the current spell name\n                local spellName = castBar.SpellName\n                --reset the text in the cast bar\n                castBar.Text:SetText(spellName)\n                \n                --paint the target name with the player's class color\n                local targetNameByColor = Plater.SetTextColorByClass (targetUnitId, targetName)\n                \n                --castbar width\n                local castBarWidth = castBar:GetWidth()\n                DetailsFramework:TruncateText (castBar.Text, castBarWidth * spellNameSize)\n                \n                --set the new text in the castbar spell name fontstring\n                local currentText = castBar.Text:GetText()\n                if (currentText ~= nil and currentText ~= '') then \n                    castBar.Text:SetText(currentText .. \" ( \" .. targetNameByColor .. \"]\")\n                    DetailsFramework:TruncateText (castBar.Text, castBarWidth)    \n                end                \n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
			},
			["Hooks"] = {
				["Cast Start"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateCastBarName(unitId, unitFrame.castBar)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Cast Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateCastBarName(unitId, unitFrame.castBar)\nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --percent of total cast bar size, default: 60% spell name\n    local spellNameSize = 0.60\n    \n    --update function\n    function envTable.UpdateCastBarName(unitId, castBar)\n        --do nothing if interrupted\n        if castBar.IsInterrupted then\n            return\n            \n        end\n        \n        --get the target's unitId \n        local targetUnitId = unitId .. \"target\"\n        \n        --does the unit exists?\n        if (UnitExists(targetUnitId)) then\n            \n            --get the target name\n            local targetName = UnitName(targetUnitId)\n            \n            --does the target name exists?\n            if (targetName) then\n                --get the current spell name\n                local spellName = castBar.SpellName\n                --reset the text in the cast bar\n                castBar.Text:SetText(spellName)\n                \n                --paint the target name with the player's class color\n                local targetNameByColor = Plater.SetTextColorByClass (targetUnitId, targetName)\n                \n                --castbar width\n                local castBarWidth = castBar:GetWidth()\n                DetailsFramework:TruncateText (castBar.Text, castBarWidth * spellNameSize)\n                \n                --set the new text in the castbar spell name fontstring\n                local currentText = castBar.Text:GetText()\n                if (currentText ~= nil and currentText ~= '') then \n                    castBar.Text:SetText(currentText .. \" ( \" .. targetNameByColor .. \"]\")\n                    DetailsFramework:TruncateText (castBar.Text, castBarWidth)    \n                end                \n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
			},
			["Time"] = 1664343705,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "https://wago.io/VOuCDrV8Y/1",
			["Icon"] = 2126355,
			["Enabled"] = true,
			["Revision"] = 62,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["Desc"] = "Show the cast target name with the spell name",
			["Prio"] = 99,
			["version"] = 1,
			["PlaterCore"] = 1,
			["LastHookEdited"] = "",
			["semver"] = "1.0.0",
			["Name"] = "Cast Target on Spell Name",
		}, -- [13]
	},
	["auras_per_row_auto"] = false,
	["auras_per_row_amount2"] = 4,
	["aura_width"] = 22,
	["health_statusbar_bgcolor"] = {
		0.12941176470588, -- [1]
		0.12941176470588, -- [2]
		0.12941176470588, -- [3]
		1, -- [4]
	},
	["click_space_friendly"] = {
		50, -- [1]
		1, -- [2]
	},
	["buff_frame_anchor_and_size_migrated"] = true,
	["pet_width_scale"] = 0.9999999403953552,
	["tank"] = {
		["colors"] = {
			["anothertank"] = {
				0.73333333333333, -- [1]
				0.19607843137255, -- [2]
			},
			["aggro"] = {
				0.38039215686275, -- [1]
				0.87450980392157, -- [2]
				0.23137254901961, -- [3]
			},
			["nocombat"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
			},
			["noaggro"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
			},
			["pulling"] = {
				nil, -- [1]
				0.93333333333333, -- [2]
				0.43137254901961, -- [3]
			},
		},
	},
	["target_highlight_color"] = {
		1, -- [1]
		1, -- [2]
	},
	["health_cutoff"] = false,
	["extra_icon_stack_outline"] = "MONOCHROME",
	["resources"] = {
		["y_offset_target"] = 20,
		["y_offset_target_withauras"] = 32,
	},
	["castbar_target_font"] = "Naowh",
	["ui_parent_cast_level"] = 1,
	["ui_parent_buff2_level"] = 1,
	["script_data_trash"] = {
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
			["Time"] = 1626602208,
			["__TrashAt"] = 1696025646,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
			["Enabled"] = true,
			["Revision"] = 610,
			["semver"] = "",
			["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
			["SpellIds"] = {
				323149, -- [1]
				324392, -- [2]
				340544, -- [3]
				342189, -- [4]
				333227, -- [5]
				163689, -- [6]
				227931, -- [7]
				233210, -- [8]
				300207, -- [9]
				301629, -- [10]
				297133, -- [11]
			},
			["Prio"] = 99,
			["Name"] = "Aura - Buff Alert [Plater]",
			["PlaterCore"] = 1,
			["version"] = -1,
			["Desc"] = "Add the buff name in the trigger box.",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Glow Enabled",
					["Value"] = false,
					["Key"] = "glowEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Glow Color",
					["Value"] = {
						0.40392156862745, -- [1]
						0.003921568627451, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "glowColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Name"] = "Dots Enabled",
					["Value"] = true,
					["Key"] = "dotsEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Dots Color",
					["Value"] = {
						1, -- [1]
						0.32156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotsColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
			},
			["NpcNames"] = {
			},
		}, -- [1]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
			["Time"] = 1615033579,
			["__TrashAt"] = 1696025646,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
			["url"] = "",
			["Icon"] = 2175503,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
			["Enabled"] = false,
			["Revision"] = 464,
			["semver"] = "",
			["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
			["SpellIds"] = {
				240446, -- [1]
				273577, -- [2]
			},
			["Prio"] = 99,
			["Name"] = "Explosion Affix M+ [Plater]",
			["PlaterCore"] = 1,
			["version"] = -1,
			["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Plays a special animation showing the explosion time.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Option 3",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Name"] = "Cast Bar Height Mod",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.5843137254902, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Changes the cast bar color to this one.",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 5,
					["Name"] = "Arrow:",
					["Value"] = "Arrow:",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 4,
					["Name"] = "Show Arrow",
					["Value"] = true,
					["Key"] = "showArrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Arrow alpha.",
					["Min"] = 0,
					["Name"] = "Arrow Alpha",
					["Value"] = 0.5,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowAlpha",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Width.",
					["Min"] = 4,
					["Name"] = "Arrow Width",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowWidth",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Height.",
					["Min"] = 4,
					["Name"] = "Arrow Height",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowHeight",
				}, -- [11]
				{
					["Type"] = 6,
					["Name"] = "Option 13",
					["Value"] = 0,
					["Key"] = "option13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [12]
				{
					["Type"] = 5,
					["Name"] = "Dot Animation:",
					["Value"] = "Dot Animation:",
					["Key"] = "option12",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						1, -- [1]
						0.6156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dot animation.",
				}, -- [14]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot X Offset",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 4,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "xOffset",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot Y Offset",
					["Min"] = -10,
					["Name"] = "Dot Y Offset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "yOffset",
				}, -- [16]
			},
			["NpcNames"] = {
			},
		}, -- [2]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Time"] = 1615905297,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["__TrashAt"] = 1696025646,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
			["Revision"] = 352,
			["semver"] = "",
			["Enabled"] = true,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
			["Author"] = "Tercioo-Sylvanas",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Desc"] = "Add the debuff name in the trigger box.",
			["SpellIds"] = {
				337220, -- [1]
				337253, -- [2]
				337251, -- [3]
			},
			["Prio"] = 99,
			["version"] = -1,
			["PlaterCore"] = 1,
			["Name"] = "Aura - Debuff Alert [Plater]",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Glow Enabled",
					["Value"] = false,
					["Key"] = "glowEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Glow Color",
					["Value"] = {
						0.40392156862745, -- [1]
						0.003921568627451, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "glowColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Name"] = "Dots Enabled",
					["Value"] = true,
					["Key"] = "dotsEnabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Dots Color",
					["Value"] = {
						1, -- [1]
						0.32156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotsColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
			},
			["NpcNames"] = {
			},
		}, -- [3]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\nend\n\n\n",
			["Time"] = 1604617977,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_red",
			["Enabled"] = true,
			["Revision"] = 513,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \nend",
			["__TrashAt"] = 1696025646,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Plays a special animation showing the explosion time.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Option 3",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "Increases the health bar height by this value",
					["Min"] = 0,
					["Name"] = "Health Bar Height Mod",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Health Bar Color",
					["Value"] = {
						1, -- [1]
						0.5843137254902, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "healthBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Changes the health bar color to this one.",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 5,
					["Name"] = "Arrow:",
					["Value"] = "Arrow:",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 4,
					["Name"] = "Show Arrow",
					["Value"] = true,
					["Key"] = "showArrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Arrow alpha.",
					["Min"] = 0,
					["Name"] = "Arrow Alpha",
					["Value"] = 0.5,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowAlpha",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Width.",
					["Min"] = 4,
					["Name"] = "Arrow Width",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowWidth",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Height.",
					["Min"] = 4,
					["Name"] = "Arrow Height",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowHeight",
				}, -- [11]
				{
					["Type"] = 6,
					["Name"] = "Option 13",
					["Value"] = 0,
					["Key"] = "option13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [12]
				{
					["Type"] = 5,
					["Name"] = "Dot Animation:",
					["Value"] = "Dot Animation:",
					["Key"] = "option12",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						1, -- [1]
						0.6156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dot animation.",
				}, -- [14]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot X Offset",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 4,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "xOffset",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot Y Offset",
					["Min"] = -10,
					["Name"] = "Dot Y Offset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "yOffset",
				}, -- [16]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Used on casts that make the mob explode or transform if the cast passes.",
			["SpellIds"] = {
				332329, -- [1]
				320103, -- [2]
				321406, -- [3]
				335817, -- [4]
				321061, -- [5]
				320141, -- [6]
				326171, -- [7]
				163966, -- [8]
				227966, -- [9]
			},
			["Name"] = "Cast - Ultra Important [P]",
			["NpcNames"] = {
			},
		}, -- [4]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        envTable.flashIn = Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        envTable.flashOut = Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    envTable.flashIn:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.flashOut:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.SmallFlashTexture:SetColorTexture (Plater:ParseColors(scriptTable.config.flashColor))\n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    \nend\n\n\n",
			["Time"] = 1604617585,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
			["Enabled"] = true,
			["Revision"] = 595,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
			["__TrashAt"] = 1696025646,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Plays a small animation when the cast start.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 3",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Name"] = "Flash Duration",
					["Value"] = 0.6,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Flash Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "flashColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [6]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				320170, -- [1]
				320171, -- [2]
				320462, -- [3]
				330712, -- [4]
				332170, -- [5]
				333875, -- [6]
				326836, -- [7]
				342135, -- [8]
				333861, -- [9]
				341969, -- [10]
				317963, -- [11]
				327481, -- [12]
				328331, -- [13]
				322614, -- [14]
				325701, -- [15]
				326438, -- [16]
				323538, -- [17]
				321764, -- [18]
				296523, -- [19]
				330755, -- [20]
				295929, -- [21]
				296019, -- [22]
				335685, -- [23]
				170751, -- [24]
				342207, -- [25]
				350554, -- [26]
				348513, -- [27]
				351779, -- [28]
				328180, -- [29]
				319898, -- [30]
				166335, -- [31]
				172810, -- [32]
				172943, -- [33]
				173148, -- [34]
				163376, -- [35]
				228011, -- [36]
				228277, -- [37]
				29928, -- [38]
				228559, -- [39]
				230050, -- [40]
				374743, -- [41]
				227615, -- [42]
				229716, -- [43]
				229083, -- [44]
				299525, -- [45]
				300514, -- [46]
				285388, -- [47]
				294324, -- [48]
				294180, -- [49]
				293827, -- [50]
				297128, -- [51]
				294015, -- [52]
				291865, -- [53]
			},
			["Name"] = "Cast - Small Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [5]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local castBar = unitFrame.castBar\n    local castBarPortion = castBar:GetWidth()/scriptTable.config.segmentsAmount\n    local castBarHeight = castBar:GetHeight()\n    \n    unitFrame.felAnimation = unitFrame.felAnimation or {}\n    \n    if (not unitFrame.felAnimation.textureStretched) then\n        unitFrame.felAnimation.textureStretched = castBar:CreateTexture(nil, \"overlay\", nil, 5)\n    end\n    \n    if (not unitFrame.felAnimation.Textures) then\n        unitFrame.felAnimation.Textures = {}\n        \n        for i = 1, scriptTable.config.segmentsAmount do\n            local texture = castBar:CreateTexture(nil, \"overlay\", nil, 6)\n            unitFrame.felAnimation.Textures[i] = texture            \n            \n            texture.animGroup = texture.animGroup or texture:CreateAnimationGroup()\n            local animationGroup = texture.animGroup\n            animationGroup:SetToFinalAlpha(true)            \n            animationGroup:SetLooping(\"NONE\")\n            \n            texture:SetTexture([[Interface\\COMMON\\XPBarAnim]])\n            texture:SetTexCoord(0.2990, 0.0010, 0.0010, 0.4159)\n            texture:SetBlendMode(\"ADD\")\n            \n            texture.scale = animationGroup:CreateAnimation(\"SCALE\")\n            texture.scale:SetTarget(texture)\n            \n            texture.alpha = animationGroup:CreateAnimation(\"ALPHA\")\n            texture.alpha:SetTarget(texture)\n            \n            texture.alpha2 = animationGroup:CreateAnimation(\"ALPHA\")\n            texture.alpha2:SetTarget(texture)\n        end\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    for i = 1, scriptTable.config.segmentsAmount  do\n        local texture = unitFrame.felAnimation.Textures[i]\n        texture:Hide()\n    end\n    \n    local textureStretched = unitFrame.felAnimation.textureStretched\n    textureStretched:Hide()    \n    \nend\n\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local castBar = unitFrame.castBar\n    \n    local textures = unitFrame.felAnimation.Textures\n    \n    if (envTable._CastPercent > envTable.NextPercent) then\n        local nextPercent = 100  / scriptTable.config.segmentsAmount\n        \n        textures[envTable.CurrentTexture]:Show()\n        textures[envTable.CurrentTexture].animGroup:Play()\n        envTable.NextPercent = envTable.NextPercent + nextPercent \n        envTable.CurrentTexture = envTable.CurrentTexture + 1\n        \n        if (envTable.CurrentTexture == #textures) then\n            envTable.NextPercent = 98\n        elseif (envTable.CurrentTexture > #textures) then\n            envTable.NextPercent = 999\n        end\n    end\n    \n    local normalizedPercent = envTable._CastPercent / 100\n    local textureStretched = unitFrame.felAnimation.textureStretched\n    local point = DetailsFramework:GetBezierPoint(normalizedPercent, 0, 0.001, 1)\n    textureStretched:SetPoint(\"left\", castBar, \"left\", point * envTable.castBarWidth, 0)\nend",
			["Time"] = 1660511537,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_glow",
			["Enabled"] = true,
			["Revision"] = 341,
			["semver"] = "",
			["Author"] = "Terciob",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local castBar = unitFrame.castBar\n    envTable.castBarWidth = castBar:GetWidth()\n    castBar.Spark:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.sparkColor))\n    \n    local textureStretched = unitFrame.felAnimation.textureStretched\n    textureStretched:Show()\n    textureStretched:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.glowColor))\n    textureStretched:SetAtlas(\"XPBarAnim-OrangeTrail\")\n    textureStretched:ClearAllPoints()\n    textureStretched:SetPoint(\"right\", castBar.Spark, \"center\", 0, 0)\n    textureStretched:SetHeight(castBar:GetHeight())\n    textureStretched:SetBlendMode(\"ADD\") \n    textureStretched:SetAlpha(0.5)\n    textureStretched:SetDrawLayer(\"overlay\", 7)\n    \n    for i = 1, scriptTable.config.segmentsAmount  do\n        local texture = unitFrame.felAnimation.Textures[i]\n        --texture:SetVertexColor(DetailsFramework:ParseColors(scriptTable.config.trailColor))\n        texture:SetVertexColor(1, 1, 1, 1)\n        texture:SetDesaturated(true)\n        \n        local castBarPortion = castBar:GetWidth()/scriptTable.config.segmentsAmount\n        \n        texture:SetSize(castBarPortion+5, castBar:GetHeight())\n        texture:SetDrawLayer(\"overlay\", 6)\n        \n        texture:ClearAllPoints()\n        if (i == scriptTable.config.segmentsAmount) then\n            texture:SetPoint(\"right\", castBar, \"right\", 0, 0)\n        else\n            texture:SetPoint(\"left\", castBar, \"left\", (i-1)*castBarPortion, 2)\n        end\n        \n        texture:SetAlpha(0)\n        texture:Hide()\n        \n        texture.scale:SetOrder(1)\n        texture.scale:SetDuration(0.5)\n        texture.scale:SetFromScale(0.2, 1)\n        texture.scale:SetToScale(1, 1.5)\n        texture.scale:SetOrigin(\"right\", 0, 0)\n        \n        local durationTime = DetailsFramework:GetBezierPoint(i / scriptTable.config.segmentsAmount, 0.2, 0.01, 0.6)\n        local duration = abs(durationTime-0.6)\n        \n        texture.alpha:SetOrder(1)\n        texture.alpha:SetDuration(0.05)\n        texture.alpha:SetFromAlpha(0)\n        texture.alpha:SetToAlpha(0.4)\n        \n        texture.alpha2:SetOrder(1)\n        texture.alpha2:SetDuration(duration) --0.6\n        texture.alpha2:SetStartDelay(duration)\n        texture.alpha2:SetFromAlpha(0.5)\n        texture.alpha2:SetToAlpha(0)\n    end\n    \n    envTable.CurrentTexture = 1\n    envTable.NextPercent  = 100  / scriptTable.config.segmentsAmount\nend\n\n\n\n\n\n\n\n\n",
			["__TrashAt"] = 1696025647,
			["NpcNames"] = {
			},
			["SpellIds"] = {
				373429, -- [1]
			},
			["PlaterCore"] = 1,
			["Name"] = "Cast - Glowing [P]",
			["version"] = -1,
			["Options"] = {
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Need a /reload",
					["Min"] = 5,
					["Key"] = "segmentsAmount",
					["Value"] = 7,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Amount of Segments",
				}, -- [1]
				{
					["Type"] = 1,
					["Key"] = "sparkColor",
					["Value"] = {
						0.9568627450980391, -- [1]
						1, -- [2]
						0.9882352941176471, -- [3]
						1, -- [4]
					},
					["Name"] = "Spark Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 1,
					["Key"] = "glowColor",
					["Value"] = {
						0.8588235294117647, -- [1]
						0.4313725490196079, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Glow Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [3]
			},
			["Desc"] = "Show a different animation for the cast bar.",
		}, -- [6]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --create a texture to use for a flash behind the cast bar\n    \n    if (not unitFrame.backGroundFlashTextureImpTarget) then\n        unitFrame.backGroundFlashTextureImpTarget =  Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    end\n    \n    local backGroundFlashTexture = unitFrame.backGroundFlashTextureImpTarget\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\n    \n    --create the target unit name box\n    if (not unitFrame.targetBox) then\n        unitFrame.targetBox = CreateFrame(\"frame\", unitFrame:GetName() .. \"ScriptImportantTarget\", unitFrame, \"BackdropTemplate\")\n        unitFrame.targetBox:SetSize(80, 20)\n        unitFrame.targetBox:SetFrameStrata(\"TOOLTIP\")\n        unitFrame.targetBox:Hide()\n        unitFrame.targetBox:SetPoint(\"left\", unitFrame, \"right\", 0, 0)\n        \n        unitFrame.targetBox:SetBackdrop({edgeFile = [[Interface\\Buttons\\WHITE8X8]], edgeSize = 1, bgFile = [[Interface\\AddOns\\Details\\images\\background]], tile = true, tileSize = 16})\n        unitFrame.targetBox:SetBackdropColor(.2, .2, .2, .8)\n        unitFrame.targetBox:SetBackdropBorderColor(0, 0, 0, 1)\n        \n        unitFrame.targetBoxName = unitFrame.targetBox:CreateFontString(nil, \"artwork\", \"GameFontNormal\")\n        unitFrame.targetBoxName:SetPoint(\"center\")\n    end\n    \n    function envTable.UpdateTargetBox(unitFrame, unitId)\n        local targetUnitId = unitId .. \"target\"\n        local unitName = UnitName(targetUnitId)\n        \n        if (unitName) then\n            if (scriptTable.config.colorByClass) then\n                Plater:SetFontColor(unitFrame.targetBoxName, \"white\")\n                unitName = Plater.SetTextColorByClass(targetUnitId, unitName)\n            else\n                Plater:SetFontColor(unitFrame.targetBoxName, scriptTable.config.textColor)\n            end\n            \n            unitFrame.targetBoxName:SetText(unitName)\n            Plater:SetFontSize(unitFrame.targetBoxName, scriptTable.config.targetNameSize)\n            unitFrame.targetBox:SetBackdropColor(Plater:ParseColors(scriptTable.config.targetBgColor))\n            unitFrame.targetBox:SetBackdropBorderColor(Plater:ParseColors(scriptTable.config.targetBgBorderColor))\n            unitFrame.targetBox:Show()\n            \n            unitFrame.targetBox:SetWidth(scriptTable.config.targetFrameWidth)\n            unitFrame.targetBox:SetHeight(scriptTable.config.targetFrameHeight)\n            \n            if (not Plater.HasDotAnimationPlaying(unitFrame.targetBox)) then\n                envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.targetBox, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n            end\n            \n            unitFrame.backGroundFlashTextureImpTarget:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n            \n            return true\n            \n        end\n    end\n    \nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.targetBox, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \n    unitFrame.targetBox:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.UpdateTargetBox(unitFrame, unitId) \n    \nend\n\n\n",
			["Time"] = 1625696653,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_target",
			["Enabled"] = true,
			["Revision"] = 836,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Shows the target name in a separate box",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 4",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 5,
					["Name"] = "Flash",
					["Value"] = "Flash:",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Name"] = "Flash Duration",
					["Value"] = 0.8,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [6]
				{
					["Type"] = 1,
					["Name"] = "Flash Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "flashColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [7]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 5,
					["Name"] = "Shake",
					["Value"] = "Shake:",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 0.5,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "How strong is the shake.",
					["Min"] = 1,
					["Name"] = "Shake Amplitude",
					["Value"] = 5,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 40,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [12]
				{
					["Type"] = 6,
					["Name"] = "Option 13",
					["Value"] = 0,
					["Key"] = "option13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 5,
					["Name"] = "Dot Animation",
					["Value"] = "Dot Animation:",
					["Key"] = "option14",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [14]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						0.56470588235294, -- [1]
						0.56470588235294, -- [2]
						0.56470588235294, -- [3]
						1, -- [4]
					},
					["Key"] = "dotColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dots around the nameplate",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "xOffset",
				}, -- [16]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Name"] = "Dot Y Offset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "yOffset",
				}, -- [17]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [18]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [19]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [20]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [21]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [22]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [23]
				{
					["Type"] = 5,
					["Name"] = "Option 19",
					["Value"] = "Cast Bar",
					["Key"] = "option19",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [24]
				{
					["Type"] = 4,
					["Name"] = "Use Cast Bar Color",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Use cast bar color.",
				}, -- [25]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						0.41176470588235, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Cast bar color.",
				}, -- [26]
				{
					["Type"] = 6,
					["Name"] = "Option 27",
					["Value"] = 0,
					["Key"] = "option27",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [27]
				{
					["Type"] = 5,
					["Name"] = "Option 28",
					["Value"] = "Target Options",
					["Key"] = "option28",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [28]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "",
					["Min"] = 8,
					["Name"] = "Text Size",
					["Value"] = 14,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "targetNameSize",
				}, -- [29]
				{
					["Type"] = 4,
					["Name"] = "Use Class Color",
					["Value"] = true,
					["Key"] = "colorByClass",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [30]
				{
					["Type"] = 1,
					["Name"] = "Text Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "textColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [31]
				{
					["Type"] = 1,
					["Name"] = "Background Color",
					["Value"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						0.98467203229666, -- [4]
					},
					["Key"] = "targetBgColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [32]
				{
					["Type"] = 1,
					["Name"] = "Border Color",
					["Value"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "targetBgBorderColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [33]
				{
					["Type"] = 2,
					["Max"] = 160,
					["Desc"] = "",
					["Min"] = 30,
					["Name"] = "Frame Width",
					["Value"] = 90,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "targetFrameWidth",
				}, -- [34]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "",
					["Min"] = 8,
					["Name"] = "Frame Height",
					["Value"] = 20,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "targetFrameHeight",
				}, -- [35]
			},
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (envTable.UpdateTargetBox(unitFrame, unitId)) then\n        \n        envTable.BackgroundFlash:Play()\n        \n        Plater.FlashNameplateBorder (unitFrame, 0.05)   \n        Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n        \n        unitFrame:PlayFrameShake (envTable.FrameShake)\n        \n        if (envTable._CanInterrupt) then\n            if (scriptTable.config.useCastbarColor) then\n                self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n            end\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n",
			["__TrashAt"] = 1696025647,
			["semver"] = "",
			["version"] = -1,
			["PlaterCore"] = 1,
			["SpellIds"] = {
				354173, -- [1]
			},
			["Desc"] = "Highlight the target name",
			["Name"] = "Cast - Important Target [P]",
			["NpcNames"] = {
			},
		}, -- [7]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\", 7)\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \n    --check if there's a timer for this spell\n    local timer = scriptTable.config.timerList[tostring(envTable._SpellID)]\n    \n    if (timer) then\n        --insert code here\n        \n        --set the castbar config\n        local config = {\n            iconTexture = \"\",\n            iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n            iconAlpha = 1,\n            iconSize = 14,\n            \n            text = \"Spikes Incoming!\",\n            textSize = 8,\n            \n            texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n            color = {.6, .6, .6, 0.8},\n            \n            isChanneling = false,\n            canInterrupt = false,\n            \n            height = 5,\n            width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n            \n            spellNameAnchor = {side = 3, x = 0, y = -2},\n            timerAnchor = {side = 5, x = 0, y = -2},\n        }\n        \n        Plater.SetAltCastBar(unitFrame.PlateFrame, config, timer, nil, nil)\n        local castBar2 = unitFrame.castBar2\n        castBar2.Text:ClearAllPoints()\n        castBar2.Text:SetPoint (\"topleft\", castBar2, \"bottomleft\", 0, 0)\n        castBar2.percentText:ClearAllPoints()\n        castBar2.percentText:SetPoint (\"topright\", castBar2, \"bottomright\", 0, 0)\n        Plater:SetFontSize(castBar2.percentText, 8)\n    end\n    \nend\n\n\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1626467946,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
			["Enabled"] = true,
			["Revision"] = 1162,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n\n\n",
			["__TrashAt"] = 1696025647,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Cast start animation settings",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Cast Bar Color Enabled",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.43137254901961, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Name"] = "Flash Duration",
					["Value"] = 0.4,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Name"] = "Cast Bar Height Mod",
					["Value"] = 5,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 100,
					["Desc"] = "How strong is the shake.",
					["Min"] = 2,
					["Name"] = "Shake Amplitude",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 40,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [11]
				{
					["Type"] = 7,
					["Name"] = "Timer (Key is SpellId and Value is Time)",
					["Value"] = {
						{
							"350421", -- [1]
							"5", -- [2]
						}, -- [1]
						{
							"355787", -- [1]
							"15", -- [2]
						}, -- [2]
						{
							"348513", -- [1]
							"14", -- [2]
						}, -- [3]
						{
							"348513", -- [1]
							"14", -- [2]
						}, -- [4]
					},
					["Key"] = "timerList",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_list",
					["Desc"] = "Key is the spellId and value is the amount of time of the Timer",
				}, -- [12]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Player an animation when the cast start. Start a timer when the cast finishes. Set the time in the options.",
			["SpellIds"] = {
				350421, -- [1]
				355787, -- [2]
				348513, -- [3]
			},
			["Name"] = "Cast - Alert + Timer [P]",
			["NpcNames"] = {
			},
		}, -- [8]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    local unitPowerBar = unitFrame.powerBar\n    unitPowerBar:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE) then\n        return \n    end\n    \n    local continuationToken\n    local slots\n    local foundAura = false\n    \n    repeat    \n        slots = { UnitAuraSlots(unitId, \"HELPFUL\", BUFF_MAX_DISPLAY, continuationToken) }\n        continuationToken = slots[1]\n        numSlots = #slots\n        \n        for i = 2, numSlots do\n            local slot = slots[i]\n            local name, texture, count, actualAuraType, duration, expirationTime, caster, canStealOrPurge, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, isCastByPlayer, nameplateShowAll, timeMod, auraAmount = UnitAuraBySlot(unitId, slot) \n            \n            if (spellId == envTable._SpellID) then --need to get the trigger spellId\n                --Ablative Shield\n                local unitPowerBar = unitFrame.powerBar\n                if (not unitPowerBar:IsShown()) then\n                    unitPowerBar:SetUnit(unitId)\n                end\n                \n                foundAura = true\n                return\n            end\n        end\n        \n    until continuationToken == nil\n    \n    if (not foundAura) then\n        local unitPowerBar = unitFrame.powerBar\n        if (unitPowerBar:IsShown()) then\n            unitPowerBar:Hide()\n        end\n    end\nend",
			["Time"] = 1660259323,
			["url"] = "",
			["Icon"] = 610472,
			["Enabled"] = true,
			["Revision"] = 52,
			["semver"] = "",
			["Author"] = "Keyspell-Azralon",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["__TrashAt"] = 1696025647,
			["NpcNames"] = {
			},
			["SpellIds"] = {
				227548, -- [1]
			},
			["PlaterCore"] = 1,
			["Name"] = "Aura is Shield [P]",
			["version"] = -1,
			["Options"] = {
			},
			["Desc"] = "Show power bar where its value is the buff value (usualy shown in the buff tooltip)",
		}, -- [9]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\", 7)\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1618996691,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
			["Enabled"] = true,
			["Revision"] = 1060,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n\n\n",
			["__TrashAt"] = 1696025647,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 3",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Cast Bar Color Enabled",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.43137254901961, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Name"] = "Flash Duration",
					["Value"] = 0.4,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Name"] = "Cast Bar Height Mod",
					["Value"] = 5,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 100,
					["Desc"] = "How strong is the shake.",
					["Min"] = 2,
					["Name"] = "Shake Amplitude",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 40,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [12]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				338353, -- [1]
				334748, -- [2]
				334749, -- [3]
				320784, -- [4]
				341352, -- [5]
				341520, -- [6]
				341522, -- [7]
				336005, -- [8]
				339777, -- [9]
				331933, -- [10]
				326617, -- [11]
				324914, -- [12]
				324776, -- [13]
				326046, -- [14]
				340634, -- [15]
				319070, -- [16]
				328295, -- [17]
				317936, -- [18]
				327413, -- [19]
				319654, -- [20]
				323821, -- [21]
				320772, -- [22]
				324293, -- [23]
				330562, -- [24]
				330868, -- [25]
				341902, -- [26]
				342139, -- [27]
				342675, -- [28]
				323190, -- [29]
				332836, -- [30]
				327648, -- [31]
				328217, -- [32]
				322938, -- [33]
				340544, -- [34]
				325876, -- [35]
				325700, -- [36]
				323552, -- [37]
				332666, -- [38]
				332612, -- [39]
				332706, -- [40]
				340026, -- [41]
				294171, -- [42]
				292910, -- [43]
				294165, -- [44]
				338871, -- [45]
				330813, -- [46]
				335694, -- [47]
				327461, -- [48]
				329787, -- [49]
				304946, -- [50]
				15245, -- [51]
				276754, -- [52]
				304831, -- [53]
				277036, -- [54]
				320657, -- [55]
				294362, -- [56]
				270248, -- [57]
				292926, -- [58]
				350421, -- [59]
				352158, -- [60]
				349985, -- [61]
				329239, -- [62]
				328400, -- [63]
				164192, -- [64]
				176032, -- [65]
				166335, -- [66]
				166387, -- [67]
				162066, -- [68]
				163689, -- [69]
				227592, -- [70]
				228254, -- [71]
				227999, -- [72]
				227987, -- [73]
				232115, -- [74]
				29580, -- [75]
				227616, -- [76]
				241828, -- [77]
				228606, -- [78]
				227800, -- [79]
				228239, -- [80]
				229706, -- [81]
				294884, -- [82]
				301629, -- [83]
				284219, -- [84]
				301689, -- [85]
				300650, -- [86]
				297835, -- [87]
				300171, -- [88]
				300087, -- [89]
				300414, -- [90]
				300436, -- [91]
				301088, -- [92]
				293729, -- [93]
				291928, -- [94]
			},
			["Name"] = "Cast - Big Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [10]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnHideCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (UnitIsUnit(unitId .. \"target\", \"player\")) then\n        Plater.SetNameplateColor(unitFrame, scriptTable.config.nameplateColor)\n    else\n        Plater.RefreshNameplateColor(unitFrame)\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1660340256,
			["url"] = "",
			["Icon"] = "Interface\\ICONS\\Ability_Fixated_State_Red",
			["Enabled"] = true,
			["Revision"] = 25,
			["semver"] = "",
			["Author"] = "Ditador-Azralon",
			["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["__TrashAt"] = 1696025647,
			["NpcNames"] = {
			},
			["SpellIds"] = {
				285388, -- [1]
			},
			["PlaterCore"] = 1,
			["Name"] = "Fixate by Unit Buff [P]",
			["version"] = -1,
			["Options"] = {
				{
					["Type"] = 1,
					["Key"] = "nameplateColor",
					["Value"] = {
						0, -- [1]
						0.5568627450980392, -- [2]
						0.03529411764705882, -- [3]
						1, -- [4]
					},
					["Name"] = "Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Change the enemy nameplate color to this color when fixating you!",
				}, -- [1]
			},
			["Desc"] = "Alert about a unit fixated on the player by using a buff on the enemy unit.",
		}, -- [11]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    --envTable.movingArrow.color = scriptTable.config.arrowColor\n    envTable.movingArrow:SetAlpha (scriptTable.config.arrowAlpha)\n    envTable.movingArrow:SetDesaturated (scriptTable.config.desaturateArrow)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    envTable.arrowAnimation = envTable.arrowAnimation or Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.20, self:GetWidth()-16, 0)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend",
			["Time"] = 1604599443,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_frontal",
			["Enabled"] = true,
			["Revision"] = 460,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
			["__TrashAt"] = 1696025647,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Produces an effect to indicate the spell will hit players in front of the enemy.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 4",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 3",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Set the alpha of the moving arrow",
					["Min"] = 0,
					["Name"] = "Arrow Alpha",
					["Value"] = 0.275,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowAlpha",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Time that takes for an arrow to travel from the to right.",
					["Min"] = 0,
					["Name"] = "Animation Speed",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "animSpeed",
				}, -- [6]
				{
					["Type"] = 4,
					["Name"] = "Use White Arrow",
					["Value"] = false,
					["Key"] = "desaturateArrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If enabled, the arrow color will be desaturated.",
				}, -- [7]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				323489, -- [1]
				323496, -- [2]
				319941, -- [3]
				319592, -- [4]
				334266, -- [5]
				325258, -- [6]
				334913, -- [7]
				326221, -- [8]
				322936, -- [9]
				323236, -- [10]
				321834, -- [11]
				336752, -- [12]
				325418, -- [13]
				324667, -- [14]
				327233, -- [15]
				324368, -- [16]
				324205, -- [17]
				323943, -- [18]
				319713, -- [19]
				320596, -- [20]
				320729, -- [21]
				323608, -- [22]
				330614, -- [23]
				320063, -- [24]
				332708, -- [25]
				334023, -- [26]
				317231, -- [27]
				317943, -- [28]
				320966, -- [29]
				334053, -- [30]
				328458, -- [31]
				321968, -- [32]
				331718, -- [33]
				325793, -- [34]
				330453, -- [35]
				326997, -- [36]
				334051, -- [37]
				292903, -- [38]
				330843, -- [39]
				294173, -- [40]
				189200, -- [41]
				352833, -- [42]
				330403, -- [43]
				166675, -- [44]
				176127, -- [45]
				166380, -- [46]
				162058, -- [47]
				167516, -- [48]
				166923, -- [49]
				178299, -- [50]
				172982, -- [51]
				163390, -- [52]
				173384, -- [53]
				173514, -- [54]
				29513, -- [55]
				227672, -- [56]
				228603, -- [57]
				227339, -- [58]
				227493, -- [59]
				241774, -- [60]
				229611, -- [61]
				229151, -- [62]
				300188, -- [63]
				299475, -- [64]
				299502, -- [65]
				300777, -- [66]
				301681, -- [67]
				298946, -- [68]
				298940, -- [69]
				300424, -- [70]
				283422, -- [71]
				294290, -- [72]
				291973, -- [73]
				293986, -- [74]
				291878, -- [75]
				292264, -- [76]
			},
			["Name"] = "Cast - Frontal Cone [Plater]",
			["NpcNames"] = {
			},
		}, -- [12]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetDrawLayer(\"OVERLAY\", 7)\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.castBar, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1618996917,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_darkorange",
			["Enabled"] = true,
			["Revision"] = 717,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n        end\n    end\n    \nend\n\n\n",
			["__TrashAt"] = 1696025647,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Plays a big animation when the cast start.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Option 4",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 5,
					["Name"] = "Flash",
					["Value"] = "Flash:",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Name"] = "Flash Duration",
					["Value"] = 0.8,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [6]
				{
					["Type"] = 1,
					["Name"] = "Flash Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "flashColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [7]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 5,
					["Name"] = "Shake",
					["Value"] = "Shake:",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 0.5,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "How strong is the shake.",
					["Min"] = 1,
					["Name"] = "Shake Amplitude",
					["Value"] = 5,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 40,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [12]
				{
					["Type"] = 6,
					["Name"] = "Option 13",
					["Value"] = 0,
					["Key"] = "option13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 5,
					["Name"] = "Dot Animation",
					["Value"] = "Dot Animation:",
					["Key"] = "option14",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [14]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						0.56470588235294, -- [1]
						0.56470588235294, -- [2]
						0.56470588235294, -- [3]
						1, -- [4]
					},
					["Key"] = "dotColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dots around the nameplate",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "xOffset",
				}, -- [16]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Name"] = "Dot Y Offset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "yOffset",
				}, -- [17]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [18]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [19]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [20]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [21]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [22]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [23]
				{
					["Type"] = 5,
					["Name"] = "Option 19",
					["Value"] = "Cast Bar",
					["Key"] = "option19",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [24]
				{
					["Type"] = 4,
					["Name"] = "Use Cast Bar Color",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Use cast bar color.",
				}, -- [25]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						0.41176470588235, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Cast bar color.",
				}, -- [26]
			},
			["version"] = -1,
			["PlaterCore"] = 1,
			["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				321247, -- [1]
				334522, -- [2]
				320232, -- [3]
				319962, -- [4]
				325879, -- [5]
				324427, -- [6]
				322999, -- [7]
				325360, -- [8]
				322903, -- [9]
				324103, -- [10]
				333294, -- [11]
				333540, -- [12]
				319521, -- [13]
				326021, -- [14]
				326450, -- [15]
				322711, -- [16]
				329104, -- [17]
				295000, -- [18]
				242391, -- [19]
				320197, -- [20]
				329608, -- [21]
				350687, -- [22]
				161090, -- [23]
				156301, -- [24]
				166341, -- [25]
				163379, -- [26]
				166923, -- [27]
				172952, -- [28]
				164426, -- [29]
				163665, -- [30]
				227578, -- [31]
				228528, -- [32]
				227789, -- [33]
				227779, -- [34]
				229608, -- [35]
				227925, -- [36]
				300129, -- [37]
				296522, -- [38]
				294349, -- [39]
				293854, -- [40]
				297834, -- [41]
				299588, -- [42]
				302682, -- [43]
				291946, -- [44]
				295169, -- [45]
				285440, -- [46]
				291613, -- [47]
				283551, -- [48]
			},
			["Name"] = "Cast - Very Important [Plater]",
			["NpcNames"] = {
			},
		}, -- [13]
	},
	["range_check_in_range_or_target_alpha_friendlies"] = 1,
	["cast_statusbar_fadeout_time"] = 0.3999999761581421,
	["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark4",
	["color_override_colors"] = {
		[3] = {
			0.996078431372549, -- [1]
			0.2980392156862745, -- [2]
			0.3098039215686275, -- [3]
		},
		[4] = {
			1, -- [1]
			0.93333333333333, -- [2]
			0.43137254901961, -- [3]
		},
		[5] = {
			0.38039215686275, -- [1]
			0.87450980392157, -- [2]
			0.23137254901961, -- [3]
		},
	},
	["indicator_spec"] = false,
	["pet_height_scale"] = 0.9999999403953552,
	["aura_x_offset"] = 0.8699951171875,
	["range_check_alpha_friendlies"] = 1,
	["indicator_raidmark_scale"] = 0.9899999499320984,
	["cast_statusbar_fadein_time"] = 0.019999999552965,
	["aura_stack_anchor"] = {
		["y"] = -4.600000381469727,
	},
	["ui_parent_scale_tune"] = 1.409999847412109,
	["healthbar_framelevel"] = 0,
	["ui_parent_buff_level"] = 1,
	["health_statusbar_bgtexture"] = "Melli",
	["indicator_raidmark_anchor"] = {
		["y"] = 2,
		["x"] = 0,
		["side"] = 9,
	},
	["aura_show_enrage"] = true,
	["aura_tracker"] = {
		["buff_banned"] = {
			["206150"] = true,
			["333553"] = true,
			["61574"] = true,
			["61573"] = true,
		},
		["debuff_banned"] = {
			["264263"] = true,
			[50536] = false,
			["339137"] = true,
			[51735] = false,
		},
		["debuff_tracked"] = {
			["336449"] = true,
			["328175"] = true,
			["321020"] = true,
		},
		["buff_tracked"] = {
			[163689] = true,
			["328175"] = true,
			["327808"] = true,
			["262092"] = true,
			[227931] = true,
			["226512"] = true,
			["209859"] = true,
			["331743"] = true,
			["333737"] = true,
			[297133] = true,
			["321764"] = true,
			[233210] = true,
			["273432"] = true,
		},
	},
	["cast_statusbar_color"] = {
		nil, -- [1]
		0.93333333333333, -- [2]
		0.43137254901961, -- [3]
		0.96000000089407, -- [4]
	},
	["update_throttle"] = 0.12000000476837,
	["indicator_rare"] = false,
	["castbar_icon_show"] = false,
	["indicator_extra_raidmark"] = false,
	["extra_icon_timer_font"] = "GothamNarrowUltra",
	["not_affecting_combat_alpha"] = 1,
	["target_highlight_alpha"] = 0.7999999523162842,
	["news_frame"] = {
		["PlaterNewsFrame"] = {
			["scale"] = 1,
		},
	},
	["extra_icon_show_offensive_border"] = {
		nil, -- [1]
		0, -- [2]
		0, -- [3]
	},
	["auto_toggle_stacking_enabled"] = true,
	["target_shady_combat_only"] = false,
	["extra_icon_use_blizzard_border_color"] = false,
	["target_shady_alpha"] = 0.59999996423721,
	["aura_height_personal"] = 19,
	["target_highlight_height"] = 12,
	["cast_statusbar_spark_alpha"] = 0.7999999523162842,
	["castbar_framelevel"] = 0,
	["version"] = 6,
	["indicator_elite"] = false,
	["first_run2"] = true,
	["health_animation_time_dilatation"] = 1.059999942779541,
	["aura_cooldown_reverse"] = false,
	["ghost_auras"] = {
		["auras"] = {
			["PRIEST"] = {
				[3] = {
					[589] = true,
					[34914] = true,
				},
			},
			["WARLOCK"] = {
				{
					[172] = true,
					[980] = true,
				}, -- [1]
			},
		},
	},
	["patch_version"] = 36,
	["range_check_in_range_or_target_alpha"] = 1,
	["aura_timer_text_size"] = 9,
	["castbar_target_anchor"] = {
		["y"] = 8.349998474121094,
		["x"] = 24.72999572753906,
		["side"] = 6,
	},
	["number_region_first_run"] = true,
	["script_auto_imported"] = {
		["Aura - Buff Alert"] = 15,
		["Cast - Effect After Cast [P]"] = 2,
		["Explosion Affix M+"] = 14,
		["Aura - Debuff Alert"] = 12,
		["Cast - Castbar is Timer [P]"] = 2,
		["Cast - Ultra Important"] = 14,
		["Add - Health Markers [P]"] = 2,
		["Cast - Small Alert"] = 12,
		["Aura - Invalidate Unit"] = 1,
		["Add - Important [P]"] = 4,
		["Unit - Main Target"] = 11,
		["Aura - Blink Time Left"] = 13,
		["Add - Tag Number [P]"] = 2,
		["Unit Power"] = 1,
		["Cast - Glowing [P]"] = 10,
		["Cast - Important Target [P]"] = 2,
		["Unit - Show Energy"] = 11,
		["Cast - Very Important"] = 15,
		["Cast - Alert + Timer [P]"] = 4,
		["Cast - Shield Interrupt"] = 2,
		["Relics 9.2 M Dungeons"] = 2,
		["Aura is Shield [P]"] = 2,
		["Add - Warning [P]"] = 5,
		["Auto Set Skull"] = 11,
		["Aura While Casting [P]"] = 1,
		["Cast - Big Alert"] = 14,
		["Add - Explode on Die [P]"] = 1,
		["Countdown"] = 11,
		["Spiteful Affix"] = 3,
		["Cast - Stop Casting"] = 4,
		["Color Change"] = 1,
		["Unit - Important"] = 11,
		["Add - Non Elite Trash [P]"] = 4,
		["Cast - Circular Swipe"] = 4,
		["Aura Border Color"] = 1,
		["Cast - On Going Cast [P]"] = 2,
		["Fixate by Unit Buff [P]"] = 2,
		["Cast - Frontal Cone"] = 15,
		["Fixate"] = 11,
		["Cast - Quick Flash"] = 2,
		["Cast - Tank Interrupt"] = 12,
		["Unit - Health Markers"] = 12,
		["Fixate On You"] = 11,
	},
	["tap_denied_color"] = {
		0.37254901960784, -- [1]
		0.37254901960784, -- [2]
		0.37254901960784, -- [3]
	},
	["aura2_grow_direction"] = 3,
	["aura_alpha"] = 1,
	["aura_cooldown_edge_texture"] = "Interface\\GLUES\\loadingOld",
	["extra_icon_show_purge_border"] = {
		nil, -- [1]
		0, -- [2]
		0, -- [3]
	},
	["first_run3"] = true,
	["target_shady_enabled"] = false,
	["ui_parent_target_strata"] = "BACKGROUND",
	["dps"] = {
		["colors"] = {
			["notontank"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
			},
			["aggro"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
			},
			["noaggro"] = {
				0.73333333333333, -- [1]
				0.19607843137255, -- [2]
			},
			["pulling"] = {
				nil, -- [1]
				0.93333333333333, -- [2]
				0.43137254901961, -- [3]
			},
		},
	},
	["extra_icon_height"] = 26,
	["aura_stack_color"] = {
		nil, -- [1]
		0.94509803921569, -- [2]
		0.93725490196078, -- [3]
	},
	["extra_icon_show_defensive_border"] = {
		0, -- [1]
		0, -- [2]
		0, -- [3]
	},
	["auto_toggle_stacking"] = {
		["cities"] = true,
	},
	["cast_statusbar_spark_width"] = 4,
}