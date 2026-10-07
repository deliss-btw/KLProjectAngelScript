

class US_CommissionSystem : UECSScriptSystem
{
    US_CommissionSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitCommissionInfo() const
    {
        int local_50 = 0;
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            if ((local_50 == 3 || (local_50 == 5)))
            {
                int local_54 = 0;
                if (FParse::Value(FCommandLine::Get(), "-commission_key=", local_54))
                {
                    XLog(ELog(22), FString().Append("Init CommissionID=").Append(local_54));
                    TDataObjectPtr<FCommissionConfig> local_134;
                    TDataObjectPtr<FCommissionConfig> local_84 = local_134;
                    if (local_84)
                    {
                        ::CommissionUtils::ServerSetCurrentCommission(local_84);
                        XLog(ELog(22), FString().Append("Init CommissionID=").Append(local_54).Append(" CommissionConfig=").Append(local_84.GetDataName()));
                    }
                    else
                    {
                        XLog(ELog(22), FString().Append("Init CommissionID=").Append(local_54).Append(" not found"));
                    }
                }
                else
                {
                }
                UGameDSConnectionSubsystem local_164 = ::UGameDSConnectionSubsystem::Get();
                if (local_164 != nullptr)
                {
                    local_164.OnPlayerExitDS.AddUFunction(this, n"OnPlayerExitDS");
                    local_164.OnPlayerEnterDS.AddUFunction(this, n"OnPlayerEnterDS");
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitSubTarget(const FCS_CommissionInfo &inout C_CommissionInfo) const
    {
        int local_80 = 0;
        int local_88 = 0;
        TDataObjectPtr<FObjectiveConfig> local_24 = TDataObjectPtr<FObjectiveConfig>(nullptr);
        FECSWorldPtr local_74 = ECS::GetECSWorld();
        if (local_80 && local_80.SubTargetConfig.IsSet())
        {
            local_24 = local_80.SubTargetConfig;
        }
        else
        {
            if (C_CommissionInfo.CommissionConfig.IsSet() && GetCommissionSubTargetObjective().IsSet())
            {
                local_24 = GetCommissionSubTargetObjective();
            }
        }
        if (local_24.IsSet())
        {
            FECSWorldPtr local_74_2 = ECS::GetECSWorld();
            local_88.SetSubTargetConfig(local_24);
            FCommissionSubTargetProgress local_90;
            local_88.SetProgress(local_90);
            local_88.GetModify_ChildProgress().Empty(0);
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateCommissionDSGlobalInfoView(const FCS_CommissionDSGlobalInfo &inout C_CommissionDSGlobalInfo) const
    {
        int local_130 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        local_130.SetStartTimeInHoursOverride(C_CommissionDSGlobalInfo.StartTimeInHoursOverride);
        local_130.SetSubTargetConfig(C_CommissionDSGlobalInfo.SubTargetConfig);
        local_130.SetIntrusionPolicyConfig(C_CommissionDSGlobalInfo.IntrusionPolicyConfig);
        local_130.SetSpawnAreaConfig(C_CommissionDSGlobalInfo.SpawnAreaConfig);
        local_130.SetStartWeatherConfig(C_CommissionDSGlobalInfo.StartWeatherConfig);
        local_130.SetEntryRuleConfig(C_CommissionDSGlobalInfo.EntryRuleConfig);
        return;
    }
    UFUNCTION()
    void OnPlayerEnterDS(const FECSEntity &inout PlayerEntity) const
    {
        int local_34 = 0;
        XLog(ELog(22), FString().Append("OnPlayerEnterDS: PlayerEntity=").Append(PlayerEntity));
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        Get local_12;
        const FCS_CommissionGuideInfo& local_14 = local_12.opCall();
        if (local_14)
        {
            ::ObjectiveUtils::StartObjectiveGuide(int(local_14.CommissionTargetObjectiveInstanceId), PlayerEntity, EGuideStyleType(local_14.GuideStyleType));
        }
        FECSWorldPtr local_8_2 = ECS::GetECSWorld();
        Has local_22;
        if (local_22.opCall() && (int(::FGameModeUtils::GetGameStageType()) < 3))
        {
            local_34.StartTime = PlayerEntity.GetWorld().GetFixedTime().Time;
        }
        return;
    }
    UFUNCTION()
    void OnPlayerExitDS(const FECSEntity &inout PlayerEntity) const
    {
        XLog(ELog(22), FString().Append("OnPlayerExitDS: PlayerEntity=").Append(PlayerEntity));
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        Has local_12;
        bool local_13 = local_12.opCall();
        if (!(local_13))
        {
            local_13 = false;
        }
        else
        {
            FECSWorldPtr local_8_2 = ECS::GetECSWorld();
            Has local_18;
            local_13 = !(local_18.opCall());
        }
        if (local_13)
        {
            XLog(ELog(22), FString().Append("commission failed, PlayerEntity=").Append(PlayerEntity));
            ::UGameDSConnectionSubsystem::Get().FinishCommission(PlayerEntity, false);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_StartCommission(const FCE_FinishPrepareGameEvent &inout Event, const FCS_FixedTime &inout C_FixedTime) const
    {
        FObjectiveInstance local_358;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_CommissionInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.CommissionConfig.IsSet())
            {
                FName local_18;
                local_18.GetDataName();
                XLog(ELog(22), FString().Append(" Start Commission: FixedTime=").Append(C_FixedTime.Time.ToSeconds()).Append("  CommissionConfig=").Append(local_18.ToString()));
                local_8.CommissionStartTime = C_FixedTime.Time;
                local_8.bRaceCommissionStarted = false;
                local_8.RaceCommissionStartTime = FFPTime(0);
                if (GetCommissionTargetObjective().IsSet())
                {
                    ::CommissionUtils::ServerActivateCommissionObjective(GetCommissionTargetObjective(), true);
                }
                ::CommissionUtils::ServerSetCurrentCommissionTimeoutTime(C_FixedTime, local_8);
                ::PlayerNotify::NotifyPlayer(EPlayerNotify(0));
            }
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Modify local_34;
        FCS_CommissionSubTarget& local_36 = local_34.opCall();
        if (local_36)
        {
            if (local_36.GetSubTargetConfig().IsSet())
            {
                FObjectiveContext local_42;
                local_36.SetObjectiveInstanceId(::ObjectiveUtils::ActivateObjective(local_36.GetSubTargetConfig(), local_42));
                int local_28 = local_36.GetObjectiveInstanceId();
                if ((local_28 > 0 && (0 == 1)))
                {
                    FObjectiveInstance local_192;
                    int local_43 = local_36.GetObjectiveInstanceId();
                    if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_43, local_192))
                    {
                        TMap<uint, FCommissionSubTargetProgress>& local_194 = local_36.GetModify_ChildProgress();
                        for (auto& local_212 : local_192.ChildObjectiveMap)
                        {
                            local_212;
                            if (local_28 == 0)
                            {
                                continue;
                            }
                            if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_43, local_358))
                            {
                                FCommissionSubTargetProgress local_360;
                                local_360.SetSuccessProgressValue(local_358.GetFinishProgressValue());
                                local_360.SetFailedProgressValue(local_358.GetFailProgressValue());
                                local_194.Add(local_358.ObjectiveId, local_360);
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDeath(const FCE_DeathEvent &inout Event) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            return;
        }
        Has local_12;
        local_7 = local_12.opCall();
        if (local_7)
        {
            FECSWorldPtr local_2_2 = ECS::GetECSWorld();
            Modify local_16;
            FCS_CommissionInfo& local_18 = local_16.opCall();
            if (local_18)
            {
                ++local_18.TotalDeathCount;
                if (local_18.CommissionConfig)
                {
                    const FCommissionConfig& local_22;
                    if (int(local_22.MaxDeathCount) > 0 && (int(local_18.TotalDeathCount) >= int(local_22.MaxDeathCount)))
                    {
                        ::CommissionUtils::FinishCommission(TDataObjectPtr<FCommissionConfig>(), false, ECommissionFailReason(2));
                    }
                    else
                    {
                        XLog(ELog(22), FString().Append("Player death in commission, DeathCount= ").Append(local_18.TotalDeathCount).Append("/").Append(local_22.MaxDeathCount));
                        if (::CommissionUtils::GetCommissionSettings().CommissionOnPlayerDeathPopup)
                        {
                            TArray<FECSEntity> local_62 = ::FTeamUtils::GetTeammates(Event.Sender);
                            if (local_62.IsEmpty())
                            {
                                local_62.Add(Event.Sender);
                            }
                            if (int(local_22.MaxDeathCount) >= 0 && ((int(local_22.MaxDeathCount) - int(local_18.TotalDeathCount)) >= 0))
                            {
                                for (auto& local_82 : local_62)
                                {
                                    TArray<FTextArgument> local_86;
                                    int local_23_2 = int(local_22.MaxDeathCount) - int(local_18.TotalDeathCount);
                                    Make local_92;
                                    local_86.Add(local_92.opImplConv());
                                    ::MessageHintUtils::ShowMessageHint(local_82, ::CommissionUtils::GetCommissionSettings().CommissionOnPlayerDeathPopup, local_86);
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleObjectiveStatusChanged(const FCE_ObjectiveStatusChanged &inout Event, const FCS_CommissionInfo &inout C_CommissionInfo) const
    {
        bool local_3;
        bool local_12;
        if (int(Event.ObjectiveInstanceId) != int(C_CommissionInfo.CommissionTargetObjectiveInstanceId))
        {
            local_3 = true;
        }
        else
        {
            FECSWorldPtr local_6 = ECS::GetECSWorld();
            Has local_10;
            local_3 = local_10.opCall();
        }
        if (local_3)
        {
            return;
        }
        if (!((int(Event.Status) == 1)))
        {
            ::CommissionUtils::SetObjectiveGuideEnabledToAllPlayers(int(Event.ObjectiveInstanceId), false, EGuideStyleType(3));
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            Remove local_20;
            local_20.opCall();
        }
        if (int(Event.Status) == 2 || (int(Event.Status) == 3))
        {
            FCE_CommissionObjectiveFinished local_28;
            FFPTime local_26 = FFPTime(-1);
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            local_28.ObjectiveConfig = C_CommissionInfo.CommissionTargetObjective;
            local_3 = (int(Event.Status) == 2);
            local_28.bSuccess = local_3;
        }
        if (!(C_CommissionInfo.CommissionTargetObjective.IsSet()))
        {
            local_12 = false;
        }
        else
        {
            FDataObjectPtr local_100;
            local_100;
            local_12 = (C_CommissionInfo.CommissionTargetObjective == local_100);
        }
        if (local_12)
        {
            if (int(Event.Status) == 2)
            {
                ::CommissionUtils::FinishCommission(C_CommissionInfo.CommissionConfig, true, ECommissionFailReason(0));
                return;
            }
            if (int(Event.Status) == 3)
            {
                ::CommissionUtils::FinishCommission(C_CommissionInfo.CommissionConfig, false, ECommissionFailReason(1));
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickCommissionTimeout(const FCS_CommissionInfo &inout C_CommissionInfo, const FCS_FixedTime &inout C_FixedTime) const
    {
        bool local_6 = C_CommissionInfo.CommissionTimeoutTime.opCmp(0.0) > 0 && ((C_CommissionInfo.CommissionTimeoutTime.opCmp(C_FixedTime.Time) < 0));
        if (!(local_6))
        {
            local_6 = false;
        }
        else
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            Has local_14;
            local_6 = !(local_14.opCall());
        }
        if (local_6)
        {
            XLog(ELog(22), "CommissionTimeout");
            ::CommissionUtils::FinishCommission(C_CommissionInfo.CommissionConfig, false, ECommissionFailReason(3));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickCommissionFinish(FCS_CommissionFinish &inout C_CommissionFinish, const FCS_FixedTime &inout C_FixedTime) const
    {
        FFPTime local_2 = FFPTime(C_CommissionFinish.GetKickPlayerTime());
        if (local_2.opCmp(0.0) > 0 && ((FFPTime(C_CommissionFinish.GetKickPlayerTime()).opCmp(C_FixedTime.Time) < 0)) && !(C_CommissionFinish.GetbKickedPlayer()))
        {
            XLog(ELog(22), "KickPlayerWhenCommissionFinished");
            if (!(WorldUtils::IsPlayInEditor(this.GetWorld())))
            {
                ::UGameDSConnectionSubsystem::Get().DisconnectAllPlayers(false);
            }
            C_CommissionFinish.SetbKickedPlayer(true);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnCommissionInfoChanged() const
    {
        FCS_CommissionTargetNeedUpdateTag local_8;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Assign local_6;
        local_6.opCall(local_8);
        this.Run_ServerJob_NotifyPlayerCommissionInfoChanged();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Remove local_12;
        local_12.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_NotifyPlayerCommissionInfoChanged(const FECSEntity &inout Player, const FCS_FixedTime &inout C_FixedTime) const
    {
        SendEvent local_4;
        local_4.opCall(C_FixedTime.Time);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateCommissionTarget(const FECSEntity &inout Entity, const FC_Prefab &inout C_Prefab) const
    {
        if (::CommissionUtils::IsCommissionTarget(Entity))
        {
            FECSWorldPtr local_4 = ECS::GetECSWorld();
            FCS_CommissionTargetNeedUpdateTag local_10;
            Assign local_8;
            local_8.opCall(local_10);
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateCommissionTargetForActive(const FECSEntity &inout Entity, const FC_Prefab &inout C_Prefab) const
    {
        if (::CommissionUtils::IsCommissionTarget(Entity))
        {
            FECSWorldPtr local_4 = ECS::GetECSWorld();
            FCS_CommissionTargetNeedUpdateTag local_10;
            Assign local_8;
            local_8.opCall(local_10);
        }
        return;
    }
    UFUNCTION()
    void Monitor_RemoveCommissionTarget(const FECSEntity &inout Entity, const FC_DeathTag &inout C_DeathTag) const
    {
        if (::CommissionUtils::IsCommissionTarget(Entity))
        {
            FECSWorldPtr local_4 = ECS::GetECSWorld();
            FCS_CommissionTargetNeedUpdateTag local_10;
            Assign local_8;
            local_8.opCall(local_10);
        }
        return;
    }
    UFUNCTION()
    void Monitor_PlayerEnterCommission(const FECSEntity &inout Player, const FC_PlayerController &inout C_PlayerController) const
    {
        FC_PlayerCommissionTargetNeedUpdateTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateCommissionTarget(FCS_CommissionInfo &inout C_CommissionInfo) const
    {
        const UCommissionSettings local_20;
        for (auto& local_16 : C_CommissionInfo.CommissionTargetEntityInfos)
        {
            ::EntityLevelSpotUtils::RemoveSpotData(local_16.GetEntity(), ELevelSpotDataSource(2));
        }
        C_CommissionInfo.CommissionTargetEntityInfos.Empty(0);
        GetGameplaySettings<UCommissionSettings> local_22;
        local_20 = local_22;
        for (auto& local_42 : ::CommissionUtils::FindCurrentCommissionTargets())
        {
            C_CommissionInfo.CommissionTargetEntityInfos.Add(FCommissionEntityInfo(local_42, ::FASCommonUtils::GetEntityLocation(local_42), ::GetBasePrefabConfig(local_42)));
        }
        FECSWorldPtr local_236 = ECS::GetECSWorld();
        Remove local_240;
        local_240.opCall();
        this.Run_ServerJob_SetCommissionTargetForPlayer();
        return;
    }
    UFUNCTION()
    void ServerJob_UpdatePlayerCommissionTarget(const FECSEntity &inout Player, const FCS_CommissionInfo &inout C_CommissionInfo) const
    {
        this.ServerSetCommissionTargetForPlayer(Player, C_CommissionInfo);
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_SetCommissionTargetForPlayer(const FECSEntity &inout Player, const FCS_CommissionInfo &inout C_CommissionInfo) const
    {
        this.ServerSetCommissionTargetForPlayer(Player, C_CommissionInfo);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleRequestCommissionFinishedLikePlayer(const FCE_RequestCommissionFinishedLikePlayer &inout Event) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_CommissionFinish& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = 0;
            for (; local_10 < local_8.GetFinishTeamers().Num(); ++local_10)
            {
                if (local_8.GetFinishTeamers()[local_10].GetPlayerID() == int(Event.TargetPlayerID))
                {
                    local_8.GetModify_FinishTeamers()[local_10].SetLikeCount((local_8.GetModify_FinishTeamers()[local_10].GetLikeCount() + 1));
                    break;
                }
            }
        }
        return;
    }
    void ServerSetCommissionTargetForPlayer(const FECSEntity &inout Player, const FCS_CommissionInfo &inout C_CommissionInfo) const
    {
        bool local_6 = false;
        bool local_1 = ::CommissionUtils::GetCommissionSettings().bSetGuidingPathToTarget;
        if (C_CommissionInfo.CommissionConfig.IsSet() && local_6)
        {
            local_1 = local_6;
        }
        if (!(local_1))
        {
            return;
        }
        if (!(C_CommissionInfo.CommissionTargetEntityInfos.IsEmpty()))
        {
            FECSEntity local_10 = FECSEntity(::FGuidingPathUtils::GetGuidingPathTargetEntityID(Player));
            if (local_10)
            {
                if (::CommissionUtils::IsCommissionTarget(local_10))
                {
                    return;
                }
            }
            ::FGuidingPathUtils::ServerSetGuidingPathTargetEntity(C_CommissionInfo.CommissionTargetEntityInfos[0].GetEntity(), Player, false);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleObjectiveGroupNewChildActivated(const FCE_ObjectiveGroupNewChildActivated &inout Event, FCS_CommissionInfo &inout CommissionTarget) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            return;
        }
        if (int(CommissionTarget.CommissionTargetObjectiveInstanceId) != int(Event.GroupInstanceId))
        {
            return;
        }
        FObjectiveInstance local_156;
        if (!(::ObjectiveUtils::TryFindActivetedObjectiveInstance(int(Event.NewChildInstanceId), local_156)))
        {
            XWarning(ELog(22), FString().Append("ServerJob_HandleObjectiveGroupNewChildActivated: new child instance ").Append(Event.NewChildInstanceId).Append(" not found"));
            return;
        }
        FCommissionTargetProgress local_164;
        local_164.SetSuccessProgressValue(local_156.GetFinishProgressValue());
        local_164.SetFailedProgressValue(local_156.GetFailProgressValue());
        CommissionTarget.ChildProgress.Add(local_156.ObjectiveId, local_164);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCommissionTargetProgressUpdate(const FCE_ObjectiveProgressUpdated &inout Event, const FCS_CommissionInfo &inout CommissionTarget) const
    {
        Modify local_16;
        FObjectiveInstance local_328;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            return;
        }
        if (!(CommissionTarget.CommissionTargetObjective.IsSet()))
        {
            return;
        }
        if (0 == 0)
        {
            if (int(CommissionTarget.CommissionTargetObjectiveInstanceId) == int(Event.ObjectiveInstanceId))
            {
                if (Event.bIsFinishProgress)
                {
                    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
                    local_16.opCall().Progress.SetSuccessProgressValue(Event.NewProgressValue);
                }
                else
                {
                    int local_10_2 = Event.NewProgressValue;
                    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
                    local_16.opCall().Progress.SetFailedProgressValue(local_10_2);
                }
            }
            return;
        }
        FObjectiveInstance local_162;
        int local_12 = int(CommissionTarget.CommissionTargetObjectiveInstanceId);
        if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_12, local_162))
        {
            int local_11 = int(Event.ObjectiveInstanceId);
            if (::ObjectiveUtils::GroupContainsChildInstance(local_162, local_11))
            {
                FECSWorldPtr local_2_4 = ECS::GetECSWorld();
                for (auto& local_182 : local_162.ChildObjectiveMap)
                {
                    local_182;
                    if (local_11 == 0)
                    {
                        continue;
                    }
                    if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_12, local_328))
                    {
                        TMap<uint, FCommissionTargetProgress> local_164;
                        if (local_164.Contains(local_328.ObjectiveId))
                        {
                            local_164[local_328.ObjectiveId].SetSuccessProgressValue(local_328.GetFinishProgressValue());
                            local_164[local_328.ObjectiveId].SetFailedProgressValue(local_328.GetFailProgressValue());
                        }
                        else
                        {
                            FCommissionTargetProgress local_330;
                            local_330.SetSuccessProgressValue(local_328.GetFinishProgressValue());
                            local_330.SetFailedProgressValue(local_328.GetFailProgressValue());
                            local_164.Add(local_328.ObjectiveId, local_330);
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientConnectRefreshCommissionGuidingPath(const FECSEntity &inout Player, const FC_PlayerController &inout PlayerController) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Get local_10;
        const FC_GuidingPathPoints& local_12 = local_10.opCall();
        if (local_12)
        {
            if (local_12.GetbLastFindPathSuccess())
            {
                FC_GuidingPathManualUpdateTag local_18;
                Assign local_16;
                local_16.opCall(local_18);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitCommissionInfo() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitCommissionInfo();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitSubTarget() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.ServerJob_InitSubTarget(local_12);
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateCommissionDSGlobalInfoView() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Monitor_UpdateCommissionDSGlobalInfoView(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_StartCommission() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FinishPrepareGameEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_FinishPrepareGameEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.ServerJob_StartCommission(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleObjectiveStatusChanged() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_ObjectiveStatusChanged> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_ObjectiveStatusChanged& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleObjectiveStatusChanged(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickCommissionTimeout() const
    {
        int local_16 = 0;
        int local_22 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10_2 = this.GetECSWorld();
        this.ServerJob_TickCommissionTimeout(local_16, local_22);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickCommissionFinish() const
    {
        int local_16 = 0;
        int local_22 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10_2 = this.GetECSWorld();
        this.ServerJob_TickCommissionFinish(local_16, local_22);
        FECSWorldPtr local_10_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_26;
        local_26.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnCommissionInfoChanged() const
    {
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        this.Monitor_OnCommissionInfoChanged();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_NotifyPlayerCommissionInfoChanged() const
    {
        int local_10 = 0;
        int local_136 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_CommissionSystem::ServerJob_NotifyPlayerCommissionInfoChanged"));
        const FCS_FixedTime& local_6 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_12 = 0;
        int local_11 = local_12;
        FECSRuntimeView local_52 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        FECSRuntimeView::Include<FC_PlayerController>(local_52).opCall();
        Exclude(local_52).opCall();
        FECSRuntimeViewIterator local_94 = local_52.Iterator();
        for (; local_94.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_133 = FECSEntityScopeCycleCounter(local_94.Proceed());
            this.ServerJob_NotifyPlayerCommissionInfoChanged(local_136, local_10);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateCommissionTarget() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPrefabOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateCommissionTarget(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateCommissionTargetForActive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPrefabOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateCommissionTargetForActive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveCommissionTarget() const
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
            this.Monitor_RemoveCommissionTarget(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PlayerEnterCommission() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPlayerControllerOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_PlayerEnterCommission(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateCommissionTarget() const
    {
        int local_16 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        this.ServerJob_UpdateCommissionTarget(local_16);
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdatePlayerCommissionTarget() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ServerJob_UpdatePlayerCommissionTarget(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_46 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ServerJob_UpdatePlayerCommissionTarget(local_170, local_12);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SetCommissionTargetForPlayer() const
    {
        int local_16 = 0;
        int local_142 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_CommissionSystem::ServerJob_SetCommissionTargetForPlayer"));
        ECS::GetContextJob();
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        FECSRuntimeView local_60 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Exclude(local_60).opCall();
        FECSRuntimeViewIterator local_102 = local_60.Iterator();
        for (; local_102.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_139 = FECSEntityScopeCycleCounter(local_102.Proceed());
            this.ServerJob_SetCommissionTargetForPlayer(local_142, local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleRequestCommissionFinishedLikePlayer() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestCommissionFinishedLikePlayer> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestCommissionFinishedLikePlayer& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleRequestCommissionFinishedLikePlayer(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleObjectiveGroupNewChildActivated() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_ObjectiveGroupNewChildActivated> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_ObjectiveGroupNewChildActivated& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleObjectiveGroupNewChildActivated(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCommissionTargetProgressUpdate() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_ObjectiveProgressUpdated> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_ObjectiveProgressUpdated& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleCommissionTargetProgressUpdate(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientConnectRefreshCommissionGuidingPath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPlayerControllerOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientConnectRefreshCommissionGuidingPath(local_46, local_52);
        }
        return;
    }
}

