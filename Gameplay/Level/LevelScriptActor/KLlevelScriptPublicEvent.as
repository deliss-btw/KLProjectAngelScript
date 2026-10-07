

class AKLLevelScriptPublicEvent : AKLLevelScriptAreaEventBase
{
    UPROPERTY()
    FNameHandle_ESMBBTrigger InteractableNotifyESMTrigger;
    UPROPERTY()
    FNameHandle_EntityBBVarInt InteractableNotifyEBB;
    UPROPERTY()
    TSoftClassPtr<APropPrefabBase_Interactable> InteractPrefabClass;
    UPROPERTY()
    TSoftClassPtr<AKLLevelPrefabBase> TreasurePrefabClass;
    UPROPERTY()
    TSoftObjectPtr<AActor> TreasureRefLocation;
    UPROPERTY()
    TArray<FDropConfigItem> TreasureDropItems;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EventActivateMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EventJoinBarMessageHint;
    UPROPERTY()
    FTeleportSlotConfig TeleportSlotConfig;

    default InteractableNotifyESMTrigger.Name = n"PublicEventCanInteract";

    AKLLevelScriptPublicEvent()
    {
        super();
        FNameHandle_EntityBBVarInt local_6;
        local_6;
        return;
    }
    UFUNCTION()
    void OnInitLevelScriptEntity_Implementation()
    {
        Super::OnInitLevelScriptEntity_Implementation();
        if (this.TeleportSlotConfig.Slots.Num() > 0)
        {
        }
        return;
    }
    UFUNCTION()
    void PreLevelBeginPlay_Implementation()
    {
        int local_6 = 0;
        Super::PreLevelBeginPlay_Implementation();
        this.SetPublicEventStatus(this.LevelScriptEntity, EPublicEventStatus(0));
        Super::TurnOnMinimapIcon();
        TSubclassOf<AECSPrefab> local_10 = this.InteractPrefabClass.Get();
        if ((!((local_10 == nullptr))))
        {
            FECSEntity local_30 = this.RequestLevelOwnedEntityDeferred(local_10, this.GetActorLocation(), this.GetActorRotation(), false);
            if (local_30.IsValid())
            {
                local_6.SetInteractEntity(local_30);
                FC_LevelPublicEventInteractTarget local_44;
                Assign local_38;
                local_38.opCall(local_44).SetLevelPublicEventEntity(this.LevelScriptEntity);
            }
        }
        return;
    }
    bool IsEventActive() const
    {
        Get local_4;
        const FC_LevelPublicEventInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            return (int(local_6.GetStatus()) == 2);
        }
        return false;
    }
    void OnPlayerEnterArea(const FECSEntity &inout PlayerEntity)
    {
        int local_6 = 0;
        Super::OnPlayerEnterArea(PlayerEntity);
        if (!(local_6))
        {
            return;
        }
        if ((int(local_6.GetStatus())) == 2)
        {
            if (this.EventJoinBarMessageHint)
            {
                Make local_20;
                TArray<FTextArgument> local_14;
                local_14.Add(local_20.opImplConv());
                Make local_32;
                local_14.Add(local_32.opImplConv());
                local_14.Add(local_20.opImplConv());
                ::MessageHintUtils::ShowMessageHint(PlayerEntity, this.EventJoinBarMessageHint, local_14);
            }
        }
        return;
    }
    void ActivateEvent()
    {
        Super::ActivateEvent();
        TArray<FECSEntity> local_4;
        ::FPlayerUtils::GetAllPlayerPawnEntitiesInRange(local_4, ECS::GetECSWorld(), this.GetActorLocation(), 20000.0f, false);
        for (auto& local_28 : local_4)
        {
            if (local_28.IsActive())
            {
                if (this.EventActivateMessageHint)
                {
                    Make local_38;
                    TArray<FTextArgument> local_32;
                    local_32.Add(local_38.opImplConv());
                    Make local_52;
                    local_32.Add(local_52.opImplConv());
                    local_32.Add(local_38.opImplConv());
                    ::MessageHintUtils::ShowMessageHint(local_28, this.EventActivateMessageHint, local_32);
                }
            }
        }
        return;
    }
    void DeactivateEvent()
    {
        Super::DeactivateEvent();
        return;
    }
    void LevelEventSuccess(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        int local_76 = 0;
        XLog(ELog(22), FString().Append(this.GetName()).Append(" LevelPublicEvent Success"));
        Super::LevelEventSuccess(TriggeredPlayers);
        this.DropTreasure();
        this.SetPublicEventStatus(this.LevelScriptEntity, EPublicEventStatus(3));
        CastTo local_38;
        TDataObjectPtr<FLevelPublicEventInfoConfig> local_62 = local_38.opCall();
        if (local_62.IsSet())
        {
            FFPTime local_72 = FFPTime(-1);
            FECSWorldPtr local_66 = ECS::GetECSWorld();
            local_76.PublicEventEntity = this.LevelScriptEntity;
            local_76.EventInfo = local_62;
            local_76.TriggeredPlayers = TriggeredPlayers;
        }
        return;
    }
    void LevelEventFailed(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        XLog(ELog(22), FString().Append(this.GetName()).Append(" LevelPublicEvent Failed"));
        Super::LevelEventFailed(TriggeredPlayers);
        this.SetPublicEventStatus(this.LevelScriptEntity, EPublicEventStatus(4));
        return;
    }
    UFUNCTION()
    void OnActivatePublicEvent_Implementation(const FECSEntity &inout InteractPlayerEntity)
    {
        return;
    }
    void OnActivatePublicEvent(const FECSEntity &inout InteractPlayerEntity)
    {
        __Evt_PushArgument__FECSEntity(InteractPlayerEntity);
        __Evt_Execute(this, n"OnActivatePublicEvent");
        return;
    }
    void SetPublicEventStatus(const FECSEntity &inout Entity, const EPublicEventStatus Status)
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        CastTo local_36;
        TDataObjectPtr<FLevelPublicEventInfoConfig> local_60 = local_36.opCall();
        if (!(local_60.IsSet()))
        {
            return;
        }
        EPublicEventStatus local_61;
        local_61 = local_6.GetStatus();
        local_6.SetStatus(EPublicEventStatus(Status));
        XLog(ELog(22), FString().Append(this.GetName()).Append(" SetPublicEventStatus: ").Append(Status));
        switch (int(Status))
        {
        case 0:
        {
                float32 local_103;
            FRuntimePublicEventLBPData local_102;
            local_103 = local_60.opArrow().PrepareToInteractDuration;
            if (::FLevelPublicEventUtils::GetLBPRuntimeData(TSoftClassPtr<AKLLevelScriptPublicEvent>(this.GetClass()), local_102))
            {
                if (int(local_102.ActiveCount) == 1)
                {
                    float32 local_104 = local_60.opArrow().PrepareToInteractDuration;
                    local_103 = FMath::RandRange(0.0f, local_104);
                }
            }
            local_6.SetInStatusTime(ECS::GetContextTime());
            local_6.SetChangeStatusTime((ECS::GetContextTime() + FFPTime(local_103)));
            break;
        }
        case 1:
        {
            local_6.SetInStatusTime(ECS::GetContextTime());
            local_6.SetChangeStatusTime((ECS::GetContextTime() + FFPTime(local_60.opArrow().InteractableKeepDuration)));
            break;
        }
        case 2:
        {
            local_6.SetInStatusTime(ECS::GetContextTime());
            local_6.SetChangeStatusTime((ECS::GetContextTime() + FFPTime(local_60.opArrow().InProgressDuration)));
            break;
        }
        case 3:
        {
            local_6.SetInStatusTime(ECS::GetContextTime());
            FFPTime local_126 = ECS::GetContextTime();
            float32 local_118 = local_60.opArrow().SuccessUnloadDuration;
            local_6.SetChangeStatusTime((local_126 + FFPTime(local_118)));
            break;
        }
        case 4:
        {
            local_6.SetInStatusTime(ECS::GetContextTime());
            FFPTime local_124_2 = ECS::GetContextTime();
            local_6.SetChangeStatusTime((local_124_2 + FFPTime(local_60.opArrow().FailedUnloadDuration)));
            break;
        }
        default:
        {
            local_6.SetInStatusTime(FFPTime(-1));
            local_6.SetChangeStatusTime(FFPTime(-1));
        }
        }
        if (int(local_61) != int(Status))
        {
            if (int(local_61) == 2)
            {
                this.DeactivateEvent();
                Super::TurnOffMinimapIcon();
            }
            else
            {
                if (int(Status) == 2)
                {
                    this.ActivateEvent();
                }
            }
            if (int(Status) == 1)
            {
                this.NotifyInteractEntityInteractable(local_6.GetInteractEntity());
            }
        }
        return;
    }
    void NotifyInteractEntityInteractable(const FECSEntity &inout InteractEntity)
    {
        if (!(InteractEntity.IsValid()))
        {
            return;
        }
        if ((!((FName(this.InteractableNotifyEBB.Name) == NAME_None))))
        {
            InteractEntity.SetBB_Int(this.InteractableNotifyEBB, 1);
        }
        if ((!((FName(this.InteractableNotifyESMTrigger.Name) == NAME_None))))
        {
            FESMTriggerUtils::ActivateESMTrigger(InteractEntity, this.InteractableNotifyESMTrigger.Name, ECS::GetContextTime(), FFPTime(0.1), 0);
        }
        return;
    }
    void SetPublicEventInteractable(const FECSEntity &inout Entity)
    {
        XLog(ELog(22), FString().Append(this.GetName()).Append(" SetPublicEventInteractable"));
        this.SetPublicEventStatus(Entity, EPublicEventStatus(1));
        return;
    }
    void DropTreasure()
    {
        AActor local_84;
        int local_154 = 0;
        bool local_155;
        bool local_156;
        TSubclassOf<AECSPrefab> local_4 = this.TreasurePrefabClass.Get();
        if ((local_4 == nullptr))
        {
            return;
        }
        CastTo local_34;
        TDataObjectPtr<FLevelPublicEventInfoConfig> local_58 = local_34.opCall();
        if (!(local_58.IsSet()))
        {
            return;
        }
        FVector local_70 = this.GetActorLocation();
        FRotator local_82 = this.GetActorRotation();
        if (local_84 != nullptr)
        {
            local_70 = local_84.GetActorLocation();
            local_82 = local_84.GetActorRotation();
        }
        float32 local_87 = 0.0f;
        if (local_58.opArrow().MaxDistanceToGetReward > 0.0f)
        {
            local_87 = local_58.opArrow().MaxDistanceToGetReward * local_58.opArrow().MaxDistanceToGetReward;
        }
        TArray<FECSEntity> local_98 = FGameUtils::GetAllPlayerControllerEntities(true);
        for (auto& local_112 : local_98)
        {
            if (!(::FASCommonUtils::GetUniqueAvatarPawnEntity(local_112).IsValid()))
            {
                continue;
            }
            if (local_87 > 0.0f)
            {
                Get local_124;
                if (local_70.DistSquared(local_124.opCall().GetPosition()) > local_87)
                {
                    continue;
                }
            }
            FECSEntity local_120 = this.RequestLevelOwnedEntityDeferred(local_4, local_70, local_82, false);
            if (local_120.IsValid())
            {
                FC_NetRelevancePolicy local_137;
                Assign local_136;
                local_136.opCall(local_137).RelevancePolicyType = (5 != 0);
            }
            Get local_142;
            const FC_PlayerController& local_144 = local_142.opCall();
            if (local_144)
            {
                FECSNetUtils::SetNetRelevance(local_120, FNetPlayerMask::MakeForPlayerIndex(local_144.GetPlayerIndex()));
            }
            local_155 = false;
            local_156 = false;
            for (auto& local_170 : this.TreasureDropItems)
            {
                int local_195 = int(local_170.TriggerType);
                local_154.AddDropItem(EDropTriggerType(local_195), TDataObjectPtr<FDropItemConfigBase>());
                if (int(local_170.TriggerType) == 3)
                {
                    local_155 = true;
                    continue;
                }
                local_156 = true;
            }
            if (local_155)
            {
                ModifyOrAdd local_200;
                local_200.opCall().bHasNonAutoDropItem = local_156;
            }
        }
        return;
    }
    void ActivatePublicEvent(const FECSEntity &inout InteractPlayerEntity)
    {
        int local_16 = 0;
        XLog(ELog(22), FString().Append(this.GetName()).Append(" ActivatePublicEvent"));
        if (!(local_16))
        {
            return;
        }
        this.SetPublicEventStatus(this.LevelScriptEntity, EPublicEventStatus(2));
        FECSEntity local_22 = FECSEntity(local_16.GetInteractEntity());
        if (local_22.IsValid())
        {
            local_22.DestroyDeferred();
            Modify local_26;
            local_26.opCall().SetInteractEntity(ENTITY_NULL);
        }
        this.OnActivatePublicEvent(InteractPlayerEntity);
        return;
    }
    void LevelEventNotInteracted(const FECSEntity &inout Entity)
    {
        XLog(ELog(22), FString().Append(this.GetName()).Append(" LevelPublicEvent Not Interacted"));
        this.UnloadPublicEvent();
        return;
    }
    void UnloadPublicEvent()
    {
        XLog(ELog(22), FString().Append(this.GetName()).Append(" UnloadPublicEvent"));
        ::FLevelPublicEventUtils::DeActivateDatalayer(this.GetWorld(), TSubclassOf<AKLLevelScriptPublicEvent>(this.GetClass()));
        return;
    }
}

