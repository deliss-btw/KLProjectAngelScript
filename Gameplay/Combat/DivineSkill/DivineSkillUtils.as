
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
        const FDivineSkillConfig& local_8;
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
    FECSEntityId local_11 = PawnEntity.GetId();
    FECSEntityId local_11_2 = PawnEntity.GetId();
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
    int local_3 = 0;
    if (!(DivineSkill) || !(DivineSkill.opArrow().GetTypeConfig()))
    {
        return false;
    }
    if (AvatarConfig.IsSet())
    {
        if (GetDefaultFoundation().IsSet())
        {
            int local_6 = int(DivineSkill.opArrow().GetTypeConfig().opArrow().TargetIllustrate);
            int local_7 = int(FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(local_3)));
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
    int local_63 = 0;
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
    if (GetAvatarConfig(PawnEntity).IsSet())
    {
        if (GetDefaultFoundation().IsSet())
        {
            int local_14_2 = int(TypeConfig.opArrow().TargetIllustrate);
            int local_13_2 = int(FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(local_63)));
            return (local_14_2 == local_13_2);
        }
    }
    return false;
}
EAvatarIllustrate GetAvatarIllustrate(const FECSEntity &inout PawnEntity)
{
    int local_62 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        Get local_10;
        return local_10.opCall().GetFoundationTalentIllustrate();
    }
    if (GetAvatarConfig(PawnEntity).IsSet() && GetDefaultFoundation().IsSet())
    {
        return FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(local_62));
    }
    return EAvatarIllustrate(3);
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
    return EAvatarIllustrate(3);
}
TDataObjectPtr<FDivineSkillTypeConfig> FindTypeConfigByIllustrate(const EAvatarIllustrate Illustrate)
{
    TDataObjectPtr<FDivineSkillTypeConfig> local_28;
    if (int(Illustrate) == 3)
    {
        return local_28;
    }
    TDataObjectIterator<FDivineSkillTypeConfig> local_68;
    for (; local_68; )
    {
        if (local_68.GetDataPtr() && (int(local_68.GetData().TargetIllustrate) == int(Illustrate)))
        {
            return local_28;
        }
        local_68.Next();
    }
    return local_28;
}
void SaveDivineSkillInfo(const FECSEntity &inout PrevEntity, const FFPTime &inout Time)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
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
