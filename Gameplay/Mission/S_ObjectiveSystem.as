class US_ObjectiveSystem : UECSScriptSystem
{
    US_ObjectiveSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitObjectiveExitHandler() const
    {
        UGameDSConnectionSubsystem local_4 = ::UGameDSConnectionSubsystem::Get();
        if (local_4 != nullptr)
        {
            local_4.OnPlayerExitDS.AddUFunction(this, n"OnPlayerExitDS");
        }
        return;
    }
    UFUNCTION()
    void OnPlayerExitDS(const FECSEntity &inout PlayerEntity) const
    {
        XLog(ELog(65), FString().Append("OnPlayerExitDS: deactivate objectives for PlayerEntity=").Append(PlayerEntity));
        ::ObjectiveUtils::DeactivateObjectivesForPlayer(PlayerEntity);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGSConditionCurrentValueUpdate(const FCE_GSConditionCurrentValueUpdate &inout Event, FCS_ObjectiveManager &inout ObjectiveManager) const
    {
        XLog(ELog(65), FString().Append("Handle GSCondition Current Value Update"));
        FECSEntity local_10 = FECSEntity(Event.Sender);
        for (auto& local_30 : ObjectiveManager.ActiveObjectives)
        {
            FObjectiveInstance& local_32 = local_30.GetValue();
            if (int(local_32.Context.ConditionUsage) == 0)
            {
                continue;
            }
            if ((!((local_32.Context.ContextEntity == local_10))))
            {
                continue;
            }
            if (this.TryUpdateObjectiveProgress(local_32.FinishConditionInfo, Event))
            {
                XLog(ELog(65), FString().Append("Finish Progress Updated: ").Append(local_32.ObjectiveId).Append("(").Append(local_32.InstanceId).Append(")  => ").Append(local_32.GetFinishProgressValue()));
                ::ObjectiveUtils::SendProgressUpdatedEvent(local_32, true, local_32.GetFinishProgressValue());
            }
            if (this.TryUpdateObjectiveProgress(local_32.FailConditionInfo, Event))
            {
                XLog(ELog(65), FString().Append("Fail Progress Updated: ").Append(local_32.ObjectiveId).Append("(").Append(local_32.InstanceId).Append(")  => ").Append(local_32.GetFailProgressValue()));
                ::ObjectiveUtils::SendProgressUpdatedEvent(local_32, false, local_32.GetFailProgressValue());
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleConditionCurrentValueUpdate(const FCE_ConditionCurrentValueUpdate &inout Event, FCS_ObjectiveManager &inout ObjectiveManager) const
    {
        XLog(ELog(65), FString().Append("Condition Current Value Update: ").Append(Event.ConditionInstance.GetLocalConditionInstanceID()));
        int local_5 = ::ConditionUtils::GetCurrentValue(Event.ConditionInstance);
        for (auto& local_28 : ObjectiveManager.ActiveObjectives)
        {
            FConditionInstanceHandle local_54;
            if (local_54.opCmp(Event.ConditionInstance) == 0)
            {
                local_28.GetValue().FinishConditionInfo.ProgressValue = local_5;
                XLog(ELog(65), FString().Append("Finish Progress Updated: ").Append(local_28.GetValue().ObjectiveId).Append("(").Append(local_28.GetKey()).Append(")  => ").Append(local_5));
                ::ObjectiveUtils::SendProgressUpdatedEvent(local_28.GetValue(), true, local_5);
            }
            if (local_54.opCmp(Event.ConditionInstance) == 0)
            {
                local_28.GetValue().FailConditionInfo.ProgressValue = local_5;
                XLog(ELog(65), FString().Append("Fail Progress Updated: ").Append(local_28.GetValue().ObjectiveId).Append("(").Append(local_28.GetKey()).Append(")  => ").Append(local_5));
                ::ObjectiveUtils::SendProgressUpdatedEvent(local_28.GetValue(), false, local_5);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleConditionReachStateUpdate(const FCE_ConditionReachStateUpdate &inout Event, FCS_ObjectiveManager &inout ObjectiveManager) const
    {
        XLog(ELog(65), FString().Append("Condition Reached: ").Append(Event.ConditionInstance.GetLocalConditionInstanceID()));
        TArray<uint> local_10;
        TArray<uint> local_14;
        for (auto& local_34 : ObjectiveManager.ActiveObjectives)
        {
            FConditionInstanceHandle local_60;
            if (local_60.opCmp(Event.ConditionInstance) == 0)
            {
                local_10.Add(local_34.GetKey());
            }
            if (local_60.opCmp(Event.ConditionInstance) == 0)
            {
                local_14.Add(local_34.GetKey());
            }
        }
        for (auto local_73 : local_10)
        {
            if (!(ObjectiveManager.ActiveObjectives.Contains(local_73)))
            {
                continue;
            }
            ObjectiveManager.ActiveObjectives[local_73].Status = EObjectiveStatus(2);
            this.SendStatusChangeEvent(ObjectiveManager, ObjectiveManager.ActiveObjectives[local_73]);
        }
        for (auto local_73 : local_14)
        {
            if (!(ObjectiveManager.ActiveObjectives.Contains(local_73)))
            {
                continue;
            }
            ObjectiveManager.ActiveObjectives[local_73].Status = EObjectiveStatus(3);
            this.SendStatusChangeEvent(ObjectiveManager, ObjectiveManager.ActiveObjectives[local_73]);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleManualSetObjectiveStatus(FCS_ObjectiveManager &inout ObjectiveManager, const FCS_ManualSetObjectiveStatus &inout ManualSetObjectiveStatus) const
    {
        for (auto& local_20 : ManualSetObjectiveStatus.ObjectiveStatusMap)
        {
            FObjectiveInstance& local_22 = ObjectiveManager.ActiveObjectives.FindOrAdd(local_20.GetKey());
            local_22.Status = EObjectiveStatus(local_20.GetValue());
            XLog(ELog(65), FString().Append("Status changed: ").Append(local_22.ObjectiveId).Append("(").Append(local_20.GetKey()).Append(") = ").Append(local_20.GetValue()));
            this.SendStatusChangeEvent(ObjectiveManager, ObjectiveManager.ActiveObjectives[local_20.GetKey()]);
        }
        FECSWorldPtr local_32 = ECS::GetECSWorld();
        Remove local_36;
        local_36.opCall();
        return;
    }
    void SendStatusChangeEvent(FCS_ObjectiveManager &inout ObjectiveManager, FObjectiveInstance &inout ObjectiveInstance) const
    {
        FCE_ObjectiveGroupNewChildActivated local_222;
        int local_1 = int(ObjectiveInstance.InstanceId);
        XLog(ELog(65), FString().Append("Status changed: ").Append(ObjectiveInstance.ObjectiveId).Append("(").Append(local_1).Append(") = ").Append(ObjectiveInstance.Status));
        FFPTime local_16 = FFPTime(-1);
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        FCE_ObjectiveStatusChanged local_20;
        local_20.ObjectiveInstanceId = local_1;
        local_20.ObjectiveId = int(ObjectiveInstance.ObjectiveId);
        local_20.Status = EObjectiveStatus(ObjectiveInstance.Status);
        TArray<uint> local_26;
        for (auto& local_46 : ObjectiveManager.ActiveObjectives)
        {
            if (!(::ObjectiveUtils::GroupContainsChildInstance(local_46.GetValue(), local_1)))
            {
                continue;
            }
            FObjectiveInstance& local_48 = ObjectiveManager.ActiveObjectives[local_46.GetKey()];
            EObjectiveStatus local_21 = this.CalculateObjectiveGroupStatus(ObjectiveManager, local_48);
            if (int(local_21) != int(local_48.Status))
            {
                FCE_ObjectiveStatusChanged local_52;
                if (int(local_21) == 2)
                {
                    local_48.FinishConditionInfo.ProgressValue = 1;
                    XLog(ELog(65), FString().Append("Group Finish Progress Updated: ").Append(local_46.GetValue().ObjectiveId).Append("(").Append(local_46.GetKey()).Append(") 0 => 1"));
                    ::ObjectiveUtils::SendProgressUpdatedEvent(local_48, true, 1);
                }
                else
                {
                    if (int(local_21) == 3)
                    {
                        local_48.FailConditionInfo.ProgressValue = 1;
                        XLog(ELog(65), FString().Append("Group Fail Progress Updated: ").Append(local_46.GetValue().ObjectiveId).Append("(").Append(local_46.GetKey()).Append(") 0 => 1"));
                        ::ObjectiveUtils::SendProgressUpdatedEvent(local_48, false, 1);
                    }
                }
                XLog(ELog(65), FString().Append("Group Status changed: ").Append(local_46.GetValue().ObjectiveId).Append("(").Append(local_46.GetKey()).Append(") ").Append(local_46.GetValue().Status).Append(" => ").Append(local_21));
                local_48.Status = EObjectiveStatus(local_21);
                FFPTime local_16_2 = FFPTime(-1);
                FECSWorldPtr local_10_2 = ECS::GetECSWorld();
                local_52.ObjectiveInstanceId = local_46.GetKey();
                int local_2 = local_46.GetValue().ObjectiveId;
                local_52.ObjectiveId = local_2;
                local_52.Status = EObjectiveStatus(local_46.GetValue().Status);
            }
            if (int(local_46.GetValue().FinishType) == 2 && (int(ObjectiveInstance.Status) == 2))
            {
                local_26.Add(local_46.GetKey());
            }
        }
        for (auto local_67 : local_26)
        {
            FObjectiveInstance local_214;
            if (!(::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_67, local_214)))
            {
                continue;
            }
            if (int(local_214.Status) != 1)
            {
                continue;
            }
            int local_2_2 = ::ObjectiveUtils::TryActivateNextSequenceChild(local_67, local_214.Context);
            if (local_2_2 == 0)
            {
                continue;
            }
            FFPTime local_16_3 = FFPTime(-1);
            FECSWorldPtr local_10_3 = ECS::GetECSWorld();
            local_222.GroupInstanceId = local_67;
            local_222.NewChildInstanceId = local_2_2;
        }
        return;
    }
    EObjectiveStatus CalculateObjectiveGroupStatus(const FCS_ObjectiveManager &inout ObjectiveManager, const FObjectiveInstance &inout ObjectiveInfo) const
    {
        if (int(ObjectiveInfo.FinishType) == 0 || (int(ObjectiveInfo.FinishType) == 2))
        {
            FObjectiveInstance local_172;
            bool local_6;
            local_6 = true;
            for (auto& local_24 : ObjectiveInfo.ChildObjectiveMap)
            {
                int local_25 = local_24.GetValue();
                if (local_25 == 0)
                {
                    local_6 = false;
                    continue;
                }
                if (this.ShouldIgnoreChildForGroupStatus(local_24.GetKey()))
                {
                    continue;
                }
                if (!(ObjectiveManager.ActiveObjectives.Find(local_24.GetValue(), local_172)))
                {
                    XWarning(ELog(65), FString().Append("CalculateObjectiveGroupStatus(All): child instance ").Append(local_24.GetValue()).Append(" not found in ActiveObjectives"));
                    local_6 = false;
                    continue;
                }
                if (int(local_172.Status) == 3)
                {
                    return EObjectiveStatus(3);
                }
                if (int(local_172.Status) != 2)
                {
                    local_6 = false;
                }
            }
            if (local_6)
            {
                return EObjectiveStatus(2);
            }
        }
        else
        {
            FObjectiveInstance local_172;
            bool local_6;
            if (int(ObjectiveInfo.FinishType) == 1)
            {
                local_6 = true;
                for (auto& local_24_2 : ObjectiveInfo.ChildObjectiveMap)
                {
                    if (this.ShouldIgnoreChildForGroupStatus(local_24_2.GetKey()))
                    {
                        continue;
                    }
                    if (!(ObjectiveManager.ActiveObjectives.Find(local_24_2.GetValue(), local_172)))
                    {
                        XWarning(ELog(65), FString().Append("CalculateObjectiveGroupStatus(Any): child instance ").Append(local_24_2.GetValue()).Append(" not found in ActiveObjectives"));
                        local_6 = false;
                        continue;
                    }
                    if (int(local_172.Status) == 2)
                    {
                        return EObjectiveStatus(2);
                    }
                    if (int(local_172.Status) != 3)
                    {
                        local_6 = false;
                    }
                }
                if (local_6)
                {
                    return EObjectiveStatus(3);
                }
            }
        }
        return ObjectiveInfo.Status;
    }
    bool ShouldIgnoreChildForGroupStatus(const uint ChildObjectiveId) const
    {
        bool local_49 = !(::ObjectiveUtils::FindObjectiveConfig(ChildObjectiveId).IsSet());
        if (local_49)
        {
            return false;
        }
        CastTo local_54;
        TDataObjectPtr<FObjectiveSingleConfig> local_78 = local_54.opCall();
        if (!(local_78.IsSet()))
        {
            local_49 = false;
        }
        else
        {
            local_49 = local_78.Get().bIgnoreStatusInGroup;
        }
        return local_49;
    }
    bool TryUpdateObjectiveProgress(FObjectiveConditionInfo &inout ConditionInfo, const FCE_GSConditionCurrentValueUpdate &inout Event) const
    {
        if (!(ConditionInfo.IsGSCondition()))
        {
            return false;
        }
        bool local_2 = false;
        if (Event.GSConditionValueMap.Contains(ConditionInfo.GSCondDataId))
        {
            ConditionInfo.ProgressValue = Event.GSConditionValueMap[ConditionInfo.GSCondDataId];
            local_2 = true;
        }
        if (Event.GSEventValueMap.Contains(ConditionInfo.ConditionIdentifier))
        {
            ConditionInfo.ProgressValue = Event.GSEventValueMap[ConditionInfo.ConditionIdentifier];
            local_2 = true;
        }
        return local_2;
    }
    UFUNCTION()
    void Run_ServerJob_InitObjectiveExitHandler() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitObjectiveExitHandler();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGSConditionCurrentValueUpdate() const
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
        TECSEventConstIterator<FCE_GSConditionCurrentValueUpdate> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_GSConditionCurrentValueUpdate& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleGSConditionCurrentValueUpdate(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleConditionCurrentValueUpdate() const
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
        TECSEventConstIterator<FCE_ConditionCurrentValueUpdate> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_ConditionCurrentValueUpdate& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleConditionCurrentValueUpdate(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleConditionReachStateUpdate() const
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
        TECSEventConstIterator<FCE_ConditionReachStateUpdate> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_ConditionReachStateUpdate& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleConditionReachStateUpdate(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleManualSetObjectiveStatus() const
    {
        int local_16 = 0;
        int local_22 = 0;
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
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        this.ServerJob_HandleManualSetObjectiveStatus(local_16, local_22);
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_30;
        local_30.opCall(local_16);
        return;
    }
}

