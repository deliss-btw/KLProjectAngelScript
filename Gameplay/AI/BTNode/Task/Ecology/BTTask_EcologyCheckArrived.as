

class UBTTask_EcologyCheckArrived : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;
    UPROPERTY()
    FBlackboardKeySelector OutResult;
    UPROPERTY()
    float32 ArrivedTolerance;

    default SetNodeName("Ecology Check Arrived");

    UBTTask_EcologyCheckArrived()
    {
        this.ArrivedTolerance = 100.0f;
        this.TargetLocation.SelectedKeyName = n"LEcologyTargetLocation";
        this.TargetLocation.AddVectorFilter(this, n"LEcologyTargetLocation");
        this.OutResult.SelectedKeyName = n"bIsChangeAreaArrived";
        this.OutResult.AddBoolFilter(this, n"bIsChangeAreaArrived");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_16 = 0;
        int local_40;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_8 = Context.GetOwnerComponent().GetBlackboardComponent();
        if (!(local_16))
        {
            local_8.SetValueAsBool(this.OutResult.SelectedKeyName, false);
            return EBTNodeResult(1);
        }
        float local_32 = local_16.GetPosition().DistSquared2D(local_8.GetValueAsVector(this.TargetLocation.SelectedKeyName));
        if (!(local_40))
        {
            local_8.SetValueAsBool(this.OutResult.SelectedKeyName, false);
            return EBTNodeResult(1);
        }
        float32 local_42 = local_40.GetScaledRadius() + this.ArrivedTolerance;
        if (local_32 < (local_42 * local_42))
        {
            local_8.SetValueAsBool(this.OutResult.SelectedKeyName, true);
            return EBTNodeResult(0);
        }
        local_8.SetValueAsBool(this.OutResult.SelectedKeyName, false);
        return EBTNodeResult(1);
    }
}

