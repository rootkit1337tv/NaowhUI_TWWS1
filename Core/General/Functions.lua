local NUI = unpack(NaowhUI)

local ReloadUI = ReloadUI

function NUI:OpenToCategory()
	local PluginInstallFrame = PluginInstallFrame
	local CategoryName = "NaowhUI"

    if PluginInstallFrame and PluginInstallFrame:IsShown() then
        PluginInstallFrame:SetFrameLevel(279)
        PluginInstallFrame:SetFrameStrata("MEDIUM")
    end

	if self.Retail then
		Settings.OpenToCategory(CategoryName)

		return
	end
	
	InterfaceOptionsFrame_OpenToCategory(CategoryName)
end

function NUI:RunInstaller()
	if self:IsAddOnEnabled("ElvUI") then
		local E = unpack(ElvUI)
		local I = self:GetModule("Installer")

		E:GetModule("PluginInstaller"):Queue(I.Installer)

		return
	end

	self:OpenToCategory()
end

function NUI:Notification(string, AcceptFunction, DeclineFunction)
	local FrameName = "Notification"

	StaticPopupDialogs[FrameName] = {
		text = string,
		button1 = "Yes",
		button2 = "No",
		OnAccept = AcceptFunction,
		OnCancel = DeclineFunction,
	}
	StaticPopup_Show(FrameName)
end

function NUI:LoadProfiles()
	local SE = self:GetModule("Setup")

	for k in pairs(self.db.global.profiles) do
		if self:IsAddOnEnabled(k) then
			SE:Setup(k)
		end
	end

	self.db.char.installed = true

	ReloadUI()
end

function NUI:LoadData()
    local C_AddOns_LoadAddOn = C_AddOns.LoadAddOn
	local DataAddOn = "NaowhUI_Data"
	local AddOnLoader = C_AddOns_LoadAddOn(DataAddOn)

	if AddOnLoader then
		return
	end

	if not self:IsAddOnEnabled(DataAddOn) then
		C_AddOns.EnableAddOn(DataAddOn)
	end

	AddOnLoader()
end

function NUI:InstallComplete(reload)
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	self.db.char.installed = true
	self.db.global.version = self.version

	if reload then
		ReloadUI()
	end
end