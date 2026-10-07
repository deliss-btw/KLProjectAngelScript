

class US_CustomNetRelevanceSystem : UECSScriptSystem
{
    US_CustomNetRelevanceSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateNetRelevanceForTeam(const FECSEntity &inout Entity, const FC_NetRelevancePolicy &inout NetRelevancePolicy, const FC_TeamInfo &inout TeamInfo) const
    {
        int local_126 = 0;
        int local_2 = int(NetRelevancePolicy.RelevancePolicyType);
        int local_2_2 = TeamInfo.GetMembers().Num();
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        FNetPlayerMask local_50;
        FECSRuntimeViewIterator local_84 = local_44.Iterator();
        for (; local_84.CanProceed;)
        {
            if (TeamInfo.HasMember(local_84.Proceed()))
            {
                local_50.SetBit(local_126.GetPlayerIndex(), true);
            }
        }
        FECSNetUtils::SetNetRelevance(Entity, local_50);
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateNetRelevanceForDropItem(const FECSEntity &inout Entity, const FC_NetRelevancePolicy &inout NetRelevancePolicy, const FC_DropItemExclusivePlayer &inout ExclusivePlayer) const
    {
        int local_126 = 0;
        int local_2 = int(NetRelevancePolicy.RelevancePolicyType);
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        FNetPlayerMask local_50;
        FECSRuntimeViewIterator local_84 = local_44.Iterator();
        for (; local_84.CanProceed;)
        {
            local_84.Proceed();
            if (local_126.GetPlayerId() == int(ExclusivePlayer.PlayerId))
            {
                local_50.SetBit(local_126.GetPlayerIndex(), true);
                break;
            }
        }
        FECSNetUtils::SetNetRelevance(Entity, local_50);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateNetRelevanceForTeam() const
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
                this.ServerJob_UpdateNetRelevanceForTeam(local_36, local_38, local_44);
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
            this.ServerJob_UpdateNetRelevanceForTeam(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateNetRelevanceForDropItem() const
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
                this.ServerJob_UpdateNetRelevanceForDropItem(local_36, local_38, local_44);
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
            this.ServerJob_UpdateNetRelevanceForDropItem(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

