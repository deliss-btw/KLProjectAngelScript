
enum EInteractionBehaviorAction_SendMessageHintTarget
{
    InteractSource,
    RangeBroadcast,
}

enum EInteractionBehaviorAction_MessageHintParameterType
{
    InteractSource,
    InteractSourcePlayer,
    InteractTarget,
    NumericValue,
    DataObjectPtr,
}


UCLASS(Abstract)
class UInteractionBehaviorActionBase : UObject
{
    UPROPERTY()
    bool bPresentationOnly = false;


    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehaviorAction_ESMTriggerBase : UInteractionBehaviorActionBase
{
    UPROPERTY()
    FInteractActionESMBB Trigger;

    UInteractionBehaviorAction_ESMTriggerBase()
    {
        super();
        this.Trigger.TriggerValidateTime = 0.2f;
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if ((FName(this.Trigger.ESMBBTrigger.Name) == NAME_None))
        {
            FString local_12 = "ESMBBTrigger Name is None! ";
            FString local_8 = this.GetPathName(nullptr);
            return;
        }
        FECSEntity local_26 = this.GetTriggerEntity(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        Has local_30;
        if (!(local_26.IsValid()) || !(local_30.opCall()))
        {
            return;
        }
        FInteractActionESMBBForEvent local_36;
        local_36.SetESMBBTriggerName(this.Trigger.ESMBBTrigger.Name);
        local_36.SetTriggerValidateTime(this.Trigger.TriggerValidateTime);
        ::FInteractUtils::CreateInteractActionESMTriggerEvent(InteractSource, local_26, local_36);
        return;
    }
    FECSEntity GetTriggerEntity(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        return ENTITY_NULL;
    }
}

class UInteractionBehaviorAction_SourceESMTrigger : UInteractionBehaviorAction_ESMTriggerBase
{
    UInteractionBehaviorAction_SourceESMTrigger()
    {
        super();
        return;
    }
    FECSEntity GetTriggerEntity(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        return InteractSource;
    }
}

class UInteractionBehaviorAction_TargetESMTrigger : UInteractionBehaviorAction_ESMTriggerBase
{
    UPROPERTY()
    bool bSecondaryInteractSource = false;


    FECSEntity GetTriggerEntity(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (this.bSecondaryInteractSource)
        {
            Get local_6;
            const FC_SecondaryInteractSourceInfo& local_8 = local_6.opCall();
            if (local_8)
            {
                return local_8.GetTargetEntity();
            }
            else
            {
                return ENTITY_NULL;
            }
        }
        else
        {
            return InteractTarget;
        }
    }
}

class UInteractionBehaviorAction_TriggerTargetAbility : UInteractionBehaviorActionBase
{
    UPROPERTY()
    bool bSecondaryInteractSource = false;
    UPROPERTY()
    FName CustomEventName;


    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Has local_6;
        if (!(InteractTarget.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        if (this.bSecondaryInteractSource)
        {
            Get local_12;
            const FC_SecondaryInteractSourceInfo& local_14 = local_12.opCall();
            if (local_14)
            {
                ::FInteractUtils::CreateInteractActionTargetAbilityEvent(InteractSource, local_14.GetTargetEntity(), this.CustomEventName, InteractTargetPointAndBehaviorIndex);
            }
            return;
        }
        ::FInteractUtils::CreateInteractActionTargetAbilityEvent(InteractSource, InteractTarget, this.CustomEventName, InteractTargetPointAndBehaviorIndex);
        return;
    }
}

class UInteractionBehaviorAction_OpenUI : UInteractionBehaviorActionBase
{
    UPROPERTY()
    TSoftClassPtr<UUserWidget> UIWidget;

    default bPresentationOnly = true;

    UInteractionBehaviorAction_OpenUI()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        FCS_FixedTime local_12;
        int local_22 = 0;
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return;
        }
        ECS::GetECSWorld().IsValid();
        if (!(local_12.bFirstTimeTick))
        {
            return;
        }
        FFPTime local_18 = FFPTime(-1);
        local_22.UIWidget = this.UIWidget;
        return;
    }
}

class UInteractionBehaviorAction_OpenPage : UInteractionBehaviorActionBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;
    UPROPERTY()
    FGameplayTag WidgetTag;

