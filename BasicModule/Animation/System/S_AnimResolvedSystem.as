

class US_AnimResolvedSystemAS : UECSScriptSystem
{
    US_AnimResolvedSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void ClientJob_RegisterChannels(const FECSEntity &inout Entity, const FC_AimPoseConfig &inout AimPoseConfig) const
    {
        FC_AnimResolvedState local_6;
        const FAnimAimPoseConfig& local_10;
        if (local_6.bRegistered)
        {
            return;
        }
        if (!(AimPoseConfig.GetConfigPtr()))
        {
            return;
        }
        if (local_10.Segments.Num() == 0)
        {
            return;
        }
        TMap<FName, FAnimResolvedChannelState> local_32;
        for (auto& local_46 : local_10.Segments)
        {
            FName local_50 = this.GetChannelKey(local_46);
            if (!(local_32.Contains(local_50)))
            {
                FAnimResolvedChannelState local_94;
                local_94.ChannelKey = local_50;
                if (local_46.AllowSourcePreset.IsSet())
                {
                }
                local_94.TransitionSpeed = local_46.ChannelTransitionSpeed;
                continue;
            }
            FAnimResolvedChannelState& local_98 = local_32[local_50];
            local_98.TransitionSpeed = FMath::Min(local_98.TransitionSpeed, local_46.ChannelTransitionSpeed);
        }
        local_6.Channels.Empty(0);
        for (auto& local_118 : local_32)
        {
            local_118;
            local_6.Channels.Add();
        }
        local_6.bRegistered = true;
        return;
    }
    UFUNCTION()
    void ServerJob_PickTopPerChannel(const FECSEntity &inout Entity, FC_LookRequestLocal &inout Local, const FC_AimPoseConfig &inout AimPoseConfig, const FC_AnimAimPoseOutput &inout AimPoseOutput, FC_AnimResolvedSynced &inout Synced, const FCS_FixedTime &inout FixedTime) const
    {
        const FAnimAimPoseConfig& local_4;
        if (!(AimPoseConfig.GetConfigPtr()))
        {
            return;
        }
        this.PruneExpired(Local, FixedTime.Time);
        TMap<FName, FAnimSnapshot> local_24;
        TSet<FName> local_44;
        for (auto& local_58 : local_4.Segments)
        {
            FName local_62 = this.GetChannelKey(local_58);
            if (local_44.Contains(local_62))
            {
                continue;
            }
            local_44.Add(local_62);
            TSet<EAnimLookSource> local_82;
            if (local_58.AllowSourcePreset.IsSet())
            {
            }
            TSet<EAnimLookSource> local_102;
            bool local_1 = this.ResolveEffectiveAllowSources(local_82, AimPoseOutput, local_102);
            FAnimSnapshot local_122;
            if (this.FilterAndPickBestFromLocal(Local, local_102, local_1, local_122))
            {
                local_24.FindOrAdd(local_62) = local_122;
            }
        }
        Synced.SetSnapshotMap(local_24);
        return;
    }
    UFUNCTION()
    void ClientJob_ResolvePerChannel(const FECSEntity &inout Entity, FC_LookRequestViewLocal &inout ViewLocal, const FC_AnimResolvedSynced &inout Synced, FC_AnimResolvedState &inout State, const FC_AnimAimPoseOutput &inout AimPoseOutput, const FC_AimPoseConfig &inout DefaultConfig) const
    {
        int local_2 = 0;
        float32 local_78;
        int local_84 = 0;
        FAnimSnapshot local_106;
        float32 local_154;
        bool local_1 = !(State.bRegistered);
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_2 = State.Channels.Num();
            local_1 = (local_2 == 0);
        }
        if (local_1)
        {
            return;
        }
        this.PruneExpiredView(ViewLocal, ECS::GetECSWorld().GetFixedTime().Time);
        FTransform local_32;
        Get local_36;
        const FC_InterpoTransform& local_38 = local_36.opCall();
        if (local_38)
        {
            local_32 = local_38.ToFTransform();
        }
        else
        {
            Get local_68;
            const FC_Transform& local_70 = local_68.opCall();
            if (local_70)
            {
                local_32 = local_70.ToFTransform();
            }
            else
            {
                return;
            }
        }
        float32 local_77 = float32(ECS::GetContextDeltaTime().ToSeconds());
        local_78 = AimPoseOutput.GetTargetLerpSpeed();
        local_84.SnapshotMap.Empty(0);
        int local_85 = 0;
        while (local_85 < local_2)
        {
            FAnimResolvedChannelState& local_88 = State.Channels[local_85];
            bool local_4 = Synced.GetSnapshotMap().Find(local_88.ChannelKey, local_106);
            TSet<EAnimLookSource> local_128;
            bool local_1_2 = this.ResolveEffectiveAllowSources(local_88.AllowSources, AimPoseOutput, local_128);
            FAnimSnapshot local_148;
            if (this.PickChannelWinner(ViewLocal, local_128, local_1_2, local_4, local_106, local_148))
            {
                this.TransformSnapshotToLocal(local_148, Entity, local_32);
            }
            else
            {
                this.MakeChannelDefaultSnapshot(local_88, DefaultConfig, local_148);
            }
            if (int(local_148.GetSource()) != (int(local_88.PrevWinnerSource)))
            {
                if (local_88.bHasTarget)
                {
                    local_88.bInTransition = true;
                }
                local_88.PrevWinnerSource = EAnimLookSource(local_148.GetSource());
            }
            local_88.bHasTarget = true;
            if (local_78 > 0.0f)
            {
                local_154 = local_78;
            }
            else
            {
                local_154 = local_88.TransitionSpeed;
            }
            if (local_88.bInTransition)
            {
                this.InterpSnapshot(local_88.SmoothedSnapshot, local_148, local_77, local_154);
                if (this.IsSnapshotConverged(local_88.SmoothedSnapshot, local_148))
                {
                    local_88.bInTransition = false;
                }
            }
            else
            {
                local_88.SmoothedSnapshot = local_148;
            }
            local_84.SnapshotMap.FindOrAdd(local_88.ChannelKey) = local_88.SmoothedSnapshot;
            ++local_85;
        }
        return;
    }
    FName GetChannelKey(const FAimPoseSegmentConfig &inout Seg) const
    {
        FName local_6;
        if (Seg.AllowSourcePreset.IsSet())
        {
            local_6 = Seg.AllowSourcePreset.GetDataName();
        }
        else
        {
            local_6 = n"All";
        }
        return local_6;
    }
    void PruneExpired(FC_LookRequestLocal &inout Local, const FFPTime &inout NowTime) const
    {
        int local_4 = Local.RequestArray.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (Local.RequestArray[local_4].bHasExpire && (FFPTime(Local.RequestArray[local_4].ExpireTime).opCmp(NowTime) <= 0))
            {
                Local.RequestArray.RemoveAt(local_4);
            }
        }
        return;
    }
    void PruneExpiredView(FC_LookRequestViewLocal &inout Local, const FFPTime &inout NowTime) const
    {
        int local_4 = Local.RequestArray.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (Local.RequestArray[local_4].bHasExpire && (FFPTime(Local.RequestArray[local_4].ExpireTime).opCmp(NowTime) <= 0))
            {
                Local.RequestArray.RemoveAt(local_4);
            }
        }
        return;
    }
    void ResolveEntryToSnapshot(const FLookRequestEntry &inout E, FAnimSnapshot &inout Out) const
    {
        AActor local_8;
        Out.SetSource(E.Source);
        Out.SetPriority(int(E.Priority));
        Out.SetAnimSnapshotTypeMask(E.SnapshotTypeMask);
        Out.SetRotator(E.TargetRotationCS);
        if (::FAnimSnapshot::HasType(E.SnapshotTypeMask, EAnimSnapshotType(0)))
        {
            FVector local_22;
            if (local_8 != nullptr)
            {
                local_22 = local_8.GetActorLocation();
            }
            else
            {
                local_22 = E.FallbackPosWS;
            }
            Out.SetPosition(local_22);
        }
        return;
    }
    bool ResolveEffectiveAllowSources(const TSet<EAnimLookSource> &inout ConfigAllowSources, const FC_AnimAimPoseOutput &inout Output, TSet<EAnimLookSource> &inout OutAllowSources) const
    {
        if (Output.GetAllowSourceOverride().Num() == 0)
        {
            OutAllowSources = ConfigAllowSources;
            return (ConfigAllowSources.Num() > 0);
        }
        if ((ConfigAllowSources.Num()) == 0)
        {
            OutAllowSources = Output.GetAllowSourceOverride();
            return true;
        }
        OutAllowSources.Empty(0);
        for (auto local_21 : Output.GetAllowSourceOverride())
        {
            if (ConfigAllowSources.Contains(local_21))
            {
                OutAllowSources.Add(local_21);
            }
        }
        return true;
    }
    bool FilterAndPickBestFromLocal(const FC_LookRequestLocal &inout Local, const TSet<EAnimLookSource> &inout AllowSources, const bool bHasFilter, FAnimSnapshot &inout OutWinner) const
    {
        int local_1 = -1;
        int local_3 = 0;
        while (local_3 < 0)
        {
            const FLookRequestEntry& local_8 = Local.RequestArray[local_3];
            if (bHasFilter && !(AllowSources.Contains(local_8.Source)))
            {
            }
            else
            {
                if (local_1 < 0 || ::FC_LookRequest::IsBetterThan(local_8, Local.RequestArray[local_1]))
                {
                    local_1 = local_3;
                }
            }
            ++local_3;
        }
        if (local_1 < 0)
        {
            return false;
        }
        this.ResolveEntryToSnapshot(Local.RequestArray[local_1], OutWinner);
        return true;
    }
    bool PickChannelWinner(const FC_LookRequestViewLocal &inout ViewLocal, const TSet<EAnimLookSource> &inout AllowSources, const bool bHasFilter, const bool bHasSyncedTop, const FAnimSnapshot &inout SyncedTop, FAnimSnapshot &inout OutWinner) const
    {
        bool local_10;
        int local_1 = -1;
        int local_3 = 0;
        while (local_3 < 0)
        {
            const FLookRequestEntry& local_8 = ViewLocal.RequestArray[local_3];
            if (bHasFilter && !(AllowSources.Contains(local_8.Source)))
            {
            }
            else
            {
                if (local_1 < 0 || ::FC_LookRequest::IsBetterThan(local_8, ViewLocal.RequestArray[local_1]))
                {
                    local_1 = local_3;
                }
            }
            ++local_3;
        }
        bool local_5 = (local_1 >= 0);
        local_10 = bHasSyncedTop && (!(bHasFilter) || AllowSources.Contains(EAnimLookSource(SyncedTop.GetSource())));
        if (local_5 && local_10)
        {
            FLookRequestEntry local_34;
            local_34.Source = SyncedTop.GetSource();
            local_34.Priority = SyncedTop.GetPriority();
            if (::FC_LookRequest::IsBetterThan(ViewLocal.RequestArray[local_1], local_34))
            {
                this.ResolveEntryToSnapshot(ViewLocal.RequestArray[local_1], OutWinner);
                return true;
            }
            OutWinner = SyncedTop;
            return true;
        }
        if (local_5)
        {
            this.ResolveEntryToSnapshot(ViewLocal.RequestArray[local_1], OutWinner);
            return true;
        }
        if (local_10)
        {
            OutWinner = SyncedTop;
            return true;
        }
        return false;
    }
    void TransformSnapshotToLocal(FAnimSnapshot &inout Snapshot, const FECSEntity &inout Entity, const FTransform &inout OwnerTransform) const
    {
        if (::FAnimSnapshot::HasSnapshotType(Snapshot, EAnimSnapshotType(0)))
        {
            Snapshot.SetPosition(::FC_LookRequest::ChangeTransformToBottomLocation(Entity, OwnerTransform).InverseTransformPosition(Snapshot.GetPosition()));
        }
        return;
    }
    void MakeChannelDefaultSnapshot(const FAnimResolvedChannelState &inout Ch, const FC_AimPoseConfig &inout AimPoseConfig, FAnimSnapshot &inout Out) const
    {
        Out.SetSource(EAnimLookSource(0));
        Out.SetPriority(0);
        if (this.IsRotationOnlyChannel(Ch.AllowSources))
        {
            Out.SetAnimSnapshotTypeMask(uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(1))));
            Out.SetRotator(FRotator::ZeroRotator);
            return;
        }
        Out.SetAnimSnapshotTypeMask(uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(0))));
        Out.SetPosition(AimPoseConfig.GetLookTargetCS());
        return;
    }
    bool IsRotationOnlyChannel(const TSet<EAnimLookSource> &inout AllowSources) const
    {
        if (AllowSources.Num() == 0)
        {
            return false;
        }
        for (auto local_21 : AllowSources)
        {
            if ((int(local_21) != 5 && (int(local_21) != 65)))
            {
                return false;
            }
        }
        return true;
    }
    void InterpSnapshot(FAnimSnapshot &inout Current, const FAnimSnapshot &inout Target, const float32 DeltaTime, const float32 Speed) const
    {
        Current.SetSource(Target.GetSource());
        Current.SetPriority(Target.GetPriority());
        Current.SetAnimSnapshotTypeMask(uint8(Target.GetAnimSnapshotTypeMask()));
        Current.SetPosition(FVector(FMath::FInterpTo(Current.GetPosition().X, Target.GetPosition().X, DeltaTime, Speed), (FMath::FInterpTo(Current.GetPosition().Y, Target.GetPosition().Y, DeltaTime, Speed)), (FMath::FInterpTo(Current.GetPosition().Z, Target.GetPosition().Z, DeltaTime, Speed))));
        if (::FAnimSnapshot::HasType(uint8(Target.GetAnimSnapshotTypeMask()), EAnimSnapshotType(1)))
        {
            Current.SetRotator(FRotator(FMath::FInterpTo(float32(Current.GetRotator().Pitch), float32(Target.GetRotator().Pitch), DeltaTime, Speed), (FMath::FInterpTo(float32(Current.GetRotator().Yaw), float32(Target.GetRotator().Yaw), DeltaTime, Speed)), (FMath::FInterpTo(float32(Current.GetRotator().Roll), float32(Target.GetRotator().Roll), DeltaTime, Speed))));
        }
        return;
    }
    bool IsSnapshotConverged(const FAnimSnapshot &inout A, const FAnimSnapshot &inout B) const
    {
        bool local_17 = FVector((FVector(A.GetPosition()) - B.GetPosition())).IsNearlyZero(1.0);
        bool local_1 = true;
        int local_18 = local_1;
        if (::FAnimSnapshot::HasType(uint8(B.GetAnimSnapshotTypeMask()), EAnimSnapshotType(1)))
        {
            FRotator local_32 = (FRotator(A.GetRotator()) - B.GetRotator()).GetNormalized();
            bool local_1_2 = FMath::Abs(float32(local_32.Pitch)) < 0.5f && (FMath::Abs(float32(local_32.Yaw)) < 0.5f) && (FMath::Abs(float32(local_32.Roll)) < 0.5f);
            local_18 = local_1_2;
        }
        return local_17 && (local_18 != 0);
    }
    UFUNCTION()
    void Run_ClientJob_RegisterChannels() const
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
                this.ClientJob_RegisterChannels(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
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
            this.ClientJob_RegisterChannels(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PickTopPerChannel() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        MarkModifiedIfDirty local_72;
        int local_204 = 0;
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
                this.ServerJob_PickTopPerChannel(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
                local_72.opCall(local_60);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_110 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        local_114.opCall();
        Exclude(local_110).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_132 = 0;
        FECSRuntimeViewIterator local_166 = local_110.Iterator();
        for (; local_166.CanProceed;)
        {
            local_40 = local_166.Proceed();
            ++local_132;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_PickTopPerChannel(local_204, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
            local_72.opCall(local_60);
        }
        local_4.UpdateCachedEntityCount(local_132);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ResolvePerChannel() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_56 = 0;
        int local_62 = 0;
        MarkModifiedIfDirty local_70;
        MarkModifiedIfDirty local_74;
        int local_210 = 0;
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
                this.ClientJob_ResolvePerChannel(local_36, local_38, local_44, local_50, local_56, local_62);
                local_70.opCall(local_38);
                local_74.opCall(local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_112 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Include local_124;
        local_124.opCall();
        Include local_128;
        local_128.opCall();
        Include local_132;
        local_132.opCall();
        local_120.opCall();
        Exclude(local_112).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_138 = 0;
        FECSRuntimeViewIterator local_172 = local_112.Iterator();
        for (; local_172.CanProceed;)
        {
            local_36 = local_172.Proceed();
            ++local_138;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_ResolvePerChannel(local_210, local_38, local_44, local_50, local_56, local_62);
            local_70.opCall(local_38);
            local_74.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_138);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

