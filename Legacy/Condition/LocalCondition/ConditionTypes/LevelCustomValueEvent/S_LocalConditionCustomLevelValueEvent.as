

class US_LocalConditionCustomLevelValueEvent : UECSScriptSystem
{
    US_LocalConditionCustomLevelValueEvent()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleLevelCustomValueEventCondition(const FCE_CustomLevelValueEvent &inout Event, const FCS_LevelCustomValueEventConditionManager &inout LevelCustomValueEventConditionManager) const
    {
        bool local_3 = !((Event.CustomName == NAME_None));
        if (LevelCustomValueEventConditionManager.MonitoredEvents.Contains(Event.CustomName))
        {
            TArray<FConditionInstanceHandle> local_8 = LevelCustomValueEventConditionManager.MonitoredEvents[Event.CustomName].ConditionInstances;
            for (auto& local_22 : local_8)
            {
                if (::ConditionUtils::IsReached(local_22))
                {
                    continue;
                }
                ::ConditionUtils::SetLocalConditionValueForInstance(local_22, (::ConditionUtils::GetCurrentValue(local_22) + Event.Count));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleLevelCustomValueEventCondition() const
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
        TECSEventConstIterator<FCE_CustomLevelValueEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CustomLevelValueEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleLevelCustomValueEventCondition(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

