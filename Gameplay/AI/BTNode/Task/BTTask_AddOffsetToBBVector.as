

class UBTTask_AddOffsetToBBVector : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;
    UPROPERTY()
    FVector Offset;

    default SetNodeName("Add Offset To BB Vector");

    UBTTask_AddOffsetToBBVector()
    {
        this.TargetLocation.SelectedKeyName = n"TargetLocation";
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        UBlackboardComponent local_2 = Context.GetOwnerComponent().GetBlackboardComponent();
        local_2.SetValueAsVector(this.TargetLocation.SelectedKeyName, (local_2.GetValueAsVector(this.TargetLocation.SelectedKeyName) + this.Offset));
        return EBTNodeResult(0);
    }
}