    default bPresentationOnly = true;

    UInteractionBehaviorAction_OpenPage()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_22 = 0;
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return;
        }
        ECS::GetECSWorld().IsValid();
        FFPTime local_18 = FFPTime(-1);
        local_22.PageWidget = this.PageWidget;
        local_22.WidgetTag = this.WidgetTag;
        local_22.InteractSource = InteractSource;
        local_22.InteractTargetInfo.SetTargetEntity(InteractTarget);
        local_22.InteractTargetInfo.SetInteractTargetPointAndBehaviorIndex(InteractTargetPointAndBehaviorIndex);
        return;
    }
}

class UInteractionBehaviorAction_ClosePage : UInteractionBehaviorActionBase
{
    default bPresentationOnly = true;

    UInteractionBehaviorAction_ClosePage()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_16 = 0;
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return;
        }
        ECS::GetECSWorld().IsValid();
        FFPTime local_12 = FFPTime(-1);
        local_16.InteractTarget = InteractTarget;
        return;
    }
}

class UInteractionBehaviorAction_EnterSystem : UInteractionBehaviorActionBase
{
    UPROPERTY()
    UFrontendSystemConfig System;

    default bPresentationOnly = true;

    UInteractionBehaviorAction_EnterSystem()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return;
        }
        ::FrontendSystemUtil::EnterSystem(::FASCommonUtils::GetUniquePlayerEntity(InteractSource), this.System);
        return;
    }
}

class UInteractionBehaviorAction_ExitSystem : UInteractionBehaviorActionBase
{
    UPROPERTY()
    UFrontendSystemConfig System;

    default bPresentationOnly = true;

    UInteractionBehaviorAction_ExitSystem()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return;
        }
        ::FrontendSystemUtil::ExitSystem(::FASCommonUtils::GetUniquePlayerEntity(InteractSource), this.System);
        return;
    }
}

class UInteractionBehaviorAction_EcosimAIUse : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_EcosimAIUse()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        return;
    }
}

class UInteractionBehaviorAction_EcosimAITrigger : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_EcosimAITrigger()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        return;
    }
}

class UInteractionBehaviorAction_EcosimAIInteractDialogue : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_EcosimAIInteractDialogue()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        return;
    }
}

class UInteractionBehaviorAction_DestroyProp : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_DestroyProp()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            ::FLifeCycleUtils::EntityDeath(InteractTarget, InteractSource.GetId(), ECS::GetECSWorld().GetFixedTime().Time, true, true, false, true, EDeathReason(0));
        }
        return;
    }
}

class UInteractionBehaviorAction_StartProgressOperation : UInteractionBehaviorActionBase
{
    UPROPERTY()
    TDataObjectPtr<FProgressOperationConfig> ProgressOperationConfig;
    UPROPERTY()
    bool bTryJoinWhenTargetInOperation = true;


    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            if (this.bTryJoinWhenTargetInOperation)
            {
                Get local_6;
                const FC_ProgressOperationTarget& local_8 = local_6.opCall();
                if (local_8)
                {
                    ::FProgressOperationUtils::JoinProgressOperation(local_8.GetOperationEntity(), InteractSource);
                    return;
                }
            }
            ::FProgressOperationUtils::StartProgressOperation(InteractSource, InteractTarget, this.ProgressOperationConfig, false);
        }
        return;
    }
}

class UInteractionBehaviorAction_JoinProgressOperation : UInteractionBehaviorActionBase
{
    UPROPERTY()
    bool bCanJoinByMember = true;
    UPROPERTY()
    bool bCanJoinByOperationEntity = true;
    UPROPERTY()
    bool bCanJoinByTarget = true;


    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            if (this.bCanJoinByMember)
            {
                Get local_6;
                const FC_ProgressOperationMember& local_8 = local_6.opCall();
                if (local_8)
                {
                    ::FProgressOperationUtils::JoinProgressOperation(local_8.GetOperationEntity(), InteractSource);
                    return;
                }
            }
            if (this.bCanJoinByOperationEntity)
            {
                Get local_12;
                const FC_ProgressOperationRuntime& local_14 = local_12.opCall();
                if (local_14)
                {
                    ::FProgressOperationUtils::JoinProgressOperation(local_14.GetOperationEntity(), InteractSource);
                    return;
                }
            }
            if (this.bCanJoinByTarget)
            {
                Get local_18;
                const FC_ProgressOperationTarget& local_20 = local_18.opCall();
                if (local_20)
                {
                    ::FProgressOperationUtils::JoinProgressOperation(local_20.GetOperationEntity(), InteractSource);
                    return;
                }
            }
        }
        return;
    }
}

