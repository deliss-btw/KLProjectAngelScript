
enum EAutoInteractResponseType
{
    None,
    TriggerBegin,
    TriggerSuccess,
    TriggerEnd,
}

enum EInteractCustomConditionType
{
    Success,
    Fail,
    FailAndShowContent,
}


struct FInteractProgressConfig
{
    UPROPERTY()
    float32 MaxProgressValue;
    UPROPERTY()
    float32 ProgressValuePerSecondPerPlayer;
    UPROPERTY()
    bool bKeepProgressWhenInterrupt = false;
    UPROPERTY()
    FGameAttributeRef SourceEntityProgressRatio;


    float32 GetMultiInteractorProgressScaler(const TArray<FECSEntity> &inout PlayerList, const FFPTime &inout Time) const
    {
        bool local_19;
        float32 local_20;
        float32 local_1 = 0.0f;
        if (this.SourceEntityProgressRatio.IsValid())
        {
            for (auto& local_18 : PlayerList)
            {
                local_19 = false;
                float32 local_2 = FGameAttributeUtils::TryGetAttributeValue(local_18, this.SourceEntityProgressRatio, Time, local_19);
                if (local_19)
                {
                    local_20 = local_2;
                }
                else
                {
                    local_20 = 1.0f;
                }
                local_1 = local_1 + local_20;
            }
        }
        else
        {
            local_1 = PlayerList.Num();
        }
        return local_1;
    }
}

struct FSecondaryInteractTargetConfig
{
    UPROPERTY()
    bool bCheckSecondaryInteractType = true;
    UPROPERTY()
    EInteractType SecondaryInteractType;
    UPROPERTY()
    bool bCheckSecondaryInteractSubType = true;
    UPROPERTY()
    EInteractionSubTypeForESM SecondaryInteractSubType;


}

