
enum EItemNumberComparison
{
    GreaterThan,
    GreaterThanOrEqual,
    LessThan,
    LessThanOrEqual,
    Equals,
    NotEqual,
}

enum EInteractEntityTypeCheck
{
    Player,
    NPC,
    Monster,
}


UCLASS(Abstract)
class UInteractCustomCheckConditionBase : UObject
{
    UPROPERTY()
    bool bShowCheckFailContent = false;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> CheckFailContentTextData;


    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        return true;
    }
}

class UInteractCustomCheckCondition_CheckInventoryItemNumber : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    FItemTableRowRef Item;
    UPROPERTY()
    EItemNumberComparison Comparison = EItemNumberComparison(0);
    UPROPERTY()
    int ItemNumber = 0;


    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
}

class UInteractCustomCheckCondition_CheckInventoryItemSpaceForCollect : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckInventoryItemSpaceForCollect()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        TArrayConstIterator<FDropItemData> local_84;
        Get local_4;
        const FC_DropItemConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            TArray<TDataObjectPtr<FDropItemConfigBase>> local_12;
            for (auto& local_26 : local_6.DropItems)
            {
                if (int(local_26.TriggerType) == 1)
                {
                    local_12.Add(TDataObjectPtr<FDropItemConfigBase>());
                }
            }
            TArray<TDataObjectPtr<FDropItemConfig>> local_58;
            ::DropItemsUtils::CollectDropItemConfigs(local_12, local_58);
            if (local_58.IsEmpty())
            {
                return true;
            }
            for (auto& local_72 : local_58)
            {
                if (!(local_72))
                {
                    XError(ELog(46), FString().Append("Interact target ").Append(InteractTarget).Append(" contains null drop item config."));
                    continue;
                }
                for (; local_84.CanProceed;)
                {
                    const FDropItemData& local_92 = local_84.Proceed();
                    TArray<FDropItemPackage> local_96;
                    ::DropItemsUtils::FillDropItemPackages(local_92, local_96);
                    for (auto& local_110 : local_96)
                    {
                        if (::InventoryUtils::GetCanAddToInventoryItemNum(InteractSource, local_110.Item) > 0)
                        {
                            return true;
                        }
                    }
                }
            }
            return false;
        }
        return true;
    }
}

class UInteractCustomCheckCondition_CheckTargetInteractionBlocked : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckTargetInteractionBlocked()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        int local_6 = 0;
        if (local_6 && local_6.GetbBlocked())
        {
            return false;
        }
        return true;
    }
}

