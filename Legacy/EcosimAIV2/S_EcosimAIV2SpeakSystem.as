

class US_EcosimAIV2SpeakSystem : UECSScriptSystem
{
    US_EcosimAIV2SpeakSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_SpeakProgressEnd(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_EcosimAIV2SpeakProgress &inout EcosimAIV2SpeakProgress) const
    {
        if (FFPTime(FixedTime.Time).opCmp(EcosimAIV2SpeakProgress.TargetWorldTime) >= 0)
        {
            ::FEcosimAIV2Utils::CloseEntityPublicSpeak(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdatePublicSpeakByDistance(const FECSEntity &inout Entity, FC_EcosimAIV2PublicSpeakByDistance &inout EcosimAIV2PublicSpeakByDistance, const FC_Transform &inout Transform) const
    {
        if (EcosimAIV2PublicSpeakByDistance.CachedPlayerControllerList.IsEmpty())
        {
            FECSRuntimeView local_42 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
            Include local_46;
            local_46.opCall();
            FECSRuntimeViewIterator local_80 = local_42.Iterator();
            for (; local_80.CanProceed;)
            {
                EcosimAIV2PublicSpeakByDistance.CachedPlayerControllerList.Add(local_80.Proceed());
            }
        }
        FFPTime local_120 = EcosimAIV2PublicSpeakByDistance.LastTriggerTime;
        if (local_120.opCmp(0.0) >= 0)
        {
            if (float32(((ECS::GetContextTime() - EcosimAIV2PublicSpeakByDistance.LastTriggerTime).ToSeconds())) < EcosimAIV2PublicSpeakByDistance.TriggerMinInterval)
            {
                return;
            }
        }
        FVector local_134 = Transform.GetPosition();
        Get local_150;
        for (auto local_116 : EcosimAIV2PublicSpeakByDistance.CachedPlayerControllerList)
        {
            local_116;
            if (local_150.opCall())
            {
                GetDefaulted local_156;
                if (local_134.DistSquared2D(FVector(local_156.opCall().GetPosition())) <= (EcosimAIV2PublicSpeakByDistance.SpeakTriggerDistance * EcosimAIV2PublicSpeakByDistance.SpeakTriggerDistance))
                {
                    EcosimAIV2PublicSpeakByDistance.LastTriggerTime = ECS::GetContextTime();
                    ::FEcosimAIV2Utils::EntityPublicSpeakByLLMPublicSpeakData(Entity, EcosimAIV2PublicSpeakByDistance.SpeakData);
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2ClearPublicSpeakDataKeyTimeRecord(const FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord &inout Event) const
    {
        const FEcosimAIV2LLMPublicSpeakData& local_6;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (local_6.SpeakKeyTag.IsValid())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            Modify local_14;
            if (local_14.opCall())
            {
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2PublicSpeakByData(const FCE_EcosimAIV2PublicSpeakByData &inout Event) const
    {
        const FEcosimAIV2LLMPublicSpeakData& local_6;
        int local_18 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (local_6.SpeakKeyTag.IsValid() && (local_6.MinSpeakInterval > 0.0f))
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            FFPTime& local_20 = local_18.PublicSpeakTimeByTag.FindOrAdd(local_6.SpeakKeyTag);
            if (((ECS::GetContextTime() - local_20).ToSeconds()) < local_6.MinSpeakInterval)
            {
                return;
            }
            FFPTime& local_20_2 = ECS::GetContextTime();
        }
        if (FEcosimAIV2Utils::CVar_EcosimAIV2_LLMPublicSpeak.GetBool())
        {
            ::FEcosimAIV2Utils::EntityPublicSpeakBySimpleLLM(local_6.PromptFileName, local_6.AdditionalContext, local_4);
        }
        else
        {
            ::FEcosimAIV2Utils::EntityPublicSpeak(local_4, local_6.ConstContent, local_6.ConstDuration);
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientSpeakerAdded(const FC_EntityDialog &inout Dialog, const FECSEntity &inout Entity) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        ModifyOrAdd local_6;
        local_6.opCall().GetModify_Entities().AddUnique(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_ClientSpeakerRemoved(const FC_EntityDialog &inout Dialog, const FECSEntity &inout Entity) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        if (local_6.opCall())
        {
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateEntityDialogSpeakersInRange(FCS_EntityDialogSpeakers &inout Speakers, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        TArray<FECSEntity> local_4;
        int local_20 = 0;
        int local_52 = 0;
        int local_58 = 0;
        if (LocalPlayer.GetPlayerPawnEntity().IsValid())
        {
            if (local_20)
            {
                float32 local_21 = 5000.0f;
                float32 local_22 = local_21 * local_21;
                FVector local_30 = local_20.GetPosition();
                for (auto& local_44 : Speakers.GetEntities())
                {
                    if (!(local_44.IsValid()) || !(local_44.IsActive()))
                    {
                        continue;
                    }
                    if (!(local_52) || local_52.GetDialogText().IsEmpty())
                    {
                        continue;
                    }
                    if (!(local_58))
                    {
                        continue;
                    }
                    if (local_30.DistSquared(local_58.GetPosition()) < local_22)
                    {
                        local_4.Add(local_44);
                    }
                }
            }
        }
        TArray<FECSEntity> local_68;
        local_68 = Speakers.GetInRangeEntities();
        if (!((local_68 == local_4)))
        {
            Speakers.SetInRangeEntities(local_4);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_SpeakProgressEnd(const FC_EcosimAIV2SpeakProgress &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetWorldTime;
        FName local_8 = FName("S_EcosimAIV2SpeakSystem::Job_SpeakProgressEnd");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_SpeakProgressEnd(const FC_EcosimAIV2SpeakProgress &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetWorldTime;
        FName local_8 = FName("S_EcosimAIV2SpeakSystem::Job_SpeakProgressEnd");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_SpeakProgressEnd() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcosimAIV2SpeakProgressOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_SpeakProgressEnd(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorEcosimAIV2SpeakProgressOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_SpeakProgressEnd(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_SpeakProgressEnd() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcosimAIV2SpeakProgressOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_SpeakProgressEnd(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorEcosimAIV2SpeakProgressOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_SpeakProgressEnd(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpeakProgressEnd() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.TargetWorldTime;
            if (local_44.opCmp(0.0) < 0 || (local_42.TargetWorldTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.Job_SpeakProgressEnd(local_50, local_6, local_52);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePublicSpeakByDistance() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
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
                this.Job_UpdatePublicSpeakByDistance(local_40, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_EcosimAIV2PublicSpeakByDistance> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdatePublicSpeakByDistance(local_180, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_EcosimAIV2PublicSpeakByDistance>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2ClearPublicSpeakDataKeyTimeRecord() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2ClearPublicSpeakDataKeyTimeRecord& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2ClearPublicSpeakDataKeyTimeRecord(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2PublicSpeakByData() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2PublicSpeakByData> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2PublicSpeakByData& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2PublicSpeakByData(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientSpeakerAdded() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEntityDialogOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientSpeakerAdded(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientSpeakerRemoved() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEntityDialogOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientSpeakerRemoved(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateEntityDialogSpeakersInRange() const
    {
        int local_18 = 0;
        int local_24 = 0;
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(1))))
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_3 = this.GetECSWorld();
        FECSWorldPtr local_8_4 = this.GetECSWorld();
        this.ClientJob_UpdateEntityDialogSpeakersInRange(local_18, local_24);
        FECSWorldPtr local_8_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_32;
        local_32.opCall(local_18);
        return;
    }
}

