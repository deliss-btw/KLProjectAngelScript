

class UHTNTask_FlockDataSync : UHTNTask_ECSScriptBase
{
    UHTNTask_FlockDataSync()
    {
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        FECSEntity local_4 = Context.GetControllerEntity();
        Get local_12;
        if (local_12.opCall())
        {
            this.SubmitPlanStep(1, "");
        }
        return;
    }
}

class UHTNTask_CalFlockLeaderToTargetDistance : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector DistanceSaveKey;

    default SetNodeName("CalFlockLeaderToTargetDistance");

    UHTNTask_CalFlockLeaderToTargetDistance()
    {
        this.DistanceSaveKey.AddFloatFilter(this, n"DistanceSaveKey");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        if (!(FECSEntity(local_6.LeaderEntity)))
        {
            return;
        }
        if (!(FECSEntity(local_6.GetMainTargetResource())))
        {
            return;
        }
        GetDefaulted local_26;
        FVector local_32 = local_26.opCall().GetPosition();
        HTNNode::SetWorldStateValueAsFloat(Context, this.DistanceSaveKey, float32(local_32.Dist2D(FVector(local_26.opCall().GetPosition()))));
        this.SubmitPlanStep(100, "");
        return;
    }
}

