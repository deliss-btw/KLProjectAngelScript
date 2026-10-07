

class US_LevelEntryInteractSystem : UECSScriptSystem
{
    US_LevelEntryInteractSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_TickLevelEntryInteract(const FECSEntity &inout TargetEntity, const FCS_FixedTime &inout FixedTime, const FC_RuntimeInteractTargetStatus &inout RuntimeInteractTargetStatus, const FC_LevelEntryConfig &inout LevelEntryConfig) const
    {
        int local_59;
        int local_73 = 0;
        if (!(LevelEntryConfig.DungeonConfig.IsSet()) || (0 != 1))
        {
            return;
        }
        TArray<FECSEntity> local_10;
        TArray<FCutScenePawnEntityWithTag> local_14;
        for (auto& local_28 : RuntimeInteractTargetStatus.GetInteractionPointStatus())
        {
            local_10.Append(local_28.GetInteractingSourceEntities());
        }
        if (local_10.Num() >= int(LevelEntryConfig.MinPlayerCount) && LevelEntryConfig.DungeonConfig.IsSet() && GetLevelConfig().IsSet())
        {
            TArray<FECSEntity> local_32;
            for (auto& local_46 : local_10)
            {
                FInteractActionESMBBForEvent local_50;
                local_50.SetESMBBTriggerName(LevelEntryConfig.CutSceneTrigger.ESMBBTrigger.Name);
                local_50.SetTriggerValidateTime(LevelEntryConfig.CutSceneTrigger.TriggerValidateTime);
                FName local_53 = local_50.GetESMBBTriggerName();
                if ((!((local_53 == NAME_None))))
                {
                    ::FInteractUtils::CreateInteractActionESMTriggerEvent(local_46, local_46, local_50);
                }
                GetDefaulted local_58;
                local_59 = local_58.opCall().GetTargetPointAndBehaviorIndex().GetPointIndex();
                FECSEntity local_64 = ::FASCommonUtils::GetUniquePlayerEntity(local_46);
                if (local_64.IsValid())
                {
                    ModifyOrAdd local_72;
                    local_72.opCall().SetLevelKey(local_73);
                    local_32.Add(local_64);
                    FCutScenePawnEntityWithTag local_80;
                    local_53 = FName(FString().Append("Player").Append(local_59));
                    local_80.PlayerTag = local_53;
                    local_80.PlayerPawnEntity = local_46;
                    local_14.Add(local_80);
                }
            }
            FFPTime local_94 = (FFPTime(FixedTime.Time) + FFPTime(LevelEntryConfig.EnterLevelDelayFromCutSceneTrigger));
            SendEvent local_98;
            FCE_LevelEntryInteractSuccess& local_100 = local_98.opCall(local_94);
            if (local_100)
            {
                FC_LevelEntryProcessingTag local_106;
                Assign local_104;
                local_104.opCall(local_106);
                local_100.PlayerEntities = local_32;
                local_100.LevelKey = local_73;
                XLog(ELog(46), FString().Append("Send FCE_LevelEntryInteractSuccess, EventTime=").Append(local_94.ToSeconds()).Append(" PlayerEntities=").Append(local_100.PlayerEntities.Num()).Append(" LevelKey=").Append(local_100.LevelKey));
                if (LevelEntryConfig.CutSceneData.IsSet())
                {
                    TMap<FName, FECSEntity> local_128;
                    for (auto& local_142 : local_14)
                    {
                        FECSEntity local_64_2 = local_142.PlayerPawnEntity;
                        FName local_144 = local_142.PlayerTag;
                        GetDefaulted local_148;
                        XLog(ELog(46), FString().Append("Play Cut Scene for PlayerPawnEntity=").Append(local_64_2).Append(" PlayerTag=").Append(local_144).Append(" PlayerEntity=").Append(local_148.opCall().GetPlayerEntity()));
                        this.BuildOtherPlayerPawnEntities(local_144, local_14, local_128);
                        ::CutSceneUtils::PlayCutScene(local_64_2, local_144, TDataObjectPtr<FCutSceneData>(), local_128, FVector::ZeroVector, FRotator::ZeroRotator, false);
                    }
                }
            }
        }
        return;
    }
    void BuildOtherPlayerPawnEntities(const FName &inout PlayerTag, const TArray<FCutScenePawnEntityWithTag> &inout CutScenePlayerPawnEntities, TMap<FName, FECSEntity> &inout OtherPlayerPawnEntities) const
    {
        OtherPlayerPawnEntities.Empty(0);
        for (auto& local_18 : CutScenePlayerPawnEntities)
        {
            if ((!((local_18.PlayerTag == PlayerTag))))
            {
                OtherPlayerPawnEntities.Add(local_18.PlayerTag, local_18.PlayerPawnEntity);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleLevelEntryInteractSuccess(const FCE_LevelEntryInteractSuccess &inout Event) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
        }
        TArray<FECSEntity> local_14;
        for (auto& local_28 : Event.PlayerEntities)
        {
            if (local_28.IsValid())
            {
                Has local_32;
                local_5 = local_32.opCall();
                if (local_5)
                {
                    local_14.Add(local_28);
                }
            }
        }
        if (local_14.Num() > 0 && (int(Event.LevelKey) > 0))
        {
            XLog(ELog(46), FString().Append("FCE_LevelEntryInteractSuccess ActualEnterLevelPlayers=").Append(local_14.Num()).Append(" LevelKey=").Append(Event.LevelKey));
            ::UGameDSConnectionSubsystem::Get().SendJoinInstanceRequest(local_14, int(Event.LevelKey));
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnLevelEntryInit(const FECSEntity &inout Entity, const FC_LevelEntryConfig &inout LevelEntityConfig) const
    {
        Has local_4;
        int local_14 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        FECSEntityId local_15 = Entity.GetId();
        local_14.GetModify_LeveScriptActorInfo().FindOrAdd(local_15) = LevelEntityConfig.DungeonConfig;
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickLevelEntryInteract() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
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
                this.ServerJob_TickLevelEntryInteract(local_40, local_6, local_42, local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_90).opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_90.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TickLevelEntryInteract(local_188, local_6, local_42, local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleLevelEntryInteractSuccess() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LevelEntryInteractSuccess> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LevelEntryInteractSuccess& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleLevelEntryInteractSuccess(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnLevelEntryInit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLevelEntryConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnLevelEntryInit(local_46, local_52);
        }
        return;
    }
}

