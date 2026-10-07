

class US_ConditionEntityDeath : UECSScriptSystem
{
    US_ConditionEntityDeath()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleEntityDeathCondition(const FCE_DeathEvent &inout Event, const FCS_EntityDeathConditionManager &inout C_EntityDeathConditionManager) const
    {
        bool local_49;
        bool local_65;
        bool local_66;
        TDataObjectPtr<FBasePrefabConfig> local_24 = ::GetPrefabConfigPtr(Event.Sender);
        CastTo local_94;
        if (local_24)
        {
            if (C_EntityDeathConditionManager.MonitoredPrefabs.Contains(local_24))
            {
                for (auto& local_64 : C_EntityDeathConditionManager.MonitoredPrefabs[local_24].ConditionInstances)
                {
                    local_65 = true;
                    local_49 = true;
                    local_66 = local_49;
                    TDataObjectPtr<FConditionConfigBase> local_90 = local_64.GetConditionConfig();
                    if (local_94.opCall())
                    {
                        FInstancedStruct::GetPtr local_146;
                        TConstRawPtr<FConditionEntityDeathConfig> local_148 = local_146.opCall();
                        if (local_148)
                        {
                            if (int(local_148.opArrow().PlayerFilter) != 0)
                            {
                                Has local_158;
                                if (local_158.opCall())
                                {
                                    local_49 = true;
                                }
                                else
                                {
                                    Has local_162;
                                    local_49 = local_162.opCall();
                                }
                                local_65 = (int(local_148.opArrow().PlayerFilter) == 1 && local_49) || (int(local_148.opArrow().PlayerFilter) == 2 && !(local_49));
                            }
                            if (local_65)
                            {
                                TSoftClassPtr<AKLLevelScriptBaseActor> local_174;
                                if (!(local_174.IsNull()))
                                {
                                    FName local_176(NAME_None);
                                    Get local_180;
                                    const FC_OwnerDataLayer& local_182 = local_180.opCall();
                                    if (local_182)
                                    {
                                        local_176 = local_182.GetOwnerDataLayerName();
                                    }
                                    if (!((local_174.Get() == nullptr)))
                                    {
                                        local_66 = (local_176 == local_174.Get().GetDefaultObject().GetClass().GetName());
                                    }
                                    else
                                    {
                                        local_66 = false;
                                    }
                                }
                            }
                        }
                    }
                    if (local_65 && local_66)
                    {
                        ::ConditionUtils::SetLocalConditionValueForInstance(local_64, (::ConditionUtils::GetCurrentValue(local_64) + 1));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleEntityDeathCondition() const
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
        TECSEventConstIterator<FCE_DeathEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_DeathEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandleEntityDeathCondition(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

