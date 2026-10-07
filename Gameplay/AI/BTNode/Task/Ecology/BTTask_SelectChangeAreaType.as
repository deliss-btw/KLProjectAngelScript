

class UBTTask_SelectChangeAreaType : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocationKey;
    UPROPERTY()
    FBlackboardKeySelector OutChangeAreaType;
    UPROPERTY()
    float32 DistanceLimit;

    default SetNodeName("SelectChangeAreaType");

    UBTTask_SelectChangeAreaType()
    {
        this.TargetLocationKey.SelectedKeyName = n"LEcologyTargetLocation";
        this.TargetLocationKey.AddVectorFilter(this, n"LEcologyTargetLocation");
        this.OutChangeAreaType.SelectedKeyName = n"LChangeAreaType";
        this.OutChangeAreaType.AddIntFilter(this, n"LChangeAreaType");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_10 = 0;
        int local_22 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        UBlackboardComponent local_14 = Context.GetBlackboardComponent();
        if (!(local_22))
        {
            return EBTNodeResult(1);
        }
        int local_23 = 0;
        FVector local_30 = local_14.GetValueAsVector(this.TargetLocationKey.SelectedKeyName);
        if (!(FAIPathSessionUtils::IsPathConnectedForEntity(local_4, local_22.GetPosition(), local_30)))
        {
            local_23 = 1;
        }
        if (local_23 == 0)
        {
            if (local_22.GetPosition().DistSquared2D(local_30) > (this.DistanceLimit * this.DistanceLimit))
            {
                local_23 = 1;
            }
        }
        local_14.SetValueAsInt(this.OutChangeAreaType.SelectedKeyName, local_23);
        return EBTNodeResult(0);
    }
}

