

class US_EnergyBallSystem : UECSScriptSystem
{
    US_EnergyBallSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_OnCharacterDeath(const FCE_DeathEvent &inout Event) const
    {
        ::EnergyBallUtils::TryDropDeathEnergyBall(Event.Sender, Event.Time);
        return;
    }
    UFUNCTION()
    void Job_DispatchSpawnEnergyBallEvent(const FCE_SpawnEnergyBall &inout SpawnEnergyBall) const
    {
        int local_8 = 0;
        int local_44 = 0;
        int local_60 = 0;
        int local_66 = 0;
        int local_124 = 0;
        TSubclassOf<AECSPrefab> local_2 = SpawnEnergyBall.Prefab.Get();
        if (!(local_2.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        FECSEntity local_18 = FECSEntity(local_8.PlayerEntity);
        if ((!((local_18 == SpawnEnergyBall.Sender))))
        {
            return;
        }
        AEnergyBallPrefab local_20 = local_2.GetDefaultObject();
        float32 local_23 = SpawnEnergyBall.MoveTime;
        FECSEntity local_18_2 = ECS::RequestEntityByPrefabDeferred(local_2, SpawnEnergyBall.OriginLocation, FRotator::ZeroRotator, EPrefabCollisionAlignment(0), EECSRegType(2), false);
        FECSEntity local_34 = FECSEntity(SpawnEnergyBall.Sender);
        ModifyOrAdd local_38;
        local_38.opCall().SetOwnerEntity(local_34);
        FECSWorldPtr local_10_2 = this.GetECSWorld();
        Get local_48;
        local_44.SetSpawnTime(local_48.opCall().Time);
        FC_EnergyBall local_22;
        local_44.SetLifeDuration(FFPTime(((local_23 + local_22.DelayFadeoutSeconds) + local_22.FadeoutSeconds)));
        local_60.SetMoveBeginTime(ECS::GetContextTime());
        local_60.SetMoveTotalTime(FFPTime(local_23));
        local_66.Target = local_34;
        FVector local_72(FVector::UpVector);
        Get local_76;
        const FC_PlayerController& local_78 = local_76.opCall();
        if (local_78)
        {
            if (local_78.GetPlayerPawnEntity())
            {
                local_72 = (SpawnEnergyBall.OriginLocation - 0.GetPosition()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            }
        }
        if (local_22.LeftRandomVelocityRotations.Num() > 0 && (local_22.RightRandomVelocityRotations.Num() > 0))
        {
            if (SpawnEnergyBall.bLeft)
            {
                int local_97 = FMath::RandHelper(local_22.LeftRandomVelocityRotations.Num());
            }
            else
            {
                int local_97_2 = FMath::RandHelper(local_22.RightRandomVelocityRotations.Num());
            }
            FRotator local_106;
            local_72 = (local_72.Rotation() + local_106).Vector();
        }
        local_66.InitialVelocity = (FMath::VRandCone(local_72, FMath::DegreesToRadians(local_22.RandomVelocityConeDegree)) * local_22.RandomVelocitySpeed[FMath::RandHelper(local_22.RandomVelocitySpeed.Num())]);
        FFPTime local_128 = (ECS::GetContextTime() + FFPTime(local_23));
        FFPTime local_52 = local_124.LastPlayTime;
        if (local_128.opCmp((local_52 + FFPTime(local_22.FXPlayMinInterval))) > 0)
        {
            SendEvent local_134;
            local_134.opCall(local_128).FXConfig = local_22.FXConfig;
            if (local_22.ReceiverMaterialParamRequests.Num() > 0)
            {
                FCE_PlayEnergyBallMaterialAnim local_140;
                local_140.ReceiverMaterialParamRequests = local_22.ReceiverMaterialParamRequests;
                local_140.Duration = local_22.MaterialAnimDuration;
            }
            local_124.LastPlayTime = local_128;
        }
        FFPTime local_126 = (ECS::GetContextTime() + FFPTime(local_23));
        float32 local_24_3 = local_22.DelayFadeoutSeconds;
        FFPTime local_52_2 = (local_126 + FFPTime(local_24_3));
        SendEvent local_144;
        local_144.opCall(local_52_2);
        return;
    }
    UFUNCTION()
    void ClientJob_EnergyBallLifeTime(const FECSEntity &inout Entity, const FC_LifeTime &inout LifeTime, const FC_EnergyBall &inout EnergyBall, const FCS_FixedTime &inout FixedTime) const
    {
        Get local_10;
        if (FFPTime(FProjectileTimeUtils::GetFrameTime(LifeTime, local_10.opCall(), FixedTime.LastTime, FixedTime.Time).CurrentTime).opCmp(LifeTime.GetLifeDuration()) >= 0)
        {
            Entity.DestroyDeferred();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_FadeoutEnergyBall(const FCE_FadeoutEnergyBall &inout FadeoutEnergyBall) const
    {
        const AActor local_4;
        local_4 = FadeoutEnergyBall.Sender.GetActor();
        if (local_4 != nullptr)
        {
            TArray<UNiagaraComponent> local_10 = local_4.GetComponentsByClass(UNiagaraComponent);
            for (auto local_28 : local_10)
            {
                local_28.Deactivate();
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_PlayEnergyBallFX(const FCE_PlayEnergyBallFX &inout PlayEnergyBallFX) const
    {
        Get local_4;
        const FC_PlayerController& local_6 = local_4.opCall();
        if (local_6)
        {
            if (FECSEntity(local_6.GetPlayerPawnEntity()))
            {
                ECS::GetContextTime();
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_StopEnergyBallMaterialAnim(const FCE_StopEnergyBallMaterialAnim &inout StopEnergyBallMaterialAnim) const
    {
        if (StopEnergyBallMaterialAnim.PawnEntity)
        {
            ::FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(StopEnergyBallMaterialAnim.PawnEntity, n"ReceiveEnergyBall", 0.0f, FSoftObjectPath());
        }
        return;
    }
    UFUNCTION()
    void ClientJob_PlayEnergyBallMaterialAnim(const FCE_PlayEnergyBallMaterialAnim &inout PlayEnergyBallMaterialAnim) const
    {
        Get local_4;
        const FC_PlayerController& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = local_6.GetPlayerPawnEntity();
            if (local_12)
            {
                ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(local_12, n"ReceiveEnergyBall", PlayEnergyBallMaterialAnim.ReceiverMaterialParamRequests);
                FFPTime local_28 = (ECS::GetContextTime() + FFPTime(PlayEnergyBallMaterialAnim.Duration));
                SendEvent local_18;
                local_18.opCall(local_28).PawnEntity = local_12;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_DispatchApplyEnergyBallEvent(const FCE_ApplyEnergyBall &inout ApplyEnergyBall) const
    {
        FC_EnergyBall local_10;
        TSubclassOf<AEnergyBallPrefab> local_2 = ApplyEnergyBall.Prefab.Get();
        if (!(local_2.IsValid()))
        {
            return;
        }
        AEnergyBallPrefab local_8 = local_2.GetDefaultObject();
        FECSEntity local_14 = FECSEntity(ApplyEnergyBall.Sender);
        Get local_18;
        const FC_PlayerController& local_20 = local_18.opCall();
        if (local_20)
        {
            TArray<FECSEntity> local_24 = local_20.GetAllPlayerPawnEntities();
            for (auto& local_38 : local_24)
            {
                if (int(local_10.EnergyBallAddType) == 1)
                {
                    FGameAttributeUtils::Recover(local_38, local_10.Attribute, ApplyEnergyBall.Time, local_10.Value, -1.0f);
                    continue;
                }
                if (int(local_10.EnergyBallAddType) == 2)
                {
                    FBuffUtils::AddBuff(local_38, local_10.BuffConfig, ApplyEnergyBall.Time, local_38, false, -1.0f, 1, false);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnCharacterDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_OnCharacterDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchSpawnEnergyBallEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SpawnEnergyBall> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SpawnEnergyBall& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchSpawnEnergyBallEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_EnergyBallLifeTime() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 2;
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
                this.ClientJob_EnergyBallLifeTime(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_EnergyBallLifeTime(local_180, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_FadeoutEnergyBall() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FadeoutEnergyBall> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FadeoutEnergyBall& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_FadeoutEnergyBall(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PlayEnergyBallFX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayEnergyBallFX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayEnergyBallFX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_PlayEnergyBallFX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_StopEnergyBallMaterialAnim() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_StopEnergyBallMaterialAnim> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_StopEnergyBallMaterialAnim& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_StopEnergyBallMaterialAnim(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PlayEnergyBallMaterialAnim() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayEnergyBallMaterialAnim> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayEnergyBallMaterialAnim& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_PlayEnergyBallMaterialAnim(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchApplyEnergyBallEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ApplyEnergyBall> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ApplyEnergyBall& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchApplyEnergyBallEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

