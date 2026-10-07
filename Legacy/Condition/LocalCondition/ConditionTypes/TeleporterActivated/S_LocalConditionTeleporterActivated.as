

class US_LocalConditionTeleporterActivated : UECSScriptSystem
{
    US_LocalConditionTeleporterActivated()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTeleporterActivatedEvent(const FCE_NofityTeleporterActivated &inout Event, const FCS_TeleporterActivatedConditionManager &inout TeleporterActivatedConditionManager) const
    {
        FECSEntity local_4 = ::FASCommonUtils::GetUniquePlayerEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        for (auto& local_24 : TeleporterActivatedConditionManager.ConditionInstances)
        {
            if (::ConditionUtils::IsReached(local_24))
            {
                continue;
            }
            const FLocalConditionInstanceData& local_28 = ::ConditionUtils_Internal::FindLocalConditionInstanceData(local_24.GetLocalConditionInstanceID());
            if (!(local_28.IsValid()))
            {
                continue;
            }
            if (!(::TeleporterActivatedConditionUtils::IsActivatingPlayerInScope(local_28.GetContextEntity(), local_4)))
            {
                continue;
            }
            ::ConditionUtils::SetLocalConditionValueForInstance(local_24, (::ConditionUtils::GetCurrentValue(local_24) + 1));
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeleporterActivatedEvent() const
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
        TECSEventConstIterator<FCE_NofityTeleporterActivated> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_NofityTeleporterActivated& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleTeleporterActivatedEvent(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

