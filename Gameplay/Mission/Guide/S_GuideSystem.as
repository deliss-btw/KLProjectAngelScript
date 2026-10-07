

class US_GuideSystem : UECSScriptSystem
{
    US_GuideSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_PreloadGuideAssets() const
    {
        const UGuideSettings local_2;
        GetGameplaySettings<UGuideSettings> local_4;
        local_2 = local_4;
        if (!(local_2.GuideFXActorClass.IsNull()) && local_2.GuideFXActorClass.IsPending())
        {
            local_2.GuideFXActorClass.LoadAsync(FOnSoftClassLoaded());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateGuide(const FECSEntity &inout PlayerEntity, FC_PendingGuideList &inout PendingGuideList) const
    {
        UGuideBehavior local_30;
        FC_DeferredGuideList& local_42;
        int local_65;
        FGuideContext local_206;
        if (!(::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity).IsValid()))
        {
            return;
        }
        for (auto& local_28 : PendingGuideList.GuideToStop)
        {
            if (!(::GuideUtils::TryGetGuideBehavior(local_30)))
            {
                XError(ELog(62), FString().Append("Failed to stop guide for custom unique id ").Append(local_28.GetKey()).Append(", guide data is not valid"));
                continue;
            }
            local_30.StopGuide(local_28.GetKey(), PlayerEntity);
            Modify local_40;
            local_42 = local_40.opCall();
            if (local_42)
            {
                if (local_42.DeferredGuides.IsEmpty())
                {
                    Remove local_46;
                    local_46.opCall();
                }
            }
        }
        for (auto& local_64 : PendingGuideList.GuideToStart)
        {
            local_65 = local_64.GetKey();
            if (!(::GuideUtils::TryGetGuideBehavior(local_206.GetGuideData(), local_30)))
            {
                XError(ELog(62), FString().Append("Failed to start guide for custom unique id ").Append(local_65).Append(", guide data is not valid"));
                continue;
            }
            EGuideStartResult local_211 = local_30.StartGuide(local_65, local_206);
            bool local_9 = local_30.IsContinuousGuide(local_206.GetGuideData());
            if (int(local_211) == 0)
            {
                this.TryShowGuidingPathForContext(PlayerEntity, local_206);
            }
            if ((int(local_211)) == 1 || (int(local_211) == 0 && local_9))
            {
                local_42.DeferredGuides.Add(local_65, local_206);
                if (int(local_211) == 1)
                {
                    XLog(ELog(62), FString().Append("Guide ").Append(local_65).Append(" deferred for retry (entity not yet loaded)"));
                }
                else
                {
                    XLog(ELog(62), FString().Append("Guide ").Append(local_65).Append(" continuous, kept in deferred list for discovery"));
                }
            }
        }
        Remove local_224;
        local_224.opCall();
        return;
    }
    void TryShowGuidingPathForContext(const FECSEntity &inout PlayerEntity, const FGuideContext &inout Context) const
    {
        if (!(Context.GetbShowGuidingPath()))
        {
            return;
        }
        FECSEntity local_10 = Context.GetPrimaryTargetEntity();
        if (local_10.IsValid())
        {
            Get local_14;
            const FC_GuidingPathUpdateInfo& local_16 = local_14.opCall();
            if (local_16)
            {
                if ((local_16.TargetEntity == local_10))
                {
                    return;
                }
            }
            ::FGuidingPathUtils::ServerSetGuidingPathTargetEntity(local_10, PlayerEntity, false);
        }
        else
        {
            Get local_14;
            if (Context.GetGuideTargets().Num() > 0)
            {
                FVector local_30 = Context.GetPrimaryTargetPosition();
                const FC_GuidingPathUpdateInfo& local_16_2 = local_14.opCall();
                if (local_16_2)
                {
                    if (!(local_16_2.TargetEntity.IsValid()) && local_16_2.TargetLocation.Equals(local_30, 1.0))
                    {
                        return;
                    }
                }
                ::FGuidingPathUtils::ServerSetGuidingPathTargetLocation(local_30, PlayerEntity, false);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_RetryDeferredGuideOnPrefabLoaded(const FECSEntity &inout Entity, const FC_PrefabLoaded &inout C_PrefabLoaded) const
    {
        int local_122 = 0;
        FGuideContext& local_146;
        UGuideBehavior local_148;
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            const FECSEntity& local_116 = local_78.Proceed();
            TArray<uint> local_126;
            for (auto& local_144 : local_122.DeferredGuides)
            {
                if (!(::GuideUtils::TryGetGuideBehavior(local_146.GetGuideData(), local_148)))
                {
                    continue;
                }
                if (local_148.IsContinuousGuide(local_146.GetGuideData()))
                {
                    FGuideContext local_294;
                    if (::GuideUtils::TryFindGuideContext(local_116, local_144.GetKey(), local_294))
                    {
                        if (local_148.AppendGuide(local_144.GetKey(), local_294))
                        {
                            XLog(ELog(62), FString().Append("Continuous guide ").Append(local_144.GetKey()).Append(" appended new targets"));
                        }
                    }
                    else
                    {
                        if ((int(local_148.StartGuide(local_144.GetKey(), local_146))) == 0)
                        {
                            XLog(ELog(62), FString().Append("Continuous guide ").Append(local_144.GetKey()).Append(" started after retry"));
                        }
                    }
                }
                else
                {
                    if ((int(local_148.StartGuide(local_144.GetKey(), local_146))) == 0)
                    {
                        XLog(ELog(62), FString().Append("Deferred guide ").Append(local_144.GetKey()).Append(" resolved after entity loaded"));
                        local_126.Add(local_144.GetKey());
                        this.TryShowGuidingPathForContext(local_116, local_146);
                    }
                }
            }
            auto local_312 = local_126.Iterator();
            for (; local_312.CanProceed;)
            {
                int local_295 = local_312.Proceed();
            }
            if (local_122.DeferredGuides.IsEmpty())
            {
                Remove local_324;
                local_324.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateGuideOnEntityDeath(const FECSEntity &inout Entity, const FC_DeathTag &inout C_DeathTag) const
    {
        TArrayConstIterator<FECSEntity> local_42;
        FGuideContext local_196;
        int local_223;
        TArray<uint> local_4;
        TArray<FECSEntity> local_8;
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        Get local_14;
        const FCS_GuideManager& local_16 = local_14.opCall();
        if (local_16)
        {
            for (auto& local_36 : local_16.GuideInfoMap)
            {
                for (; local_42.CanProceed;)
                {
                    const FECSEntity& local_50 = local_42.Proceed();
                    Get local_54;
                    FC_GuidingInfoList local_56 = local_54.opCall();
                    if (local_56)
                    {
                        if (local_56.GetGuideInfoMap().Find(local_36.GetKey(), local_196))
                        {
                            for (auto& local_210 : local_196.GetGuideTargets())
                            {
                                if ((FECSEntity(local_210.GetEntity()) == Entity))
                                {
                                    local_4.Add(local_36.GetKey());
                                    local_8.Add(local_50);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
        int local_216 = 0;
        for (; local_216 < local_4.Num(); ++local_216)
        {
            FECSEntity local_222 = local_8[local_216];
            local_223 = local_4[local_216];
            Modify local_228;
            FC_GuidingInfoList local_56_2 = local_228.opCall();
            if (local_56_2)
            {
                UGuideBehavior local_234;
                if (!(local_56_2.GetGuideInfoMap().Find(local_223, local_196)))
                {
                    continue;
                }
                ::EntityLevelSpotUtils::SetSpotDataVisibilityForViewer(Entity, ELevelSpotDataSource(2), local_222, false);
                int local_232 = local_196.GetGuideTargets().Num() - 1;
                for (; local_232 >= 0; --local_232)
                {
                    if ((FECSEntity(local_196.GetGuideTargets()[local_232].GetEntity()) == Entity))
                    {
                        local_196.GetModify_GuideTargets().RemoveAt(local_232);
                    }
                }
                bool local_17 = ::GuideUtils::TryGetGuideBehavior(local_196.GetGuideData(), local_234);
                bool local_242 = local_17 && local_234.IsContinuousGuide(local_196.GetGuideData());
                if (local_196.GetGuideTargets().IsEmpty() && !(local_242))
                {
                    if (local_17)
                    {
                        local_234.StopGuide(local_223, local_222);
                        XLog(ELog(62), FString().Append("Guide ").Append(local_223).Append(" last target died, stopped"));
                    }
                }
                else
                {
                    local_56_2.GetModify_GuideInfoMap()[local_223] = local_196;
                    XLog(ELog(62), FString().Append("Guide ").Append(local_223).Append(" target entity died, ").Append(local_196.GetGuideTargets().Num()).Append(" targets remaining"));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PreloadGuideAssets() const
    {
        ECS::GetContextJob();
        this.ClientJob_PreloadGuideAssets();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateGuide() const
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
                this.ServerJob_UpdateGuide(local_36, local_38);
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
            this.ServerJob_UpdateGuide(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RetryDeferredGuideOnPrefabLoaded() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPrefabLoadedOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RetryDeferredGuideOnPrefabLoaded(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateGuideOnEntityDeath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateGuideOnEntityDeath(local_46, local_52);
        }
        return;
    }
}