class UInteractCustomCheckCondition_CheckEcoCollectableReadyForCollect : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckEcoCollectableReadyForCollect()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        bool local_17;
        bool local_18;
        bool local_23;
        FECSEntity local_10 = FECSEntity(::EcoCollectableUtils::GetCurrespondingDynamicEntityIdOfStatic(InteractTarget.GetId()));
        EEcoCollectableNonSyncedVisibilityStatus local_11 = EEcoCollectableNonSyncedVisibilityStatus(0);
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            local_18 = false;
        }
        else
        {
            Has local_16;
            local_18 = local_16.opCall();
        }
        if (local_18)
        {
            local_17 = true;
        }
        else
        {
            local_23 = ECS::GetRuntimeInfo().IsClient;
            if (!(local_23))
            {
                local_23 = false;
            }
            else
            {
                Has local_22;
                local_23 = local_22.opCall();
            }
            local_17 = local_23;
        }
        if (local_17)
        {
            Get local_34;
            XError(ELog(30), FString().Append("Interact target ").Append(InteractTarget).Append(" has layout info error. Always allow collect. Check layout info in editor."));
            if (local_10.IsValid())
            {
                const FC_EcoCollectableSyncedRuntime& local_36 = local_34.opCall();
                if (local_36)
                {
                    return local_36.GetbReadyForCollect();
                }
            }
            return true;
        }
        bool local_37 = false;
        local_23 = ECS::GetRuntimeInfo().IsClient;
        if (local_23)
        {
            FC_EcoCollectableNonSyncedVisualStatus local_44;
            if (!(local_44))
            {
                local_23 = false;
            }
            else
            {
                local_23 = local_44.bVisibilityStatusCacheValid;
            }
            if (local_23)
            {
                local_11 = local_44.VisibilityStatus;
                local_37 = true;
            }
        }
        if (!(local_37))
        {
            local_37 = ::EcoCollectableUtils::CalculateVisibilityState(InteractTarget, local_11);
        }
        if (local_37)
        {
            Get local_34;
            if (local_10.IsValid())
            {
                const FC_EcoCollectableSyncedRuntime& local_36_2 = local_34.opCall();
                if (local_36_2)
                {
                    return local_36_2.GetbReadyForCollect() && (int(local_11) == 0);
                }
            }
            else
            {
                return (int(local_11) == 0);
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckSecondarySourcePointName : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    FName SecondarySourcePointName;

    UInteractCustomCheckCondition_CheckSecondarySourcePointName()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Get local_4;
        const FC_InteractionInfoForESM& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12;
            if (local_6.GetbIsSecondaryInteractSource())
            {
                local_12 = local_6.GetTargetEntity();
            }
            else
            {
                local_12 = ENTITY_NULL;
            }
            if (local_12.IsValid())
            {
                Get local_20;
                const FC_InteractionTargetConfig& local_22 = local_20.opCall();
                if (local_22)
                {
                    FName local_28 = local_22.InteractionPoints[local_6.GetTargetPointAndBehaviorIndex().GetPointIndex()].IdentifierPointName;
                    return (local_28 == this.SecondarySourcePointName);
                }
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_BlackboardConditionAndArray : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    FESMBlackboardConditionAndArray BlackboardConditionAndArray;
    UPROPERTY()
    bool bCheckSourceEntity = true;


    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        if (!(bIsCheckingDuringInteracting))
        {
            if (this.bCheckSourceEntity)
            {
                return this.EvaluateBBCondition(InteractSource);
            }
            return this.EvaluateBBCondition(InteractTarget);
        }
        return (Super::CheckCondition(InteractSource, InteractTarget, InteractionPoint, bIsCheckingDuringInteracting));
    }
    bool EvaluateBBCondition(const FECSEntity &inout Entity) const
    {
        bool local_1;
        if (!(Entity.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            return this.BlackboardConditionAndArray.Evaluate(Entity);
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckPageOpenState : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    bool bPageOpenState;

    UInteractCustomCheckCondition_CheckPageOpenState()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        int local_6 = 0;
        bool local_7 = false;
        if (local_6)
        {
            if (!((::FASCommonUtils::GetLocalPlayerController() != nullptr)))
            {
                return false;
            }
            local_7 = local_6.OpenedPage.IsLayoutLayerWidget();
        }
        bool local_8 = (!(this.bPageOpenState) == !(local_7));
        return local_8;
    }
}

class UInteractCustomCheckCondition_CheckSystemOpen : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    UFrontendSystemConfig System;
    UPROPERTY()
    bool bSystemOpen;

    UInteractCustomCheckCondition_CheckSystemOpen()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        return ::FrontendSystemUtil::IsSystemOpen(InteractSource, this.System);
    }
}

class UInteractCustomCheckCondition_CheckMainPlayer : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    bool bCheckInteractSource = true;
    UPROPERTY()
    bool bWantMainPlayer = true;


    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        FECSEntity local_6;
        if (this.bCheckInteractSource)
        {
            local_6 = InteractSource;
        }
        else
        {
            local_6 = InteractTarget;
        }
        if (local_6.IsValid())
        {
            bool local_11;
            bool local_1 = false;
            local_11 = local_1;
            if (::GetAvatarConfig(local_6))
            {
                local_11 = local_1;
            }
            local_1 = !(this.bWantMainPlayer);
            local_1 = (local_1 == !(local_11));
            return local_1;
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckFaction : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    uint8 EnableFactionRelation = (7 != 0);


    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        if (!(this.CheckFactionRelation(InteractSource, InteractTarget)))
        {
            return false;
        }
        Get local_6;
        const FC_MountIsDrivenBy& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.GetDriverEntity().IsValid() && !(this.CheckFactionRelation(InteractSource, local_8.GetDriverEntity())))
            {
                return false;
            }
        }
        Get local_14;
        const FC_ChainParentInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            FECSEntity local_20 = FECSEntity(local_16.GetParent());
            if (local_20.IsValid())
            {
                if (!(this.CheckFactionRelation(InteractSource, local_20)))
                {
                    return false;
                }
                const FC_MountIsDrivenBy& local_8_2 = local_6.opCall();
                if (local_8_2)
                {
                    if (local_8_2.GetDriverEntity().IsValid() && !(this.CheckFactionRelation(InteractSource, local_8_2.GetDriverEntity())))
                    {
                        return false;
                    }
                }
            }
        }
        Get local_24;
        const FC_ChainChildrenInfo& local_26 = local_24.opCall();
        if (local_26)
        {
            for (auto& local_40 : local_26.GetChildren())
            {
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                if (!(this.CheckFactionRelation(InteractSource, local_40)))
                {
                    return false;
                }
                const FC_MountIsDrivenBy& local_8_3 = local_6.opCall();
                if (local_8_3)
                {
                    if (local_8_3.GetDriverEntity().IsValid() && !(this.CheckFactionRelation(InteractSource, local_8_3.GetDriverEntity())))
                    {
                        return false;
                    }
                }
            }
        }
        return true;
    }
    bool CheckFactionRelation(const FECSEntity &inout Source, const FECSEntity &inout Target) const
    {
        EFactionRelation local_2 = ::FASCommonUtils::GetEntityFactionRelation(Source, Target);
        int local_3 = int(local_2);
        int local_7 = this.EnableFactionRelation & local_3;
        return (local_7 != 0);
    }
}

