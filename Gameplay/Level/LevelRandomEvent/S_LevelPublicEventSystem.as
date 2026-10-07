
const FConsoleVariable CVar_Level_DebugPublicEvent = FConsoleVariable();

class US_LevelPublicEventSystem : UECSScriptSystem
{
    US_LevelPublicEventSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitPublicEventData(const FCS_FixedTime &inout FixedTime) const
    {
        ::FLevelPublicEventUtils::InitPublicEventData(this.GetWorld(), FixedTime);
        return;
    }
    UFUNCTION()
    void ServerJob_UpdatePublicEvent(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_LevelPublicEventInfo &inout LevelPublicEventInfo, const FC_LevelScriptActor &inout LevelScriptActor) const
    {
        AActor local_2;
        AKLLevelScriptPublicEvent local_6 = (Cast<AKLLevelScriptPublicEvent>(local_2));
        if (int(LevelPublicEventInfo.GetStatus()) == 0)
        {
            FFPTime local_12 = FFPTime(LevelPublicEventInfo.GetChangeStatusTime());
            if (local_12.opCmp(0.0) > 0 && ((FFPTime(FixedTime.Time).opCmp(LevelPublicEventInfo.GetChangeStatusTime().ToSeconds()) >= 0)))
            {
                local_6.SetPublicEventInteractable(Entity);
            }
        }
        if (int(LevelPublicEventInfo.GetStatus()) == 1)
        {
            FFPTime local_12_2 = FFPTime(LevelPublicEventInfo.GetChangeStatusTime());
            if (local_12_2.opCmp(0.0) > 0 && ((FFPTime(FixedTime.Time).opCmp(LevelPublicEventInfo.GetChangeStatusTime().ToSeconds()) >= 0)))
            {
                local_6.LevelEventNotInteracted(Entity);
            }
            return;
        }
        if (int(LevelPublicEventInfo.GetStatus()) == 2)
        {
            FFPTime local_12_3 = FFPTime(LevelPublicEventInfo.GetChangeStatusTime());
            if (local_12_3.opCmp(0.0) > 0 && ((FFPTime(FixedTime.Time).opCmp(LevelPublicEventInfo.GetChangeStatusTime().ToSeconds()) >= 0)))
            {
                local_6.SetLevelEventFinish(false);
            }
            return;
        }
        if (int(LevelPublicEventInfo.GetStatus()) == 3)
        {
            FFPTime local_12_4 = FFPTime(LevelPublicEventInfo.GetChangeStatusTime());
            if (local_12_4.opCmp(0.0) > 0 && ((FFPTime(FixedTime.Time).opCmp(LevelPublicEventInfo.GetChangeStatusTime().ToSeconds()) >= 0)))
            {
                local_6.UnloadPublicEvent();
            }
            return;
        }
        if (int(LevelPublicEventInfo.GetStatus()) == 4)
        {
            FFPTime local_12_5 = FFPTime(LevelPublicEventInfo.GetChangeStatusTime());
            if (local_12_5.opCmp(0.0) > 0 && ((FFPTime(FixedTime.Time).opCmp(LevelPublicEventInfo.GetChangeStatusTime().ToSeconds()) >= 0)))
            {
                local_6.UnloadPublicEvent();
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_RegeneratePublicEvent(const FCS_FixedTime &inout FixedTime, FCS_LevelPublicEventData &inout LevelPublicEventData) const
    {
        ::FLevelPublicEventUtils::RegeneratePublicEvent(this.GetWorld(), FixedTime, LevelPublicEventData);
        return;
    }
    UFUNCTION()
    void ClientJob_DebugDrawPublicEvent(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_LevelPublicEventInfo &inout LevelPublicEventInfo) const
    {
        int local_1 = -1;
        FFPTime local_4 = FFPTime(LevelPublicEventInfo.GetChangeStatusTime());
        if (local_4.opCmp(0.0) > 0)
        {
            local_1 = int(((FFPTime(LevelPublicEventInfo.GetChangeStatusTime()) - FixedTime.Time).ToSeconds()));
        }
        FString local_14 = "None";
        Get local_18;
        const FC_LevelAreaEventInfo& local_20 = local_18.opCall();
        if (local_20)
        {
            if (local_20.GetEventInfo().IsSet())
            {
                FString local_24;
                local_14 = local_24;
            }
        }
        FString local_28 = local_24.Append("Event: ").Append(local_14).Append("  entity: ").Append(Entity.GetIdValue()).Append(" Status: ").Append(LevelPublicEventInfo.GetStatus()).Append(" Time: ").Append(local_1);
        Entity.GetEntityName();
        __GetWorldContext();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitPublicEventData() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        this.ServerJob_InitPublicEventData(local_6);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdatePublicEvent() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_52 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.ServerJob_UpdatePublicEvent(local_44, local_12, local_46, local_52);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_44 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            FECSEntity::Get<FC_LevelScriptActor> local_56 = FECSEntity::Get<FC_LevelScriptActor>(local_44);
            this.ServerJob_UpdatePublicEvent(local_180, local_12, local_46, local_52);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_RegeneratePublicEvent() const
    {
        int local_18 = 0;
        int local_20 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        this.ServerJob_RegeneratePublicEvent(local_18, local_20);
        FECSWorldPtr local_12_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_28;
        local_28.opCall(local_20);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugDrawPublicEvent() const
    {
        int local_8 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(CVar_Level_DebugPublicEvent.GetBool()) == !(false))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_DebugDrawPublicEvent(local_40, local_8, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_DebugDrawPublicEvent(local_166, local_8, local_42);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

