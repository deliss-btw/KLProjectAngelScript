class UESMAction_DataTrackMonterSkill : UESMBPBaseInstantAction
{
    UESMAction_DataTrackMonterSkill()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FNameHandle_EntityBBVarInt local_8;
        local_8;
        int local_4_2 = local_2.GetBB_Int(local_8);
        if (local_4_2 > 0)
        {
            int local_12;
            local_12 = 0;
            int local_11 = local_2.GetIdValue();
            Get local_18;
            const FC_MonsterInfo& local_20 = local_18.opCall();
            if (local_20)
            {
                local_12 = local_20.GetMonsterConfig().Get().DataId;
            }
            FPbPlayerLogDsSkillCast local_30;
            local_30.SetEntityType(2);
            local_30.SetEntityConfigId(local_12);
            local_30.SetEntityInstanceId(local_11);
            local_30.SetCastType(2);
            local_30.SetSkillId(FString().Append(local_4_2));
            FPbPlayerLogDsCombatCommon local_44 = local_30.GetCommon();
            ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_2, local_44);
            ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(local_2, 102506, local_30.ToWrapper());
        }
        return;
    }
}

