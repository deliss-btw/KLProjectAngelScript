

class US_KillZSystem : UECSScriptSystem
{
    US_KillZSystem()
    {
        return;
    }
    void TeleportAvatarToSafePoint(const FECSEntity &inout Avatar) const
    {
        bool local_41;
        int local_64 = 0;
        if (!(Avatar.IsValid()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        bool local_7 = false;
        FVector local_14(FVector::ZeroVector);
        float32 local_15 = 1.0f;
        float32 local_17 = 150.0f;
        ULevelGlobalSettings local_22 = ::ULevelGlobalSettings::Get();
        if (local_22 != nullptr)
        {
            local_15 = local_22.TeleportBlackScreenTime;
            local_17 = local_22.KillZTeleportHeightOffset;
        }
        Get local_26;
        const FC_LastValidNavGround& local_28 = local_26.opCall();
        if (local_28)
        {
            local_14 = local_28.GetLastNavGroundPosition();
            local_7 = true;
        }
        else
        {
            Get local_32;
            const FC_LastValidGround& local_34 = local_32.opCall();
            if (local_34)
            {
                local_14 = local_34.GetLastGroundPosition();
                local_7 = true;
            }
        }
        if (local_7)
        {
            if (!(local_1))
            {
                local_41 = false;
            }
            else
            {
                Has local_40;
                local_41 = local_40.opCall();
            }
            if (local_41)
            {
                FFPTime local_48 = FFPTime(-1);
                FCE_ShowLoadingPage local_52;
                local_52.DisplayTime = local_15;
            }
            FFPTime local_62 = (ECS::GetContextTime() + FFPTime(0.05));
            local_64.Location = (local_14 + (FVector(FVector::UpVector) * local_17));
            GetDefaulted local_80;
            local_64.Rotation = FRotator(local_80.opCall().GetRotation());
        }
        return;
    }
    UFUNCTION()
    void Job_RecordLastValidGround(const FECSEntity &inout Character, const FC_CharacterMovement &inout CharacterMovement, const FC_Collision &inout Collision) const
    {
        int local_10 = 0;
        int local_26 = 0;
        if (CharacterMovement.GetbAirborne() || !(CharacterMovement.GetFloorInfo().bValid) || !(CharacterMovement.GetFloorInfo().bHasFloor) || CharacterMovement.GetFloorInfo().bNoFloorAtCapsuleCenter)
        {
            return;
        }
        local_10.SetLastGroundPosition(CharacterMovement.GetPosition());
        FVector local_16;
        local_16.X = Collision.GetScaledRadius();
        local_16.Y = local_16.X;
        local_16.Z = Collision.GetScaledHalfHeight();
        if (FAIPathFollowUtils::IsPointOnNavigation(Character, local_10.GetLastGroundPosition(), local_16))
        {
            local_26.SetLastNavGroundPosition(local_10.GetLastGroundPosition());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTeleportToLastValidGround(const FCE_TeleportToLastValidGround &inout Event) const
    {
        bool local_5;
        if (!(FECSEntity(Event.Sender).IsValid()))
        {
            return;
        }
        Has local_10;
        if (!(local_10.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_14;
            local_5 = local_14.opCall();
        }
        FFPTime local_22 = FFPTime(-1);
        FCE_TeleportToLocationRequest local_26;
        local_26.Location = Event.Location;
        local_26.Rotation = Event.Rotation;
        local_26.bShowBlackScreen = local_5;
        local_26.bBlockInput = local_5;
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateKillZ(const FECSEntity &inout Character, const FC_Transform &inout Transform) const
    {
        if ((!((ECS::GetUEWorld() != nullptr))))
        {
            return;
        }
        AWorldSettings local_10 = ECS::GetUEWorld().GetWorldSettings();
        if ((!((local_10 != nullptr))))
        {
            return;
        }
        if (Transform.GetPosition().Z < local_10.KillZ)
        {
            this.TeleportAvatarToSafePoint(Character);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleEnterKillZone(const FCE_EnterKillZone &inout Event) const
    {
        if (!(FECSEntity(Event.Sender).IsValid()))
        {
            return;
        }
        Has local_10;
        if (local_10.opCall() && !(Event.bTeleportPlayerToSafePoint))
        {
            FC_KillZoneCameraFreezeTag local_18;
            Assign local_16;
            local_16.opCall(local_18);
        }
        FFPTime local_32 = (ECS::GetContextTime() + FFPTime(Event.TriggerDeathDelay));
        FCE_TriggerDeathByKillZone local_34;
        local_34.bTeleportPlayerToSafePoint = Event.bTeleportPlayerToSafePoint;
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTriggerDeathByKillZone(const FCE_TriggerDeathByKillZone &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        Has local_10;
        bool local_5 = local_10.opCall();
        if ((local_5 && !(Event.bTeleportPlayerToSafePoint)))
        {
            Has local_16;
            bool local_6 = local_16.opCall();
            ::FLifeCycleUtils::EntityDeath(local_4, ENTITY_ID_NULL, ECS::GetContextTime(), true, false, false, true, EDeathReason(1));
            if (!(local_6))
            {
                ::FLifeCycleUtils::ServerDataTrackPlayerDeath(local_4, EServerDataTrackDeathReason(4), ENTITY_ID_NULL);
            }
            return;
        }
        this.TeleportAvatarToSafePoint(local_4);
        return;
    }
    UFUNCTION()
    void Monitor_OnAssignKillZoneCameraFreezeTag(const FECSEntity &inout Entity, const FC_KillZoneCameraFreezeTag &inout KillZoneCameraFreezeTag) const
    {
        ULevelGlobalSettings local_4 = ::ULevelGlobalSettings::Get();
        if (local_4 != nullptr)
        {
            ::ScriptCameraUtils::CameraFreezeAndLookAtFollowTarget(Entity, local_4.KillZoneCameraLookAtSocketName, local_4.KillZoneCameraLookAtSocketOffset, local_4.KillZoneCameraLookAtConfig);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveKillZoneCameraFreezeTag(const FECSEntity &inout Entity, const FC_KillZoneCameraFreezeTag &inout KillZoneCameraFreezeTag) const
    {
        ::ScriptCameraUtils::CameraUnfreezeAndLookAtFollowTarget(Entity);
        return;
    }
    UFUNCTION()
    void Run_Job_RecordLastValidGround() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_RecordLastValidGround(local_42, local_44, local_50);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_42 = local_144.Proceed();
            ++local_110;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_RecordLastValidGround(local_182, local_44, local_50);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeleportToLastValidGround() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TeleportToLastValidGround> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TeleportToLastValidGround& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeleportToLastValidGround(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateKillZ() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.ServerJob_UpdateKillZ(local_42, local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_86.Iterator();
        for (; local_146.CanProceed;)
        {
            local_42 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.ServerJob_UpdateKillZ(local_184, local_44);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleEnterKillZone() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnterKillZone> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnterKillZone& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleEnterKillZone(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTriggerDeathByKillZone() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TriggerDeathByKillZone> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TriggerDeathByKillZone& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTriggerDeathByKillZone(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAssignKillZoneCameraFreezeTag() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorKillZoneCameraFreezeTagOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAssignKillZoneCameraFreezeTag(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveKillZoneCameraFreezeTag() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorKillZoneCameraFreezeTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveKillZoneCameraFreezeTag(local_46, local_52);
        }
        return;
    }
}