class UInteractionBehaviorAction_EnterDS : UInteractionBehaviorActionBase
{
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfoConfig;

    UInteractionBehaviorAction_EnterDS()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_52 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer) || !(this.LevelInfoConfig))
        {
            return;
        }
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            if (0 == local_52)
            {
                XWarning(ELog(0), "EnterDS LevelKey is the same as the current level");
                return;
            }
        }
        if (::FASCommonUtils::GetUniquePlayerEntity(InteractSource).IsValid())
        {
            FFPTime local_68 = FFPTime(-1);
            FCE_ServerPlayerRequestEnterLevel local_72;
            local_72.LevelKey = local_52;
        }
        return;
    }
}

class UInteractionBehaviorAction_ConsumeItem : UInteractionBehaviorActionBase
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;
    UPROPERTY()
    int ItemNumber = 1;


    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer) || !(this.ItemConfig))
        {
            return;
        }
        ::InventoryUtils::RemoveInventoryItem(InteractSource, this.ItemConfig, this.ItemNumber);
        return;
    }
}

class UInteractionBehaviorAction_EcosimAIV2Chain : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_EcosimAIV2Chain()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_16 = 0;
        int local_22 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (InteractSource.MatchGameplayTag(GameplayTags::EcosimAIV2_Ability_ChainSource))
        {
            FFPTime local_12 = FFPTime(-1);
            local_16.ChainParentEntity = InteractSource;
            local_16.ChainChildEntity = InteractTarget;
        }
        else
        {
            FFPTime local_12_2 = FFPTime(-1);
            local_22.RiderEntity = InteractSource;
            local_22.ChainChildEntity = InteractTarget;
        }
        return;
    }
}

class UInteractionBehaviorAction_EcosimAIV2Unchain : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_EcosimAIV2Unchain()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_16 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        FFPTime local_12 = FFPTime(-1);
        local_16.TargetEntity = InteractTarget;
        return;
    }
}

class UInteractionBehaviorAction_EcosimAIV2InteractDialogue : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_EcosimAIV2InteractDialogue()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_16 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        FFPTime local_12 = FFPTime(-1);
        local_16.InteractSource = InteractSource;
        local_16.InteractTarget = InteractTarget;
        return;
    }
}

class UInteractionBehaviorAction_DialogueInteraction : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_DialogueInteraction()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_20 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        if (local_10.IsValid())
        {
            FFPTime local_16 = FFPTime(-1);
            local_20.PlayerEntity = local_10;
            local_20.InteractTarget = InteractTarget;
        }
        return;
    }
}

class UInteractionBehaviorAction_AddTemporarySkill : UInteractionBehaviorActionBase
{
    UPROPERTY()
    TDataObjectPtr<FAddTemporarySkillConfig> AddTemporarySkillConfig;

    UInteractionBehaviorAction_AddTemporarySkill()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        ::FSkillUtils::AddTemporarySkill(InteractSource, this.AddTemporarySkillConfig);
        return;
    }
}

class UInteractionBehaviorAction_TargetSendCustomLevelEvent : UInteractionBehaviorActionBase
{
    UPROPERTY()
    FName EventName;

    UInteractionBehaviorAction_TargetSendCustomLevelEvent()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_12 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FFPTime local_8 = FFPTime(-1);
        local_12.CustomName = this.EventName;
        return;
    }
}

class UInteractionBehaviorAction_DirectInteractSuccess : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_DirectInteractSuccess()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        ::FInteractUtils::ExecuteInteractSuccessAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        return;
    }
}

class UInteractionBehaviorAction_TriggerPrefabOnInteractWith : UInteractionBehaviorActionBase
{
    UPROPERTY()
    FName CustomEventName;

