

class UBTDecorator_HasBuff : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityToCheck;
    UPROPERTY()
    FBuffConfigRef BuffConfig;

    default SetNodeName("Has Buff");

    UBTDecorator_HasBuff()
    {
        return;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return (FString(": ") + this.BuffConfig.GetBuffName());
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        if (Context.GetBlackboardComponent() != nullptr)
        {
            FECSEntity local_14 = FECSEntity(this.EntityToCheck.GetValue(Context.opImplConv()));
            if (local_14)
            {
                return FBuffUtils::HasBuff(local_14, this.BuffConfig);
            }
        }
        return false;
    }
}

