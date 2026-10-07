

class US_ProgressOperationSystem : UECSScriptSystem
{
    US_ProgressOperationSystem()
    {
        return;
    }
    void DisposeUpdateProgressOperationInput(const FECSEntity &inout Entity, const FC_ProgressOperationMember &inout Member, const FC_Input &inout Input, FC_ESMTrigger &inout ESMTrigger, const FCS_FixedTime &inout FixedTime) const
    {
        const FProgressOperationConfig& local_10;
        int local_58 = 0;
        EProgressOperationState local_1;
        Get local_6;
        local_1 = local_6.opCall().GetState();
        for (auto& local_26 : local_10.InputActions)
        {
            if ((int(local_26.ResponseState) & (1 << int(local_1))) == 0)
            {
                continue;
            }
            if ((Member.GetbIsInitiator() && (int(local_26.InputType) == 0 || (int(local_26.InputType) == 2))) || (!(Member.GetbIsInitiator()) && (int(local_26.InputType) == 1 || (int(local_26.InputType) == 2))))
            {
                FActiveTriggerResult local_46 = local_26.InputTrigger.TestTrigger(Input.State, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
                if ((local_46.bActive && ((FFPTime(local_46.TriggerTime).opCmp(FixedTime.Time) <= 0))) && ((local_46.GetTriggerExpireTime().opCmp(FixedTime.LastTime) >= 0)))
                {
                    local_58.SetProgressValueWhenAccurateInput(local_58.GetProgressValue());
                    for (auto& local_78 : local_26.Actions)
                    {
                        local_78.ActivateAction(local_58, Entity);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateProgressOperationInput(const FECSEntity &inout Entity, const FC_ProgressOperationMember &inout Member, const FC_Input &inout Input, FC_ESMTrigger &inout ESMTrigger, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(Member.GetOperationEntity().IsValid()))
        {
            return;
        }
        this.DisposeUpdateProgressOperationInput(Entity, Member, Input, ESMTrigger, FixedTime);
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateProgressOperationInput(const FECSEntity &inout Entity, const FC_ProgressOperationMember &inout Member, const FC_Input &inout Input, FC_ESMTrigger &inout ESMTrigger, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(Member.GetOperationEntity().IsValid()))
        {
            return;
        }
        Get local_6;
        if (!(local_6.opCall().GetbLocalPrediction()))
        {
            return;
        }
        this.DisposeUpdateProgressOperationInput(Entity, Member, Input, ESMTrigger, FixedTime);
        return;
    }
    void DisposeUpdateProgressOperationRuntime(const FECSEntity &inout Entity, FC_ProgressOperationRuntime &inout ProgressOperationRuntime, const FCS_FixedTime &inout FixedTime) const
    {
        int local_12 = 0;
        int local_36 = 0;
        UProgressOperationBase local_4;
        local_4.Tick(ProgressOperationRuntime, FixedTime.DeltaTime);
        if (local_4.NeedEndOperation(ProgressOperationRuntime))
        {
            Remove local_20;
            local_12.SetFinalState(ProgressOperationRuntime.GetState());
            local_12.SetFinalProgressValue(ProgressOperationRuntime.GetProgressValue());
            local_12.SetFinalProgressMaxValue(ProgressOperationRuntime.GetProgressMaxValue());
            local_12.SetFinalProgressTime(float32(ProgressOperationRuntime.GetCurTime().ToSeconds()));
            local_12.SetFinalProgressTotalTime(float32(ProgressOperationRuntime.GetTotalTime().ToSeconds()));
            local_20.opCall();
            for (auto& local_34 : ProgressOperationRuntime.GetParticipantEntities())
            {
                local_34;
                local_36.SetFinalState(ProgressOperationRuntime.GetState());
                local_36.SetFinalProgressValue(ProgressOperationRuntime.GetProgressValue());
                local_36.SetFinalProgressMaxValue(ProgressOperationRuntime.GetProgressMaxValue());
                local_36.SetFinalProgressTime(float32(ProgressOperationRuntime.GetCurTime().ToSeconds()));
                local_36.SetFinalProgressTotalTime(float32(ProgressOperationRuntime.GetTotalTime().ToSeconds()));
                local_20.opCall();
            }
            if (ECS::GetRuntimeInfo().IsServer)
            {
                Remove local_40;
                local_40.opCall();
                Entity.DestroyDeferred();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateProgressOperationRuntime(const FECSEntity &inout Entity, FC_ProgressOperationRuntime &inout ProgressOperationRuntime, const FCS_FixedTime &inout FixedTime) const
    {
        this.DisposeUpdateProgressOperationRuntime(Entity, ProgressOperationRuntime, FixedTime);
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateProgressOperationRuntime(const FECSEntity &inout Entity, FC_ProgressOperationRuntime &inout ProgressOperationRuntime, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(ProgressOperationRuntime.GetbLocalPrediction()))
        {
            return;
        }
        this.DisposeUpdateProgressOperationRuntime(Entity, ProgressOperationRuntime, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_UpdateProgressOperationUI(const FECSEntity &inout Entity, const FC_ProgressOperationMember &inout Member, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        const FProgressOperationConfig& local_2;
        int local_10 = 0;
        if (!(local_2.UISoftWidgetClass.IsNull()) && Member.GetOperationEntity().IsValid())
        {
            TSoftClassPtr<UEUIUserWidget> local_20;
            local_20 = local_10.UIWidgetClass;
            if (!((local_20 == local_2.UISoftWidgetClass)))
            {
                ::ECSWorldLifetimePage::Close(local_10.PageHandle);
                FEUIWidgetRef local_22 = ::ECSWorldLifetimePage::OpenByClass(local_2.UISoftWidgetClass);
                if (local_22.IsValid())
                {
                    local_10.PageHandle = local_22;
                    local_10.UIWidgetClass = local_2.UISoftWidgetClass;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnProgressOperationEnd(const FECSEntity &inout Entity, const FC_ProgressOperationMember &inout Member) const
    {
        if (Entity.IsValid())
        {
            Modify local_6;
            FC_ProgressOperationUIData& local_8 = local_6.opCall();
            if (local_8)
            {
                local_8.PageHandle = FEUIWidgetRef();
                local_8.UIWidgetClass = nullptr;
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateProgressOperationInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.Job_UpdateProgressOperationInput(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateProgressOperationInput(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateProgressOperationInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.ClientJob_UpdateProgressOperationInput(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_UpdateProgressOperationInput(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateProgressOperationRuntime() const
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
                this.Job_UpdateProgressOperationRuntime(local_40, local_42, local_6);
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
            this.Job_UpdateProgressOperationRuntime(local_174, local_42, local_6);
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
    void Run_ClientJob_UpdateProgressOperationRuntime() const
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
                this.ClientJob_UpdateProgressOperationRuntime(local_40, local_42, local_6);
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
            this.ClientJob_UpdateProgressOperationRuntime(local_174, local_42, local_6);
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
    void Run_Job_UpdateProgressOperationUI() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_180 = 0;
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
                this.Job_UpdateProgressOperationUI(local_46, local_48, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_46 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_UpdateProgressOperationUI(local_180, local_48, local_12);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnProgressOperationEnd() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProgressOperationMemberOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnProgressOperationEnd(local_46, local_52);
        }
        return;
    }
}

