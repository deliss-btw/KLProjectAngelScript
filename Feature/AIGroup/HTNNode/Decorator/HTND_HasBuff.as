

class UHTND_HasBuff : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityToCheck;
    UPROPERTY()
    FBuffConfigRef BuffConfig;

    default SetNodeName("Has Buff");

    UHTND_HasBuff()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_12 = FECSEntity(this.EntityToCheck.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            return FBuffUtils::HasBuff(local_12, this.BuffConfig);
        }
        return false;
    }
}