class UInteractCustomCheckCondition_CheckSocialTeam : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    bool bCheckInteractSource = false;
    UPROPERTY()
    bool bCheckValidSocialTeam = false;


    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        int local_26;
        bool local_1 = false;
        FECSEntity local_6;
        if (this.bCheckInteractSource)
        {
            local_6 = InteractSource;
        }
        else
        {
            local_6 = InteractTarget;
        }
        if (local_6.IsValid())
        {
            ::FASCommonUtils::GetUniquePlayerEntity(local_6);
            Get local_18;
            const FC_DSPlayerInfo& local_20 = local_18.opCall();
            if (local_20)
            {
                local_1 = (local_20.GetSocialTeamId() > 0);
            }
        }
        if (this.bCheckValidSocialTeam)
        {
            local_26 = local_1;
        }
        else
        {
            bool local_25 = !(local_1);
            local_26 = local_25;
        }
        return (local_26 != 0);
    }
}

class UInteractCustomCheckCondition_EcosimAIV2CheckRiderMountChainCondition : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_EcosimAIV2CheckRiderMountChainCondition()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Get local_4;
        const FC_PawnRiddingMount& local_6 = local_4.opCall();
        if (local_6)
        {
            Has local_12;
            if (local_6.GetMountEntity().IsValid() && local_6.IsDriver() && !(local_12.opCall()))
            {
                return local_6.GetMountEntity().MatchGameplayTag(GameplayTags::EcosimAIV2_Ability_ChainSource);
            }
        }
        else
        {
            Has local_12;
            if (!(local_12.opCall()))
            {
                return InteractSource.MatchGameplayTag(GameplayTags::EcosimAIV2_Ability_ChainSource);
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_EcosimAIV2TargetNotChained : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_EcosimAIV2TargetNotChained()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Has local_4;
        if (local_4.opCall())
        {
            return false;
        }
        return true;
    }
}

