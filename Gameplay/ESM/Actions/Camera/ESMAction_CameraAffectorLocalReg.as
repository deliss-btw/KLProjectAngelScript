class UESMAction_CameraAffectorLocalReg : UESMBPBaseSpanAction
{
    UPROPERTY()
    FCameraAffectorItem AffectorItem;
    UPROPERTY()
    bool bSuppressWarningWithoutValidAffector = false;

    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
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
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.GetDefaultEntity(Context).IsValid()))
        {
            return;
        }
        Modify local_14;
        FC_CameraAffector& local_16 = local_14.opCall();
        if (local_16)
        {
            local_16.PushOverride(this.AffectorItem, this.GetDataPathName());
        }
        else
        {
            if (this.bSuppressWarningWithoutValidAffector)
            {
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.GetDefaultEntity(Context).IsValid()))
        {
            return;
        }
        Modify local_14;
        FC_CameraAffector& local_16 = local_14.opCall();
        if (local_16)
        {
            local_16.PopOverride(this.GetDataPathName());
        }
        else
        {
            if (this.bSuppressWarningWithoutValidAffector)
            {
            }
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
    {
        Get local_4;
        const FC_LocalToDefault& local_6 = local_4.opCall();
        if (local_6)
        {
            return FECSEntity(local_6.DefaultEntityId);
        }
        return ENTITY_NULL;
    }
}

