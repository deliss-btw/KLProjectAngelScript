

class US_LevelDataLayerSystem : UECSScriptSystem
{
    US_LevelDataLayerSystem()
    {
        return;
    }
    bool IsDataLayerDirty() const
    {
        bool local_1 = false;
        ULevelActorManager local_6 = ULevelActorManager::Get();
        if (local_6 != nullptr)
        {
            local_1 = local_6.IsPendingReplicateDatalayerStates();
        }
        return local_1;
    }
    UFUNCTION()
    void ServerJob_InitialUpdateLevelGroups() const
    {
        FCS_ServerPendingUpdateLevelGroupsTag local_8;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Assign local_6;
        local_6.opCall(local_8);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_LevelActiveDataLayers local_24;
        Assign local_12;
        local_12.opCall(local_24);
        return;
    }
    UFUNCTION()
    void ClientJob_InitalUpdateLevelGroups() const
    {
        FCS_ClientPendingUpdateLevelGroupsTag local_8;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Assign local_6;
        local_6.opCall(local_8);
        return;
    }
    UFUNCTION()
    void ServerJob_TickLevelDataLayer() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        ULevelActorManager::Get().GetActiveDataLayers(local_8.GetModify_ActiveDataLayers(), local_8.GetModify_EffectiveActiveDataLayers());
        ULevelActorManager::Get().NotifyReplicatedDatalayerStates();
        local_8.SetModifyFlag((local_8.GetModifyFlag() + 1));
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_ServerPendingUpdateLevelGroupsTag local_18;
        Assign local_16;
        local_16.opCall(local_18);
        return;
    }
    UFUNCTION()
    void ClientJob_ResetLevelActiveDataLayersClientModifyFlag() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_LevelActiveDataLayers(const FCS_LevelActiveDataLayers &inout LevelActiveDataLayers) const
    {
        FCS_LevelActiveDataLayersClientModifyFlag local_8;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (LevelActiveDataLayers.GetModifyFlag() == int(local_8.ModifyFlag))
        {
            return;
        }
        local_8.ModifyFlag = LevelActiveDataLayers.GetModifyFlag();
        ULevelActorManager::Get().ClientKLReceiveActiveDataLayers(LevelActiveDataLayers.GetActiveDataLayers(), LevelActiveDataLayers.GetEffectiveActiveDataLayers());
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_18;
        if (local_18.opCall() && !(this.GetWorld().GetGameInstance().IsChangeMapLoadingScreenDisabled()))
        {
            UKLLoadingScreenSubsystem::Get().WantsLevelStreaming(ELoadingScreenAction(0));
        }
        if (UGameplayConfigsManager::UseJsonConfig())
        {
            FECSWorldPtr local_2_3 = this.GetECSWorld();
            FCS_ClientPendingUpdateLevelGroupsTag local_34;
            Assign local_32;
            local_32.opCall(local_34);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitialUpdateLevelGroups() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitialUpdateLevelGroups();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitalUpdateLevelGroups() const
    {
        ECS::GetContextJob();
        this.ClientJob_InitalUpdateLevelGroups();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickLevelDataLayer() const
    {
        ECS::GetContextJob();
        if (this.IsDataLayerDirty() == false)
        {
            return;
        }
        this.ServerJob_TickLevelDataLayer();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ResetLevelActiveDataLayersClientModifyFlag() const
    {
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        this.ClientJob_ResetLevelActiveDataLayersClientModifyFlag();
        return;
    }
    UFUNCTION()
    void Run_Monitor_LevelActiveDataLayers() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_LevelActiveDataLayers, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_LevelActiveDataLayers(local_24);
        }
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_LevelActiveDataLayers, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_LevelActiveDataLayers(local_24);
        }
        return;
    }
}

