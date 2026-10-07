

class UHTNService_EcologyNoResourceFlockUpdate : UHTNService_ECSScriptBase
{
    UHTNService_EcologyNoResourceFlockUpdate()
    {
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        int local_10 = 0;
        FECSEntity::Modify<FC_EcologyFlockBehaviorComponent> local_8 = FECSEntity::Modify<FC_EcologyFlockBehaviorComponent>(FECSEntity(Context.PawnEntity));
        if ((int(local_10.NoResourceData.FlockUpdatePolicy)) == 1)
        {
            local_10.BehaviorSubTask.bUpdatePosition = true;
            FC_UpdateFlockSubTaskTag local_22;
            Assign local_20;
            local_20.opCall(local_22);
        }
        return;
    }
    UFUNCTION()
    void ExecutionFinish_Implementation(const FHTNContext &inout Context, const EHTNNodeResult NodeResult)
    {
        int local_16 = 0;
        FECSEntity::Remove<FC_UpdateFlockSubTaskTag>(FECSEntity(Context.PawnEntity)).opCall();
        local_16.BehaviorSubTask.bUpdatePosition = false;
        return;
    }
}

