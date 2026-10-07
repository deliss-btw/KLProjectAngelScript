

class US_LocalConditionSystem : UECSScriptSystem
{
    US_LocalConditionSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleNewlyCreatedInstances(const FCS_LocalConditionManager &inout Manager, const FCS_LocalConditionNewlyCreatedInstances &inout C_NewlyCreatedInstances) const
    {
        const FLocalConditionInstanceData& local_18;
        for (auto local_14 : C_NewlyCreatedInstances.NewlyCreatedInstances)
        {
            if (local_18.IsValid())
            {
                const ULocalConditionTypeDefineBase local_20 = ::ConditionUtils::GetConditionTypeDefine(local_18.GetConditionConfig());
                local_20.OnConditionRegistered(FLocalConditionInstance(local_14, local_18));
            }
        }
        FECSWorldPtr local_58 = ECS::GetECSWorld();
        Remove local_62;
        local_62.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleRemovedInstances(const FCS_LocalConditionRemovedInstances &inout C_RemovedInstances) const
    {
        for (auto& local_16 : C_RemovedInstances.RemovedInstances)
        {
            const ULocalConditionTypeDefineBase local_18 = ::ConditionUtils::GetConditionTypeDefine(GetConditionConfig());
            local_18.OnConditionUnregistered(local_16);
        }
        FECSWorldPtr local_22 = ECS::GetECSWorld();
        Remove local_26;
        local_26.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_SyncServerCondition(const FCS_LocalConditionManager &inout Manager) const
    {
        const FLocalConditionInstanceContainer& local_2 = Manager.FindInstancesByEntity(ENTITY_NULL);
        if (local_2.GetInstances().IsEmpty())
        {
            FECSWorldPtr local_6 = ECS::GetECSWorld();
            Remove local_10;
            local_10.opCall();
            FFPTime local_16 = FFPTime(-1);
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            SendEvent local_14;
            local_14.opCall(ENTITY_NULL, local_16);
        }
        else
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            ModifyOrAdd local_22;
            this.SyncCurrentContionStateToView(ENTITY_NULL, Manager, local_2, local_22.opCall().GetModify_InstanceDatas());
        }
        FECSWorldPtr local_6_4 = ECS::GetECSWorld();
        Remove local_26;
        local_26.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_SyncEntityCondition(const FECSEntity &inout Entity, const FCS_LocalConditionManager &inout Manager) const
    {
        const FLocalConditionInstanceContainer& local_2 = Manager.FindInstancesByEntity(Entity);
        if (local_2.GetInstances().IsEmpty())
        {
            Remove local_8;
            local_8.opCall();
            FFPTime local_16 = FFPTime(-1);
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            SendEvent local_14;
            local_14.opCall(Entity, local_16);
        }
        else
        {
            ModifyOrAdd local_22;
            this.SyncCurrentContionStateToView(Entity, Manager, local_2, local_22.opCall().GetModify_InstanceDatas());
        }
        Remove local_26;
        local_26.opCall();
        return;
    }
    void SyncCurrentContionStateToView(const FECSEntity &inout ContextEntity, const FCS_LocalConditionManager &inout Manager, const FLocalConditionInstanceContainer &inout Current, TMap<int, FLocalConditionInstanceData> &inout View) const
    {
        int local_27;
        int local_68 = 0;
        int local_127;
        bool local_128;
        bool local_1 = false;
        bool local_3 = false;
        TArray<int> local_8;
        for (auto& local_26 : View)
        {
            local_27 = local_26.GetKey();
            if (!(Current.GetInstances().Contains(local_27)))
            {
                local_8.Add(local_27);
            }
        }
        if (!(local_8.IsEmpty()))
        {
            auto local_34 = local_8.Iterator();
            for (; local_34.CanProceed;)
            {
                local_27 = local_34.Proceed();
            }
            local_1 = true;
        }
        TSet<int> local_60;
        FECSWorldPtr local_62 = ECS::GetECSWorld();
        auto local_74 = Current.GetInstances().Iterator();
        for (; local_74.CanProceed;)
        {
            local_27 = local_74.Proceed();
            if (View.Contains(local_27))
            {
                const FLocalConditionInstanceData& local_82;
                FLocalConditionInstanceData& local_84 = View[local_27];
                if (local_84.GetCurrentValue() != local_82.GetCurrentValue())
                {
                    FFPTime local_92 = FFPTime(-1);
                    FECSWorldPtr local_62_2 = ECS::GetECSWorld();
                    FConditionInstanceHandle local_120 = FConditionInstanceHandle(local_82.GetConditionConfig(), local_27);
                    if (this.IsReachStateChanged(local_82.GetCurrentValue(), local_84.GetCurrentValue(), local_82.GetConditionConfig()))
                    {
                        FFPTime local_92_2 = FFPTime(-1);
                        FECSWorldPtr local_62_3 = ECS::GetECSWorld();
                        FConditionInstanceHandle local_120_2 = FConditionInstanceHandle(local_82.GetConditionConfig(), local_27);
                        if (!(local_68))
                        {
                            local_128 = false;
                        }
                        else
                        {
                            local_128 = local_68.ConditionInstanceIdToGroupInstanceId.Find(local_27, local_127);
                        }
                        if (local_128)
                        {
                            local_60.Add(local_127);
                        }
                        local_3 = true;
                    }
                    local_84.SetCurrentValue(local_82.GetCurrentValue());
                }
                continue;
            }
            View.Add(local_27);
            local_1 = true;
        }
        auto local_136 = local_60.Iterator();
        for (; local_136.CanProceed;)
        {
            local_127 = local_136.Proceed();
            TRawPtr<FLocalConditionGroupInstanceData> local_146 = local_68.ConditionGroupInstanceData.Find(local_127);
            if (local_146)
            {
                FConditionInstanceHandle local_120_3 = FConditionInstanceHandle(local_146.opArrow().ConditionGroupConfig, local_127);
                bool local_2 = local_146.opArrow().bCachedReached;
                local_146.opArrow().bCachedReached = ::ConditionGroupUtils::IsReached(local_120_3);
                local_128 = !(local_2);
                local_2 = !(local_146.opArrow().bCachedReached);
                if (local_128 != local_2)
                {
                    FFPTime local_92_3 = FFPTime(-1);
                    FECSWorldPtr local_62_4 = ECS::GetECSWorld();
                }
            }
        }
        if (local_3)
        {
            FFPTime local_92_4 = FFPTime(-1);
            FECSWorldPtr local_62_5 = ECS::GetECSWorld();
            SendEvent local_180;
            local_180.opCall(ContextEntity, local_92_4);
        }
        if (local_1)
        {
            FFPTime local_92_5 = FFPTime(-1);
            FECSWorldPtr local_62_6 = ECS::GetECSWorld();
            SendEvent local_184;
            local_184.opCall(ContextEntity, local_92_5);
        }
        return;
    }
    bool IsReachStateChanged(const int ValueA, const int ValueB, const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        ECondCmpType local_1 = ConditionConfig.opArrow().CompareType;
        bool local_4 = ((!(::ConditionUtils_Internal::IsValueReached(ValueA, ConditionConfig.opArrow().TargetValue))) != !(::ConditionUtils_Internal::IsValueReached(ValueB, ConditionConfig.opArrow().TargetValue)));
        return local_4;
    }
    UFUNCTION()
    void Run_ServerJob_HandleNewlyCreatedInstances() const
    {
        int local_16 = 0;
        int local_22 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        this.ServerJob_HandleNewlyCreatedInstances(local_16, local_22);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleRemovedInstances() const
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
        this.ServerJob_HandleRemovedInstances(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SyncServerCondition() const
    {
        int local_16 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        this.ServerJob_SyncServerCondition(local_16);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SyncEntityCondition() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_166 = 0;
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
                this.ServerJob_SyncEntityCondition(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_46 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ServerJob_SyncEntityCondition(local_166, local_12);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}

