

class US_ConditionBodyPartDestroy : UECSScriptSystem
{
    US_ConditionBodyPartDestroy()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleBodyPartDestroyCondition(const FCE_BodyPartDestroyEvent &inout Event, const FCS_BodyPartDestroyConditionManager &inout C_BodyPartDestroyConditionManager) const
    {
        CastTo local_46;
        if (!((Event.BodyPart == NAME_None)))
        {
            if (C_BodyPartDestroyConditionManager.MonitoredBodyParts.Contains(Event.BodyPart))
            {
                for (auto& local_18 : C_BodyPartDestroyConditionManager.MonitoredBodyParts[Event.BodyPart].ConditionInstances)
                {
                    if (::ConditionUtils::IsReached(local_18))
                    {
                        continue;
                    }
                    TDataObjectPtr<FConditionConfigBase> local_42 = local_18.GetConditionConfig();
                    if (local_46.opCall())
                    {
                        bool local_95;
                        local_95 = true;
                        FInstancedStruct::GetPtr local_100;
                        TConstRawPtr<FConditionBodyPartDestroyConfig> local_102 = local_100.opCall();
                        if (local_102)
                        {
                            if (local_102.opArrow().PrefabConfig)
                            {
                                FDataObjectPtr local_176;
                                TDataObjectPtr<FBasePrefabConfig> local_128 = ::GetPrefabConfigPtr(Event.Sender);
                                local_176;
                                if (!((local_128 == local_176)))
                                {
                                    local_95 = false;
                                }
                            }
                        }
                        if (local_95)
                        {
                            ::ConditionUtils::SetLocalConditionValueForInstance(local_18, (::ConditionUtils::GetCurrentValue(local_18) + 1));
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleBodyPartDestroyCondition() const
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
        TECSEventConstIterator<FCE_BodyPartDestroyEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_BodyPartDestroyEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleBodyPartDestroyCondition(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

