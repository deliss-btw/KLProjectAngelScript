

class US_VisualScaleModifySystem : UECSScriptSystem
{
    US_VisualScaleModifySystem()
    {
        return;
    }
    FVector EvaluateBlendOutScale(const FC_VisualScaleModifyBlendOut &inout BlendOut, const FFPTime &inout CurrentTime) const
    {
        if (BlendOut.GetBlendOutTime() <= 0.0f)
        {
            return BlendOut.GetTargetVisualScale();
        }
        float local_14 = FMath::Clamp((CurrentTime - BlendOut.GetBlendOutStartTime()).ToSeconds(), 0.0, BlendOut.GetBlendOutTime());
        return FMath::Lerp(BlendOut.GetInitialVisualScale(), BlendOut.GetTargetVisualScale(), (float32(local_14) / BlendOut.GetBlendOutTime()));
    }
    UFUNCTION()
    void ClientJob_TickVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity, const FC_VisualScaleModifyBlendInAndHold &inout BlendInAndHold) const
    {
        if (BlendInAndHold.GetBlendInTime() > 0.0f)
        {
            float local_10 = (ECS::GetContextTime() - BlendInAndHold.GetBlendInStartTime()).ToSeconds();
            FVector local_26 = FMath::Lerp(BlendInAndHold.GetInitialVisualScale(), BlendInAndHold.GetTargetVisualScale(), ((FMath::Clamp(float32(local_10), 0.0f, BlendInAndHold.GetBlendInTime())) / BlendInAndHold.GetBlendInTime()));
            FECSActorProxy local_30 = Entity.ModifyActor();
            if (local_30)
            {
                FTransform& local_36 = local_30.ModifyTransform();
                local_36.SetScale3D(local_26);
            }
            return;
        }
        if (BlendInAndHold.GetBlendInTime() == 0.0f)
        {
            FECSActorProxy local_34 = Entity.ModifyActor();
            if (local_34)
            {
                FTransform& local_36_2 = local_34.ModifyTransform();
                local_36_2.SetScale3D(BlendInAndHold.GetTargetVisualScale());
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickVisualScaleModifyBlendOut(const FECSEntity &inout Entity, const FC_VisualScaleModifyBlendOut &inout BlendOut) const
    {
        FVector local_14 = this.EvaluateBlendOutScale(BlendOut, ECS::GetContextTime());
        FECSActorProxy local_18 = Entity.ModifyActor();
        if (local_18)
        {
            FTransform& local_26 = local_18.ModifyTransform();
            local_26.SetScale3D(local_14);
        }
        return;
    }
    UFUNCTION()
    void Monitor_RetargetVisualScaleModifyBlendOut(const FECSEntity &inout Entity, const FC_Scale &inout Scale) const
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_12) || (FVector(local_12.GetTargetVisualScale()) == Scale.Scale))
        {
            return;
        }
        FFPTime local_22 = FFPTime(this.GetECSWorld().GetFixedTime().Time);
        float local_30 = (local_22 - local_12.GetBlendOutStartTime()).ToSeconds();
        float32 local_31 = float32(local_30);
        if (local_12.GetBlendOutTime() > 0.0f)
        {
            float32 local_35;
            local_35 = FMath::Max((local_12.GetBlendOutTime() - local_31), 0.0f);
        }
        else
        {
            float32 local_35;
            local_35 = 0.0f;
        }
        FVector local_18 = this.EvaluateBlendOutScale(local_12, local_22);
        Modify local_46;
        FC_VisualScaleModifyBlendOut& local_48 = local_46.opCall();
        if (local_48)
        {
            float32 local_35;
            local_48.SetInitialVisualScale(local_18);
            local_48.SetTargetVisualScale(Scale.Scale);
            local_48.SetBlendOutStartTime(local_22);
            local_48.SetBlendOutTime(local_35);
        }
        return;
    }
    UFUNCTION()
    void Job_RemoveVisualScaleModifyBlendOut(const FECSEntity &inout Entity, const FC_VisualScaleModifyBlendOut &inout BlendOut, const FCS_FixedTime &inout Time) const
    {
        if (FFPTime(Time.Time).opCmp(BlendOut.GetRemoveTime()) >= 0)
        {
            Remove local_8;
            local_8.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickVisualScaleModifyBlendInAndHold() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_TickVisualScaleModifyBlendInAndHold(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickVisualScaleModifyBlendInAndHold(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickVisualScaleModifyBlendOut() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_TickVisualScaleModifyBlendOut(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickVisualScaleModifyBlendOut(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RetargetVisualScaleModifyBlendOut() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorScaleOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RetargetVisualScaleModifyBlendOut(local_46, local_52);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_RemoveVisualScaleModifyBlendOut(const FC_VisualScaleModifyBlendOut &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetRemoveTime());
        FName local_8 = FName("S_VisualScaleModifySystem::Job_RemoveVisualScaleModifyBlendOut");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_RemoveVisualScaleModifyBlendOut(const FC_VisualScaleModifyBlendOut &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetRemoveTime());
        FName local_8 = FName("S_VisualScaleModifySystem::Job_RemoveVisualScaleModifyBlendOut");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_RemoveVisualScaleModifyBlendOut(const FC_VisualScaleModifyBlendOut &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetRemoveTime());
        FName local_8 = FName("S_VisualScaleModifySystem::Job_RemoveVisualScaleModifyBlendOut");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_RemoveVisualScaleModifyBlendOut() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorVisualScaleModifyBlendOutOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_RemoveVisualScaleModifyBlendOut(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorVisualScaleModifyBlendOutOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_RemoveVisualScaleModifyBlendOut(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_RemoveVisualScaleModifyBlendOut() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorVisualScaleModifyBlendOutOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_RemoveVisualScaleModifyBlendOut(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorVisualScaleModifyBlendOutOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_RemoveVisualScaleModifyBlendOut(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_RemoveVisualScaleModifyBlendOut() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorVisualScaleModifyBlendOutOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_RemoveVisualScaleModifyBlendOut(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorVisualScaleModifyBlendOutOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_RemoveVisualScaleModifyBlendOut(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveVisualScaleModifyBlendOut() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetRemoveTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetRemoveTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_RemoveVisualScaleModifyBlendOut(local_68, local_70, local_6);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
}

