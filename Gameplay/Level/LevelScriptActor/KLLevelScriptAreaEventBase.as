

UCLASS(Abstract)
class AKLLevelScriptAreaEventBase : AKLLevelScriptBaseActor
{
    UPROPERTY()
    TDataObjectPtr<FLevelEventInfoConfigBase> EventInfo;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> PresentationRuleConfig;
    UPROPERTY()
    TDataObjectPtr<FMinimapIconConfig> IconSettings;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> EventArea;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EventFailedMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EventSuccessMessageHint;
    UPROPERTY()
    int EventTargetNumber = 1;
    UPROPERTY()
    float32 EventAreaTriggerBufferTime = 1.0f;
    UPROPERTY()
    bool bUseLevelEventAttribute = false;
    FLevelTimerCallback AreaEventTimer;

    default bEnableOnLevelMonsterDeadEvent = true;


    UFUNCTION()
    void OnInitLevelScriptEntity_Implementation()
    {
        int local_68 = 0;
        Super::OnInitLevelScriptEntity_Implementation();
        Has local_4;
        if (this.EventInfo && !(local_4.opCall()))
        {
            FC_PrefabConfig local_12;
            TDataObjectPtr<FBasePrefabConfig> local_36;
            local_12.ConfigPtr = local_36;
            local_12.PrefabType = EPrefabType(5);
            bool local_5 = ECS::GetRuntimeInfo().IsServer;
            if (local_5)
            {
                local_68.SetEventInfo(TDataObjectPtr<FLevelEventInfoConfigBase>());
            }
        }
        return;
    }
    UFUNCTION()
    void PreLevelBeginPlay_Implementation()
    {
        AECSRegionVolume local_2;
        Super::PreLevelBeginPlay_Implementation();
        if (local_2 != nullptr)
        {
            local_2.OnECSPlayerControllerBeginOverlap.AddUFunction(this, n"OnPlayerBeginOverlapAreaVolume");
            local_2.OnECSPlayerControllerEndOverlap.AddUFunction(this, n"OnPlayerEndOverlapAreaVolume");
        }
        this.AreaEventTimer.BindUFunction(this, n"CheckPlayerLeavingArea");
        ModifyOrAdd local_10;
        local_10.opCall().EventProgress = 0;
        return;
    }
    UFUNCTION()
    void ECSEndPlayBP_Implementation()
    {
        FFPTime local_4 = ECS::GetContextTime();
        Get local_8;
        const FC_LevelAreaEventPlayers& local_10 = local_8.opCall();
        if (local_10)
        {
            int local_15 = local_10.PlayerInAreaList.Num() - 1;
            for (; local_15 >= 0; )
            {
                const FPlayerInAreaInfo& local_18 = local_10.PlayerInAreaList[local_15];
                if (local_18.PlayerEntity.IsValid() && local_18.PlayerEntity.IsActive())
                {
                    FCE_LevelAreaEventPlayerLeave local_42;
                    float32 local_27 = float32((FMath::Max(0.0, (local_4 - local_18.EnterTime).ToSeconds())));
                    FFPTime local_2 = FFPTime(-1);
                    FECSEntity local_40 = FECSEntity(local_18.PlayerEntity.GetId());
                    FECSWorldPtr local_30 = ECS::GetECSWorld();
                    local_42.LevelScriptEntity = this.LevelScriptEntity;
                    local_42.Result = ELevelAreaEventLeaveResult(2);
                    local_42.Duration = local_27;
                }
                this.OnPlayerLeaveArea(local_18.PlayerEntity);
                --local_15;
            }
        }
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.AreaEventTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.AreaEventTimer);
        }
        return;
    }
    bool IsEventActive() const
    {
        return this.LevelScriptEntity.IsValid() && this.LevelScriptEntity.IsActive();
    }
    void OnPlayerEnterArea(const FECSEntity &inout PlayerEntity)
    {
        int local_8 = 0;
        if (!(this.IsEventActive()))
        {
            local_8.SetLevelScriptEntity(this.LevelScriptEntity);
            return;
        }
        this.UpdateEventProgressForPlayer(PlayerEntity);
        Get local_12;
        const FC_AreaEventObjective& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.GetCurrentObjectiveInstanceId() > 0)
            {
                ::ObjectiveUtils::StartObjectiveGuide(local_14.GetCurrentObjectiveInstanceId(), PlayerEntity, EGuideStyleType(3));
            }
        }
        return;
    }
    void OnPlayerLeaveArea(const FECSEntity &inout PlayerEntity)
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
        }
        if (!(this.IsEventActive()))
        {
            return;
        }
        this.RemoveEventProgressForPlayer(PlayerEntity);
        Get local_14;
        const FC_AreaEventObjective& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetCurrentObjectiveInstanceId() > 0)
            {
                ::ObjectiveUtils::StopObjectiveGuide(local_16.GetCurrentObjectiveInstanceId(), PlayerEntity);
            }
        }
        return;
    }
    void ActivateEvent()
    {
        if (this.EventInfo)
        {
            this.LevelScriptEntity.IsValid();
            if (GetLevelObjectives().Num() > 0)
            {
                FC_PendingInitAreaEventObjectiveTag local_10;
                Assign local_8;
                local_8.opCall(local_10);
            }
        }
        this.ClearUnActiveEventForAllPlayers();
        this.UpdateEventProgressForAllPlayers();
        if (ECS::GetRuntimeInfo().IsServer && this.LevelScriptEntity.IsValid())
        {
            SendEvent local_16;
            local_16.opCall(FFPTime(-1));
        }
        return;
    }
    void DeactivateEvent()
    {
        this.TurnOffGuidingPath();
        this.TurnOffMark();
        this.RemoveEventProgressForAllPlayers();
        if (UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.AreaEventTimer))
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.AreaEventTimer);
        }
        return;
    }
    void SetLevelEventFinish(const bool bSuccess)
    {
        Make local_38;
        Make local_50;
        FFPTime local_4 = ECS::GetContextTime();
        if (bSuccess)
        {
            int local_7;
            int local_6;
            local_7 = 0;
            local_6 = local_7;
        }
        else
        {
            int local_7;
            int local_6;
            local_7 = 1;
            local_6 = local_7;
        }
        TArray<FECSEntity> local_12;
        Modify local_16;
        FC_LevelAreaEventPlayers& local_18 = local_16.opCall();
        if (local_18)
        {
            int local_6;
            int local_23 = local_18.PlayerInAreaList.Num() - 1;
            for (; local_23 >= 0; --local_23)
            {
                FPlayerInAreaInfo& local_26 = local_18.PlayerInAreaList[local_23];
                if (local_26.PlayerEntity.IsActive())
                {
                    FCE_LevelAreaEventPlayerLeave local_74;
                    if (!(!(bSuccess)) && this.EventSuccessMessageHint)
                    {
                        TArray<FTextArgument> local_32;
                        local_32.Add(local_38.opImplConv());
                        local_32.Add(local_50.opImplConv());
                        local_32.Add(local_38.opImplConv());
                        ::MessageHintUtils::ShowMessageHint(local_26.PlayerEntity, this.EventSuccessMessageHint, local_32);
                    }
                    else
                    {
                        bool local_19;
                        local_19 = !(bSuccess);
                        if (!(local_19))
                        {
                            local_19 = false;
                        }
                        else
                        {
                            local_19 = this.EventFailedMessageHint;
                        }
                        if (local_19)
                        {
                            TArray<FTextArgument> local_32;
                            local_32.Add(local_38.opImplConv());
                            local_32.Add(local_50.opImplConv());
                            ::MessageHintUtils::ShowMessageHint(local_26.PlayerEntity, this.EventFailedMessageHint, local_32);
                        }
                    }
                    local_12.Add(local_26.PlayerEntity);
                    float32 local_59 = float32((FMath::Max(0.0, (local_4 - local_26.EnterTime).ToSeconds())));
                    FFPTime local_2 = FFPTime(-1);
                    FECSEntity local_72 = FECSEntity(local_26.PlayerEntity.GetId());
                    FECSWorldPtr local_62 = ECS::GetECSWorld();
                    local_74.LevelScriptEntity = this.LevelScriptEntity;
                    local_74.Result = ELevelAreaEventLeaveResult(local_6);
                    local_74.Duration = local_59;
                }
            }
        }
        this.DeactivateEvent();
        if (bSuccess)
        {
            this.LevelEventSuccess(local_12);
        }
        else
        {
            this.LevelEventFailed(local_12);
        }
        return;
    }
    void LevelEventSuccess(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        int local_15 = 0;
        this.OnEventSuccess(TriggeredPlayers);
        ModifyOrAdd local_4;
        local_4.opCall().SetbIsSuccess(true);
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        Modify local_12;
        FCS_CommissionInfo& local_14 = local_12.opCall();
        if (local_14)
        {
            int local_16 = local_15;
            if (local_16 == 0)
            {
                ++local_14.RandomEventSuccessNum;
            }
        }
        return;
    }
    void LevelEventFailed(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        ModifyOrAdd local_4;
        local_4.opCall().SetbIsSuccess(false);
        this.OnEventFailed(TriggeredPlayers);
        return;
    }
    UFUNCTION()
    void OnEventSuccess_Implementation(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        return;
    }
    UFUNCTION()
    void OnEventFailed_Implementation(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        return;
    }
    UFUNCTION()
    void OnEventObjectiveFinished_Implementation(const int ObjectiveIndex, const TDataObjectPtr<FObjectiveConfig> &inout Objective)
    {
        return;
    }
    UFUNCTION()
    void ClientInitEntityByDefaultObject(const FECSEntity &inout Entity) const
    {
        TDataObjectPtr<FLevelEventInfoConfigBase> local_24 = this.EventInfo;
        Get local_52;
        const FC_LevelAreaEventInfo& local_54 = local_52.opCall();
        if (local_54)
        {
            local_24 = local_54.GetEventInfo();
        }
        Has local_60;
        if (local_24 && !(local_60.opCall()))
        {
            FC_PrefabConfig local_68;
            TDataObjectPtr<FBasePrefabConfig> local_92;
            local_68.ConfigPtr = local_92;
            local_68.PrefabType = EPrefabType(5);
        }
        return;
    }
    UFUNCTION()
    void OnPlayerBeginOverlapAreaVolume(const FECSContext &in Context, const FECSEntity &in Entity, const AActor TriggerActor)
    {
        int local_12 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        int local_14 = local_12.GetPlayerInAreaIndex(Entity);
        if (local_14 == -1)
        {
            if (local_12.PlayerInAreaList.Num() == 0)
            {
                if (!(UECSLevelTimerFunctions::ECSLevelHasTimer(this, this.AreaEventTimer)))
                {
                    UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.AreaEventTimer, 0.2f, true, -1.0f);
                }
            }
            FPlayerInAreaInfo local_28;
            local_28.PlayerEntity = Entity;
            local_28.bIsLeavingArea = false;
            local_28.EnterTime = ECS::GetContextTime();
            local_12.PlayerInAreaList.Add(local_28);
            this.OnPlayerEnterArea(local_28.PlayerEntity);
            if (this.IsEventActive())
            {
                FFPTime local_30 = FFPTime(-1);
                SendEvent local_34;
                local_34.opCall(local_30).LevelScriptEntity = this.LevelScriptEntity;
            }
            return;
        }
        local_12.PlayerInAreaList[local_14].bIsLeavingArea = false;
        return;
    }
    UFUNCTION()
    void OnPlayerEndOverlapAreaVolume(const FECSContext &in Context, const FECSEntity &in Entity, const AActor TriggerActor)
    {
        int local_12 = 0;
        if (!(this.LevelScriptEntity.IsValid()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            return;
        }
        int local_14 = local_12.GetPlayerInAreaIndex(Entity);
        FFPTime local_18 = ECS::GetContextTime();
        if (local_14 != -1)
        {
            FPlayerInAreaInfo& local_20 = local_12.PlayerInAreaList[local_14];
            local_20.bIsLeavingArea = true;
            local_20.LastCheckTime = local_18;
        }
        return;
    }
    UFUNCTION()
    void CheckPlayerLeavingArea()
    {
        int local_10 = 0;
        FFPTime local_4 = ECS::GetContextTime();
        int local_14 = local_10.PlayerInAreaList.Num() - 1;
        for (; local_14 >= 0; --local_14)
        {
            FPlayerInAreaInfo& local_18 = local_10.PlayerInAreaList[local_14];
            if (!(local_18.PlayerEntity.IsValid()) || !(local_18.PlayerEntity.IsActive()))
            {
                local_10.PlayerInAreaList.RemoveAt(local_14);
                continue;
            }
            if (local_18.bIsLeavingArea && ((local_4 - local_18.LastCheckTime).opCmp(this.EventAreaTriggerBufferTime) > 0))
            {
                FECSEntity local_26 = local_18.PlayerEntity;
                float32 local_20 = float32((FMath::Max(0.0, (local_4 - local_18.EnterTime).ToSeconds())));
                local_10.PlayerInAreaList.RemoveAt(local_14);
                this.OnPlayerLeaveArea(local_26);
                if (this.IsEventActive() && local_26.IsValid())
                {
                    FCE_LevelAreaEventPlayerLeave local_38;
                    FFPTime local_2 = FFPTime(-1);
                    local_38.LevelScriptEntity = this.LevelScriptEntity;
                    local_38.Result = ELevelAreaEventLeaveResult(2);
                    local_38.Duration = local_20;
                }
            }
        }
        if (local_10.PlayerInAreaList.Num() == 0)
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.AreaEventTimer);
        }
        return;
    }
    void UpdateEventProgressForPlayer(const FECSEntity &inout PlayerEntity)
    {
        Get local_4;
        int local_14 = 0;
        if (local_4.opCall())
        {
            if (this.EventInfo)
            {
                local_14.SetLevelScriptEntity(this.LevelScriptEntity);
                local_14.SetEventInfo(this.EventInfo);
            }
        }
        return;
    }
    void RemoveEventProgressForPlayer(const FECSEntity &inout PlayerEntity)
    {
        if (PlayerEntity.IsValid())
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    void UpdateEventProgressForAllPlayers()
    {
        Get local_4;
        const FC_LevelAreaEventPlayers& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_11 = local_6.PlayerInAreaList.Num() - 1;
            for (; local_11 >= 0; --local_11)
            {
                const FPlayerInAreaInfo& local_14 = local_6.PlayerInAreaList[local_11];
                if (local_14.PlayerEntity.IsActive())
                {
                    this.UpdateEventProgressForPlayer(local_14.PlayerEntity);
                }
            }
        }
        return;
    }
    void RemoveEventProgressForAllPlayers()
    {
        int local_20 = 0;
        Get local_4;
        const FC_LevelAreaEventPlayers& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_11 = local_6.PlayerInAreaList.Num() - 1;
            for (; local_11 >= 0; )
            {
                this.RemoveEventProgressForPlayer(local_6.PlayerInAreaList[local_11].PlayerEntity);
                local_20.SetLevelScriptEntity(this.LevelScriptEntity);
                --local_11;
            }
        }
        return;
    }
    void ClearUnActiveEventForAllPlayers()
    {
        Get local_4;
        const FC_LevelAreaEventPlayers& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_11 = local_6.PlayerInAreaList.Num() - 1;
            for (; local_11 >= 0; --local_11)
            {
                const FPlayerInAreaInfo& local_14 = local_6.PlayerInAreaList[local_11];
                if (local_14.PlayerEntity.IsActive())
                {
                    Remove local_18;
                    local_18.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void AddEventProgress(const int AddValue = 1)
    {
        FC_LevelAreaEventProcess local_12;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        if (int(local_12.EventProgress) < this.EventTargetNumber)
        {
            local_12.EventProgress = (int(local_12.EventProgress) + AddValue);
            this.UpdateEventProgressForAllPlayers();
            if (int(local_12.EventProgress) >= this.EventTargetNumber)
            {
                this.SetLevelEventFinish(true);
            }
        }
        return;
    }
    UFUNCTION()
    void TurnOnMinimapIcon()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void TurnOffMinimapIcon()
    {
        ::EntityLevelSpotUtils::RemoveSpotData(this.LevelScriptEntity, ELevelSpotDataSource(4));
        return;
    }
    UFUNCTION()
    void TurnOnIndicator()
    {
        XWarning(ELog(22), "TurnOnIndicator е·Іеєџејѓдё”дёЌе†Ќз”џж•€пјљHUDIndicatorSystem е·Іиў«еџєдєЋ Spot зљ„ Indicator / HeadsUpDisplay дЅ“зі»еЏ–д»ЈгЂ‚");
        return;
    }
    UFUNCTION()
    void TurnOffIndicator()
    {
        XWarning(ELog(22), "TurnOffIndicator е·Іеєџејѓдё”дёЌе†Ќз”џж•€пјљHUDIndicatorSystem е·Іиў«еџєдєЋ Spot зљ„ Indicator / HeadsUpDisplay дЅ“зі»еЏ–д»ЈгЂ‚");
        return;
    }
    UFUNCTION()
    void TurnOffMark()
    {
        Get local_4;
        const FC_Marked& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_26 : local_6.MarkPlayers)
            {
                ::MarkUtil::RemoveMark(local_26, this.LevelScriptEntity);
            }
        }
        return;
    }
    void TurnOffGuidingPath()
    {
        Get local_4;
        const FC_GuidingPathTarget& local_6 = local_4.opCall();
        GetDefaulted local_26;
        if (local_6)
        {
            for (auto& local_22 : local_6.GuidingPlayers)
            {
                if ((FECSEntity(local_26.opCall().GetTargetEntity()) == this.LevelScriptEntity))
                {
                    ::FGuidingPathUtils::ServerCancelGuidingPath(local_22);
                }
            }
        }
        return;
    }
    void OnEventSuccess(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        __Evt_PushArgument(TriggeredPlayers);
        __Evt_Execute(this, n"OnEventSuccess");
        return;
    }
    void OnEventFailed(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        __Evt_PushArgument(TriggeredPlayers);
        __Evt_Execute(this, n"OnEventFailed");
        return;
    }
    UFUNCTION()
    void ActivateLevelObjective(const TDataObjectPtr<FObjectiveConfig> &inout Objective)
    {
        int local_20 = 0;
        if (this.EventInfo.IsSet() && (GetLevelObjectives().Num() > 0))
        {
            XError(ELog(22), FString().Append(this.GetName()).Append(" LevelObjectives is not empty, cannot activate objective manually"));
            return;
        }
        Objective.IsSet();
        local_20.SetCurrentObjectiveIndex(-1);
        FObjectiveContext local_26;
        local_20.SetCurrentObjectiveInstanceId(::ObjectiveUtils::ActivateObjective(Objective, local_26));
        local_20.SetCurrentObjective(Objective);
        FName local_29;
        local_29.GetDataName();
        XLog(ELog(22), FString().Append(this.GetName()).Append(" ActivateLevelObjective: ").Append(local_29));
        return;
    }
    UFUNCTION()
    void DeactivateEventObjective(const TDataObjectPtr<FObjectiveConfig> &inout Objective)
    {
        Get local_4;
        const FC_AreaEventObjective& local_6 = local_4.opCall();
        if (local_6)
        {
            TDataObjectPtr<FObjectiveConfig> local_32;
            local_32 = local_6.GetCurrentObjective();
            if ((local_32 == Objective.opImplConv()))
            {
                FName local_96;
                ::ObjectiveUtils::DeactivateObjectives(local_6.GetCurrentObjectiveInstanceId());
                local_96.GetDataName();
                XLog(ELog(22), FString().Append(this.GetName()).Append(" DeactivateLevelObjective: ").Append(local_96));
                Remove local_102;
                local_102.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void FinishCurrentEventObjective()
    {
        Get local_4;
        const FC_AreaEventObjective& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetCurrentObjectiveInstanceId() > 0)
            {
                FName local_20;
                local_20.GetDataName();
                XLog(ELog(22), FString().Append(this.GetName()).Append(" FinishCurrentEventObjective: ").Append(local_20));
                ::ObjectiveUtils::SetObjectiveStatusManually(local_6.GetCurrentObjectiveInstanceId(), EObjectiveStatus(2));
            }
        }
        return;
    }
    UFUNCTION()
    void FinishAllEventObjectives()
    {
        XLog(ELog(22), FString().Append(this.GetName()).Append(" FinishAllEventObjectives"));
        this.NotifyAllEventObjectivesFinished();
        return;
    }
    void SetObjectiveGuideEnabled(const uint ObjectiveInstanceId, const bool bEnabled)
    {
        if (ObjectiveInstanceId > 0)
        {
            Get local_6;
            const FC_LevelAreaEventPlayers& local_8 = local_6.opCall();
            if (local_8)
            {
                if (bEnabled)
                {
                    for (auto& local_22 : local_8.PlayerInAreaList)
                    {
                        ::ObjectiveUtils::StartObjectiveGuide(ObjectiveInstanceId, local_22.PlayerEntity, EGuideStyleType(3));
                    }
                    return;
                }
                ::ObjectiveUtils::StopObjectiveGuide(ObjectiveInstanceId, ENTITY_NULL);
            }
        }
        return;
    }
    void NotifyLevelObjectiveStatusChanged(const int ObjectiveIndex, const uint ObjectiveInstanceId, const TDataObjectPtr<FObjectiveConfig> &inout Objective, const EObjectiveStatus Status)
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        FName local_16;
        local_16.GetDataName();
        XLog(ELog(22), FString().Append(this.GetName()).Append(" LevelObjective Status changed: Idx:").Append(ObjectiveIndex).Append(" Obj:").Append(local_16).Append(" Status:").Append(Status));
        this.SetObjectiveGuideEnabled(ObjectiveInstanceId, (int(Status) == 1));
        if (int(Status) == 2)
        {
            this.OnEventObjectiveFinished(ObjectiveIndex, Objective);
            return;
        }
        if (int(Status) == 3)
        {
            this.SetLevelEventFinish(false);
        }
        return;
    }
    void NotifyAllEventObjectivesFinished()
    {
        XLog(ELog(22), FString().Append(this.GetName()).Append(" EventObjective All Finished"));
        this.SetLevelEventFinish(true);
        return;
    }
    void OnEventObjectiveFinished(const int ObjectiveIndex, const TDataObjectPtr<FObjectiveConfig> &inout Objective)
    {
        __Evt_PushArgument__int32(ObjectiveIndex);
        __Evt_PushArgument(Objective);
        __Evt_Execute(this, n"OnEventObjectiveFinished");
        return;
    }
}

