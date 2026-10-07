

class US_PlayerEnterRegionConditionSystem : UECSScriptSystem
{
    US_PlayerEnterRegionConditionSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_TickPlayerEnterRegion(const FECSEntity &inout Entity, FC_PlayerEnterRegionCondition &inout EnterRegionCond) const
    {
        bool local_65;
        TArray<int> local_4;
        EnterRegionCond.EnterRegionInfos.GetKeys(local_4);
        TDataObjectPtr<FLevelInfoConfig> local_28 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        for (auto local_66 : local_4)
        {
            FEnterRegionInfo& local_70 = EnterRegionCond.EnterRegionInfos[local_66];
            if (!(local_70.LevelInfo.IsSet()))
            {
                local_65 = false;
            }
            else
            {
                TDataObjectPtr<FLevelInfoConfig> local_52;
                local_52 = local_70.LevelInfo;
                local_65 = !((local_52 == local_28.opImplConv()));
            }
            if (local_65)
            {
                continue;
            }
            if (!(::FASCommonUtils::GetControlledPawnEntity(Entity).IsValid()))
            {
                continue;
            }
            Get local_132;
            FVector local_138 = local_132.opCall().GetPosition();
            if (local_138.DistSquared(local_70.Center) <= (local_70.Radius * local_70.Radius))
            {
                if (local_70.bHasReset)
                {
                    local_70.bHasReset = false;
                    ::ConditionUtils::SetLocalConditionValueForInstance(local_70.ConditionHandle, (::ConditionUtils::GetCurrentValue(local_70.ConditionHandle) + 1));
                    if (::ConditionUtils::IsReached(local_70.ConditionHandle))
                    {
                    }
                }
            }
            else
            {
                if (!(local_70.bHasReset))
                {
                    local_70.bHasReset = true;
                }
            }
        }
        if (EnterRegionCond.EnterRegionInfos.Num() == 0)
        {
            Remove local_150;
            local_150.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlayerEnterRegion() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.1))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.ServerJob_TickPlayerEnterRegion(local_42, local_44);
                local_52.opCall(local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_90.Iterator();
        for (; local_134.CanProceed;)
        {
            local_42 = local_134.Proceed();
            ++local_100;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.ServerJob_TickPlayerEnterRegion(local_172, local_44);
            local_52.opCall(local_44);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
}

