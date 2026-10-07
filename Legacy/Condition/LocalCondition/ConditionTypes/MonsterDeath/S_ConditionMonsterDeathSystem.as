

class US_ConditionMonsterDeathSystem : UECSScriptSystem
{
    US_ConditionMonsterDeathSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleMonsterDeath(const FCE_DeathEvent &inout Event, const FCS_ConditionMonsterDeathManager &inout C_ConditionMonsterDeathManager) const
    {
        int local_12 = 0;
        ELocalConditionPlayerFilter local_35;
        UClass local_108;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            TConstRawPtr<FMonsterDeathMonitorConditions> local_14 = C_ConditionMonsterDeathManager.MonitoredMonsters.Find(local_12.GetMonsterConfig());
            if (!(local_14))
            {
                return;
            }
            for (auto& local_30 : local_14.opArrow().ConditionInstances)
            {
                TConstRawPtr<FConditionMonsterDeathConfig> local_32 = this.GetConditionMonsterDeathConfig(local_30);
                local_35 = local_32.opArrow().PlayerFilter;
                if (int(local_35) != 0)
                {
                    Has local_44;
                    bool local_5_2 = local_44.opCall();
                    if (local_5_2)
                    {
                        local_5_2 = true;
                    }
                    else
                    {
                        Has local_48;
                        local_5_2 = local_48.opCall();
                    }
                    if (!((int(local_35) == 1 && local_5_2) || (int(local_35) == 2 && !(local_5_2))))
                    {
                        continue;
                    }
                }
                TSoftClassPtr<AKLLevelScriptBaseActor> local_62 = TSoftClassPtr<AKLLevelScriptBaseActor>(local_32.opArrow().DataLayerLevelClass);
                if (!(local_62.IsNull()))
                {
                    FName local_64(NAME_None);
                    Get local_68;
                    const FC_OwnerDataLayer& local_70 = local_68.opCall();
                    if (local_70)
                    {
                        local_64 = local_70.GetOwnerDataLayerName();
                    }
                    else
                    {
                        Get local_76;
                        const FC_CreatureMeta& local_78 = local_76.opCall();
                        if (local_78)
                        {
                            FECSEntity local_92;
                            if ((local_78.SpawnerConfigRef == ENTITY_ID_NULL))
                            {
                                local_92 = FECSEntity(local_78.RuntimeSpawnerEntity);
                            }
                            else
                            {
                                local_92 = FECSEntity(local_78.SpawnerConfigRef);
                            }
                            if (local_92)
                            {
                                Get local_100;
                                const FC_OwnerDataLayer& local_102 = local_100.opCall();
                                if (local_102)
                                {
                                    local_64 = local_102.GetOwnerDataLayerName();
                                }
                            }
                        }
                    }
                    if (local_62.Get().IsValid())
                    {
                        if ((!((local_64 == local_108.GetName()))))
                        {
                            continue;
                        }
                    }
                    else
                    {
                        continue;
                    }
                }
                ::ConditionUtils::SetLocalConditionValueForInstance(local_30, (::ConditionUtils::GetCurrentValue(local_30) + 1));
            }
        }
        return;
    }
    TConstRawPtr<FConditionMonsterDeathConfig> GetConditionMonsterDeathConfig(const FConditionInstanceHandle &inout Handle) const
    {
        if ((int(Handle.GetLocalConditionType())) == 1)
        {
            TDataObjectPtr<FConditionConfigBase> local_28 = Handle.GetConditionConfig();
            CastTo local_32;
            TDataObjectPtr<FLocalConditionConfig> local_56 = local_32.opCall();
            if (local_56)
            {
                if (FInstancedStruct::GetPtr(local_56.opArrow().ConditionTypeDefineConfig).opCall())
                {
                    return TConstRawPtr<FConditionMonsterDeathConfig>();
                }
            }
        }
        return TConstRawPtr<FConditionMonsterDeathConfig>(nullptr);
    }
    UFUNCTION()
    void Run_ServerJob_HandleMonsterDeath() const
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
            this.ServerJob_HandleMonsterDeath(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

