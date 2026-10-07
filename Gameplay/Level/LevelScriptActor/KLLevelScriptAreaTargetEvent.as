

class AKLLevelScriptAreaTargetEvent : AKLLevelScriptAreaEventBase
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> PlayerFirstEnterMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> AreaFirstEnterMessageHint;
    UPROPERTY()
    float32 AreaFirstEnterSideHintRange = 5000.0f;

    default bUseLevelEventAttribute = true;


    UFUNCTION()
    void OnInitLevelScriptEntity_Implementation()
    {
        Super::OnInitLevelScriptEntity_Implementation();
        CastTo local_4;
        if (local_4.opCall())
        {
            Has local_58;
            if (this.EventInfo && !(local_58.opCall()))
            {
                FC_PrefabConfig local_66;
                TDataObjectPtr<FBasePrefabConfig> local_90;
                local_66.ConfigPtr = local_90;
                local_66.PrefabType = EPrefabType(5);
            }
        }
        return;
    }
    UFUNCTION()
    void PreLevelBeginPlay_Implementation()
    {
        Super::PreLevelBeginPlay_Implementation();
        this.ServerInitAreaEvent();
        return;
    }
    void OnPlayerEnterArea(const FECSEntity &inout PlayerEntity)
    {
        Super::OnPlayerEnterArea(PlayerEntity);
        this.ShowEventForPlayer(PlayerEntity);
        return;
    }
    void ActivateEvent()
    {
        FLevelEventTypeAttribute local_130;
        if (this.GetCurrentTypeAttribute(local_130))
        {
            this.PresentationRuleConfig = local_130.PresentationRuleConfig;
        }
        Super::ActivateEvent();
        Super::TurnOnMinimapIcon();
        return;
    }
    void DeactivateEvent()
    {
        Super::TurnOffMinimapIcon();
        Super::DeactivateEvent();
        return;
    }
    void SetLevelEventFinish(const bool bSuccess)
    {
        FLevelEventTypeAttribute local_130;
        if (this.GetCurrentTypeAttribute(local_130))
        {
            if (bSuccess)
            {
                this.EventSuccessMessageHint = local_130.EventSuccessMessageHint;
            }
            else
            {
                this.EventFailedMessageHint = local_130.EventFailedMessageHint;
            }
        }
        Super::SetLevelEventFinish(bSuccess);
        return;
    }
    void LevelEventSuccess(const TArray<FECSEntity> &inout TriggeredPlayers)
    {
        Super::LevelEventSuccess(TriggeredPlayers);
        return;
    }
    ULevelEventAttribute GetLevelEventAttribute() const
    {
        CastTo local_4;
        if (local_4.opCall())
        {
            ULevelEventAttribute local_56;
            return local_56;
        }
        return nullptr;
    }
    bool GetCurrentTypeAttribute(FLevelEventTypeAttribute &inout OutAttr) const
    {
        int local_59 = 0;
        ULevelEventAttribute local_4 = this.GetLevelEventAttribute();
        if (local_4 == nullptr)
        {
            return false;
        }
        CastTo local_10;
        if (!(local_10.opCall()))
        {
            return false;
        }
        return local_4.GetTypeAttribute(ELevelRandomEventType(local_59), OutAttr);
    }
    void ServerInitAreaEvent()
    {
        this.ActivateEvent();
        return;
    }
    void ShowEventForPlayer(const FECSEntity &inout PlayerEntity)
    {
        int local_8 = 0;
        int local_278 = 0;
        GetDefaulted local_244;
        if (PlayerEntity.IsActive())
        {
            TDataObjectPtr<FMessageHintConfig> local_32;
            TDataObjectPtr<FMessageHintConfig> local_56;
            FLevelEventTypeAttribute local_186;
            if (this.GetCurrentTypeAttribute(local_186))
            {
                local_32 = local_186.PlayerFirstEnterMessageHint;
                local_56 = local_186.AreaFirstEnterMessageHint;
            }
            Has local_216;
            if (!(!(!(local_216.opCall()))) && local_56)
            {
                TArray<FECSEntity> local_222 = ::FTeamUtils::GetTeammates(PlayerEntity);
                for (auto& local_240 : local_222)
                {
                    if ((!((FECSEntity(local_244.opCall().GetPlayerEntity()) == PlayerEntity))))
                    {
                        if (local_56)
                        {
                            Make local_258;
                            TArray<FTextArgument> local_252;
                            local_252.Add(local_258.opImplConv());
                            Make local_272;
                            local_252.Add(local_272.opImplConv());
                            local_252.Add(local_258.opImplConv());
                            ::MessageHintUtils::ShowMessageHint(local_240, local_56, local_252);
                        }
                    }
                }
                local_8.SetAreaFirstEnterMessageHint(local_56);
            }
            if (local_32)
            {
                if (!(local_278.TriggeredPlayers.Contains(PlayerEntity)))
                {
                    local_278.TriggeredPlayers.Add(PlayerEntity);
                    local_8.SetPlayerFirstEnterMessageHint(local_32);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void DropRewardByEventType(const FVector &inout DropLocation)
    {
        FLevelEventTypeAttribute local_130;
        if (!(this.GetCurrentTypeAttribute(local_130)))
        {
            XWarning(ELog(22), FString().Append(this.GetName()).Append(" [LevelEventAttribute] Cannot drop reward: DA not configured"));
            return;
        }
        for (auto& local_156 : local_130.RewardDropConfigs)
        {
            if (local_156)
            {
                CastTo local_184;
                TDataObjectPtr<FDropItemConfigBase> local_208 = local_184.opCall();
                FDropMovementConfigData local_232;
                ::DropItemsUtils::DropItemsFromBPCaller(local_208, local_232, this.LevelScriptEntity, this.LevelScriptEntity, true, DropLocation);
            }
        }
        return;
    }
}

struct FLevelAreaEventUnitConfig : FLevelBPUnitConfig
{
    FLevelBPUnitConfig _base_FLevelBPUnitConfig;
    UPROPERTY()
    TDataObjectPtr<FLevelEventInfoConfigBase> EventInfo;
    UPROPERTY()
    TDataObjectPtr<FMinimapIconConfig> IconSettings;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> PlayerFirstEnterMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> AreaFirstEnterMessageHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EventSuccessMessageHint;
    UPROPERTY()
    int EventTargetNumber = 1;


    void SetupByActor(const AKLLevelScriptAreaTargetEvent Actor)
    {
        this.EventInfo = Actor.EventInfo;
        this.IconSettings = Actor.IconSettings;
        this.PlayerFirstEnterMessageHint = Actor.PlayerFirstEnterMessageHint;
        this.AreaFirstEnterMessageHint = Actor.AreaFirstEnterMessageHint;
        this.EventSuccessMessageHint = Actor.EventSuccessMessageHint;
        this.EventTargetNumber = int(Actor.EventTargetNumber);
        this.Transform = Actor.GetActorTransform();
        return;
    }
}

