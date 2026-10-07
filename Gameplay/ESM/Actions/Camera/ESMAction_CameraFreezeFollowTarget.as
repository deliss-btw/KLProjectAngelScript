

class UESMAction_CameraFreezeFollowTarget : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bFreezeYawInLookAt = true;


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
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_FreezeCameraFollowTarget local_6;
        local_6.bFreezeYawInLookAt = this.bFreezeYawInLookAt;
        local_6.bPendingRecordFreeze = true;
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        FECSWorldPtr local_8 = Context.GetECSWorld();
        Assign local_12;
        local_12.opCall(FCS_TPCameraTeleportToTargetTag());
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
}

