

class US_CommissionStatsSystem : UECSScriptSystem
{
    US_CommissionStatsSystem()
    {
        return;
    }
    FECSEntity GetPlayer(const FECSEntity &inout Pawn) const
    {
        return ::CommissionStatsUtils::GetPlayer(Pawn);
    }
    bool IsCommissionChatChannel(const uint ChannelType) const
    {
        return (ChannelType == 1 || (ChannelType == 3));
    }
    FECSEntity GetPlayerByUid(const uint PlayerUid) const
    {
        UGameDSConnectionSubsystem local_2 = ::UGameDSConnectionSubsystem::Get();
        if ((local_2 == nullptr || (PlayerUid == 0)))
        {
            return ENTITY_NULL;
        }
        return FECSEntity(local_2.GetPlayerEntityIdByUid(PlayerUid));
    }
    UFUNCTION()
    void Job_PlayerDamageBeHitOrApply(const FCE_DamageEvent &inout Event) const
    {
        FECSEntity local_4 = this.GetPlayer(Event.Receiver);
        if (Event.ActualDamageToHP <= 0.0f)
        {
            return;
        }
        if ((!((this.GetPlayer(Event.FinalDamageSource) == ENTITY_NULL))))
        {
            SendEvent local_24;
            ModifyOrAdd local_20;
            local_20.opCall().DamageToHP = (local_20.opCall().DamageToHP + Event.ActualDamageToHP);
            FFPTime local_26 = FFPTime(-1);
            local_24.opCall(local_26).PlayerStatsType = ECommissionPlayerStatsType(0);
        }
        if ((!((local_4 == ENTITY_NULL))))
        {
            SendEvent local_24;
            ModifyOrAdd local_20;
            local_20.opCall().BeHitDamageCount = (local_20.opCall().BeHitDamageCount + 1);
            FFPTime local_26_2 = FFPTime(-1);
            local_24.opCall(local_26_2).PlayerStatsType = ECommissionPlayerStatsType(7);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PlayerBodyPartDestroy(const FCE_BodyPartDestroyEvent &inout Event) const
    {
        if ((!((this.GetPlayer(Event.DestroyedByEntity) == ENTITY_NULL))))
        {
            ModifyOrAdd local_14;
            local_14.opCall().BodyPartDestroy = (local_14.opCall().BodyPartDestroy + 1);
            FFPTime local_22 = FFPTime(-1);
            SendEvent local_20;
            local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(3);
        }
        return;
    }
    UFUNCTION()
    void Monitor_PlayerNearDeath(const FECSEntity &inout Entity, const FC_NearDeathTag &inout NearDeath) const
    {
        if ((!((this.GetPlayer(Entity) == ENTITY_NULL))))
        {
            SendEvent local_20;
            ModifyOrAdd local_14;
            local_14.opCall().NearDeathCount = (local_14.opCall().NearDeathCount + 1);
            local_14.opCall().NearDeathAndDeathCount = (local_14.opCall().NearDeathAndDeathCount + 1);
            FFPTime local_22 = FFPTime(-1);
            local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(4);
            FFPTime local_22_2 = FFPTime(-1);
            local_20.opCall(local_22_2).PlayerStatsType = ECommissionPlayerStatsType(6);
        }
        return;
    }
    UFUNCTION()
    void Monitor_PlayerDeath(const FECSEntity &inout Entity, const FC_DeathTag &inout Death) const
    {
        if ((!((this.GetPlayer(Entity) == ENTITY_NULL))))
        {
            FECSEntity::SendEvent<FCE_CommissionPlayerStatsUpdatedEvent> local_20;
            ModifyOrAdd local_14;
            local_14.opCall().DeathCount = (local_14.opCall().DeathCount + 1);
            local_14.opCall().NearDeathAndDeathCount = (local_14.opCall().NearDeathAndDeathCount + 1);
            FFPTime local_22 = FFPTime(-1);
            local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(5);
            FFPTime local_22_2 = FFPTime(-1);
            local_20.opCall(local_22_2).PlayerStatsType = ECommissionPlayerStatsType(6);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PlayerChatCount(const FCE_DSChatMsgCommission &inout Event) const
    {
        if (!(this.IsCommissionChatChannel(int(Event.Channel))))
        {
            return;
        }
        if ((!((this.GetPlayer(Event.Sender) == ENTITY_NULL))))
        {
            ModifyOrAdd local_14;
            local_14.opCall().SendChatCount = (local_14.opCall().SendChatCount + 1);
            FFPTime local_22 = FFPTime(-1);
            SendEvent local_20;
            local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PlayerDamageBeHitOrApply() const
    {
        ECS::GetContextJob();
        if (::CommissionStatsUtils::CheckInCommission() == false)
        {
            return;
        }
        TECSEventConstIterator<FCE_DamageEvent> local_38 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_38.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_38.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_PlayerDamageBeHitOrApply(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PlayerBodyPartDestroy() const
    {
        ECS::GetContextJob();
        if (::CommissionStatsUtils::CheckInCommission() == false)
        {
            return;
        }
        TECSEventConstIterator<FCE_BodyPartDestroyEvent> local_38 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_38.CanProceed;)
        {
            const FCE_BodyPartDestroyEvent& local_60 = local_38.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PlayerBodyPartDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PlayerNearDeath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        if (::CommissionStatsUtils::CheckInCommission() == false)
        {
            return;
        }
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorNearDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_PlayerNearDeath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PlayerDeath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        if (::CommissionStatsUtils::CheckInCommission() == false)
        {
            return;
        }
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_PlayerDeath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PlayerChatCount() const
    {
        ECS::GetContextJob();
        if (::CommissionStatsUtils::CheckInCommission() == false)
        {
            return;
        }
        TECSEventConstIterator<FCE_DSChatMsgCommission> local_38 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_38.CanProceed;)
        {
            const FCE_DSChatMsgCommission& local_60 = local_38.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PlayerChatCount(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

