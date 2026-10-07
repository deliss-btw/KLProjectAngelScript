

class US_AutoTrackTurretSystem : UECSScriptSystem
{
    US_AutoTrackTurretSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_SeekTarget(const FECSEntity &inout Entity, const FC_AutoTrackTurretConfig &inout Config, FC_AutoTrackTurretClientRuntime &inout Runtime) const
    {
        bool local_2;
        if (!(Runtime.GetTargetEntity().IsValid()))
        {
            local_2 = true;
        }
        else
        {
            Has local_6;
            local_2 = local_6.opCall();
        }
        if (!(local_2))
        {
            for (auto& local_22 : Config.TargetingConditionsForMonster)
            {
                if (!(::AutoTrackTurret::ValidateTarget(Entity, Config, local_22, Runtime.GetTargetEntity())))
                {
                    local_2 = true;
                    break;
                }
            }
        }
        if (!(local_2))
        {
            return;
        }
        int local_27 = Entity.GetIdValue();
        ::AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] Job Entity[").Append(local_27).Append("] target lost, re-seeking..."));
        if (Runtime.GetbHasTarget())
        {
            Runtime.SetbHasTarget(false);
            ::AutoTrackTurret::TryActivateLostTargetTrigger(Entity);
        }
        Runtime.SetTargetEntity(::AutoTrackTurret::SeekTarget(Entity));
        if (Runtime.GetTargetEntity().IsValid())
        {
            Runtime.SetbHasTarget(true);
            ::AutoTrackTurret::TryActivateFoundTargetTrigger(Entity);
            ::AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] Job Entity[").Append(Entity.GetIdValue()).Append("] new Target[").Append(Runtime.GetTargetEntity().GetIdValue()).Append("]"));
            return;
        }
        int local_33 = Entity.GetIdValue();
        ::AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] Job Entity[").Append(local_33).Append("] re-seek failed, жњЄж‰ѕе€°еђ€жі•з›®ж ‡"));
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateEntityRotation(const FECSEntity &inout Entity, const FC_AutoTrackTurretConfig &inout Config, const FC_AutoTrackTurretClientRuntime &inout Runtime, FC_AutoTrackTurretServerCache &inout ServerCache, const FCS_FixedTime &inout FixedTime) const
    {
        int local_8 = 0;
        if (!(Runtime.GetbHasTarget()) || !(Runtime.GetTargetEntity().IsValid()))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        float32 local_9 = 0.0f;
        float32 local_11 = 0.0f;
        ::AutoTrackTurret::ComputeDesiredAngles(Entity, Runtime.GetTargetEntity(), Config, local_9, local_11);
        float32 local_13 = FixedTime.DeltaTime;
        ServerCache.CurrentEntityYaw = ::AutoTrackTurret::InterpAngle(ServerCache.CurrentEntityYaw, (ServerCache.CurrentEntityYaw + local_9), Config.MaxYawAngularVelocity, local_13);
        ServerCache.CurrentEntityPitch = ::AutoTrackTurret::InterpAngle(ServerCache.CurrentEntityPitch, (ServerCache.CurrentEntityPitch + local_11), Config.MaxPitchAngularVelocity, local_13);
        FRotator local_28 = ServerCache.InitialEntityRotation.Rotator();
        FQuat local_56 = FRotator((float32(local_28.Pitch) + ServerCache.CurrentEntityPitch), (float32(local_28.Yaw) + ServerCache.CurrentEntityYaw), float32(local_28.Roll)).Quaternion();
        Entity.MoveRotation(local_56, FFPTime(-1));
        return;
    }
    UFUNCTION()
    void ClientJob_UpdatePresentation(const FECSEntity &inout Entity, const FC_AutoTrackTurretConfig &inout Config, const FC_AutoTrackTurretClientRuntime &inout Runtime, FC_AutoTrackTurretClientCache &inout ClientCache, const FCS_FixedTime &inout FixedTime) const
    {
        int local_8 = 0;
        AGameActor local_14;
        USceneComponent local_62;
        if (!(ClientCache.bInitialized))
        {
            ClientCache.bInitialized = true;
            if (local_8)
            {
                ClientCache.CachedInitialEntityRotation = local_8.GetRotation();
            }
            local_14 = (Cast<AGameActor>(Entity.GetActor()));
            if (local_14 != nullptr)
            {
                if (!((Config.StaticComponentLogicName == NAME_None)))
                {
                    TArray<USceneComponent> local_20 = local_14.GetCachedSceneComponentByLogicName(Config.StaticComponentLogicName);
                    for (auto local_38 : local_20)
                    {
                        ClientCache.StaticComponentInitialWorldRotations.Add(local_38.GetComponentQuat());
                        ClientCache.StaticComponentInitialRelativeLocations.Add(local_38.GetRelativeLocation());
                        ClientCache.StaticComponentInitialRelativeScales.Add(local_38.GetRelativeScale3D());
                        ClientCache.CachedStaticCompFNames.Add(local_38.GetFName());
                    }
                }
                if ((Config.bTrackYaw && !((Config.YawAxisMeshLogicName == NAME_None))))
                {
                    TArray<USceneComponent> local_24 = local_14.GetCachedSceneComponentByLogicName(Config.YawAxisMeshLogicName);
                    for (auto local_38 : local_24)
                    {
                        ClientCache.YawComponentInitialRelativeLocations.Add(local_38.GetRelativeLocation());
                        ClientCache.YawComponentInitialRelativeScales.Add(local_38.GetRelativeScale3D());
                        ClientCache.CachedYawCompFNames.Add(local_38.GetFName());
                        local_62 = local_38.GetAttachParent();
                        FName local_64;
                        if (local_62 != nullptr)
                        {
                            local_64 = local_62.GetFName();
                        }
                        else
                        {
                            local_64 = NAME_None;
                        }
                        ClientCache.CachedYawParentFNames.Add(local_64);
                    }
                    if ((Config.bTrackPitch && !((Config.PitchAxisMeshLogicName == NAME_None))))
                    {
                        TArray<USceneComponent> local_20_2 = local_14.GetCachedSceneComponentByLogicName(Config.PitchAxisMeshLogicName);
                        for (auto local_38 : local_20_2)
                        {
                            ClientCache.PitchComponentInitialRelativeLocations.Add(local_38.GetRelativeLocation());
                            ClientCache.PitchComponentInitialRelativeScales.Add(local_38.GetRelativeScale3D());
                            ClientCache.CachedPitchCompFNames.Add(local_38.GetFName());
                            local_62 = local_38.GetAttachParent();
                            FName local_64;
                            if (local_62 != nullptr)
                            {
                                local_64 = local_62.GetFName();
                            }
                            else
                            {
                                local_64 = NAME_None;
                            }
                            ClientCache.CachedPitchParentFNames.Add(local_64);
                        }
                    }
                }
            }
        }
        if (::AutoTrackTurretDebug::IsDebugEnabled())
        {
            ::AutoTrackTurretDebug::DrawDebugConfig(Entity, Config);
            ::AutoTrackTurretDebug::DrawDebugTracking(Entity, Runtime.GetTargetEntity());
        }
        ::AutoTrackTurret::UpdateMeshRotation(Entity, Config, ClientCache);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SeekTarget() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_186 = 0;
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
                this.ServerJob_SeekTarget(local_42, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_42 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.ServerJob_SeekTarget(local_186, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateEntityRotation() const
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
                this.ServerJob_UpdateEntityRotation(local_40, local_42, local_48, local_54, local_6);
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
            this.ServerJob_UpdateEntityRotation(local_194, local_42, local_48, local_54, local_6);
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
    void Run_ClientJob_UpdatePresentation() const
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
                this.ClientJob_UpdatePresentation(local_40, local_42, local_48, local_54, local_6);
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
            this.ClientJob_UpdatePresentation(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

