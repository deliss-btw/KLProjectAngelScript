

class US_PortalSystem : UECSScriptSystem
{
    US_PortalSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_InitAccountExclusivePortalState(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout LevelObjectStatConfig, const FC_PortalConfig &inout PortalConfig) const
    {
        int local_14 = 0;
        int local_23 = 0;
        int local_44 = 0;
        ModifyOrAdd local_50;
        Remove local_4;
        local_4.opCall();
        if (!(LevelObjectStatConfig.LevelObjectStatConfig.IsSet()))
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        if (!(local_14))
        {
            return;
        }
        FECSEntity local_22 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_22.IsValid())
        {
            if (local_14.LevelObjectStatIdToEntityMap.Contains(local_23))
            {
                if (FECSEntity(local_14.LevelObjectStatIdToEntityMap[local_23]).IsValid())
                {
                    Get local_32;
                    const FC_DefaultToLocal& local_34 = local_32.opCall();
                    if (local_34)
                    {
                        if (FECSEntity(local_34.LocalEntityId).IsValid())
                        {
                            if (!(local_44) || local_44.CheckUnlockConditions(local_22))
                            {
                                FC_ESMExternalTransitOnLocalReg& local_52 = local_50.opCall();
                                if (local_52)
                                {
                                    const FPortalStateData& local_56 = PortalConfig.StateConfig.GetData(EPortalState(0));
                                    local_52.SMName = local_56.StateMachineName;
                                    local_52.StateName = local_56.StateName;
                                }
                            }
                            else
                            {
                                FC_ESMExternalTransitOnLocalReg& local_52_2 = local_50.opCall();
                                if (local_52_2)
                                {
                                    const FPortalStateData& local_56_2 = PortalConfig.StateConfig.GetData(EPortalState(1));
                                    local_52_2.SMName = local_56_2.StateMachineName;
                                    local_52_2.StateName = local_56_2.StateName;
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitAccountExclusivePortalState() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_176 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_InitAccountExclusivePortalState(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_36 = local_138.Proceed();
            ++local_104;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_InitAccountExclusivePortalState(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

