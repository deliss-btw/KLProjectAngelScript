

class UHTNDecorator_CheckDynamicTreeValid : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_GameplayTag DynamicTreeTag;

    default SetNodeName("CheckDynamicTreeValid");

    UHTNDecorator_CheckDynamicTreeValid()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        return Context.HasDynamicSubHTN(this.DynamicTreeTag.GetValue(Context.opImplConv()));
    }
}

