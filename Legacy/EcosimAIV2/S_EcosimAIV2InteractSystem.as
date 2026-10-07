

class US_EcosimAIV2InteractSystem : UECSScriptSystem
{
    US_EcosimAIV2InteractSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_HandleEcosimAIV2ChainInit(const FECSEntity &inout Entity, const FC_EcosimAIV2ChainParentConfig &inout EcosimAIV2ChainParentConfig) const
    {
        Entity.AddGameplayTag(GameplayTags::EcosimAIV2_Ability_ChainSource, NAME_None);
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2ChainEvent(FCE_EcosimAIV2ChainEvent &inout Event) const
    {
        int local_14 = 0;
        int local_20 = 0;
        FECSEntity local_4 = Event.ChainParentEntity;
        FECSEntity local_8 = Event.ChainChildEntity;
        if (!(!(local_14)) && local_20)
        {
            GetDefaulted local_90;
            FCE_TeleportToLocationRequest local_86;
            FChainParam local_76;
            local_76.SetParentJointInfo(local_14.ParentJointInfo);
            local_76.SetChildJointInfo(local_20.ChildJointInfo);
            local_76.SetChildCenterInfo(local_20.ChildCenterInfo);
            local_76.SetLinkInfo(local_20.LinkInfo);
            ::FChainUtils::ChainToEntity(local_8, local_4, local_76);
            FFPTime local_82 = FFPTime(-1);
            local_86.Location = local_90.opCall().GetPosition();
            local_86.Rotation = FRotator(local_90.opCall().GetRotation());
            local_86.bShowBlackScreen = false;
            local_86.bBlockInput = false;
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2RiderChainEvent(FCE_EcosimAIV2RiderChainEvent &inout Event) const
    {
        int local_26 = 0;
        int local_32 = 0;
        FECSEntity local_8;
        Get local_12;
        const FC_PawnRiddingMount& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.GetMountEntity().IsValid() && local_14.IsDriver())
            {
                local_8 = local_14.GetMountEntity();
            }
            else
            {
                return;
            }
        }
        FECSEntity local_20 = Event.ChainChildEntity;
        if (!(!(local_26)) && local_32)
        {
            GetDefaulted local_98;
            FCE_TeleportToLocationRequest local_94;
            FChainParam local_84;
            local_84.SetParentJointInfo(local_26.ParentJointInfo);
            local_84.SetChildJointInfo(local_32.ChildJointInfo);
            local_84.SetChildCenterInfo(local_32.ChildCenterInfo);
            local_84.SetLinkInfo(local_32.LinkInfo);
            ::FChainUtils::ChainToEntity(local_20, local_8, local_84);
            FFPTime local_90 = FFPTime(-1);
            local_94.Location = local_98.opCall().GetPosition();
            local_94.Rotation = FRotator(local_98.opCall().GetRotation());
            local_94.bShowBlackScreen = false;
            local_94.bBlockInput = false;
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2UnlinkChainEvent(FCE_EcosimAIV2UnchainEvent &inout Event) const
    {
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            ::FChainUtils::UnchainFromParent(Event.TargetEntity);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2ChainUnchainOnDeath(const FCE_DeathEvent &inout Event) const
    {
        FC_EcosimAIV2ChainStateConfig local_12;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if ((!(local_12) || !(local_12.bUnChainWhenDead)))
        {
            return;
        }
        TArray<FECSEntity> local_18;
        if (::FChainUtils::GetChainChildren(local_4, local_18))
        {
            for (auto& local_32 : local_18)
            {
                if (local_32.IsValid())
                {
                    ::FChainUtils::UnchainFromParent(local_32);
                }
            }
        }
        Has local_36;
        bool local_5 = local_36.opCall();
        if (local_5)
        {
            ::FChainUtils::UnchainFromParent(local_4);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_HandleEcosimAIV2ChainInit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimAIV2ChainParentConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_HandleEcosimAIV2ChainInit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2ChainEvent() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_EcosimAIV2ChainEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_EcosimAIV2ChainEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2ChainEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2RiderChainEvent() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_EcosimAIV2RiderChainEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_EcosimAIV2RiderChainEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2RiderChainEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2UnlinkChainEvent() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_EcosimAIV2UnchainEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_EcosimAIV2UnchainEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2UnlinkChainEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2ChainUnchainOnDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2ChainUnchainOnDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

