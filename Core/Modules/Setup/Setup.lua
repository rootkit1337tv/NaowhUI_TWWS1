local NUI = unpack(NaowhUI)
local SE = NUI:GetModule("Setup")

local E
local ProfileName = "Naowh"
local AceDB = LibStub("AceDB-3.0")
local VMRT = VMRT
local pairs = pairs
local SetupTable = {}

do
	if NUI:IsAddOnEnabled("ElvUI") then
		E = unpack(ElvUI)
	end
end

local function SetupComplete(addon)
	local PluginInstallStepComplete = PluginInstallStepComplete

	if PluginInstallStepComplete then
		PluginInstallStepComplete:Hide()
		PluginInstallStepComplete.message = "Success"
		PluginInstallStepComplete:Show()
	end

	if not addon then
		return
	end

	if not NUI.db.global.profiles then
		NUI.db.global.profiles = {}
	end

	NUI.db.global.profiles[addon] = true
end

local function ImportBigWigs(addon)
	BigWigsAPI:ImportProfileString(NUI.title, NUI.BigWigsData, ProfileName, function(callback)
		if not callback then
			return
		end

		SetupComplete(addon)
	end)
end

local function IsProfileExisting(db)
	local AddOnDatabase = AceDB:New(db)
	local ProfileTable = AddOnDatabase:GetProfiles()

	for i = 1, #ProfileTable do
		if ProfileTable[i] == ProfileName then

			return true
		end
	end
end

local function ImportElvUI(addon, scale)
	local SC = NUI:GetModule("Scaling")

	if NUI.ReloadRequired then
		NUI:Notification("A reload is required in order to select a different scale. Do you wish to reload your UI?", function() ReloadUI() end)

		return
	end

	SetupComplete(addon)
	E:SetupCVars(true)

	E.data.profiles[ProfileName] = NUI.ElvUIData

	SC:Scale(addon, scale)
end

local function ImportMRT(addon)
	local MRTProfile = VMRT.Profile or "default"
	local IgnoredKeys = {
		["Addon"] = true,
		["Profiles"] = true,
		["Profile"] = true,
		["ProfileKeys"] = true,
		["Encounter"] = true,
		["Attendance"] = true,
		["LootHistory"] = true,
		["Reminder"] = true,
		["Reminder2"] = true
	}

	VMRT.Profiles[MRTProfile] = {}

	for k, v in pairs(VMRT) do
		if not IgnoredKeys[k] then
			VMRT.Profiles[MRTProfile][k] = v
			VMRT[k] = nil
		end
	end

	for k, v in pairs(NUI.MRTData) do
		if not IgnoredKeys[k] then
			VMRT[k] = v
		end
	end

	SetupComplete(addon)

	VMRT.Profile = ProfileName
end

function SetupTable.BigWigs(import, addon)
	local BigWigs3DB = BigWigs3DB
	local AddOnDatabase

	if import then
		ImportBigWigs(addon)

		return
	end

	if not IsProfileExisting(BigWigs3DB) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	AddOnDatabase = AceDB:New(BigWigs3DB)

	AddOnDatabase:SetProfile(ProfileName)
end

function SetupTable.Details(import, addon)
	local Details = Details

	if import then
		Details:EraseProfile(ProfileName)
		SetupComplete(addon)

		_detalhes_global.__profiles[ProfileName] = NUI.DetailsData
	end

	if not Details:GetProfile(ProfileName) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	Details:ApplyProfile(ProfileName)
end

function SetupTable.ElvUI(import, addon, scale)
	if import then
		ImportElvUI(addon, scale)
	end

	if not IsProfileExisting(ElvDB) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	E.data:SetProfile(ProfileName)
	E:StaggeredUpdateAll()

	E.private.general.chatBubbleFont = ProfileName
	E.private.general.chatBubbleFontOutline = "OUTLINE"
	E.private.general.chatBubbleFontSize = 11
	E.private.general.dmgfont = "GothamNarrowUltra"
	E.private.general.namefont = ProfileName
	E.private.nameplates.enable = false
end

function SetupTable.HidingBar()
	local HidingBarDB = HidingBarDB
	local tinsert = tinsert
	local HidingBarDatabase = {}

	for _, v in ipairs(HidingBarDB.profiles) do
		if v.name ~= ProfileName then
			v.isDefault = nil

			tinsert(HidingBarDatabase, v)
		end
	end

	tinsert(HidingBarDatabase, NUI.HidingBarData)

	HidingBarDB.profiles = HidingBarDatabase
	HidingBarDBChar = nil

	SetupComplete()
end

function SetupTable.MRT(import, addon)
	if import then
		ImportMRT(addon)
	end

	if not (VMRT.Profile == ProfileName or VMRT.Profiles[ProfileName]) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	VMRT.ProfileKeys[NUI.mynameRealm] = ProfileName
end

function SetupTable.NameplateAuras(import, addon)
	local NameplateAurasAceDB = NameplateAurasAceDB
	local AddOnDatabase = AceDB:New(NameplateAurasAceDB)

	if import then
		SetupComplete(addon)

		NameplateAurasAceDB.profiles[ProfileName] = NUI.NameplateAurasData
	end

	if not IsProfileExisting(NameplateAurasAceDB) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	AddOnDatabase:SetProfile(ProfileName)
end

function SetupTable.OmniCD(import, addon)
	local OmniCDDB = OmniCDDB
	local AddOnDatabase = AceDB:New(OmniCDDB)

	if import then
		SetupComplete(addon)

		OmniCDDB.profiles[ProfileName] = NUI.OmniCDData
	end

	if not IsProfileExisting(OmniCDDB) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	AddOnDatabase:SetProfile(ProfileName)
end

function SetupTable.Plater(import, addon)
	local Plater = Plater
	local FunctionName = "RefreshConfigProfileChanged"

	if import then
		SetupComplete(addon)

		Plater.db.profiles[ProfileName] = NUI.PlaterData
	end

	if not IsProfileExisting(PlaterDB) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	if not SE:IsHooked(Plater, FunctionName) then
		SE:RawHook(Plater, FunctionName, function() Plater:RefreshConfig() end)
	end

	Plater.db:SetProfile(ProfileName)
end

function SetupTable.WarpDeplete(import, addon)
	local WarpDepleteDB = WarpDepleteDB

	if import then
		SetupComplete(addon)

		WarpDepleteDB.profiles[ProfileName] = NUI.WarpDepleteData
	end

	if not IsProfileExisting(WarpDepleteDB) then
		NUI.db.global.profiles[addon] = nil

		return
	end

	WarpDeplete.db:SetProfile(ProfileName)
end

function SetupTable.WeakAuras()
	local WeakAurasSaved = WeakAurasSaved
	local UIIndicator = "NaowhUI"

	for k,v in pairs(WeakAurasSaved.displays) do
		if not NUI.WeakAurasData[k] and v.url == UIIndicator then
			WeakAurasSaved.displays[k] = nil
		end
	end

	for k,v in pairs(NUI.WeakAurasData) do
		if not WeakAurasSaved.displays[k] or (WeakAurasSaved.displays[k] and WeakAurasSaved.displays[k].url == UIIndicator) then
			WeakAurasSaved.displays[k] = v
		end
	end

	SetupComplete()
end

function SE:Setup(addon, import, scale)
	local SetupFunction = SetupTable[addon]

	NUI:LoadData()
	SetupFunction(import, addon, scale)
end