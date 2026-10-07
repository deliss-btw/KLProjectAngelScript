

class US_ConditionGameplayTagChanged : UECSScriptSystem
{
    US_ConditionGameplayTagChanged()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGameplayTagChangedCondition(const FECSEntity &inout Entity, const FC_GameplayTags &inout GameplayTags, const FC_GameplayTagsChanged &inout GameplayTagsChanged, const FCS_GameplayTagChangedConditionManager &inout GameplayTagChangedConditionManager) const
    {
        bool local_17;
        bool local_21;
        TArrayConstIterator<FConditionInstanceHandle> local_38;
        int local_231;
        int local_235;
        Has local_26;
        CastTo local_74;
        for (auto& local_20 : GameplayTagChangedConditionManager.MonitoredTags)
        {
            if (!(GameplayTagsChanged.ContainsTag(local_20.GetKey())))
            {
                continue;
            }
            if (local_26.opCall())
            {
                local_17 = true;
            }
            else
            {
                Has local_30;
                local_17 = local_30.opCall();
            }
            bool local_31 = GameplayTags.Match(local_20.GetKey());
            for (; local_38.CanProceed;)
            {
                const FConditionInstanceHandle& local_46 = local_38.Proceed();
                if (::ConditionUtils::IsReached(local_46))
                {
                    continue;
                }
                TDataObjectPtr<FConditionConfigBase> local_70 = local_46.GetConditionConfig();
                if (local_74.opCall())
                {
                    FInstancedStruct::GetPtr local_126;
                    TConstRawPtr<FConditionGameplayTagChangedConfig> local_128 = local_126.opCall();
                    if (local_128)
                    {
                        int local_234;
                        int local_228;
                        if (!(local_128.opArrow().PrefabConfig.IsSet()))
                        {
                            local_21 = false;
                        }
                        else
                        {
                            TDataObjectPtr<FBasePrefabConfig> local_178;
                            local_178 = local_128.opArrow().PrefabConfig;
                            local_21 = !((local_178 == ::GetPrefabConfigPtr(Entity).opImplConv()));
                        }
                        if (local_21)
                        {
                            continue;
                        }
                        local_228 = int(local_128.opArrow().PlayerFilter);
                        int local_229 = local_228;
                        bool local_32 = (local_229 == 0);
                        if (local_32)
                        {
                            local_32 = true;
                        }
                        else
                        {
                            int local_230 = int(local_128.opArrow().PlayerFilter);
                            if (local_17)
                            {
                                local_231 = 1;
                                local_228 = local_231;
                            }
                            else
                            {
                                local_231 = 2;
                                local_228 = local_231;
                            }
                            local_32 = (local_230 == local_228);
                        }
                        if (!(local_32))
                        {
                            continue;
                        }
                        local_234 = int(local_128.opArrow().MonitorType);
                        local_21 = (local_234 == 2);
                        if (local_21)
                        {
                            local_21 = true;
                        }
                        else
                        {
                            local_229 = int(local_128.opArrow().MonitorType);
                            if (local_31)
                            {
                                local_235 = 0;
                                local_234 = local_235;
                            }
                            else
                            {
                                local_235 = 1;
                                local_234 = local_235;
                            }
                            local_21 = (local_229 == local_234);
                        }
                        if (!(local_21))
                        {
                            continue;
                        }
                        ::ConditionUtils::SetLocalConditionValueForInstance(local_46, (::ConditionUtils::GetCurrentValue(local_46) + 1));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGameplayTagChangedCondition() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_182 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ServerJob_HandleGameplayTagChangedCondition(local_46, local_48, local_54, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_96.Iterator();
        for (; local_144.CanProceed;)
        {
            local_46 = local_144.Proceed();
            ++local_110;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ServerJob_HandleGameplayTagChangedCondition(local_182, local_48, local_54, local_12);
        }
        local_2.UpdateCachedEntityCount(local_110);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}