class UInteractCustomCheckCondition_EcosimAIV2CheckCanUnchainTarget : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    FGameplayTagContainer AllowUnchainWhenMatchAnyTags;

    UInteractCustomCheckCondition_EcosimAIV2CheckCanUnchainTarget()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        if (this.AllowUnchainWhenMatchAnyTags.IsEmpty())
        {
            return false;
        }
        Get local_6;
        const FC_PawnRiddingMount& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.GetMountEntity().IsValid() && local_8.IsDriver())
            {
                Get local_14;
                const FC_ChainChildrenInfo& local_16 = local_14.opCall();
                if (local_16)
                {
                    if (local_16.GetChildren().Contains(InteractTarget))
                    {
                        return local_8.GetMountEntity().MatchAnyGameplayTags(this.AllowUnchainWhenMatchAnyTags);
                    }
                }
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckDialogueInteractable : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckDialogueInteractable()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(InteractSource);
        if (!(local_8.IsValid()))
        {
            return false;
        }
        if (::DialogueUtils::IsPlayingDialogue(local_8) || ::DialogueUtils::IsPlayingDialogue(InteractTarget))
        {
            return false;
        }
        Get local_14;
        const FC_GlobalDialogues& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetDialogueInfos().Num() > 0)
            {
                return true;
            }
        }
        Get local_22;
        const FC_PlayerDialogues& local_24 = local_22.opCall();
        if (local_24)
        {
            Get local_28;
            const FC_NPCInfo& local_30 = local_28.opCall();
            if (local_30)
            {
                if (local_30.GetMainConfig().IsSet() && local_24.GetNPCDialogueMap().Contains(local_30.GetMainConfig()))
                {
                    return true;
                }
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_EcosimAIV2CheckHasSpeakToDialogue : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_EcosimAIV2CheckHasSpeakToDialogue()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Get local_4;
        const FC_EcosimAIV2SyncSpeakToAndOptionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            Get local_12;
            const FC_ControlledByPlayer& local_14 = local_12.opCall();
            if (local_14)
            {
                if (local_6.GetHasSpeakToAndOptionPlayerEntityList().Contains(local_14.GetPlayerEntity()))
                {
                    return true;
                }
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_EcosimAIV2NoDialoguingWithOther : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_EcosimAIV2NoDialoguingWithOther()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Get local_4;
        const FC_EcosimAIV2SyncSpeakToAndOptionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetCurrentSpeakToEntity().GetEntity().IsValid() && !((local_6.GetCurrentSpeakToEntity().GetEntity() == InteractSource)))
            {
                return false;
            }
        }
        return true;
    }
}

class UInteractCustomCheckCondition_CheckReviveTargetTeamRuleMet : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckReviveTargetTeamRuleMet()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        int local_8 = 0;
        int local_11 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_8 && local_8.GetReviveData().IsSet())
        {
            if ((local_11) == 1)
            {
                if ((int(::FASCommonUtils::GetEntityFactionRelation(InteractSource, InteractTarget))) != 4)
                {
                    return false;
                }
            }
        }
        return true;
    }
}

class UInteractCustomCheckCondition_LevelPublicEvent : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_LevelPublicEvent()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Get local_4;
        const FC_LevelPublicEventInteractTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetLevelPublicEventEntity().IsValid())
            {
                Get local_12;
                const FC_LevelPublicEventInfo& local_14 = local_12.opCall();
                if (local_14)
                {
                    if ((int(local_14.GetStatus())) == 1)
                    {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckAccountExclusivePropDisableInteract : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckAccountExclusivePropDisableInteract()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            return true;
        }
        Get local_6;
        const FC_DefaultToLocal& local_8 = local_6.opCall();
        if (local_8)
        {
            if (FECSEntity(local_8.LocalEntityId).IsValid())
            {
                Has local_20;
                return !(local_20.opCall());
            }
        }
        return true;
    }
}

