

class US_OculusSystem : UECSScriptSystem
{
    US_OculusSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_InitAccountExclusiveOculusState(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout LevelObjectStatConfig, const FC_OculusConfig &inout OculusConfig) const
    {
        int local_14 = 0;
        int local_23 = 0;
        ModifyOrAdd local_42;
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
                            if (::FLevelObjectStatUtils::IsLevelObjectRecorded(local_22, LevelObjectStatConfig.LevelObjectStatConfig))
                            {
                                FC_ESMExternalTransitOnLocalReg& local_44 = local_42.opCall();
                                if (local_44)
                                {
                                    const FOculusStateData& local_48 = OculusConfig.StateConfig.GetData(EOculusState(0));
                                    local_44.SMName = local_48.StateMachineName;
                                    local_44.StateName = local_48.StateName;
                                }
                            }
                            else
                            {
                                FC_ESMExternalTransitOnLocalReg& local_44_2 = local_42.opCall();
                                if (local_44_2)
                                {
                                    const FOculusStateData& local_48_2 = OculusConfig.StateConfig.GetData(EOculusState(1));
                                    local_44_2.SMName = local_48_2.StateMachineName;
                                    local_44_2.StateName = local_48_2.StateName;
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
    void Run_ClientJob_InitAccountExclusiveOculusState() const
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
                this.ClientJob_InitAccountExclusiveOculusState(local_36, local_38, local_44);
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
            this.ClientJob_InitAccountExclusiveOculusState(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

