namespace DivineSkillUtils
{
TDataObjectPtr<FDivineSkillConfig> GetDivineSkill(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_DivineSkill& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetDivineSkillData().GetSkillConfig();
    }
    Get local_36;
    const FC_PlayerController& local_38 = local_36.opCall();
    if (local_38)
    {
        FSocialTeamMember local_70;
        if (FSocialTeamUtils::ClientFindSocialTeamMemberInfo(local_38.GetPlayerId(), local_70))
        {
            return local_70.DivineSkillData.GetSkillConfig();
        }
    }
    return TDataObjectPtr<FDivineSkillConfig>();
}
void AddDivineSkillModifier(const FECSEntity &inout PawnEntity, FC_DivineSkill &inout DivineSkill, const FFPTime &inout OverrideAddTime = FFPTime(-1))
{
    int local_12 = 0;
    int local_32 = 0;
    if (!(DivineSkill.GetDivineSkillData()) || !(DivineSkill.GetbHasSuitableCharacter()))
    {
        return;
    }
    Has local_6;
    bool local_2 = local_6.opCall();
    if (local_2)
    {
        const FDivineSkillConfig& local_8 = DivineSkill.GetDivineSkillData().GetSkillConfig().Get();
        FECSEntityId local_9 = PawnEntity.GetId();
        local_12.GetModifierIds().Reset(0);
        for (auto& local_28 : local_8.Modifiers)
        {
            local_12.GetModifierIds().Add(FGameplayModifierUtils::AddGameplayModifier(PawnEntity, local_28, OverrideAddTime, true));
        }
        FECSEntityId local_9_2 = PawnEntity.GetId();
        for (auto& local_46 : local_8.Capabilities)
        {
            local_32.GetCapabilityIds().Add(FCapabilityUtils::AddCapability(PawnEntity, local_46.GetCapabilityConfig(), local_46.GetLevel()));
        }
    }
    return;
}
void RemoveDivineSkillModifier(const FECSEntity &inout PawnEntity, FC_DivineSkill &inout DivineSkill)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        FDivineSkillCapabilityIds local_30;
        FDivineSkillModifierIds local_10;
        if (DivineSkill.GetModifierIdByPawnEntityId().Find(PawnEntity.GetId(), local_10))
        {
            for (auto local_25 : local_10.GetModifierIds())
            {
                FGameplayModifierUtils::RemoveGameplayModifier(PawnEntity, local_25);
            }
        }
        if (DivineSkill.GetCapabilityIdByPawnEntityId().Find(PawnEntity.GetId(), local_30))
        {
            for (auto& local_44 : local_30.GetCapabilityIds())
            {
                FCapabilityUtils::RemoveCapabilityByInstanceId(PawnEntity, local_44);
            }
        }
    }
    DivineSkill.GetModify_ModifierIdByPawnEntityId().Remove(PawnEntity.GetId());
    DivineSkill.GetModify_CapabilityIdByPawnEntityId().Remove(PawnEntity.GetId());
    return;
}
bool SuitForPlayerCurrentAvatars(const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkill, const FECSEntity &inout PlayerEntity)
{
    if (!(DivineSkill))
    {
        return false;
    }
    return DivineSkillUtils::SuitForPlayerCurrentAvatars(DivineSkill.opArrow().GetTypeConfig(), PlayerEntity);
}
bool SuitForPlayerCurrentAvatars(const TDataObjectPtr<FDivineSkillTypeConfig> &inout TypeConfig, const FECSEntity &inout PlayerEntity)
{
    Get local_4;
    const FC_PlayerController& local_6 = local_4.opCall();
    if (local_6)
    {
        return DivineSkillUtils::SuitForPlayerCurrentAvatarByPlayerController(TypeConfig, local_6);
    }
    return false;
}
bool SuitForPlayerCurrentAvatarByPlayerController(const TDataObjectPtr<FDivineSkillTypeConfig> &inout TypeConfig, const FC_PlayerController &inout PlayerController)
{
    if (PlayerController.GetAllPlayerPawnEntities().Num() > 0)
    {
        if (DivineSkillUtils::SuitForAvatar(TypeConfig, PlayerController.GetAllPlayerPawnEntities()[0]))
        {
            return true;
        }
    }
    return false;
}
bool SuitForAvatar(const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkill, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    if (!(DivineSkill) || !(DivineSkill.opArrow().GetTypeConfig()))
    {
        return false;
    }
    if (AvatarConfig.IsSet())
    {
        if (AvatarConfig.Get().GetDefaultFoundation().IsSet())
        {
            int local_6 = int(DivineSkill.opArrow().GetTypeConfig().opArrow().TargetIllustrate);
            int local_7 = int(FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(AvatarConfig.Get().GetDefaultFoundation().Get().TalentDivision)));
            return (local_6 == local_7);
        }
    }
    return false;
}
bool SuitForAvatar(const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkill, const FECSEntity &inout PawnEntity)
{
    if (!(DivineSkill.IsSet()))
    {
        return false;
    }
    return DivineSkillUtils::SuitForAvatar(DivineSkill.opArrow().GetTypeConfig(), PawnEntity);
}
bool SuitForAvatar(const TDataObjectPtr<FDivineSkillTypeConfig> &inout TypeConfig, const FECSEntity &inout PawnEntity)
{
    if (!(TypeConfig.IsSet()))
    {
        return false;
    }
    Has local_6;
    bool local_1 = local_6.opCall();
    if (local_1)
    {
        int local_13 = int(TypeConfig.opArrow().TargetIllustrate);
        Get local_10;
        int local_14 = int(local_10.opCall().GetFoundationTalentIllustrate());
        return (local_13 == local_14);
    }
    TDataObjectPtr<FAvatarPrefabConfig> local_38 = GetAvatarConfig(PawnEntity);
    if (local_38.IsSet())
    {
        if (local_38.Get().GetDefaultFoundation().IsSet())
        {
            int local_14_2 = int(TypeConfig.opArrow().TargetIllustrate);
            int local_13_2 = int(FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(local_38.Get().GetDefaultFoundation().Get().TalentDivision)));
            return (local_14_2 == local_13_2);
        }
    }
    return false;
}
EAvatarIllustrate GetAvatarIllustrate(const FECSEntity &inout PawnEntity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        Get local_10;
        return local_10.opCall().GetFoundationTalentIllustrate();
    }
    TDataObjectPtr<FAvatarPrefabConfig> local_36 = GetAvatarConfig(PawnEntity);
    if (local_36.IsSet() && local_36.Get().GetDefaultFoundation().IsSet())
    {
        return FASCommonUtils::TalentDivisionToIllustrate(local_36.Get().GetDefaultFoundation().Get().TalentDivision);
    }
    return EAvatarIllustrate::MaxCount;
}
EAvatarIllustrate GetPlayerMainAvatarIllustrate(const FECSEntity &inout PlayerEntity)
{
    Get local_4;
    const FC_PlayerController& local_6 = local_4.opCall();
    if (local_6)
    {
        if ((local_6.GetAllPlayerPawnEntities().Num()) > 0)
        {
            return DivineSkillUtils::GetAvatarIllustrate(local_6.GetAllPlayerPawnEntities()[0]);
        }
    }
    return EAvatarIllustrate::MaxCount;
}
TDataObjectPtr<FDivineSkillTypeConfig> FindTypeConfigByIllustrate(const EAvatarIllustrate Illustrate)
{
    if (int(Illustrate) == 3)
    {
        return TDataObjectPtr<FDivineSkillTypeConfig>();
    }
    TDataObjectIterator<FDivineSkillTypeConfig> local_68;
    for (; local_68; )
    {
        if (local_68.GetDataPtr() && (int(local_68.GetData().TargetIllustrate) == int(Illustrate)))
        {
            return TDataObjectPtr<FDivineSkillTypeConfig>(local_68.GetData());
        }
        local_68.Next();
    }
    return TDataObjectPtr<FDivineSkillTypeConfig>();
}
void SaveDivineSkillInfo(const FECSEntity &inout PrevEntity, const FFPTime &inout Time)
{
    int local_20 = 0;
    USkillConfig local_24;
    if (!(PrevEntity) || !(PrevEntity.IsValid()))
    {
        return;
    }
    Get local_8;
    if (local_8.opCall())
    {
        if (!(local_20.GetDivineSkillData().GetSkillConfig()))
        {
            return;
        }
        const FDivineSkillConfig& local_22 = local_20.GetDivineSkillData().GetSkillConfig().Get();
        local_24 = local_22.SkillConfig;
        if (!((local_24 != nullptr)))
        {
            return;
        }
        int local_26 = FSkillUtils::GetSkillIndex(PrevEntity, local_22.SkillConfig);
        if (local_26 == INDEX_NONE)
        {
            return;
        }
        FFPTime local_30 = FSkillUtils::GetSkillCDRemainTime(PrevEntity, local_26, Time);
        float32 local_32 = FSkillUtils::GetSkillCDDuration(PrevEntity, local_26);
        FDivineSkillCDSnapshot local_40;
        local_40.SetCDEndTime((Time + local_30));
        local_40.SetSnapshotTime(Time);
        local_40.SetCDDuration(local_32);
        local_20.SetCDSnapshot(local_40);
    }
    return;
}
EDivineSkillType FilterTagToDivineSkillType(const FName &inout FilterTag)
{
    if ((FilterTag == n"PVP"))
    {
        return EDivineSkillType(1);
    }
    return EDivineSkillType(0);
}
}
