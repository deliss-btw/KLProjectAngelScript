

class US_LocalConditionCustomLevelEvent : UECSScriptSystem
{
    US_LocalConditionCustomLevelEvent()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleLevelCustomEventCondition(const FCE_CustomLevelEvent &inout Event, const FCS_LevelCustomEventConditionManager &inout LevelCustomEventConditionManager) const
    {
        bool local_3 = !((Event.CustomName == NAME_None));
        if (LevelCustomEventConditionManager.MonitoredEvents.Contains(Event.CustomName))
        {
            for (auto& local_18 : LevelCustomEventConditionManager.MonitoredEvents[Event.CustomName].ConditionInstances)
            {
                if (::ConditionUtils::IsReached(local_18))
                {
                    continue;
                }
                ::ConditionUtils::SetLocalConditionValueForInstance(local_18, (::ConditionUtils::GetCurrentValue(local_18) + 1));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleLevelCustomEventCondition() const
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
        TECSEventConstIterator<FCE_CustomLevelEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CustomLevelEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleLevelCustomEventCondition(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

