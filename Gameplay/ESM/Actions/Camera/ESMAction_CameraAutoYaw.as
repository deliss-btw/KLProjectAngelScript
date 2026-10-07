

class UESMAction_CameraAutoYaw : UESMBPBaseSpanAction
{
    UESMAction_CameraAutoYaw()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(3);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        const FC_ControlledByPlayer& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = local_6.GetPlayerEntity();
            ModifyOrAdd local_16;
            FC_CameraAutoYawControl& local_18 = local_16.opCall();
            if (local_18)
            {
                int local_19 = int(local_18.AutoYawCounter) + 1;
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        const FC_ControlledByPlayer& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = local_6.GetPlayerEntity();
            Modify local_16;
            FC_CameraAutoYawControl& local_18 = local_16.opCall();
            if (local_18)
            {
                int local_21 = FMath::Max(0, (int(local_18.AutoYawCounter) - 1));
            }
        }
        return;
    }
}

class UESMAction_CameraAutoYawEnable : UESMBPBaseSpanAction
{
    UESMAction_CameraAutoYawEnable()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(3);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        const FC_ControlledByPlayer& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = local_6.GetPlayerEntity();
            ModifyOrAdd local_16;
            FC_CameraAutoYawControl& local_18 = local_16.opCall();
            if (local_18)
            {
                int local_19 = int(local_18.EnableCounter) + 1;
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        const FC_ControlledByPlayer& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = local_6.GetPlayerEntity();
            Modify local_16;
            FC_CameraAutoYawControl& local_18 = local_16.opCall();
            if (local_18)
            {
                int local_21 = FMath::Max(0, (int(local_18.EnableCounter) - 1));
            }
        }
        return;
    }
}

