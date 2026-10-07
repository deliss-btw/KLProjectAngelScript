
enum ESkillUnusableReason
{
    None,
    InCD,
    ConsumeAttributeNotEnough,
    ConsumeItemNotEnough,
    ConditionNotSatisfied,
}


struct FSkillCastHintData
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    UESMInputTriggerAsset InputTrigger = nullptr;
    UPROPERTY()
    UInputAction InputAction = nullptr;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> OverrideTextRow;

    FSkillCastHintData()
    {
        return;
    }
}

namespace FSkillUIUtils
{
bool IsSkillUsable(const FECSEntity &inout Entity, const USkillConfig SkillConfig)
{
    return (int((FSkillUIUtils::GetSkillUnusableReason(Entity, SkillConfig))) == 0);
}
bool IsSkillConditionSatisfied(const FECSEntity &inout Entity, const USkillConfig SkillConfig)
{
    return (int((FSkillUIUtils::GetSkillUnusableReason(Entity, SkillConfig))) != 4);
}
bool IsConsumeItemEnough(const FECSEntity &inout Entity, const USkillConfig SkillConfig)
{
    return (int((FSkillUIUtils::GetSkillUnusableReason(Entity, SkillConfig))) != 3);
}
ESkillUnusableReason GetSkillUnusableReason(const FECSEntity &inout Entity, const USkillConfig SkillConfig)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    ESkillUnusableReason __r; return __r;
}
FECSEntity GetPawnEntityByAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    int local_10;
    FECSEntity local_4 = FASCommonUtils::GetLocalUniquePlayerEntity();
    for (auto& local_26 : local_10.GetAllPlayerPawnEntities())
    {
        if ((GetAvatarConfig(local_26) == AvatarConfig.opImplConv()))
        {
            return local_26;
        }
    }
    return local_4;
}
TArray<ESkillSlot> GetAvatarAllSkillSlots(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    TArrayConstIterator<FAvatarSkillSlotConfig> local_64;
    if (!(AvatarConfig))
    {
        return TArray<ESkillSlot>();
    }
    TArray<ESkillSlot> local_10;
    TDataObjectPtr<FAvatarSkillConfig> local_34 = GetSkillConfig();
    for (; local_64.CanProceed;)
    {
        local_10.AddUnique(local_64.Proceed().SkillSlot);
    }
    return local_10;
}
FEUIInputAction GetSkillInputAction(const FECSEntity &inout Entity, const FSkillCastHintData &inout SkillCastHintData)
{
    if (!(Entity.IsValid()))
    {
        return FEUIInputAction();
    }
    if (SkillCastHintData.SkillConfig != nullptr)
    {
        int local_12 = FSkillUtils::GetSkillIndex(Entity, SkillCastHintData.SkillConfig);
        if (local_12 != -1)
        {
            return FEUIInputAction(FSkillUtils::GetSkillInputAction(Entity, local_12));
        }
    }
    else
    {
        if (SkillCastHintData.InputTrigger != nullptr)
        {
            return FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(Entity, SkillCastHintData.InputTrigger.CoreTriggerItem.MainInputName.Name));
        }
        if (SkillCastHintData.InputAction != nullptr)
        {
            return FEUIInputAction(SkillCastHintData.InputAction);
        }
    }
    return FEUIInputAction();
}
FText GetSkillCastHintText(const FSkillCastHintData &inout SkillCastHintData)
{
    FText __return;
    if (SkillCastHintData.OverrideTextRow.IsSet())
    {
    }
    else
    {
        __return = FText();
    }
    return __return;
}
}
