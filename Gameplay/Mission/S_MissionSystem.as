

class US_MissionSystem : UECSScriptSystem
{
    US_MissionSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleMissionStatusTransition(const FCE_OnMissionStatusTransited &inout Event) const
    {
        bool local_9;
        int local_16 = 0;
        int local_40 = 0;
        TDataObjectPtr<FMissionConfig> local_88;
        int local_210 = 0;
        bool local_259;
        int local_260 = 0;
        int local_268 = 0;
        int local_286;
        FStatusTransitionInfo local_358;
        EMissionType local_360 = EMissionType(0);
        FECSEntity local_4 = FECSEntity(Event.PlayerEntityId);
        if (!(local_4.IsValid()))
        {
            return;
        }
        TArray<TDataObjectPtr<FMissionConfig>> local_20;
        TDataObjectPtr<FMissionConfig> local_64;
        for (auto& local_34 : Event.TransitionInfos)
        {
            if (!(local_16.GetActiveMissionStatus().Contains(local_34.MissionId)))
            {
                XLog(ELog(63), FString().Append("[Mission] Try add new MissionDetail for missionId: ").Append(local_34.MissionId));
                local_40 = int(local_34.MissionId);
                local_64 = ::MissionUtils::FindMissionConfig(local_40);
                if (!(local_64))
                {
                    XError(ELog(63), FString().Append("[Mission] Add MissionDetail failed, MissionConfig not found for MissionId: ").Append(local_34.MissionId));
                    continue;
                }
                FMissionDetail local_200;
                local_200.SetMissionConfig(local_64);
                local_16.GetModify_ActiveMissionStatus().Add(local_34.MissionId, local_200);
                FFPTime local_206 = FFPTime(-1);
                local_210.MissionConfig = local_64;
                if (!(::MissionUtils::GetMissionPresentationRuleConfig(local_64).IsSet() && (local_260 == 1)))
                {
                    FFPTime local_206_2 = FFPTime(-1);
                    local_268.MissionConfig = local_64;
                }
            }
            TArray<FStatusTransitionInfo> local_272;
            FMissionDetail& local_274 = local_16.GetModify_ActiveMissionStatus()[local_34.MissionId];
            if (int(local_274.GetMissionStatus()) == 0 && (int(local_34.CurMissionStatus) == 1))
            {
                XLog(ELog(63), FString().Append("[Mission] Status Transit: ").Append(local_274.GetMissionName()).Append(" ").Append(local_274.GetMissionStatus()).Append(" => ").Append(local_34.CurMissionStatus));
                EMissionStatus local_275 = local_34.CurMissionStatus;
                local_274.SetMissionStatus(EMissionStatus(local_275));
                local_275 = EMissionStatus(1);
                EMissionStatus local_285 = EMissionStatus(0);
                local_272.Add(FStatusTransitionInfo(int(local_34.MissionId), 0, EMissionStatus(local_285), EMissionStatus(local_275)));
            }
            local_286 = GetFirstPhase().IsSet() ? local_40 : 0;
            local_9 = false;
            for (auto& local_302 : local_34.PhaseTransitionInfos)
            {
                XLog(ELog(63), FString().Append("[Mission] Phase Status Transit: ").Append(local_302.GetMissionPhaseId()).Append(" ").Append(local_302.GetOldStatus()).Append(" => ").Append(local_302.GetNewStatus()));
                this.ApplyPhaseStatusTransition(local_4, local_274, local_302);
                TDataObjectPtr<FMissionPhaseConfig> local_326 = ::MissionUtils::FindMissionPhaseConfig(local_302.GetMissionPhaseId());
                EMissionStatus local_285_2 = local_302.GetNewStatus();
                int local_207 = this.TriggerMissionPhaseActions(local_4, local_274.GetMissionConfig(), local_326);
                if (local_286 != 0 && (local_302.GetMissionPhaseId() == local_286) && (int(local_302.GetOldStatus()) == 1) && (int(local_302.GetNewStatus()) > 1))
                {
                    local_9 = true;
                }
                local_285_2 = local_302.GetNewStatus();
                EMissionStatus local_275_2 = local_302.GetOldStatus();
                int local_287 = local_302.GetMissionPhaseId();
                local_40 = int(local_34.MissionId);
                local_358.SetExecutionEntryId(local_207);
                local_272.Add(local_358);
            }
            if (local_9 && (int(local_34.CurMissionStatus) == 1) && local_274.GetActivePhaseConfig().IsSet())
            {
                local_259 = ::MissionUtils::GetMissionPresentationRuleConfig(local_274.GetMissionConfig()).IsSet() && (local_260 == 1);
                if (local_259)
                {
                    FFPTime local_206_3 = FFPTime(-1);
                    local_268.MissionConfig = local_274.GetMissionConfig();
                    if (local_259)
                    {
                        if (!(::MissionUtils::GetCurrentTrackingMission(local_4, EMissionType(local_360)).IsSet()))
                        {
                            ::MissionUtils::StartMissionTrackingWithGuide(local_4, local_274.GetMissionConfig(), false);
                        }
                    }
                }
            }
            if (int(local_34.CurMissionStatus) > 1)
            {
                EMissionStatus local_285_3 = local_274.GetMissionStatus();
                int local_351 = int(local_285_3);
                local_259 = ::MissionUtils::IsMissionTracking(local_4, local_274.GetMissionConfig());
                XLog(ELog(63), FString().Append("[Mission] Status Transit: ").Append(local_274.GetMissionName()).Append(" ").Append(local_274.GetMissionStatus()).Append(" => ").Append(::MissionUtils::StopMissionTracking(local_4, local_274.GetMissionConfig())));
                EMissionStatus local_275_3 = local_34.CurMissionStatus;
                local_274.SetMissionStatus(EMissionStatus(local_275_3));
                XLog(ELog(63), FString().Append("[Mission] Move MissionDetail ").Append(local_274.GetMissionName()).Append(" to FinishedList."));
                local_64 = local_274.GetMissionConfig();
                local_16.GetModify_FinishedMissionStatus().Add(local_64, local_274);
                local_285_3 = local_34.CurMissionStatus;
                local_275_3 = EMissionStatus(1);
                local_272.Add(FStatusTransitionInfo(int(local_34.MissionId), 0, EMissionStatus(local_275_3), EMissionStatus(local_285_3)));
                if (local_351 == 1)
                {
                    local_20.Add(local_64);
                }
            }
            if (local_272.Num() > 0)
            {
                FCE_NotifyClientMissionTransited local_368;
                FFPTime local_206_4 = FFPTime(-1);
                local_368.MissionId = int(local_34.MissionId);
                local_368.TransitionInfos = local_272;
            }
        }
        for (auto& local_382 : local_20)
        {
            local_88 = ::MissionUtils::FindFollowUpMissionToTrack(local_4, local_382);
            if (local_88)
            {
                ::MissionUtils::StartMissionTrackingWithGuide(local_4, local_88, false);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerObjectiveStatusChanged(const FCE_ObjectiveStatusChanged &inout Event) const
    {
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            const FECSEntity& local_116 = local_78.Proceed();
            int local_117 = 0;
            int local_119 = 0;
            if (!(::MissionUtils::TryFindActiveMissionPhaseForObjective(local_116, int(Event.ObjectiveInstanceId), local_117, local_119)))
            {
                continue;
            }
            EMissionStatus local_123 = this.UpdateMissionObjectiveStatus(local_116, local_117, int(Event.ObjectiveInstanceId), int(Event.ObjectiveId), Event.Status);
            if ((int(local_123)) != 1)
            {
                ::MissionNetUtils::RequestGSMissionPhaseStatusChange(local_116, local_117, local_119, EMissionStatus(local_123));
            }
            break;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleObjectiveGroupNewChildActivated(const FCE_ObjectiveGroupNewChildActivated &inout Event) const
    {
        int local_126 = 0;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            const FECSEntity& local_116 = local_78.Proceed();
            int local_117 = 0;
            int local_119 = 0;
            if (!(::MissionUtils::TryFindActiveMissionPhaseForObjective(local_116, int(Event.GroupInstanceId), local_117, local_119)))
            {
                continue;
            }
            ::MissionUtils::RegisterNewSequenceChildForMission(local_116, int(Event.GroupInstanceId), int(Event.NewChildInstanceId), local_126);
            break;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleObjectiveProgressUpdated(const FCE_ObjectiveProgressUpdated &inout Event) const
    {
        int local_126 = 0;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            const FECSEntity& local_116 = local_78.Proceed();
            int local_117 = 0;
            int local_119 = 0;
            if (!(::MissionUtils::TryFindActiveMissionPhaseForObjective(local_116, int(Event.ObjectiveInstanceId), local_117, local_119)))
            {
                continue;
            }
            FMissionObjectiveInfo& local_128 = local_126.GetModify_ActiveObjectiveStatusMap()[Event.ObjectiveInstanceId];
            if (Event.bIsFinishProgress)
            {
                local_128.SetFinishProgressValue(int(Event.NewProgressValue));
            }
            else
            {
                local_128.SetFailProgressValue(int(Event.NewProgressValue));
            }
            break;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleMissionStarted(const FCE_OnMissionStarted &inout Event) const
    {
        int local_125 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()) || !(Event.MissionConfig.IsSet()))
        {
            XError(ELog(63), FString().Append("HandleMissionStarted Failed, PlayerEntity or MissionConfig is invalid"));
            return;
        }
        FMissionDetail local_124;
        if (!(::MissionUtils::TryFindMissionDetail(local_4, local_125, local_124, false)))
        {
            XError(ELog(63), FString().Append("HandleMissionStarted Failed, MissionDetail not found for MissionConfig: ").Append(Event.MissionConfig.GetDataName()));
            return;
        }
        ::MissionUtils::InitMissionTrackingAndGuiding(local_4, local_124);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleMissionRequestToggleTrack(const FCE_MissionRequestToggleTrack &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Has local_10;
        if (!(local_4.IsValid()) || !(local_10.opCall()))
        {
            XError(ELog(63), FString().Append("[Mission] HandleMissionRequestToggleTrack PlayerEntity is not valid"));
            return;
        }
        if (!(Event.MissionConfig.IsSet()))
        {
            XError(ELog(63), FString().Append("[Mission] HandleMissionRequestToggleTrack MissionConfig is invalid"));
            return;
        }
        if (Event.bIsTracking)
        {
            ::MissionUtils::StartMissionTrackingWithGuide(local_4, Event.MissionConfig, Event.bOpenMapAndSelect);
        }
        else
        {
            if (!(::MissionUtils::StopMissionTrackingWithGuide(local_4, Event.MissionConfig)))
            {
                FString local_16 = FString();
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleNotifyClientMissionTransited(const FCE_NotifyClientMissionTransited &inout Event) const
    {
        int local_16 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        FFPTime local_12 = FFPTime(-1);
        for (auto& local_30 : Event.TransitionInfos)
        {
            XLog(ELog(63), FString().Append("[Mission] Add PerformEntry: ").Append(local_30.GetMissionId()).Append(" ").Append(local_30.GetMissionPhaseId()).Append(" ").Append(local_30.GetOldStatus()).Append(" => ").Append(int(local_30.GetNewStatus())));
            local_16.TransitionInfos.Add(local_30);
            if (::MissionUtils::FindMissionPhaseConfig(local_30.GetMissionPhaseId()).IsSet() && (local_30.GetExecutionEntryId() > 0))
            {
                TArrayConstIterator<FMissionActionConfig> local_110;
                EMissionTriggerType local_91 = this.GetMissionTriggerType(local_30.GetNewStatus());
                FMissionExecutionEntry local_104 = ::MissionExecUtils::CreateExecutionEntry(local_30.GetExecutionEntryId());
                for (; local_110.CanProceed;)
                {
                    const FMissionActionConfig& local_118 = local_110.Proceed();
                    if (int(local_118.TriggerType) != int(local_91))
                    {
                        continue;
                    }
                    if (int(::MissionExecUtils::GetActionType(local_118.ActionData)) != 1)
                    {
                        continue;
                    }
                    local_104.AddAction(local_118.ActionData);
                }
                if (!(local_104.ActionInstances.IsEmpty()))
                {
                    ::MissionExecUtils::RequestStartExecution(local_4, local_104, EMissionActionType(EMissionActionType(1)));
                }
            }
        }
        return;
    }
    EMissionTriggerType GetMissionTriggerType(const EMissionStatus NewStatus) const
    {
        switch (int(NewStatus))
        {
        case 1:
        {
            return EMissionTriggerType(1);
        }
        case 2:
        {
            return EMissionTriggerType(2);
        }
        case 3:
        {
            return EMissionTriggerType(3);
        }
        default:
        {
        }
        }
        return EMissionTriggerType(0);
    }
    int TriggerMissionPhaseActions(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TDataObjectPtr<FMissionPhaseConfig> &inout MissionPhaseConfig, const EMissionStatus NewStatus) const
    {
        TArrayConstIterator<FMissionActionConfig> local_24;
        if (!(MissionConfig.IsSet()) || !(MissionPhaseConfig.IsSet()))
        {
            return 0;
        }
        EMissionTriggerType local_4 = this.GetMissionTriggerType(EMissionStatus(NewStatus));
        if (int(local_4) == 0)
        {
            return 0;
        }
        FMissionExecutionEntry local_18 = ::MissionExecUtils::CreateExecutionEntry();
        for (; local_24.CanProceed;)
        {
            const FMissionActionConfig& local_32 = local_24.Proceed();
            if (int(local_32.TriggerType) != int(local_4))
            {
                continue;
            }
            if (int(::MissionExecUtils::GetActionType(local_32.ActionData)) != 2)
            {
                continue;
            }
            local_18.AddAction(local_32.ActionData);
        }
        if (!(local_18.ActionInstances.IsEmpty()))
        {
            ::MissionExecUtils::RequestStartExecution(PlayerEntity, local_18, EMissionActionType(EMissionActionType(2)));
        }
        FFPTime local_40 = FFPTime(-1);
        FCE_MissionTriggerEvent local_42;
        local_42.MissionPhaseConfig = MissionPhaseConfig;
        local_42.MissionConfig = MissionConfig;
        local_42.TriggerType = EMissionTriggerType(local_4);
        return int(local_18.EntryId);
    }
    void ApplyPhaseStatusTransition(const FECSEntity &inout PlayerEntity, FMissionDetail &inout MissionDetail, const FStatusTransitionInfo &inout TransInfo) const
    {
        int local_4;
        int local_1 = TransInfo.GetMissionPhaseId();
        local_4 = TransInfo.GetMissionPhaseId();
        EMissionStatus local_5 = ::MissionUtils::GetMissionPhaseStatus(MissionDetail, local_4);
        int local_8 = int(TransInfo.GetOldStatus());
        bool local_3 = int(TransInfo.GetOldStatus()) == 1 && (MissionDetail.GetActivePhaseId() == local_4);
        if (local_3)
        {
            ::MissionUtils::ClearActivePhase(PlayerEntity, MissionDetail);
        }
        else
        {
            if (int(TransInfo.GetNewStatus()) != 1)
            {
                local_3 = false;
            }
            else
            {
                int local_1_2 = MissionDetail.GetActivePhaseId();
                local_3 = (local_1_2 == 0);
            }
            if (local_3)
            {
                TDataObjectPtr<FMissionPhaseConfig> local_58 = ::MissionUtils::FindMissionPhaseConfig(local_4);
                ::MissionUtils::ActivatePhase(PlayerEntity, local_58, MissionDetail);
            }
        }
        int& local_60 = int(MissionDetail.GetModify_MissionPhaseStatusMap().FindOrAdd(local_4));
        int& local_60_2 = TransInfo.GetNewStatus();
        return;
    }
    EMissionStatus UpdateMissionObjectiveStatus(const FECSEntity &inout PlayerEntity, const uint MissionId, const uint ObjectiveInstanceId, const uint ObjectiveId, const EObjectiveStatus ObjectiveStatus) const
    {
        int local_6 = 0;
        if (!(local_6.GetActiveMissionStatus().Contains(MissionId)))
        {
            XError(ELog(63), FString().Append("[Mission] UpdateMissionPhaseStatus MissionDetail not found for MissionId: ").Append(MissionId));
            return EMissionStatus(0);
        }
        FMissionDetail& local_16 = local_6.GetModify_ActiveMissionStatus()[MissionId];
        local_16.GetModify_ActiveObjectiveStatusMap()[ObjectiveInstanceId].SetObjectiveStatus();
        if (int(ObjectiveStatus) != 1)
        {
            ::ObjectiveUtils::StopObjectiveGuide(ObjectiveInstanceId, PlayerEntity);
            ::MissionUtils::RefreshMissionGuidingPathOnObjectiveChanged(PlayerEntity, local_16);
        }
        if (local_16.GetActivePhaseConfig().IsSet())
        {
            if (GetObjective().IsSet() && (0 == ObjectiveId))
            {
                int local_18 = int(ObjectiveStatus);
                if (local_18 <= 3)
                {
                    if (local_18 != 2)
                    {
                        if (local_18 != 3)
                        {
                        }
                    }
                    else
                    {
                        return EMissionStatus(2);
                    }
                }
                return EMissionStatus(1);
            }
        }
        return EMissionStatus(1);
    }
    UFUNCTION()
    void ClientJob_HandleOpenCGPlayer(const FCE_NotifyClientOpenCGPlayer &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        if (!(Event.CGConfig.IsSet()))
        {
            return;
        }
        ::CGPlayerUtils::OpenCGPlayerByDataObject(LocalPlayer.UEPlayerController.GetLocalPlayer(), Event.CGConfig);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCGPlayFinished(const FCE_NotifyServerCGPlayFinished &inout Event) const
    {
        if (!(Event.CGConfig.IsSet()))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(Event.Sender);
        if (!(local_6.IsValid()))
        {
            return;
        }
        ::ULevelEventManager::Get().NotifyCGPlayFinished(Event.CGConfig, local_6);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleMissionStatusTransition() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnMissionStatusTransited> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnMissionStatusTransited& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleMissionStatusTransition(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerObjectiveStatusChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ObjectiveStatusChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ObjectiveStatusChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerObjectiveStatusChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleObjectiveGroupNewChildActivated() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ObjectiveGroupNewChildActivated> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ObjectiveGroupNewChildActivated& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleObjectiveGroupNewChildActivated(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleObjectiveProgressUpdated() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ObjectiveProgressUpdated> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ObjectiveProgressUpdated& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleObjectiveProgressUpdated(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleMissionStarted() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnMissionStarted> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnMissionStarted& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleMissionStarted(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleMissionRequestToggleTrack() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_MissionRequestToggleTrack> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_MissionRequestToggleTrack& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_MissionRequestToggleTrack, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleMissionRequestToggleTrack(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleNotifyClientMissionTransited() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NotifyClientMissionTransited> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NotifyClientMissionTransited& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleNotifyClientMissionTransited(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleOpenCGPlayer() const
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
        TECSEventConstIterator<FCE_NotifyClientOpenCGPlayer> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_NotifyClientOpenCGPlayer& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_HandleOpenCGPlayer(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCGPlayFinished() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NotifyServerCGPlayFinished> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NotifyServerCGPlayFinished& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_NotifyServerCGPlayFinished, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleCGPlayFinished(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

