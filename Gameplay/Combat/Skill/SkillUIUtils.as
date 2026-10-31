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
    USkillConfig SkillConfig = nullptr;
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
    int local_2 = FSkillUtils::GetSkillIndex(Entity, SkillConfig);
    if (local_2 != INDEX_NONE)
    {
        bool local_4;
        const FC_SkillInstance& local_6 = FSkillUtils::GetSkillInstance(Entity, local_2, local_4);
        FFPTime local_8 = FFPTime(ECS::GetContextTime());
        if (local_6.GetCDRemainTime(local_8).opCmp(0.0) > 0)
        {
            return ESkillUnusableReason(1);
        }
        if (!(FSkillUtils::IsConsumeAttributeEnough(Entity, local_6, local_8)))
        {
            return ESkillUnusableReason(2);
        }
        if (local_6.GetConsumeConfig().ConsumeItemRow.IsValid())
        {
            if (InventoryUtils::GetInventoryItemNumber(Entity, TDataObjectPtr<FItemConfig>(local_6.GetConsumeConfig().ConsumeItemRow)) < int(local_6.GetConsumeConfig().ConsumeItemNumber))
            {
                return ESkillUnusableReason(3);
            }
        }
        if (!(Entity) || !(local_6.GetUseConditionConfig().UsableValidation.Evaluate(Entity)))
        {
            return ESkillUnusableReason(4);
        }
    }
    return ESkillUnusableReason(0);
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
    if (!(AvatarConfig))
    {
        return TArray<ESkillSlot>();
    }
    TArray<ESkillSlot> local_10;
    TDataObjectPtr<FAvatarSkillConfig> local_34 = AvatarConfig.Get().GetSkillConfig();
    for (auto& local_72 : local_34.Get().SkillInitConfigs)
    {
        local_10.AddUnique(local_72.SkillSlot);
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
    if (SkillCastHintData.OverrideTextRow.IsSet())
    {
        return SkillCastHintData.OverrideTextRow.Get().Text;
    }
    return FText();
}
}
