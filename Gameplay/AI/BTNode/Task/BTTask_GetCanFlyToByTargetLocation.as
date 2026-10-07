

class UBTTask_GetCanFlyToByTargetLocation : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector EntityCanFly;
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;
    UPROPERTY()
    FBlackboardKeySelector TryFlyToTargetLocation;
    UPROPERTY()
    float32 MaxGroundMovePathLength;

    default SetNodeName("Get Can Fly To By Target Location");

    UBTTask_GetCanFlyToByTargetLocation()
    {
        this.MaxGroundMovePathLength = 5000.0f;
        this.EntityCanFly.AddBoolFilter(this, n"EntityCanFly");
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        this.TryFlyToTargetLocation.SelectedKeyName = n"TryFlyToTargetLocation";
        this.TryFlyToTargetLocation.AddBoolFilter(this, n"TryFlyToTargetLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        UBlackboardComponent local_6 = Context.GetOwnerComponent().GetBlackboardComponent();
        FVector local_22 = local_6.GetValueAsVector(this.TargetLocation.SelectedKeyName);
        GetDefaulted local_32;
        FVector local_28 = local_32.opCall().GetPosition();
        float32 local_33 = 100.0f;
        Get local_38;
        const FC_Collision& local_40 = local_38.opCall();
        if (local_40)
        {
            local_33 = local_40.GetScaledHalfHeight();
        }
        if (local_6.GetValueAsBool(this.EntityCanFly.SelectedKeyName))
        {
            float32 local_34 = FAINavigationUtils::EstimateGroundPathLengthTo(local_4, local_22);
            if ((local_34 < 0.0f || (local_34 >= this.MaxGroundMovePathLength)))
            {
                if (FAINavigationUtils::EstimateAirPathLengthTo(local_4, local_22) > 0.0f)
                {
                    local_6.SetValueAsBool(this.TryFlyToTargetLocation.SelectedKeyName, true);
                    return EBTNodeResult(0);
                }
            }
            if (local_34 >= 0.0f)
            {
                local_6.SetValueAsBool(this.TryFlyToTargetLocation.SelectedKeyName, false);
                return EBTNodeResult(0);
            }
            local_6.SetValueAsBool(this.TryFlyToTargetLocation.SelectedKeyName, false);
            return EBTNodeResult(0);
        }
        local_6.SetValueAsBool(this.TryFlyToTargetLocation.SelectedKeyName, false);
        return EBTNodeResult(0);
    }
}

