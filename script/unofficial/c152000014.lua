--Honey Trap
--Scripted by Larry126
local s,id=GetID()
function s.initial_effect(c)
	--skill
	aux.AddVrainsSkillProcedure(c,s.flipcon,s.flipop,EVENT_BATTLE_DAMAGE)
end
function s.flipcon(e,tp,eg,ep,ev,re,r,rp)
	--opd check
	if Duel.GetFlagEffect(tp,id)>0 then return false end
	--condition
	return ep==tp and not Duel.GetAttackTarget() and Duel.GetLocationCount(tp,LOCATION_SZONE)>0
		and not Duel.IsPlayerAffectedByEffect(tp,EFFECT_CANNOT_SSET)
end
function s.flipop(e,tp,eg,ep,ev,re,r,rp)
	--ask if you want to activate the skill or not
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	--opd Register
	Duel.RegisterFlagEffect(tp,id,0,0,0)
	Duel.Hint(HINT_SKILL_FLIP,tp,id|(1<<32))
	Duel.Hint(HINT_CARD,tp,id)
	--check if skill is negated
	if aux.CheckSkillNegation(e,tp) then return end
	--Recover and Set
	local rec=Duel.Recover(tp,ev,REASON_EFFECT)
	if rec~=ev or Duel.GetLocationCount(tp,LOCATION_SZONE)<1 or Duel.IsPlayerAffectedByEffect(tp,EFFECT_CANNOT_SSET) then return end
	Duel.BreakEffect()
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CODE)
	s.announce_filter={TYPE_TRAP,OPCODE_ISTYPE}
	local ac=Duel.AnnounceCard(tp,table.unpack(s.announce_filter))
	local tc=Duel.CreateToken(tp,ac)
	if tc:IsSSetable() then
		Duel.SSet(tp,tc)
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_TRAP_ACT_IN_SET_TURN)
		e1:SetProperty(EFFECT_FLAG_SET_AVAILABLE)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		tc:RegisterEffect(e1)
	end
end
