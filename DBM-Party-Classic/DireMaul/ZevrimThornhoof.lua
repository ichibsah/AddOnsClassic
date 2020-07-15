local mod	= DBM:NewMod(402, "DBM-Party-Classic", 6, 230)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20200626182941")
mod:SetCreatureID(11490)
--mod:SetEncounterID(1443)
mod:SetMinSyncRevision(20190917000000)--2019, 9, 17

mod:RegisterCombat("combat")
mod:DisableFriendlyDetection()

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 22651"
)

local warnSacrifice				= mod:NewTargetNoFilterAnnounce(22651, 4)

local yellSacrifice				= mod:NewYell(22651)

--function mod:OnCombatStart(delay)

--end

do
	local sacrifice = DBM:GetSpellInfo(22651)
	function mod:SacTarget(targetname, uId)
		if not targetname then return end
		warnSacrifice:Show(targetname)
		if targetname == UnitName("player") then
			yellSacrifice:Yell()
		end
	end

	function mod:SPELL_CAST_START(args)
		if args.spellName == sacrifice and args:IsSrcTypeHostile() then
			self:BossTargetScanner(args.sourceGUID, "SacTarget", 0.1, 8)
		end
	end
end
