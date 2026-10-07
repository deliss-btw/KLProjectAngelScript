

class US_CameraPostProcess : UECSScriptSystem
{
    US_CameraPostProcess()
    {
        return;
    }
    UFUNCTION()
    void Job_UpdateCameraPostProcessAnimLifeTime(const FECSEntity &inout Entity, FC_CameraPostProcessAnim &inout CameraPostProcessAnim, const FCS_FixedTime &inout FixedTime) const
    {
        const TArray<FCameraPostProcessAnimRange>& local_2 = CameraPostProcessAnim.GetAnims();
        int local_6 = local_2.Num() - 1;
        for (; local_6 >= 0; --local_6)
        {
            const FCameraPostProcessAnimRange& local_10 = local_2[local_6];
            if (FFPTime(local_10.GetDuration()).opCmp(0.0) < 0)
            {
                continue;
            }
            FFPTime local_16 = (FFPTime(local_10.GetStartTime()) + local_10.GetDuration());
            if (FFPTime(FixedTime.Time).opCmp((local_16 + FFPTime(0.2))) >= 0)
            {
                CameraPostProcessAnim.GetModify_Anims().RemoveAtSwap(local_6);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateCameraPostProcessAnim(const FECSEntity &inout Entity, const FC_CameraPostProcessAnim &inout CameraPostProcessAnim, const FCS_LocalPlayer &inout Player) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Monitor_ClearCameraPostProcess(const FC_CameraPostProcessAnimResource &inout Resource) const
    {
        int local_8 = 0;
        UMaterialInstanceDynamic local_30;
        FECSWorldPtr local_2 = this.GetECSWorld();
        for (auto& local_28 : Resource.DataMap)
        {
            local_28;
            local_8.RemoveBlendable(local_30);
        }
        for (auto& local_48 : Resource.EsmMaterialsMap)
        {
            local_48;
            local_8.RemoveBlendable(local_30);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_OutputPostProcess(const FCS_LocalPlayer &inout Player) const
    {
        AECSPlayerController local_12;
        APXECSPlayerController local_16;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        const FCS_CameraPostProcess& local_8 = local_6.opCall();
        if (local_8)
        {
            local_12 = Player.UEPlayerController;
            local_16 = (Cast<APXECSPlayerController>(local_12));
            if (local_16 != nullptr)
            {
                local_16.PostProcessSettings = local_8.Settings;
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCameraPostProcessAnimLifeTime() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateCameraPostProcessAnimLifeTime(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateCameraPostProcessAnimLifeTime(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateCameraPostProcessAnim() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_172 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_UpdateCameraPostProcessAnim(local_46, local_48, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_90.Iterator();
        for (; local_134.CanProceed;)
        {
            local_46 = local_134.Proceed();
            ++local_100;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_UpdateCameraPostProcessAnim(local_172, local_48, local_12);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClearCameraPostProcess() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCameraPostProcessAnimResourceOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClearCameraPostProcess(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OutputPostProcess() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ClientJob_OutputPostProcess(local_12);
        return;
    }
}

