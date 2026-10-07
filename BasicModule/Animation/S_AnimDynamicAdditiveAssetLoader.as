

class US_AnimDynamicAdditiveAssetLoader : UECSScriptSystem
{
    US_AnimDynamicAdditiveAssetLoader()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnConfigAssigned(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveConfig &inout Config) const
    {
        if (!(Config.GetConfigPtr()))
        {
            return;
        }
        FAnimDynamicAdditiveConfig local_34;
        TArray<FSoftObjectPath> local_70;
        FSoftObjectPath local_86 = local_34.SourceSequence.ToSoftObjectPath();
        FSoftObjectPath local_78 = local_34.TargetSequence.ToSoftObjectPath();
        if (local_86.IsValid())
        {
            local_70.Add(local_86);
        }
        if (local_78.IsValid())
        {
            local_70.Add(local_78);
        }
        if (local_70.Num() > 0)
        {
            FComponentAssetPoolHelper::RequestAsyncLoadAssetsForEntity(Entity, n"FC_AnimParamDynamicAdditiveConfig", local_70);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnConfigRemoved(const FECSEntity &inout Entity, const FC_AnimParamDynamicAdditiveConfig &inout Config) const
    {
        FComponentAssetPoolHelper::ReleaseEntityComponentAssets(Entity, n"FC_AnimParamDynamicAdditiveConfig");
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnConfigAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAnimParamDynamicAdditiveConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnConfigAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnConfigRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAnimParamDynamicAdditiveConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnConfigRemoved(local_46, local_52);
        }
        return;
    }
}

