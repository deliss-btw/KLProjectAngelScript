

class US_LevelObjectiveSystem : UECSScriptSystem
{
    US_LevelObjectiveSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitAreaEventObjective(const FECSEntity &inout LevelScriptEntity, const FC_LevelScriptActor &inout C_LevelScriptActor) const
    {
        int local_22 = 0;
        Remove local_4;
        local_4.opCall();
        AActor local_8;
        AKLLevelScriptAreaEventBase local_12 = (Cast<AKLLevelScriptAreaEventBase>(local_8));
        if (local_12 != nullptr)
        {
            if (local_12.EventInfo.IsSet() && (GetLevelObjectives().Num() > 0))
            {
                local_22.SetObjectives(GetLevelObjectives());
                local_22.SetCurrentObjectiveIndex(0);
                FObjectiveContext local_28;
                local_22.SetCurrentObjectiveInstanceId(::ObjectiveUtils::ActivateObjective(local_22.GetObjectives()[0], local_28));
                local_22.SetCurrentObjective(local_22.GetObjectives()[0]);
                FObjectiveProgressData local_34;
                local_22.SetProgress(local_34);
                local_22.GetModify_ObjectiveGroupSuccessProgress().Empty(0);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleAreEventObjectiveStatusChanged(const FCE_ObjectiveStatusChanged &inout Event) const
    {
        int local_126 = 0;
        AKLLevelScriptAreaEventBase local_138;
        FObjectiveInstance local_300;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            local_82.Proceed();
            if (local_126.GetCurrentObjectiveInstanceId() == int(Event.ObjectiveInstanceId))
            {
                AActor local_134;
                local_138 = Cast<AKLLevelScriptAreaEventBase>(local_134);
                local_126.GetCurrentObjective().IsSet();
                local_138.NotifyLevelObjectiveStatusChanged(local_126.GetCurrentObjectiveIndex(), local_126.GetCurrentObjectiveInstanceId(), local_126.GetCurrentObjective(), Event.Status);
                if (int(Event.Status) == 2)
                {
                    if (local_126.GetCurrentObjectiveIndex() >= 0 && (local_126.GetCurrentObjectiveIndex() < local_126.GetObjectives().Num()))
                    {
                        int local_141 = local_126.GetCurrentObjectiveIndex() + 1;
                        if (local_141 < local_126.GetObjectives().Num())
                        {
                            local_126.SetCurrentObjectiveIndex(local_141);
                            local_126.SetCurrentObjective(local_126.GetObjectives()[local_126.GetCurrentObjectiveIndex()]);
                            ::ObjectiveUtils::DeactivateObjectives(local_126.GetCurrentObjectiveInstanceId());
                            FObjectiveContext local_154;
                            local_126.SetCurrentObjectiveInstanceId(::ObjectiveUtils::ActivateObjective(local_126.GetObjectives()[local_126.GetCurrentObjectiveIndex()], local_154));
                            if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_126.GetCurrentObjectiveInstanceId(), local_300))
                            {
                                local_126.GetProgress().SetSuccessProgressValue(local_300.GetFinishProgressValue());
                                local_126.GetProgress().SetFailedProgressValue(local_300.GetFailProgressValue());
                                local_126.GetProgress().SetObjectiveState(local_300.Status);
                            }
                        }
                        else
                        {
                            local_138.NotifyAllEventObjectivesFinished();
                            Remove local_304;
                            local_304.opCall();
                        }
                    }
                }
                else
                {
                    if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_126.GetCurrentObjectiveInstanceId(), local_300))
                    {
                        local_126.GetProgress().SetSuccessProgressValue(local_300.GetFinishProgressValue());
                        local_126.GetProgress().SetFailedProgressValue(local_300.GetFailProgressValue());
                        local_126.GetProgress().SetObjectiveState(local_300.Status);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleLevelObjectiveProgressUpdate(const FCE_ObjectiveProgressUpdated &inout Event) const
    {
        int local_126 = 0;
        int local_127 = 0;
        FObjectiveInstance local_278;
        FObjectiveInstance local_462;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            local_82.Proceed();
            if (local_127 == 0)
            {
                if (local_126.GetCurrentObjectiveInstanceId() == int(Event.ObjectiveInstanceId))
                {
                    if (local_127 == 0)
                    {
                        if (Event.bIsFinishProgress)
                        {
                            local_126.GetProgress().SetSuccessProgressValue(int(Event.NewProgressValue));
                        }
                        else
                        {
                            local_126.GetProgress().SetFailedProgressValue(int(Event.NewProgressValue));
                        }
                    }
                }
                continue;
            }
            int local_130 = local_126.GetCurrentObjectiveInstanceId();
            if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_130, local_278))
            {
                int local_131 = int(Event.ObjectiveInstanceId);
                if (::ObjectiveUtils::GroupContainsChildInstance(local_278, local_131))
                {
                    TMap<uint, FObjectiveProgressData> local_298;
                    for (auto& local_316 : local_278.ChildObjectiveMap)
                    {
                        local_316;
                        if (local_130 == 0)
                        {
                            continue;
                        }
                        if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_131, local_462))
                        {
                            FObjectiveProgressData local_466;
                            local_466.SetSuccessProgressValue(local_462.GetFinishProgressValue());
                            local_466.SetFailedProgressValue(local_462.GetFailProgressValue());
                            local_466.SetObjectiveState(local_462.Status);
                            local_298.Add(local_462.ObjectiveId, local_466);
                        }
                    }
                    local_126.SetObjectiveGroupSuccessProgress(local_298);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitAreaEventObjective() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.ServerJob_InitAreaEventObjective(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_InitAreaEventObjective(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleAreEventObjectiveStatusChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ObjectiveStatusChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ObjectiveStatusChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleAreEventObjectiveStatusChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleLevelObjectiveProgressUpdate() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ObjectiveProgressUpdated> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ObjectiveProgressUpdated& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleLevelObjectiveProgressUpdate(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

