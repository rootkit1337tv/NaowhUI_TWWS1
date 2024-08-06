local NUI = unpack(NaowhUI)
local SC = NUI:GetModule("Scaling")

local ScalingTable = {}

function ScalingTable.ElvUI(scale)
	local E = unpack(ElvUI)
	local UIScale = scale or E.data.global.general.UIScale
	local DefaultScale = 0.7111111111111111
	local UIParent = UIParent
	local xResNew
	local yResNew
	local ProfileName = "Naowh"
	local UnscaledMovers = {
		["TargetPowerBarMover"] = true,
		["LootFrameMover"] = true,
		["ElvUF_Raid3Mover"] = true,
		["ElvUF_PartyMover"] = true,
		["ElvUF_FocusMover"] = true,
		["ElvUF_PlayerMover"] = true,
		["ElvUF_PetMover"] = true,
		["ElvUF_TargetTargetMover"] = true,
		["ElvUF_TargetMover"] = true,
		["LossControlMover"] = true,
		["AltPowerBarMover"] = true,
		["ElvUF_Raid1Mover"] = true,
		["ElvUF_Raid2Mover"] = true,
		["VehicleLeaveButton"] = true,
		["ObjectiveFrameMover"] = true,
		["BossHeaderMover"] = true,
		["AlertFrameMover"] = true
	}
	local anchorMods = {
		["BOTTOM"] = {
			["anchorModX"] = 0,
			["anchorModY"] = 1 / 2
		},
		["BOTTOMLEFT"] = {
			["anchorModX"] = 1 / 2,
			["anchorModY"] = 1 / 2
		},
		["BOTTOMRIGHT"] = {
			["anchorModX"] = -1 / 2,
			["anchorModY"] = 1 / 2
		},
		["TOP"] = {
			["anchorModX"] = 0,
			["anchorModY"] = -1 / 2
		},
		["TOPLEFT"] = {
			["anchorModX"] = 1 / 2,
			["anchorModY"] = -1 / 2
		},
		["TOPRIGHT"] = {
			["anchorModX"] = -1 / 2,
			["anchorModY"] = -1 / 2
		}
	}
	local xResOld = 768 / DefaultScale / 9 * 16
	local yResOld = 768 / DefaultScale
	local tostring = tostring
	local ScaledMovers = {}

	if UIScale == DefaultScale then
		E.data.global.general.UIScale = UIScale

		return
	end

	UIParent:SetScale(UIScale)
	xResNew, yResNew = UIParent:GetSize()

	for k, v in pairs(E.data.profiles[ProfileName].movers) do
		local StringTable = {}

		for e in string.gmatch(v, "[^,]+") do
			tinsert(StringTable, e)
		end

		if UnscaledMovers[k] then
			local anchorModX = anchorMods[StringTable[1]].anchorModX
			local NewX = StringTable[4] - (xResOld * anchorModX) + (xResNew * anchorModX)
			local anchorModY = anchorMods[StringTable[1]].anchorModY
			local NewY = StringTable[5] - (yResOld * anchorModY) + (yResNew * anchorModY)

			ScaledMovers[k] = StringTable[1] .. "," .. StringTable[2] .. "," .. StringTable[3] .. "," .. tostring(NewX) .. "," .. tostring(NewY)
		else
			ScaledMovers[k] = v
		end
	end

	E.data.global.general.UIScale = UIScale
	E.data.profiles[ProfileName].movers = ScaledMovers
	NUI.ReloadRequired = true
end

function SC:Scale(addon, scale)
	local ScalingFunction = ScalingTable[addon]

	ScalingFunction(scale)
end