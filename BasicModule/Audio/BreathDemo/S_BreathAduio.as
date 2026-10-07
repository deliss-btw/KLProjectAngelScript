

class US_BreathAudio : UECSScriptSystem
{
    US_BreathAudio()
    {
        return;
    }
    UFUNCTION()
    void Monitor_BreathAudioConstruct(const FECSEntity &inout Entity, const FC_BreathAudioConfig &inout BreathAudioConfig) const
    {
        if (BreathAudioConfig.Settings == nullptr)
        {
            return;
        }
        UBreathAudioSettings local_12 = BreathAudioConfig.Settings;
        FC_BreathAudio local_10;
        local_10.Settings = local_12;
        FGameAudioUtils::SetRTPC(Entity, local_12.HeartRateRtpc, local_10.BreathWeight, -1);
        ::BreathAudioUtils::PlayBreathSound(Entity, local_12.BreathAudioEvent, local_12.BreathStopAudioEvent);
        return;
    }
    UFUNCTION()
    void ClientJob_BreathAudioUpdate(const FECSEntity &inout Entity, FC_BreathAudio &inout BreathAudio) const
    {
        UBreathAudioSettings local_4;
        EBreathAudioState local_6;
        float32 local_19;
        if (local_4 == nullptr)
        {
            return;
        }
        if (BreathAudio.bBreathStateSet)
        {
            local_6 = BreathAudio.BreathState;
        }
        else
        {
            local_6 = EBreathAudioState(0);
        }
        float32 local_9 = 0.0f;
        local_4.BreathAudioStateWeightMap.Find(local_6, local_9);
        FNameHandle_EntityBBVarBool local_16;
        local_16;
        BreathAudio.bIsInCombat = Entity.GetBB_Bool(local_16);
        if (BreathAudio.bIsInCombat)
        {
            local_9 = local_9 + local_4.CombatAdditiveWeight;
        }
        local_9 = FMath::Clamp(local_9, 0.0f, 1.0f);
        if (!(local_4.CustomBlendSpeeds.Find(FBreathAudioBlendKey(EBreathAudioState(BreathAudio.PrevBreathState), EBreathAudioState(local_6)), local_19)) == (!(false)))
        {
            local_19 = local_4.DefaultBlendSpeed;
        }
        BreathAudio.BreathWeight = FMath::FInterpConstantTo(BreathAudio.BreathWeight, local_9, float32(ECS::GetContextDeltaTime().ToSeconds()), local_19);
        FGameAudioUtils::SetRTPC(Entity, local_4.HeartRateRtpc, BreathAudio.BreathWeight, -1);
        ::BreathAudioUtils::PlayBreathSound(Entity, local_4.BreathAudioEvent, local_4.BreathStopAudioEvent);
        return;
    }
    UFUNCTION()
    void Run_Monitor_BreathAudioConstruct() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBreathAudioConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_BreathAudioConstruct(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_BreathAudioUpdate() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
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
                this.ClientJob_BreathAudioUpdate(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_BreathAudioUpdate(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