UCLASS(Abstract)
class UInteractionBehaviorBase : UObject
{
    UPROPERTY()
    EInteractType InteractType = EInteractType(0);
    UPROPERTY()
    bool bOverrideInteractPointSubType = false;
    UPROPERTY()
    EInteractionSubTypeForESM OverrideSubType;
    UPROPERTY()
    bool bIsSecondaryInteractSource = false;
    UPROPERTY()
    bool bIsSecondaryInteractTarget = false;
    UPROPERTY()
    FSecondaryInteractTargetConfig SecondaryInteractTargetConfig;
    UPROPERTY()
    int Priority;
    UPROPERTY()
    EAutoInteractChannelType AutoInteractChannelType = EAutoInteractChannelType(0);
    UPROPERTY()
    EAutoInteractResponseType AutoInteractResponseType = EAutoInteractResponseType(0);
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> InputTriggerBegin = nullptr;
    UPROPERTY()
    TObjectPtr<UESMInputTriggerAsset> InputTriggerEnd = nullptr;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> HUDContentRow;
    UPROPERTY()
    int MaxInteractSourceCount = 1;
    UPROPERTY()
    bool bHasInteractProgress = false;
    UPROPERTY()
    FInteractProgressConfig InteractProgressConfig;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> InteractProgressContentRow;
    UPROPERTY()
    bool bShowInteractProgress = true;
    UPROPERTY()
    bool bTraceCheck;
    UPROPERTY()
    bool bTraceDynamic;
    UPROPERTY()
    float32 TraceStartUpwardRatio;
    UPROPERTY()
    bool bExtraTraceCheckFromCamera;
    UPROPERTY()
    bool bCanBeInteractedWhenInteracting = false;
    UPROPERTY()
    bool bOverrideInteractPointParam = false;
    UPROPERTY()
    FInteractPointParam OverrideInteractPointParam;
    UPROPERTY()
    FInteractionPointHUDIconSettings HUDIconSettings;
    UPROPERTY()
    TDataObjectPtr<FInteractTipPreset> InteractTipPreset;
    UPROPERTY()
    FESMBlackboardConditionAndArray InteractSourceCondition;
    UPROPERTY()
    FESMBlackboardConditionAndArray InteractTargetCondition;
    UPROPERTY()
    TArray<UInteractCustomCheckConditionBase> CustomCheckConditions;
    UPROPERTY()
    TArray<UInteractionBehaviorActionBase> InteractBeginActions;
    UPROPERTY()
    TArray<UInteractionBehaviorActionBase> InteractEndActions;
    UPROPERTY()
    TArray<UInteractionBehaviorActionBase> InteractSuccessActions;
    UPROPERTY()
    TArray<UInteractionStateActionBase> InteractionStateActions;
    UPROPERTY()
    TArray<UInteractionStatePresentationActionBase> InteractionStatePresentationActions;
    UPROPERTY()
    EEcosimAIV2EntityRelation NPCPostInteractRelation = EEcosimAIV2EntityRelation(0);
    UPROPERTY()
    FGameplayTagContainer NPCSuccessGameplayTags;


    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        return true;
    }
    void ExecuteBeginAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly)
    {
        for (auto local_16 : this.InteractBeginActions)
        {
            if (local_16 == nullptr)
            {
                XWarning(ELog(0), FString().Append("UInteractionBehavior: ").Append(this.GetPathName(nullptr)).Append(" InteractBeginActions has null action!"));
                continue;
            }
            if (!(bPresentationOnly) == !(local_16.bPresentationOnly))
            {
                local_16.TriggerAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
            }
        }
        return;
    }
    void ExecuteEndAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly)
    {
        for (auto local_16 : this.InteractEndActions)
        {
            if (local_16 == nullptr)
            {
                XWarning(ELog(0), FString().Append("UInteractionBehavior: ").Append(this.GetPathName(nullptr)).Append(" InteractEndActions has null action!"));
                continue;
            }
            if (!(bPresentationOnly) == !(local_16.bPresentationOnly))
            {
                local_16.TriggerAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
            }
        }
        return;
    }
    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        for (auto local_16 : this.InteractSuccessActions)
        {
            if (local_16 == nullptr)
            {
                XWarning(ELog(0), FString().Append("UInteractionBehavior: ").Append(this.GetPathName(nullptr)).Append(" InteractSuccessActions has null action!"));
                continue;
            }
            local_16.TriggerAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
    void BeginKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        for (auto local_16 : this.InteractionStateActions)
        {
            if (local_16 == nullptr)
            {
                XWarning(ELog(0), FString().Append("UInteractionBehavior: ").Append(this.GetPathName(nullptr)).Append(" InteractionStateActions has null action!"));
                continue;
            }
            local_16.OnActionBegin(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
    void EndKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        for (auto local_16 : this.InteractionStateActions)
        {
            if (local_16 == nullptr)
            {
                XWarning(ELog(0), FString().Append("UInteractionBehavior: ").Append(this.GetPathName(nullptr)).Append(" InteractionStateActions has null action!"));
                continue;
            }
            local_16.OnActionEnd(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
    void BeginKeepInteractPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        for (auto local_16 : this.InteractionStatePresentationActions)
        {
            if (local_16 == nullptr)
            {
                XWarning(ELog(0), FString().Append("UInteractionBehavior: ").Append(this.GetPathName(nullptr)).Append(" InteractionStateActions has null action!"));
                continue;
            }
            local_16.OnActionBeginPresentation(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
    void EndKeepInteractPresentation(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        for (auto local_16 : this.InteractionStatePresentationActions)
        {
            if (local_16 == nullptr)
            {
                XWarning(ELog(0), FString().Append("UInteractionBehavior: ").Append(this.GetPathName(nullptr)).Append(" InteractionStateActions has null action!"));
                continue;
            }
            local_16.OnActionEndPresentation(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        }
        return;
    }
    FText GetHUDContent(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const int ShowFailConditionIndex, const bool bShowFailFromSource = false) const
    {
        FText __return;
        FText local_12;
        if (ShowFailConditionIndex >= 0)
        {
            if (bShowFailFromSource)
            {
                Get local_6;
                const FC_InteractSourceConfig& local_8 = local_6.opCall();
                if (local_8)
                {
                    return ::GetCustomCheckFailHUDContent(local_8.InteractSourceCustomCheckConditions, ShowFailConditionIndex);
                }
            }
            else
            {
                local_12 = ::GetCustomCheckFailHUDContent(this.CustomCheckConditions, ShowFailConditionIndex);
                __return = local_12;
            }
        }
        else
        {
            if (this.HUDContentRow.IsSet())
            {
            }
            else
            {
            }
        }
        return local_12;
    }
    bool HasPresentationOnlyBeginActions() const
    {
        for (auto local_16 : this.InteractBeginActions)
        {
            if ((local_16 != nullptr && local_16.bPresentationOnly))
            {
                return true;
            }
        }
        return false;
    }
    bool HasPresentationOnlyEndActions() const
    {
        for (auto local_16 : this.InteractEndActions)
        {
            if ((local_16 != nullptr && local_16.bPresentationOnly))
            {
                return true;
            }
        }
        return false;
    }
    EInteractCustomConditionType CheckCustomCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting, int &out ShowFailConditionIndex, bool &out bShowFailFromSource) const
    {
        ShowFailConditionIndex = 0;
        bShowFailFromSource = false;
        ShowFailConditionIndex = -1;
        bShowFailFromSource = false;
        Get local_8;
        const FC_InteractSourceConfig& local_10 = local_8.opCall();
        if (local_10)
        {
            EInteractCustomConditionType local_12 = ::AccumulateInteractCustomCheckConditions(local_10.InteractSourceCustomCheckConditions, true, InteractSource, InteractTarget, InteractionPoint, bIsCheckingDuringInteracting, ShowFailConditionIndex, bShowFailFromSource);
            if (int(local_12) == 1)
            {
                return local_12;
            }
        }
        EInteractCustomConditionType local_11 = ::AccumulateInteractCustomCheckConditions(this.CustomCheckConditions, false, InteractSource, InteractTarget, InteractionPoint, bIsCheckingDuringInteracting, ShowFailConditionIndex, bShowFailFromSource);
        if ((int(local_11)) == 1)
        {
            return local_11;
        }
        if (ShowFailConditionIndex != -1)
        {
            return EInteractCustomConditionType(2);
        }
        return EInteractCustomConditionType(0);
    }
    FText GetInteractProgressContent() const
    {
        FText __return;
        if (this.InteractProgressContentRow.IsSet())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_SplineMove : UInteractionBehaviorBase
{
    default InteractType = EInteractType(1);

    UInteractionBehavior_SplineMove()
    {
        super();
        return;
    }
    void BeginKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_6 = 0;
        int local_28 = 0;
        Super::BeginKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        FVector local_12;
        FQuat local_20;
        FECSWorldPtr local_22 = InteractSource.GetWorld();
        FFPTime local_32 = FTransformUtils::GetPlayerRollbackTime(InteractSource, local_28);
        if (::FInteractUtils::GetInteractTargetLocationAndRotation(InteractTarget, InteractTargetPointAndBehaviorIndex.GetPointIndex(), local_32, local_12, local_20, false))
        {
            local_6.SetTargetLocation(local_12);
            local_6.SetSplineEntity(InteractTarget);
        }
        return;
    }
    void EndKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::EndKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        Remove local_4;
        local_4.opCall();
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_HookMove : UInteractionBehaviorBase
{
    default InteractType = EInteractType(2);

    UInteractionBehavior_HookMove()
    {
        super();
        return;
    }
    void BeginKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_24 = 0;
        int local_38 = 0;
        Super::BeginKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        FVector local_6;
        FQuat local_16;
        FECSWorldPtr local_18 = InteractSource.GetWorld();
        FFPTime local_28 = FTransformUtils::GetPlayerRollbackTime(InteractSource, local_24);
        if (::FInteractUtils::GetInteractTargetLocationAndRotation(InteractTarget, InteractTargetPointAndBehaviorIndex.GetPointIndex(), local_28, local_6, local_16, false))
        {
            local_38.Reset(InteractTarget, local_6);
            Get local_48;
            FVector3f local_67 = FVector3f((FVector(local_38.GetTargetLocation()) - FVector(local_48.opCall().GetPosition())));
            local_38.SetDistanceToTarget(local_67.Size2D());
            local_38.SetInitDistanceToTarget(local_38.GetDistanceToTarget());
            Get local_72;
            const FC_HookMoveConfig& local_74 = local_72.opCall();
            if (local_74)
            {
                local_38.SetMoveSpeed(local_74.MoveSpeed);
                if (local_74.TargetRangeConfigs.Num() > 0)
                {
                    FVector3f local_51 = local_67.GetSafeNormal2D(1e-8f, FVector3f::ZeroVector);
                    float32 local_79 = -2.0f;
                    for (auto& local_94 : local_74.TargetRangeConfigs)
                    {
                        float32 local_68_2 = local_51.DotProduct(local_94.GetOffset().GetSafeNormal2D(1e-8f, FVector3f::ZeroVector));
                        if (local_68_2 > local_79)
                        {
                            local_79 = local_68_2;
                            local_38.SetTargetRangeConfig(local_94);
                            local_38.SetbUseDefaultTarget(false);
                        }
                    }
                }
            }
        }
        return;
    }
    void EndKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::EndKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        Get local_4;
        const FC_RuntimeHookMoveTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            if (FFPTime(local_6.GetTotalMoveTime()).opCmp(0.0) < 0)
            {
                Remove local_18;
                local_18.opCall();
            }
        }
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_Collect : UInteractionBehaviorBase
{
    UPROPERTY()
    bool bDestroyTargetAfterInteract = true;
    UPROPERTY()
    float32 RewardPopupDelaySeconds = 0.0f;

    default InteractType = EInteractType(4);


    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_47 = 0;
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        bool local_1_2 = false;
        int local_2 = local_1_2;
        Get local_6;
        const FC_DropGroundBagInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.GetGroundBagConfig())
            {
                local_2 = local_1_2;
            }
        }
        FInventoryAddItemCollectScope local_10 = FInventoryAddItemCollectScope((local_2 != 0));
        Get local_14;
        const FC_CollectItem& local_16 = local_14.opCall();
        if (local_16)
        {
            bool local_17;
            local_17 = true;
            int local_18 = 0;
            for (; local_18 < local_16.GetItems().Num(); ++local_18)
            {
                const TDataObjectPtr<FItemConfig>& local_22 = local_16.GetItems()[local_18];
                if (::InventoryUtils::GetCanAddToInventoryItemNum(InteractSource, local_22) < int(local_16.GetNums()[local_18]))
                {
                    ::InventoryUtils::ShowInventoryLimitReachedMessage(InteractSource, local_22);
                    local_17 = false;
                    break;
                }
            }
            if (local_17)
            {
                local_18 = 0;
                for (; local_18 < local_16.GetItems().Num(); ++local_18)
                {
                    const TDataObjectPtr<FItemConfig>& local_22_2 = local_16.GetItems()[local_18];
                    int local_24 = local_16.GetNums()[local_18];
                    if (::InventoryUtils::AddInventoryItem(InteractSource, local_22_2, int(local_24)) == 0)
                    {
                        ::InventoryUtils::SyncInventoryInfoToAudioVo(InteractSource, InteractTarget, local_22_2, int(local_24));
                    }
                }
            }
            else
            {
                return;
            }
        }
        Modify local_30;
        FC_TreasureTracker& local_32 = local_30.opCall();
        if (local_32)
        {
            bool local_1_3 = true;
            local_32.bCollected = local_1_3;
            FFPTime local_38 = FFPTime(-1);
            SendEvent local_36;
            FCE_AccountExclusiveTreasureBoxCollected_DataTracker& local_40 = local_36.opCall(local_38);
            if (local_40)
            {
                local_40.TreasureBoxEntity = local_32.TreasureBoxEntity;
                local_40.InteractSourceEntity = InteractSource;
                if (local_32.TreasureBoxEntity.IsValid())
                {
                    Get local_44;
                    const FC_LevelObjectStatConfig& local_46 = local_44.opCall();
                    if (local_46)
                    {
                        if (local_46.LevelObjectStatConfig.IsSet())
                        {
                            local_40.DataId = local_47;
                        }
                    }
                }
            }
        }
        ::DropItemsUtils::TryTriggerDropItems(EDropTriggerType(1), InteractTarget, InteractSource);
        if (local_10.ShouldFlush())
        {
            ::DropItemsUtils::FlushRewardPopup(local_10.GetRecords(), this.RewardPopupDelaySeconds);
        }
        ModifyOrAdd local_58;
        FC_CollectionPrefabPresentationState& local_60 = local_58.opCall();
        if (local_60)
        {
            local_60.SetState(ECollectionPrefabPresentationState(2));
        }
        Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        ::DropItemsUtils::ServerDataTrackTreasureCollect(InteractSource, InteractTarget);
        if (this.bDestroyTargetAfterInteract)
        {
            InteractTarget.DestroyDeferred();
        }
        return;
    }
    FText GetHUDContent(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const int ShowFailConditionIndex, const bool bShowFailFromSource = false) const
    {
        int local_16 = 0;
        FText __return;
        FText local_8 = Super::GetHUDContent(SourceEntity, TargetEntity, ShowFailConditionIndex, bShowFailFromSource);
        if (ShowFailConditionIndex < 0)
        {
            if (local_16 && (local_16.GetItems().Num() == 1))
            {
                if (local_16.GetItems()[0].IsSet())
                {
                    FString local_22 = local_8.ToString();
                    FString local_26 = (local_22 + " ");
                    return FText::FromString(local_22);
                }
            }
            else
            {
                __return = FText::FromString(((local_8.ToString() + " ") + ::FASCommonUtils::GetPropConfigData(TargetEntity).DisplayName));
            }
        }
        return local_8;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_TestThreeChooseOne : UInteractionBehaviorBase
{
    default InteractType = EInteractType(18);

    UInteractionBehavior_TestThreeChooseOne()
    {
        super();
        return;
    }
    void ExecuteBeginAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly = false)
    {
        Super::ExecuteBeginAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex, bPresentationOnly);
        return;
    }
    FText GetHUDContent(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const int ShowFailConditionIndex, const bool bShowFailFromSource = false) const
    {
        int local_16 = 0;
        FText __return;
        FText local_8 = Super::GetHUDContent(SourceEntity, TargetEntity, ShowFailConditionIndex, bShowFailFromSource);
        if (ShowFailConditionIndex < 0)
        {
            if (local_16 && (local_16.GetItems().Num() == 1))
            {
                if (local_16.GetItems()[0].IsSet())
                {
                    FString local_22 = local_8.ToString();
                    FString local_26 = (local_22 + " ");
                    return FText::FromString(local_22);
                }
            }
            else
            {
                __return = FText::FromString(((local_8.ToString() + " ") + ::FASCommonUtils::GetPropConfigData(TargetEntity).DisplayName));
            }
        }
        return local_8;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_EcoCollectable : UInteractionBehavior_Collect
{
    UInteractionBehavior_EcoCollectable()
    {
        super();
        return;
    }
    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_2 = 0;
        int local_12 = 0;
        int local_66 = 0;
        int local_104 = 0;
        Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        if (!(local_12))
        {
            return;
        }
        FECSEntity local_16;
        if (!(local_12.GetStatic2DynamicEntityIdMap().Contains(InteractTarget.GetId())))
        {
            FC_EcoCollectableSyncedRuntime& local_46;
            FC_EcoCollectableConfig local_20;
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            if (!(local_2.IsValid()) || !(local_20) || !(local_6_2.IsValid()))
            {
                return;
            }
            if (FEcoCollectableUtils::IsEntityInStaticRegistry(local_2))
            {
                local_16 = FECSEntity(FEcoCollectableUtils::CreateVirtualEntityInDefaultRegistry(local_6_2, local_2.GetEntityName()));
            }
            else
            {
                return;
            }
            local_46.SetbReadyForCollect(false);
            if (!(local_16) || !(local_46))
            {
                return;
            }
            local_46.SetStaticEntityId(local_2.GetId());
            FC_NetRelevancePolicy local_51;
            Assign local_50;
            if (local_50.opCall(local_51))
            {
            }
        }
        else
        {
            local_16 = FECSEntity(local_12.GetStatic2DynamicEntityIdMap()[InteractTarget.GetId()]);
        }
        if (local_16.IsValid())
        {
            FC_EcoCollectableSyncedRuntime& local_46;
            FC_EcoCollectableConfig local_20;
            Modify local_60;
            local_46 = local_60.opCall();
            if (local_46)
            {
                local_46.SetbReadyForCollect(false);
                FECSWorldPtr::Get<FCS_FixedTime> local_64 = FECSWorldPtr::Get<FCS_FixedTime>(InteractTarget.GetWorld());
                if (!(!(local_20)) && local_66)
                {
                    local_46.SetRecoverCDTargetTime(FFPTime((local_66.Time.ToSeconds() + local_20.CollectedRecoverTimeSeconds)));
                }
                Get local_78;
                const FC_DropEnergyBallSource& local_80 = local_78.opCall();
                if (local_80)
                {
                    float32 local_81;
                    local_81 = local_80.DetectRadius;
                    for (auto& local_96 : local_80.DeathEnergyBallDrops)
                    {
                        ::EnergyBallUtils::SpawnEnergyBallInSphere(local_2, local_96.Prefab, local_66.Time, local_81, int(local_96.Number), EEnergyBallSpawnDirection(0));
                    }
                }
                if (local_104)
                {
                    FFPTime local_74 = FFPTime(-1);
                    SendEvent local_108;
                    FCE_PropAddBuffToPlayerEvent& local_110 = local_108.opCall(local_74);
                    if (local_110)
                    {
                        local_110.TriggerPlayer = InteractSource;
                        local_110.BuffConfigSourceEntity = local_2;
                        local_110.bIncludeDefault = true;
                        for (auto& local_124 : local_104.TagNameToBuffConfigList)
                        {
                            local_110.BuffTagNames.Add(local_124.TagName);
                        }
                    }
                }
                if (local_20 && !(local_20.CollectedSFXConfigs.IsEmpty()))
                {
                    bool local_126;
                    local_126 = false;
                    for (auto& local_140 : local_20.CollectedSFXConfigs)
                    {
                        if (local_140.Event.IsNull())
                        {
                            XError(ELog(30), FString().Append("EcoCollectable [").Append(local_2.GetId()).Append("] CollectedSFXConfigs has null Event"));
                            continue;
                        }
                        local_126 = true;
                    }
                    if (local_126)
                    {
                        FFPTime local_74_2 = FFPTime(-1);
                        SendEvent local_150;
                        FCE_EcoCollectSFX& local_152 = local_150.opCall(local_74_2);
                        if (local_152)
                        {
                            local_152.CollectableEntity = local_2;
                            local_152.Collector = InteractSource;
                        }
                    }
                }
                FFPTime local_74_3 = FFPTime(-1);
                SendEvent local_156;
                FCE_EcoCollectableCollected_DataTracker& local_158 = local_156.opCall(local_74_3);
                if (local_158)
                {
                    local_158.EcoCollectableEntity = local_2;
                    local_158.InteractSourceEntity = InteractSource;
                    Get local_162;
                    const FC_EcoCollectableLayoutInfo& local_164 = local_162.opCall();
                    if (local_164)
                    {
                        local_158.SpawnerEntity = FECSEntity(local_164.CachedSpawnerEntityId);
                        local_158.CreatureDef = local_164.LayoutInfo.CreatureDef;
                        local_158.ResourcePointIndex = local_164.LayoutInfo.ResourcePointIndex;
                    }
                }
            }
        }
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_Custom : UInteractionBehaviorBase
{
    default InteractType = EInteractType(18);

    UInteractionBehavior_Custom()
    {
        super();
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_TeammateRescueLieDown : UInteractionBehavior_Custom
{
    UPROPERTY()
    bool bRescueWithAnimation = true;

    default InteractType = EInteractType(18);


    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        FFPTime local_10 = FFPTime(FECSWorldPtr::Get<FCS_FixedTime>(ECS::GetECSWorld()).opCall().Time);
        FFPTime local_18 = FFPTime(-1);
        FCE_RescueNearDeathEvent local_12;
        local_12.RescueByEntity = InteractSource;
        local_12.bRescueWithAnimation = this.bRescueWithAnimation;
        Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        return;
    }
    void BeginKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_4 = 0;
        int local_12 = 0;
        Super::BeginKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        local_4.SetRescuedByEntity(InteractSource.GetId());
        local_12.SetRescuedTarget(InteractTarget.GetId());
        return;
    }
    void EndKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Remove local_10;
            local_10.opCall();
        }
        Has local_14;
        bool local_1_2 = local_14.opCall();
        if (local_1_2)
        {
            Remove local_18;
            local_18.opCall();
        }
        Super::EndKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_TeammateRescueFromExecution : UInteractionBehaviorBase
{
    default InteractType = EInteractType(6);

    UInteractionBehavior_TeammateRescueFromExecution()
    {
        super();
        return;
    }
    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_24 = 0;
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FNameHandle_EntityBBVarEntity local_12;
            local_12;
            if ((!((InteractTarget.GetBB_Entity(local_12) == ENTITY_NULL))))
            {
                FFPTime local_22 = FFPTime(-1);
                local_24.RescuedByEntity = InteractSource;
                ::CommissionStatsUtils::AddCatchRescueCount(InteractSource);
            }
        }
        Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        return;
    }
    void BeginKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        int local_8 = 0;
        Super::BeginKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_8.SetRescuer(InteractSource);
            Get local_16;
            local_8.SetRescuerLocation(local_16.opCall().GetPosition());
        }
        return;
    }
    void EndKeepInteract(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::EndKeepInteract(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_Execute : UInteractionBehaviorBase
{
    default InteractType = EInteractType(7);

    UInteractionBehavior_Execute()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        bool local_2 = Super::CheckBehaviorConditions(InteractSource, InteractTarget);
        Get local_6;
        const FC_ExecutedInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            local_2 = local_2 && ((int(local_8.GetExecutionState())) == 1 || (int(local_8.GetExecutionState()) == 2));
            Get local_16;
            const FC_ExecutedConfig& local_18 = local_16.opCall();
            if (local_18)
            {
                local_2 = local_2 && local_8.CheckCanAddNotExceedConfigMax(InteractSource, local_18);
            }
        }
        else
        {
            local_2 = false;
        }
        return local_2;
    }
    void ExecuteBeginAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly = false)
    {
        int local_12 = 0;
        Super::ExecuteBeginAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex, bPresentationOnly);
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FFPTime local_8 = FFPTime(-1);
            local_12.ExecuteTarget = InteractTarget;
        }
        Get local_16;
        int local_17 = int(local_16.opCall().GetExecutedPreType());
        Modify local_22;
        local_22.opCall().SetExecutePreType();
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_RideAsPassenger : UInteractionBehaviorBase
{
    UPROPERTY()
    int SeatIndex = -1;

    default InteractType = EInteractType(9);


    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        Get local_4;
        if (local_4.opCall())
        {
            return false;
        }
        if (this.SeatIndex > 0)
        {
            GetDefaulted local_14;
            if (!(local_14.opCall().IsSeatAvailable(this.SeatIndex)))
            {
                return false;
            }
        }
        else
        {
            GetDefaulted local_14;
            if (local_14.opCall().GetAvailableSeatIndex(false) == -1)
            {
                return false;
            }
        }
        return Super::CheckBehaviorConditions(InteractSource, InteractTarget);
    }
}

UCLASS(Abstract)
class UInteractionBehavior_DrivePublicMount : UInteractionBehaviorBase
{
    default InteractType = EInteractType(10);

    UInteractionBehavior_DrivePublicMount()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        Get local_4;
        if (local_4.opCall())
        {
            return false;
        }
        Has local_12;
        if (local_12.opCall())
        {
            return false;
        }
        return Super::CheckBehaviorConditions(InteractSource, InteractTarget);
    }
}

UCLASS(Abstract)
class UInteractionBehavior_TeamFlagLink : UInteractionBehaviorBase
{
    FText TeamLeaderText = NSLOCTEXT("TeamFlag", "TeamLeader", "йџй•ї");

    default InteractType = EInteractType(11);

    UInteractionBehavior_TeamFlagLink()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        GetDefaulted local_4;
        FECSEntity local_12 = local_4.opCall().GetOwnerEntity();
        FECSEntity local_8 = local_12;
        if (!(local_8.IsValid()) == !(false))
        {
            return false;
        }
        FECSEntity local_12_2 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        if ((local_12_2 == local_8))
        {
            return false;
        }
        if (::FSocialTeamUtils::GetSocialTeamId(local_12_2) > 0 && (::FSocialTeamUtils::GetSocialTeamId(local_8) > 0))
        {
            return false;
        }
        return Super::CheckBehaviorConditions(InteractSource, InteractTarget);
    }
    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        Get local_8;
        FECSEntity local_4 = FECSEntity(local_8.opCall().GetOwnerEntity());
        if (local_4.IsValid())
        {
            FECSEntity local_12 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
            if (local_12.IsValid())
            {
                FNameHandle_EntityBBVarInt local_24;
                ::FSocialTeamUtils::JoinSocialTeam(local_4, local_12);
                local_24;
                if (local_12.GetBB_Int(local_24) > 0)
                {
                    Get local_30;
                    const FC_SpawnEntityRecord& local_32 = local_30.opCall();
                    if (local_32)
                    {
                        for (auto& local_46 : local_32.GetEntities())
                        {
                            if ((FString(::GetPropConfig(local_46).GetDataName()) == "TeamFlag"))
                            {
                                local_46.DestroyDeferred();
                                local_24;
                                int local_25 = local_12.GetBB_Int(local_24) - 1;
                                local_24;
                                local_12.SetBB_Int(local_24, n"iTeamFlag");
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    FText GetHUDContent(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const int ShowFailConditionIndex, const bool bShowFailFromSource = false) const
    {
        FText local_8 = Super::GetHUDContent(SourceEntity, TargetEntity, ShowFailConditionIndex, bShowFailFromSource);
        GetDefaulted local_12;
        FECSEntity local_16 = FECSEntity(local_12.opCall().GetOwnerEntity());
        Has local_26;
        bool local_27 = local_26.opCall();
        Get local_32;
        int local_21 = local_27 ? local_32.opCall().GetSocialTeamSize() : 1;
        if (!(local_16.IsValid()))
        {
            local_27 = false;
        }
        else
        {
            local_27 = local_26.opCall();
        }
        if (local_27)
        {
            FString local_42 = (local_8.ToString() + " [");
            FString local_42_2 = ((local_42 + local_21) + "/4]  ");
            FString local_38_2 = (local_42_2 + this.TeamLeaderText);
            FString local_42_3 = (local_38_2 + "пјљ");
            local_8 = FText::FromString((local_42_3 + local_32.opCall().GetNickName()));
        }
        return local_8;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_RecycleTeamFlag : UInteractionBehaviorBase
{
    default InteractType = EInteractType(12);

    UInteractionBehavior_RecycleTeamFlag()
    {
        super();
        return;
    }
    bool CheckBehaviorConditions(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget) const
    {
        FECSEntity local_4 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        Get local_12;
        FECSEntity local_16 = FECSEntity(local_12.opCall().GetOwnerEntity());
        if (local_16.IsValid() == false)
        {
            return false;
        }
        if ((local_4 == local_16))
        {
            return Super::CheckBehaviorConditions(InteractSource, InteractTarget);
        }
        return false;
    }
    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return;
        }
        FECSEntity local_6 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        if (InteractTarget.IsValid())
        {
            FNameHandle_EntityBBVarInt local_16;
            local_16;
            int local_12 = local_6.GetBB_Int(local_16) - 1;
            local_16;
            local_6.SetBB_Int(local_16, n"iTeamFlag");
            InteractTarget.DestroyDeferred();
        }
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_Dialogue : UInteractionBehaviorBase
{
    default InteractType = EInteractType(14);

    UInteractionBehavior_Dialogue()
    {
        super();
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_ControlCreature : UInteractionBehaviorBase
{
    UPROPERTY()
    FDefaultAvatarData CreaturePrefab;
    UPROPERTY()
    FSpawnFakeCharacterExtractData ExtraData;

    default InteractType = EInteractType(13);

    UInteractionBehavior_ControlCreature()
    {
        super();
        return;
    }
    void OnInteractSuccess(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
    {
        Super::OnInteractSuccess(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex);
        ::FFakeCharacterUtils::SpawnFakeCharacterAndControl(InteractSource, this.CreaturePrefab, this.ExtraData);
        return;
    }
}

UCLASS(Abstract)
class UInteractionBehavior_SocialViewPage : UInteractionBehaviorBase
{
    default InteractType = EInteractType(16);

    UInteractionBehavior_SocialViewPage()
    {
        super();
        return;
    }
    void ExecuteBeginAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly = false)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FCE_SelectSocialViewPageInteraction local_12;
            FFPTime local_8 = FFPTime(-1);
            local_12.InteractTarget = InteractTarget;
            local_12.bInInteract = true;
            TDataObjectPtr<FLevelInfoConfig> local_36 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
            if (local_36)
            {
                if (int(local_36.opArrow().LevelType) == 2)
                {
                    local_12.OpenType = ESocialViewPageOpenType(2);
                }
                else
                {
                    if (int(local_36.opArrow().LevelType) == 1)
                    {
                        local_12.OpenType = ESocialViewPageOpenType(1);
                    }
                    else
                    {
                        if (int(local_36.opArrow().LevelType) == 3 || (int(local_36.opArrow().LevelType) == 5))
                        {
                            local_12.OpenType = ESocialViewPageOpenType(3);
                        }
                    }
                }
            }
            else
            {
                local_12.OpenType = ESocialViewPageOpenType(2);
            }
        }
        Super::ExecuteBeginAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex, bPresentationOnly);
        return;
    }
    void ExecuteEndAction(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bPresentationOnly = false)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FCE_SelectSocialViewPageInteraction local_12;
            FFPTime local_8 = FFPTime(-1);
            local_12.InteractTarget = InteractTarget;
            local_12.bInInteract = false;
            local_12.OpenType = ESocialViewPageOpenType(0);
        }
        Super::ExecuteEndAction(InteractSource, InteractTarget, InteractTargetPointAndBehaviorIndex, bPresentationOnly);
        return;
    }
}

EInteractCustomConditionType AccumulateInteractCustomCheckConditions(const TArray<UInteractCustomCheckConditionBase> &inout CheckConditions, const bool bConditionsFromSource, const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting, int &inout ShowFailConditionIndex, bool &inout bShowFailFromSource)
{
    UInteractCustomCheckConditionBase local_6;
    int local_1 = 0;
    for (; local_1 < CheckConditions.Num(); ++local_1)
    {
        local_6 = CheckConditions[local_1];
        if (local_6 == nullptr || local_6.CheckCondition(InteractSource, InteractTarget, InteractionPoint, bIsCheckingDuringInteracting))
        {
            continue;
        }
        if (local_6.bShowCheckFailContent)
        {
            if (ShowFailConditionIndex == -1)
            {
                ShowFailConditionIndex = local_1;
                bShowFailFromSource = bConditionsFromSource;
            }
        }
        else
        {
            return EInteractCustomConditionType(1);
        }
    }
    return EInteractCustomConditionType(0);
}
FText GetCustomCheckFailHUDContent(const TArray<UInteractCustomCheckConditionBase> &inout CheckConditions, const int ShowFailConditionIndex)
{
    UInteractCustomCheckConditionBase local_6;
    if (ShowFailConditionIndex >= 0 && (ShowFailConditionIndex < CheckConditions.Num()))
    {
        if (local_6 != nullptr)
        {
            if (local_6.CheckFailContentTextData)
            {
            }
            else
            {
            }
        }
    }
    return FText();
}
