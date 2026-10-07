

class UESMAction_CameraMuteCollision : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 MuteDistance = 100.0f;


    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.bExclusive = true;
        OutParam.IdentifyName = n"CameraMuteCollision";
        return;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(3);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_TPCameraMuteCollisionDistance local_12;
        local_12.StartTime = Time.WorldLastTime;
        local_12.EndTime = -1;
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            local_6.EndTime = Time.WorldTime;
        }
        return;
    }
}