    UInteractionBehaviorAction_TriggerPrefabOnInteractWith()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        AKLLevelPrefabBase local_14;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        Get local_6;
        if (local_6.opCall())
        {
            AECSPrefab local_10;
            local_14 = (Cast<AKLLevelPrefabBase>(local_10));
            if (local_14 != nullptr && local_14.OnInteractWith.IsBound())
            {
                local_14.OnInteractWith.Broadcast(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex.GetPointIndex(), this.CustomEventName);
            }
        }
        return;
    }
}

struct FAddBuffConfigItem
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    float32 OverrideDuration = -1.0f;
    UPROPERTY()
    int AddStackNum = 1;


}

class UInteractionBehaviorAction_SourceAddBuff : UInteractionBehaviorActionBase
{
    UPROPERTY()
    TArray<FAddBuffConfigItem> BuffConfigs;

    UInteractionBehaviorAction_SourceAddBuff()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FECSWorldPtr local_4 = InteractSource.GetWorld();
        Get local_8;
        const FCS_FixedTime& local_10 = local_8.opCall();
        if (local_10)
        {
            for (auto& local_24 : this.BuffConfigs)
            {
                FBuffUtils::AddBuff(InteractSource, local_24.BuffConfig, local_10.Time, InteractTarget, false, local_24.OverrideDuration, int(local_24.AddStackNum), false);
            }
        }
        return;
    }
}

class UInteractionBehaviorAction_PropAddBuffToPlayer : UInteractionBehaviorActionBase
{
    UPROPERTY()
    bool bIncludeDefault = true;
    UPROPERTY()
    TArray<FName> BuffTagNames;


    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FFPTime local_8 = FFPTime(-1);
        SendEvent local_6;
        FCE_PropAddBuffToPlayerEvent& local_12 = local_6.opCall(local_8);
        if (local_12)
        {
            local_12.TriggerPlayer = InteractSource;
            local_12.BuffConfigSourceEntity = InteractTarget;
            local_12.bIncludeDefault = this.bIncludeDefault;
            local_12.BuffTagNames = this.BuffTagNames;
        }
        return;
    }
}

struct FInteractionBehaviorAction_MessageHintParameter
{
    UPROPERTY()
    EInteractionBehaviorAction_MessageHintParameterType ParameterType;
    UPROPERTY()
    float NumericValue;
    UPROPERTY()
    FDataObjectPtr DataObjectPtrValue;


}

class UInteractionBehaviorAction_MessageHint : UInteractionBehaviorActionBase
{
    UPROPERTY()
    EInteractionBehaviorAction_SendMessageHintTarget SendTarget;
    UPROPERTY()
    float32 BroadcastRange = 2000.0f;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig;
    UPROPERTY()
    TArray<FInteractionBehaviorAction_MessageHintParameter> CustomParameters;


    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

class UInteractionBehaviorAction_ActivatePublicEvent : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_ActivatePublicEvent()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        AKLLevelScriptPublicEvent local_18;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        Get local_6;
        const FC_LevelPublicEventInteractTarget& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.GetLevelPublicEventEntity().IsValid())
            {
                AActor local_14;
                local_18 = (Cast<AKLLevelScriptPublicEvent>(local_14));
                if (local_18 != nullptr)
                {
                    local_18.ActivatePublicEvent(InteractSource);
                }
            }
        }
        return;
    }
}

class UInteractionBehaviorAction_AccountExclusiveTreasureBoxOpen : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_AccountExclusiveTreasureBoxOpen()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_51;
        int local_52;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        if (!(::TreasureBoxSpawnDropItemUtils::SpawnDropItemsForTriggerPlayer(InteractTarget, InteractSource, true).IsValid()))
        {
            return;
        }
        Get local_14;
        const FC_LevelObjectStatConfig& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.LevelObjectStatConfig.IsSet())
            {
                FFPTime local_22 = FFPTime(-1);
                SendEvent local_20;
                FCE_TreasureBoxStateChanged& local_26 = local_20.opCall(local_22);
                if (local_26)
                {
                    local_26.TreasureBoxEntity = InteractTarget;
                    bool local_1 = ::FLevelObjectStatUtils::IsLevelObjectRecorded(InteractSource, TDataObjectPtr<FLevelObjectStatConfig>());
                    if (local_1)
                    {
                        local_52 = 2;
                        local_51 = local_52;
                    }
                    else
                    {
                        local_52 = 3;
                        local_51 = local_52;
                    }
                    local_26.OldState = ETreasureBoxState(local_51);
                    local_26.NewState = ETreasureBoxState(1);
                }
                ::TreasureBoxUtils::SetTreasureBoxRecordState(InteractSource, TDataObjectPtr<FLevelObjectStatConfig>(), ETreasureBoxRecordState(1), false);
            }
        }
        return;
    }
}

