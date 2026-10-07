

class US_LookRequestSystemAS : UECSScriptSystem
{
    US_LookRequestSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    void PruneExpired(FC_LookRequestLocal &inout Local, const FFPTime &inout NowTime) const
    {
        int local_4 = Local.RequestArray.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FLookRequestEntry& local_8 = Local.RequestArray[local_4];
            if (local_8.bHasExpire && ((local_8.ExpireTime.opCmp(NowTime) <= 0)))
            {
                Local.RequestArray.RemoveAt(local_4);
            }
        }
        return;
    }
    int FindBestIndex(const FC_LookRequestLocal &inout Local) const
    {
        int local_1 = -1;
        int local_3 = 0;
        while (local_3 < 0)
        {
            if (local_1 < 0 || ::FC_LookRequest::IsBetterThan(Local.RequestArray[local_3], Local.RequestArray[local_1]))
            {
                local_1 = local_3;
            }
            ++local_3;
        }
        return local_1;
    }
    void PruneExpiredView(FC_LookRequestViewLocal &inout Local, const FFPTime &inout NowTime) const
    {
        int local_4 = Local.RequestArray.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            FLookRequestEntry& local_8 = Local.RequestArray[local_4];
            if (local_8.bHasExpire && ((local_8.ExpireTime.opCmp(NowTime) <= 0)))
            {
                Local.RequestArray.RemoveAt(local_4);
            }
        }
        return;
    }
    int FindBestViewIndex(const FC_LookRequestViewLocal &inout Local) const
    {
        int local_1 = -1;
        int local_3 = 0;
        while (local_3 < 0)
        {
            if (local_1 < 0 || ::FC_LookRequest::IsBetterThan(Local.RequestArray[local_3], Local.RequestArray[local_1]))
            {
                local_1 = local_3;
            }
            ++local_3;
        }
        return local_1;
    }
    void ResolveEntryToSnapshot(const FLookRequestEntry &inout E, FLookSnapshot &inout Out) const
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
    void WriteResolvedFromWorldSnapshot(const FLookSnapshot &inout WorldSnapshot, const FECSEntity &inout Entity, const FTransform &inout OwnerTransform, FC_LookResolvedTarget &inout Out) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void WriteResolvedFromLocalTarget(const FC_AimPoseConfig &inout AimPoseConfig, FC_LookResolvedTarget &inout Out) const
    {
        FLookSnapshot local_18;
        local_18.SetSource(EAnimLookSource(0));
        local_18.SetPriority(0);
        local_18.SetAnimSnapshotTypeMask(uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(0))));
        local_18.SetPosition(AimPoseConfig.GetLookTargetCS());
        Out.Snapshot = local_18;
        Out.bHasTarget = false;
        return;
    }
    void ClearResolved(FC_LookResolvedTarget &inout Out) const
    {
        FLookSnapshot local_18;
        Out.Snapshot = local_18;
        Out.bHasTarget = false;
        Out.bInTransition = false;
        return;
    }
    void SetupTargetTransition(const FECSEntity &inout Entity, FC_LookResolvedTarget &inout Out, const FVector &inout OldTargetPos) const
    {
        Out.bInTransition = true;
        return;
    }
    UFUNCTION()
    void ServerJob_PickTop(const FECSEntity &inout Entity, FC_LookRequestLocal &inout Local, FC_LookRequest &inout Synced, const FCS_FixedTime &inout FixedTime) const
    {
        this.PruneExpired(Local, FixedTime.Time);
        int local_2 = this.FindBestIndex(Local);
        if (local_2 < 0)
        {
            Synced.SetbTopValid(false);
            FLookSnapshot local_22;
            Synced.SetTopRequest(local_22);
            return;
        }
        FLookSnapshot local_40;
        this.ResolveEntryToSnapshot(Local.RequestArray[local_2], local_40);
        Synced.SetTopRequest(local_40);
        Synced.SetbTopValid(true);
        return;
    }
    UFUNCTION()
    void ClientJob_PickTop(const FECSEntity &inout Entity, FC_LookRequestViewLocal &inout ViewLocal, const FC_LookRequest &inout Synced, const FC_AimPoseConfig &inout DefaultConfig) const
    {
        int local_6 = 0;
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
                this.ClearResolved(local_6);
                return;
            }
        }
        int local_72 = this.FindBestViewIndex(ViewLocal);
        bool local_73 = false;
        if (local_72 >= 0)
        {
            if (!(Synced.GetbTopValid()))
            {
                local_73 = true;
            }
            else
            {
                FLookRequestEntry local_96;
                local_96.Source = EAnimLookSource(Synced.GetTopRequest().GetSource());
                local_96.Priority = Synced.GetTopRequest().GetPriority();
                local_73 = ::FC_LookRequest::IsBetterThan(ViewLocal.RequestArray[local_72], local_96);
            }
        }
        FVector local_104(local_6.Snapshot.GetPosition());
        EAnimLookSource local_105;
        local_105 = local_6.Snapshot.GetSource();
        if (local_73)
        {
            FLookSnapshot local_124;
            this.ResolveEntryToSnapshot(ViewLocal.RequestArray[local_72], local_124);
            this.WriteResolvedFromWorldSnapshot(local_124, Entity, local_32, local_6);
        }
        else
        {
            if (Synced.GetbTopValid())
            {
                this.WriteResolvedFromWorldSnapshot(Synced.GetTopRequest(), Entity, local_32, local_6);
            }
            else
            {
                this.WriteResolvedFromLocalTarget(DefaultConfig, local_6);
            }
        }
        if (int(local_105) != (int(local_6.Snapshot.GetSource())))
        {
            this.SetupTargetTransition(Entity, local_6, local_104);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_LerpResolvedTarget(const FECSEntity &inout Entity, FC_LookResolvedTarget &inout LookResolvedTarget) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Run_ServerJob_PickTop() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_184 = 0;
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
                this.ServerJob_PickTop(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_LookRequestLocal> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        local_102.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_98.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_PickTop(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_LookRequestLocal>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PickTop() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_186 = 0;
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
                this.ClientJob_PickTop(local_36, local_38, local_44, local_50);
                local_58.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        local_104.opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_36 = local_148.Proceed();
            ++local_114;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_PickTop(local_186, local_38, local_44, local_50);
            local_58.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_LerpResolvedTarget() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
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
                this.ClientJob_LerpResolvedTarget(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_LerpResolvedTarget(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