class UInteractCustomCheckCondition_CheckAccountExclusiveTeleporterActive : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckAccountExclusiveTeleporterActive()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        int local_8 = 0;
        Get local_4;
        const FC_AccountExclusiveTeleporterConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.TeleporterConfig.IsSet())
            {
                return ::TeleporterUtils::IsTeleporterActive(InteractSource, local_8, InteractTarget);
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckAccountExclusiveTeleporterUnlocked : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckAccountExclusiveTeleporterUnlocked()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        int local_8 = 0;
        Get local_4;
        const FC_AccountExclusiveTeleporterConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.TeleporterConfig.IsSet())
            {
                return ::TeleporterUtils::IsTeleporterUnlocked(InteractSource, local_8, InteractTarget);
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckAccountExclusiveTreasureBoxCoolingDown : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckAccountExclusiveTreasureBoxCoolingDown()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        int local_8 = 0;
        Get local_4;
        const FC_LevelObjectStatConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.LevelObjectStatConfig.IsSet())
            {
                return ::TreasureBoxUtils::CanOpenTreasureBox(InteractSource, local_8);
            }
        }
        return true;
    }
}

class UInteractCustomCheckCondition_CheckAccountExclusiveItemRecorded : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckAccountExclusiveItemRecorded()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Get local_4;
        const FC_LevelObjectStatConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.LevelObjectStatConfig.IsSet())
            {
                return !(::FLevelObjectStatUtils::IsLevelObjectRecorded(InteractSource, TDataObjectPtr<FLevelObjectStatConfig>()));
            }
        }
        return true;
    }
}

class UInteractCustomCheckCondition_CheckAccountExclusiveItemUnlocked : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckAccountExclusiveItemUnlocked()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        Get local_4;
        const FC_LevelObjectStatUnlockConditionConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.CheckUnlockConditions(InteractSource))
            {
                return true;
            }
        }
        return false;
    }
}

class UInteractCustomCheckCondition_CheckRemnantSkillState : UInteractCustomCheckConditionBase
{
    UInteractCustomCheckCondition_CheckRemnantSkillState()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        return ::RemnantUtils::CheckCanChangeRemnantSkill(::FASCommonUtils::GetUniquePlayerEntity(InteractSource), FECSEntity(InteractSource));
    }
}

class UInteractCustomCheckCondition_CheckEntityType : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    bool bCheckInteractSource = true;
    UPROPERTY()
    uint8 AllowedEntityTypes = (7 != 0);
    UPROPERTY()
    bool bInvertResult = false;


    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        bool local_23;
        FECSEntity local_6;
        if (this.bCheckInteractSource)
        {
            local_6 = InteractSource;
        }
        else
        {
            local_6 = InteractTarget;
        }
        if (!(local_6.IsValid()))
        {
            return false;
        }
        bool local_11 = false;
        Has local_16;
        bool local_1 = local_16.opCall();
        if (local_1)
        {
            int local_20 = this.AllowedEntityTypes & 1;
            local_11 = (local_20 != 0);
        }
        else
        {
            if (::FASCommonUtils::IsNPC(local_6))
            {
                int local_21 = this.AllowedEntityTypes & 2;
                local_11 = (local_21 != 0);
            }
            else
            {
                if (::FASCommonUtils::IsMonsterPrefab(local_6))
                {
                    int local_20_2 = this.AllowedEntityTypes & 4;
                    local_11 = (local_20_2 != 0);
                }
            }
        }
        if (this.bInvertResult)
        {
            local_23 = !(local_11);
        }
        else
        {
            local_23 = local_11;
        }
        return local_23;
    }
}

class UInteractCustomCheckCondition_CheckSystemControl : UInteractCustomCheckConditionBase
{
    UPROPERTY()
    TDataObjectPtr<FSystemControlConfig> SystemControlConfig;

    UInteractCustomCheckCondition_CheckSystemControl()
    {
        super();
        return;
    }
    bool CheckCondition(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPoint &inout InteractionPoint, const bool bIsCheckingDuringInteracting) const
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            if (!(this.SystemControlConfig.IsSet()))
            {
                return true;
            }
            FAsToCpp_IsSystemUnlockedDelegate local_8 = FAsToCpp_IsSystemUnlockedDelegate(::UScriptAsToCppModelFunctionRouter::Get().OnIsSystemUnlock);
            if (local_8.IsBound())
            {
                return local_8.Execute(this.SystemControlConfig, false);
            }
        }
        return true;
    }
}

