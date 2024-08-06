local NUI = unpack(NaowhUI)
local SE = NUI:GetModule("Setup")

local function AreAddOnsDisabled()
	local AddOnList = {
		["BigWigs"] = true,
		["Details"] = true,
		["HidingBar"] = true,
		["MRT"] = true,
		["NameplateAuras"] = true,
		["OmniCD"] = true,
		["Plater"] = true,
		["WarpDeplete"] = true,
		["WeakAuras"] = true
	}
	local OmniCD = AddOnList.OmniCD
	local WarpDeplete = AddOnList.WarpDeplete

	if NUI.Cata then
		OmniCD = nil
		WarpDeplete = nil
	elseif NUI.Classic then
		AddOnList.MRT = nil
		OmniCD = nil
		WarpDeplete = nil
	end

	for k in pairs(AddOnList) do
		if NUI:IsAddOnEnabled(k) then
			return false
		end
	end

	return true
end

NUI.Options = {
	name = "NaowhUI",
	type = "group",
	args = {
		addonprofiles = {
			name = "AddOn profiles",
			order = 1,
			hidden = function()
				if NUI:IsAddOnEnabled("ElvUI") or AreAddOnsDisabled() then
					return true
				end
			end,
			type = "group",
			args = {
				bigwigs = {
					name = "BigWigs",
					desc = "Setup BigWigs",
					hidden = function()
						if not NUI:IsAddOnEnabled("BigWigs") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:InstallComplete()
						SE:Setup("BigWigs", true)
					end
				},
				details = {
					name = "Details",
					desc = "Setup Details",
					hidden = function()
						if not NUI:IsAddOnEnabled("Details") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:InstallComplete()
						SE:Setup("Details", true)
					end
				},
				hidingbar = {
					name = "HidingBar",
					desc = "Setup HidingBar",
					hidden = function()
						if not NUI:IsAddOnEnabled("HidingBar") then
							return true
						end
					end,
					type = "execute",
					func = function()
						SE:Setup("HidingBar")
						NUI:InstallComplete(true)
					end
				},
				mrt = {
					name = "MRT",
					desc = "Setup MRT",
					hidden = function()
						if NUI.Classic or not NUI:IsAddOnEnabled("MRT") then
							return true
						end
					end,
					type = "execute",
					func = function()
						SE:Setup("MRT", true)
						NUI:InstallComplete(true)
					end
				},
				nameplateauras = {
					name = "NameplateAuras",
					desc = "Setup NameplateAuras",
					hidden = function()
						if not NUI:IsAddOnEnabled("NameplateAuras") then
							return true
						end
					end,
					type = "execute",
					func = function()
						SE:Setup("NameplateAuras", true)
						NUI:InstallComplete(true)
					end
				},
				omnicd = {
					name = "OmniCD",
					desc = "Setup OmniCD",
					hidden = function()
						if NUI.Cata or NUI.Classic or not NUI:IsAddOnEnabled("OmniCD") then
							return true
						end
					end,
					type = "execute",
					func = function()
						SE:Setup("OmniCD", true)
						NUI:InstallComplete(true)
					end
				},
				plater = {
					name = "Plater",
					desc = "Setup Plater",
					hidden = function()
						if not NUI:IsAddOnEnabled("Plater") then
							return true
						end
					end,
					type = "execute",
					func = function()
						SE:Setup("Plater", true)
						NUI:InstallComplete(true)
					end
				},
				warpdeplete = {
					name = "WarpDeplete",
					desc = "Setup WarpDeplete",
					hidden = function()
						if NUI.Cata or NUI.Classic or not NUI:IsAddOnEnabled("WarpDeplete") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:InstallComplete()
						SE:Setup("WarpDeplete", true)
					end
				},
				weakauras = {
					name = "WeakAuras",
					desc = "Setup WeakAuras",
					hidden = function()
						if not NUI:IsAddOnEnabled("WeakAuras") then
							return true
						end
					end,
					type = "execute",
					func = function()
						SE:Setup("WeakAuras")
						NUI:InstallComplete(true)
					end
				}
			}
		},
		classweakauras = {
			name = "Class WeakAuras",
			order = 2,
			hidden = function()
				if not NUI:IsAddOnEnabled("WeakAuras") then
					return true
				end
			end,
			type = "group",
			args = {
				deathknight = {
					name = "Death Knight",
					desc = "Import the Death Knight Class WeakAura",
					hidden = function()
						if NUI.Classic then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasDeathKnightData)
					end
				},
				demonhunter = {
					name = "Demon Hunter",
					desc = "Import the Demon Hunter Class WeakAura",
					hidden = function()
						if NUI.Cata or NUI.Classic then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasDemonHunterData)
					end
				},
				druid = {
					name = "Druid",
					desc = "Import the Druid Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasDruidData)
					end
				},
				evoker = {
					name = "Evoker",
					desc = "Import the Evoker Class WeakAura",
					hidden = function()
						if NUI.Cata or NUI.Classic then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasEvokerData)
					end
				},
				hunter = {
					name = "Hunter",
					desc = "Import the Hunter Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasHunterData)
					end
				},
				mage = {
					name = "Mage",
					desc = "Import the Mage Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasMageData)
					end
				},
				monk = {
					name = "Monk",
					desc = "Import the Monk Class WeakAura",
					hidden = function()
						if NUI.Cata or NUI.Classic then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasMonkData)
					end
				},
				paladin = {
					name = "Paladin",
					desc = "Import the Paladin Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasPaladinData)
					end
				},
				priest = {
					name = "Priest",
					desc = "Import the Priest Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasPriestData)
					end
				},
				rogue = {
					name = "Rogue",
					desc = "Import the Rogue Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasRogueData)
					end
				},
				shaman = {
					name = "Shaman",
					desc = "Import the Shaman Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasShamanData)
					end
				},
				warlock = {
					name = "Warlock",
					desc = "Import the Warlock Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasWarlockData)
					end
				},
				warrior = {
					name = "Warrior",
					desc = "Import the Warrior Class WeakAura",
					type = "execute",
					func = function()
						NUI:LoadData()
						WeakAuras.Import(NUI.WeakAurasWarriorData)
					end
				}
			}
		},
		advanced = {
			name = "Advanced",
			order = -1,
			type = "group",
			args = {
				loadprofiles = {
					name = "Load Profiles",
					desc = "Load your selected NaowhUI profiles onto this character",
					hidden = function()
						if NUI:IsAddOnEnabled("ElvUI") or AreAddOnsDisabled() then
							return true
						end
					end,
					type = "execute",
					func = function() NUI:LoadProfiles() end
				},
				printversion = {
					name = "Print Version",
					desc = "Print the current NaowhUI AddOn version",
					type = "execute",
					func = function() NUI:Print(NUI.version) end
				}
			}
		}
	}
}