

class UHTNDecorator_CheckFlockState : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector DesiredFlockState;

    UHTNDecorator_CheckFlockState()
    {
        this.DesiredFlockState.AddEnumFilter(this, n"FlockBehaviorState", EnumType());
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        FC_EcologyFlockBehaviorComponent local_14;
        int local_16 = int(local_14.MainState);
        return (local_16 == Context.GetBlackboardComponent().GetValueAsInt(this.DesiredFlockState.SelectedKeyName));
    }
}

