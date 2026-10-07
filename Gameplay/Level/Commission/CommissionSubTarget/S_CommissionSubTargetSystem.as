
const FConsoleVariable CVar_DebugCommissionSubTaret = FConsoleVariable();

class US_CommissionSubTargetSystem : UECSScriptSystem
{
    US_CommissionSubTargetSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_CommissionSubTargetHandleConditionReachStateUpdate(const FCE_ObjectiveStatusChanged &inout Event, const FCS_CommissionSubTarget &inout CommissionSubTarget) const
    {
        Modify local_24;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            return;
        }
        if (int(Event.ObjectiveInstanceId) == CommissionSubTarget.GetObjectiveInstanceId())
        {
            ::CommissionUtils::SetObjectiveGuideEnabledToAllPlayers(int(Event.ObjectiveInstanceId), (int(Event.Status) == 1), EGuideStyleType(3));
            XLog(ELog(22), FString().Append("CommissionSubTarget Condition Reached: ").Append(Event.ObjectiveInstanceId));
            if (int(Event.Status) == 3)
            {
                FECSWorldPtr local_2_2 = ECS::GetECSWorld();
                local_24.opCall().SetSubTargetStatus(ECommissionSubTargetStatus(2));
                return;
            }
            if (int(Event.Status) == 2)
            {
                FECSWorldPtr local_2_3 = ECS::GetECSWorld();
                local_24.opCall().SetSubTargetStatus(ECommissionSubTargetStatus(1));
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleObjectiveGroupNewChildActivated(const FCE_ObjectiveGroupNewChildActivated &inout Event, const FCS_CommissionSubTarget &inout CommissionSubTarget) const
    {
        int local_168 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            return;
        }
        if (CommissionSubTarget.GetObjectiveInstanceId() != int(Event.GroupInstanceId))
        {
            return;
        }
        FObjectiveInstance local_156;
        if (!(::ObjectiveUtils::TryFindActivetedObjectiveInstance(int(Event.NewChildInstanceId), local_156)))
        {
            XWarning(ELog(22), FString().Append("SubTarget ServerJob_HandleObjectiveGroupNewChildActivated: new child instance ").Append(Event.NewChildInstanceId).Append(" not found"));
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FCommissionSubTargetProgress local_170;
        local_170.SetSuccessProgressValue(local_156.GetFinishProgressValue());
        local_170.SetFailedProgressValue(local_156.GetFailProgressValue());
        local_168.Add(local_156.ObjectiveId, local_170);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCommissionSubTargetProgressUpdate(const FCE_ObjectiveProgressUpdated &inout Event, const FCS_CommissionSubTarget &inout CommissionSubTarget) const
    {
        Modify local_16;
        FObjectiveInstance local_162;
        int local_164 = 0;
        FObjectiveInstance local_328;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            return;
        }
        if (0 == 0)
        {
            if (CommissionSubTarget.GetObjectiveInstanceId() == int(Event.ObjectiveInstanceId))
            {
                if (Event.bIsFinishProgress)
                {
                    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
                    local_16.opCall().GetModify_Progress().SetSuccessProgressValue(Event.NewProgressValue);
                }
                else
                {
                    int local_10_2 = Event.NewProgressValue;
                    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
                    local_16.opCall().GetModify_Progress().SetFailedProgressValue(local_10_2);
                }
            }
            return;
        }
        int local_12 = CommissionSubTarget.GetObjectiveInstanceId();
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
                        if (local_164.Contains(local_328.ObjectiveId))
                        {
                            local_164[local_328.ObjectiveId].SetSuccessProgressValue(local_328.GetFinishProgressValue());
                            local_164[local_328.ObjectiveId].SetFailedProgressValue(local_328.GetFailProgressValue());
                        }
                        else
                        {
                            FCommissionSubTargetProgress local_330;
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
    void DebugSingleSubObjective(const FObjectiveSingleConfig &inout ObjectiveSingleConfig, const int SuccessProgressValue, const int FailedProgressValue) const
    {
        FString local_4 = FString().Append("SingleSubObjective: ").Append(ObjectiveSingleConfig.ObjectiveTitle).Append(" ");
        if (ObjectiveSingleConfig.GetFinishCondition().IsSet())
        {
            local_4 += FString().Append("FinishCondition: ").Append(SuccessProgressValue).Append(" / ").Append(::ConditionUtils::GetTargetValue(ObjectiveSingleConfig.GetFinishCondition())).Append("  ");
        }
        if (ObjectiveSingleConfig.GetFailCondition().IsSet())
        {
            local_4 += FString().Append("FailCondition: ").Append(FailedProgressValue).Append(" / ").Append(::ConditionUtils::GetTargetValue(ObjectiveSingleConfig.GetFailCondition())).Append("  ");
        }
        System::PrintString(__GetWorldContext(), local_4, true, false, FLinearColor::Green, -1.0f, n"SingleSubObjective");
        return;
    }
    UFUNCTION()
    void ClientJob_DebugCommissionSubTarget(const FCS_CommissionSubTarget &inout CommissionSubTarget) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    UFUNCTION()
    void Run_ServerJob_CommissionSubTargetHandleConditionReachStateUpdate() const
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
            this.ServerJob_CommissionSubTargetHandleConditionReachStateUpdate(local_70, local_12);
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
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCommissionSubTargetProgressUpdate() const
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
            this.ServerJob_HandleCommissionSubTargetProgressUpdate(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugCommissionSubTarget() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        if (CVar_DebugCommissionSubTaret.GetBool() == false)
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.ClientJob_DebugCommissionSubTarget(local_12);
        return;
    }
}

