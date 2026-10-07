

class US_ConditionCombatItemUseSystem : UECSScriptSystem
{
    US_ConditionCombatItemUseSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCombatItemUse(const FCE_ConsumeCombatItemEvent &inout Event, const FCS_LocalConditionSubscriptionManager &inout SubscriptionManager) const
    {
        TArray<FConditionInstanceHandle> local_6;
        if (!(Event.CombatItemConfig))
        {
            return;
        }
        FName local_3 = Event.CombatItemConfig.GetDataName();
        for (auto& local_20 : local_6)
        {
            ::ConditionUtils::SetLocalConditionValueForInstance(local_20, (::ConditionUtils::GetCurrentValue(local_20) + 1));
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCombatItemUse() const
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
        TECSEventConstIterator<FCE_ConsumeCombatItemEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_ConsumeCombatItemEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleCombatItemUse(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

