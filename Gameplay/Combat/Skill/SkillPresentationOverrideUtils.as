
namespace FSkillPresentationOverrideUtils
{
void ApplyOverride(const FECSEntity &inout Entity, const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout Config, const bool bEnable)
{
    FC_SkillPresentationOverride local_12;
    int local_18 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer) || !(Config) || !(Entity.IsValid()))
    {
        return;
    }
    FECSEntity local_10 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (!(local_10.IsValid()))
    {
        return;
    }
    int local_17 = local_18;
    if (bEnable)
    {
        FSkillPresentationOverrideActiveEntry local_44;
        local_44.Config = Config;
        local_44.Serial = (int(local_12.NextSerial) + 1);
        local_12.ActiveEntries.Add(local_44);
    }
    else
    {
        int local_71 = 0;
        while (local_71 < 0)
        {
            if (local_12.ActiveEntries[local_71].Config && (local_18 == local_17))
            {
                local_12.ActiveEntries.RemoveAt(local_71);
                break;
            }
            ++local_71;
        }
    }
    FSkillPresentationOverrideUtils::Reconcile(local_10, Entity, local_12);
    if (local_12.ActiveEntries.Num() == 0 && (int(local_12.AppliedDataId) == 0))
    {
        Remove local_76;
        local_76.opCall();
    }
    return;
}
void Reconcile(const FECSEntity &inout PC, const FECSEntity &inout Owner, FC_SkillPresentationOverride &inout Comp)
{
    int local_4 = 0;
    int local_6 = 0;
    bool local_7;
    bool local_8;
    int local_11 = 0;
    USkillConfig local_46;
    const FSkillPresentationOverrideConfig& local_56;
    int local_58 = 0;
    USkillConfig local_78;
    int local_1 = -1;
    int local_3 = 0;
    while (local_3 < local_4)
    {
        if (!(Comp.ActiveEntries[local_3].Config))
        {
        }
        else
        {
            if (local_1 < 0 || (local_4 > local_6) || (local_4 == local_6 && (Comp.ActiveEntries[local_3].Serial < Comp.ActiveEntries[local_1].Serial)))
            {
                local_1 = local_3;
            }
        }
        ++local_3;
    }
    int local_10 = local_1 >= 0 ? local_11 : 0;
    if (local_10 == int(Comp.AppliedDataId))
    {
        return;
    }
    FECSWorldPtr local_14 = UEASAbility::GetContextECSWorld();
    Has local_20;
    local_8 = local_20.opCall();
    if (local_8)
    {
        Remove local_24;
        local_24.opCall();
    }
    if (!(Owner.IsValid()))
    {
        local_7 = false;
    }
    else
    {
        Has local_28;
        local_7 = local_28.opCall();
    }
    if (local_7)
    {
        for (auto& local_42 : Comp.AppliedRestores)
        {
            local_7 = local_42.bReplaceInSameSlot && (int(local_42.Slot) != 0);
            if (local_7 && ((local_42.OriginalSkillConfig != nullptr)))
            {
                FECSEntity local_50 = FSkillUtils::CreateSkillEntityAndAddSkill(local_14, Owner, local_42.OriginalSkillConfig, ESkillSlot(local_42.Slot), true, false, 1);
                continue;
            }
            local_46 = local_42.AddedSkillConfig;
            if (local_46 != nullptr)
            {
                FECSEntity local_50_2 = FSkillUtils::GetSkillEntityByConfig(Owner, local_42.AddedSkillConfig);
                if (local_50_2.IsValid())
                {
                    FSkillUtils::RemoveSkill(local_50_2, Owner, true);
                }
            }
        }
    }
    Comp.AppliedRestores.Empty(0);
    Comp.AppliedDataId = local_10;
    if (local_1 < 0)
    {
        return;
    }
    if (!(local_56.bEnableChangeSkillPanel))
    {
        local_8 = false;
    }
    else
    {
        local_8 = local_56.GetSkillBtnConfig();
    }
    if (local_8)
    {
        local_58.SetSkillBtnConfig(local_56.GetSkillBtnConfig());
        local_58.SetRefCount(1);
    }
    local_7 = local_56.bEnableReplaceSkill;
    if (!(local_7 && Owner.IsValid()))
    {
        local_7 = false;
    }
    else
    {
        Has local_28;
        local_7 = local_28.opCall();
    }
    if (local_7)
    {
        for (auto& local_76 : local_56.ReplaceSkills)
        {
            local_78 = local_76.SkillConfig;
            if (local_78 == nullptr)
            {
                continue;
            }
            FSkillReplaceRestore local_84;
            local_84.AddedSkillConfig = local_76.SkillConfig;
            local_84.Slot = ESkillSlot(local_76.Slot);
            local_84.bReplaceInSameSlot = local_76.bReplaceInSameSlot;
            local_84.OriginalSkillConfig = nullptr;
            if (local_76.bReplaceInSameSlot && (int(local_76.Slot) != 0))
            {
                int local_2 = FSkillUtils::GetSkillIndex(Owner, ESkillSlot(local_76.Slot));
                if (local_2 >= 0)
                {
                    TSoftObjectPtr<USkillConfig> local_94 = FSkillUtils::GetSkillInstance(Owner, local_2).GetSkillConfig();
                    local_84.OriginalSkillConfig = local_46;
                }
            }
            FSkillUtils::CreateSkillEntityAndAddSkill(local_14, Owner, local_76.SkillConfig, ESkillSlot(local_76.Slot), local_76.bReplaceInSameSlot, false, 1);
            Comp.AppliedRestores.Add(local_84);
        }
    }
    return;
}
}