class UInteractionBehaviorAction_AccountExclusiveOculus : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_AccountExclusiveOculus()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        Get local_6;
        const FC_LevelObjectStatConfig& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.LevelObjectStatConfig.IsSet())
            {
                ::FLevelObjectStatUtils::RecordLevelObject(InteractSource, TDataObjectPtr<FLevelObjectStatConfig>());
            }
        }
        return;
    }
}

class UInteractionBehaviorAction_AccountExclusivePortal : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_AccountExclusivePortal()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        Get local_6;
        const FC_LevelObjectStatConfig& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.LevelObjectStatConfig.IsSet())
            {
                ::FLevelObjectStatUtils::RecordLevelObject(InteractSource, TDataObjectPtr<FLevelObjectStatConfig>());
            }
        }
        return;
    }
}

class UInteractionBehaviorAction_AccountExclusiveTriggerTeleporterActivate : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_AccountExclusiveTriggerTeleporterActivate()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_8 = 0;
        int local_9 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        if (!(local_8.TeleporterConfig.IsSet()))
        {
            return;
        }
        if (!(!(::TeleporterUtils::IsTeleporterActive(InteractSource, local_9, InteractTarget))))
        {
            return;
        }
        if (!(::TeleporterUtils::ActivateTeleporter(InteractSource, local_9, InteractTarget)))
        {
            return;
        }
        if (GetActivationReward().IsSet())
        {
            TArray<TDataObjectPtr<FDropItemConfigBase>> local_14;
            local_14.Add(GetActivationReward());
            FDropMovementConfigData local_40;
            ::DropItemsUtils::DropItemsFromBaseConfig(local_14, local_40, InteractTarget, InteractSource);
        }
        FFPTime local_46 = FFPTime(-1);
        SendEvent local_44;
        FCE_AccountExclusiveTeleporterActivated_DataTracker& local_48 = local_44.opCall(local_46);
        if (local_48)
        {
            local_48.TeleporterEntity = InteractTarget;
            local_48.InteractSourceEntity = InteractSource;
            local_48.DataId = local_9;
        }
        FFPTime local_46_2 = FFPTime(-1);
        SendEvent local_52;
        FCE_TeleporterStateChanged& local_54 = local_52.opCall(local_46_2);
        if (local_54)
        {
            local_54.TeleporterEntity = InteractTarget;
            local_54.OldState = ETeleporterState(1);
            local_54.NewState = ETeleporterState(2);
        }
        FString local_64 = InteractSource.ToString();
        FString local_60 = FString();
        return;
    }
}

class UInteractionBehaviorAction_AccountExclusiveCollectionPrefabCollect : UInteractionBehaviorActionBase
{
    UInteractionBehaviorAction_AccountExclusiveCollectionPrefabCollect()
    {
        super();
        return;
    }
    void TriggerAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_19 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        ::DropItemsUtils::TryTriggerDropItems(EDropTriggerType(1), InteractTarget, InteractSource);
        Get local_6;
        const FC_LevelObjectStatConfig& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.LevelObjectStatConfig.IsSet())
            {
                ::FLevelObjectStatUtils::RecordLevelObject(InteractSource, local_8.LevelObjectStatConfig);
                FFPTime local_14 = FFPTime(-1);
                SendEvent local_12;
                FCE_AccountExclusiveCollectionPrefabCollected_DataTracker& local_18 = local_12.opCall(local_14);
                if (local_18)
                {
                    local_18.CollectionPrefabEntity = InteractTarget;
                    local_18.InteractSourceEntity = InteractSource;
                    local_18.DataId = local_19;
                }
            }
        }
        FFPTime local_14_2 = FFPTime(-1);
        SendEvent local_24;
        FCE_AccountExclusiveCollectionPrefabCollected& local_26 = local_24.opCall(local_14_2);
        if (local_26)
        {
            local_26.CollectionPrefabEntity = InteractTarget;
        }
        return;
    }
}

