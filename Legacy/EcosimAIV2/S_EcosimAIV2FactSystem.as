

class US_EcosimAIV2FactSystem : UECSScriptSystem
{
    FFPTime HitDamageMemoryLastTime = FFPTime(10.0);

    US_EcosimAIV2FactSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_InitEcosimAIV2RelationDB() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        ModifyOrAdd local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_HandleEntityDeathCleanupRelations(const FCE_DeathEvent &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        ::FEcosimAIV2Utils::RemoveAllEntityRelationsInvolvingEntity(local_4);
        ::FEcosimAIV2Utils::RemoveAllInteractRelationsInvolvingEntity(local_4);
        return;
    }
    UFUNCTION()
    void Monitor_OnPawnRiddingMountModified(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout PawnRiddingMount) const
    {
        if (PawnRiddingMount.IsDriver())
        {
            ::FEcosimAIV2Utils::RemoveEntityRelationsBySource(Entity, EEcosimAIV2EntityRelation(1), false);
            ::FEcosimAIV2Utils::AddEntityRelation(Entity, PawnRiddingMount.GetMountEntity(), EEcosimAIV2EntityRelation(1), false);
            ::FEcosimAIV2Utils::SendRelationChangeEvent(Entity, PawnRiddingMount.GetMountEntity(), EEcosimAIV2EntityRelation(1), true);
            return;
        }
        ::FEcosimAIV2Utils::RemoveEntityRelationsBySource(Entity, EEcosimAIV2EntityRelation(3), false);
        ::FEcosimAIV2Utils::AddEntityRelation(Entity, PawnRiddingMount.GetMountEntity(), EEcosimAIV2EntityRelation(3), false);
        ::FEcosimAIV2Utils::SendRelationChangeEvent(Entity, PawnRiddingMount.GetMountEntity(), EEcosimAIV2EntityRelation(3), true);
        return;
    }
    UFUNCTION()
    void Monitor_OnPawnRiddingMountAssignOrRemove(const FECSEntity &inout Entity, const FC_PawnRiddingMount &inout PawnRiddingMount) const
    {
        if (PawnRiddingMount.IsDriver())
        {
            ::FEcosimAIV2Utils::RemoveEntityRelationsBySource(Entity, EEcosimAIV2EntityRelation(1), false);
            ::FEcosimAIV2Utils::SendRelationChangeEvent(Entity, ENTITY_NULL, EEcosimAIV2EntityRelation(1), false);
            return;
        }
        ::FEcosimAIV2Utils::RemoveEntityRelationsBySource(Entity, EEcosimAIV2EntityRelation(3), false);
        ::FEcosimAIV2Utils::SendRelationChangeEvent(Entity, ENTITY_NULL, EEcosimAIV2EntityRelation(3), false);
        return;
    }
    UFUNCTION()
    void Monitor_OnInteractionInfoForESMModified(const FECSEntity &inout Entity, const FC_InteractionInfoForESM &inout InteractionInfoForESM) const
    {
        ::FEcosimAIV2Utils::RemoveInteractRelationsBySource(Entity, false);
        ::FEcosimAIV2Utils::AddInteractRelation(Entity, InteractionInfoForESM.GetTargetEntity(), InteractionInfoForESM.GetTargetPointAndBehaviorIndex().GetPointIndex(), InteractionInfoForESM.GetTargetPointAndBehaviorIndex().GetBehaviorIndex(), false);
        XLog(ELog(0), FString().Append(Entity).Append(" Interact With Target: ").Append(InteractionInfoForESM.GetTargetEntity()).Append(", Point: ").Append(InteractionInfoForESM.GetTargetPointAndBehaviorIndex().GetPointIndex()).Append(", Behavior: ").Append(InteractionInfoForESM.GetTargetPointAndBehaviorIndex().GetBehaviorIndex()));
        return;
    }
    UFUNCTION()
    void Monitor_OnInteractKeepingTagRemove(const FECSEntity &inout Entity, const FC_InteractKeepingTag &inout InteractKeepingTag) const
    {
        Get local_4;
        const FC_InteractionInfoForESM& local_6 = local_4.opCall();
        if (local_6)
        {
            ::FEcosimAIV2Utils::RemoveInteractRelationsBySource(Entity, false);
            XLog(ELog(0), FString().Append(Entity).Append(" Stop Interact With Target: ").Append(local_6.GetTargetEntity()).Append(", Point: ").Append(local_6.GetTargetPointAndBehaviorIndex().GetPointIndex()).Append(", Behavior: ").Append(local_6.GetTargetPointAndBehaviorIndex().GetBehaviorIndex()));
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnChainParentInfoModified(const FECSEntity &inout Entity, const FC_ChainParentInfo &inout ChainParentInfo) const
    {
        ::FEcosimAIV2Utils::RemoveEntityRelationsByTarget(Entity, EEcosimAIV2EntityRelation(2), false);
        if (ChainParentInfo.GetParent().IsValid())
        {
            ::FEcosimAIV2Utils::AddEntityRelation(ChainParentInfo.GetParent(), Entity, EEcosimAIV2EntityRelation(2), false);
            ::FEcosimAIV2Utils::SendRelationChangeEvent(ChainParentInfo.GetParent(), Entity, EEcosimAIV2EntityRelation(2), true);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnChainParentInfoAssignOrRemove(const FECSEntity &inout Entity, const FC_ChainParentInfo &inout ChainParentInfo) const
    {
        ::FEcosimAIV2Utils::RemoveEntityRelationsByTarget(Entity, EEcosimAIV2EntityRelation(2), false);
        ::FEcosimAIV2Utils::SendRelationChangeEvent(ENTITY_NULL, Entity, EEcosimAIV2EntityRelation(2), false);
        return;
    }
    UFUNCTION()
    void Monitor_OnEcosimAIV2TeamModified(const FECSEntity &inout Entity, const FC_EcosimAIV2Team &inout EcosimAIV2Team) const
    {
        ::FEcosimAIV2Utils::RemoveEntityRelationsByTarget(Entity, EEcosimAIV2EntityRelation(4), false);
        if (EcosimAIV2Team.LeaderEntity.IsValid())
        {
            ::FEcosimAIV2Utils::AddEntityRelation(EcosimAIV2Team.LeaderEntity, Entity, EEcosimAIV2EntityRelation(4), false);
            ::FEcosimAIV2Utils::SendRelationChangeEvent(EcosimAIV2Team.LeaderEntity, Entity, EEcosimAIV2EntityRelation(4), true);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnEcosimAIV2TeamRemove(const FECSEntity &inout Entity, const FC_EcosimAIV2Team &inout EcosimAIV2Team) const
    {
        ::FEcosimAIV2Utils::RemoveEntityRelationsByTarget(Entity, EEcosimAIV2EntityRelation(4), false);
        ::FEcosimAIV2Utils::SendRelationChangeEvent(ENTITY_NULL, Entity, EEcosimAIV2EntityRelation(4), false);
        return;
    }
    UFUNCTION()
    void Job_RecordEcosimAIV2HitDamageTmpMemory(const FCE_DamageEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_26 = 0;
        FECSEntity local_4 = Event.Receiver;
        FECSEntity local_8 = Event.FinalDamageSource;
        if (local_4.MatchGameplayTag(GameplayTags::EcosimAIV2_Ability_RecordHitDamageMemory))
        {
            ECS::GetContextTime();
            ECS::GetContextTime();
            FECSEntity local_18;
            FFPTime local_24 = (local_18 + this.HitDamageMemoryLastTime);
            local_26.HitDamageSource = local_8;
            ::FEcosimAIV2Utils::AddEntityRelation(local_8, local_4, EEcosimAIV2EntityRelation(5), false);
            ::FEcosimAIV2Utils::SendRelationChangeEvent(local_8, local_4, EEcosimAIV2EntityRelation(5), true);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleTryRemoveHitDamageMemory(const FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent &inout Event) const
    {
        Modify local_4;
        FC_EcosimAIV2HitDamageTmpMemory& local_6 = local_4.opCall();
        if (local_6)
        {
            FFPTime local_10;
            if (local_6.HitDamageTmpMemory.Find(Event.HitDamageSource, local_10))
            {
                if (this.HitDamageMemoryLastTime.opCmp(((ECS::GetContextTime() - local_10).ToSeconds())) <= 0)
                {
                    ::FEcosimAIV2Utils::RemoveEntityRelation(Event.HitDamageSource, Event.Sender, EEcosimAIV2EntityRelation(5), false);
                    ::FEcosimAIV2Utils::SendRelationChangeEvent(ENTITY_NULL, Event.Sender, EEcosimAIV2EntityRelation(5), false);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitEcosimAIV2RelationDB() const
    {
        ECS::GetContextJob();
        this.Job_InitEcosimAIV2RelationDB();
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEntityDeathCleanupRelations() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEntityDeathCleanupRelations(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPawnRiddingMountModified() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPawnRiddingMountOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPawnRiddingMountModified(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPawnRiddingMountOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnPawnRiddingMountModified(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPawnRiddingMountAssignOrRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPawnRiddingMountOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPawnRiddingMountAssignOrRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInteractionInfoForESMModified() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorInteractionInfoForESMOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInteractionInfoForESMModified(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorInteractionInfoForESMOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnInteractionInfoForESMModified(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInteractKeepingTagRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorInteractKeepingTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInteractKeepingTagRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnChainParentInfoModified() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChainParentInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnChainParentInfoModified(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorChainParentInfoOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnChainParentInfoModified(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnChainParentInfoAssignOrRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChainParentInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnChainParentInfoAssignOrRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEcosimAIV2TeamModified() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimAIV2TeamOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEcosimAIV2TeamModified(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorEcosimAIV2TeamOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnEcosimAIV2TeamModified(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEcosimAIV2TeamRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimAIV2TeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEcosimAIV2TeamRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RecordEcosimAIV2HitDamageTmpMemory() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_DamageEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_RecordEcosimAIV2HitDamageTmpMemory(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleTryRemoveHitDamageMemory() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleTryRemoveHitDamageMemory(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

