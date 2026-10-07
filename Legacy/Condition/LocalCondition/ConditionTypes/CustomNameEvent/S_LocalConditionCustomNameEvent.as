

class US_LocalConditionCustomNameEvent : UECSScriptSystem
{
    US_LocalConditionCustomNameEvent()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCustomNameEventCondition(const FCE_CommissionCustomNameEvent &inout Event, const FCS_CustomNameEventConditionManager &inout CustomNameEventConditionManager) const
    {
        bool local_3 = !((Event.CustomName == NAME_None));
        if (CustomNameEventConditionManager.MonitoredEvents.Contains(Event.CustomName))
        {
            for (auto& local_18 : CustomNameEventConditionManager.MonitoredEvents[Event.CustomName].ConditionInstances)
            {
                if (::ConditionUtils::IsReached(local_18))
                {
                    continue;
                }
                ::ConditionUtils::SetLocalConditionValueForInstance(local_18, (::ConditionUtils::GetCurrentValue(local_18) + Event.Count));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCustomNameEventCondition() const
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
        TECSEventConstIterator<FCE_CommissionCustomNameEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CommissionCustomNameEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleCustomNameEventCondition(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

