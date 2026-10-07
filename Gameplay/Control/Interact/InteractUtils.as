
namespace FInteractUtils
{
    const float32 InteractSelectScoreDistanceOffset = 100f;
    const float32 InteractSelectScoreDistanceWeight = 0.3f;

TDataObjectPtr<FInteractTipPreset> GetInteractTipPreset(const FInteractionPoint &inout InteractPoint, const UInteractionBehaviorBase BehaviorConfig)
{
    if (InteractPoint.bOverrideInteractTipPreset)
    {
        return InteractPoint.OverrideInteractTipPreset;
    }
    return BehaviorConfig.InteractTipPreset;
}
const FInteractionPointHUDIconSettings& GetInteractionPointHUDIconSettings(const FInteractionPoint &inout InteractPoint, const UInteractionBehaviorBase BehaviorConfig)
{
    bool local_1 = InteractPoint.bOverrideHUDIconSettings;
    if (local_1)
    {
    }
    else
    {
    }
    return local_1;
}
bool GetCurrentInteractTargetInfoForUI(const FECSEntity &inout Entity, const EInteractMode InteractMode, FVector &out HUDDisplayLocation, FVector2D &out HUDDisplayUIOffset, FString &out InteractHUDContent, bool &out bIsFailContent, FSoftBrush &out HUDIcon, FVector &out HUDIconDisplayLocation, FVector2D &out HUDIconDisplayUIOffset, bool &out bForceShowPointWithIcon, FECSEntity &out TargetEntity)
{
    FVector local_6;
    HUDDisplayLocation = local_6;
    HUDDisplayUIOffset = FVector2D();
    InteractHUDContent = FString();
    bIsFailContent = false;
    HUDIcon = FSoftBrush();
    HUDIconDisplayLocation = local_6;
    HUDIconDisplayUIOffset = FVector2D();
    bForceShowPointWithIcon = false;
    TargetEntity = FECSEntity();
    FECSEntity local_80 = FASCommonUtils::GetRiderEntity(Entity);
    FASCommonUtils::GetUniquePlayerEntity(local_80);
    Get local_92;
    const FC_SelectSocialInteractionInfo& local_94 = local_92.opCall();
    if (local_94)
    {
        if (!((local_94.InteractTarget == ENTITY_NULL)) && local_94.InteractTarget.IsValid())
        {
            return false;
        }
    }
    FInteractionPointAndBehaviorIndex local_98;
    int local_99 = -1;
    int local_100 = int(InteractMode);
    if (local_100 <= 1)
    {
        if (local_100 != 0)
        {
            if (local_100 != 1)
            {
            }
        }
        else
        {
            Get local_106;
            const FC_BestInteractionTargetInfo& local_108 = local_106.opCall();
            if (local_108)
            {
                TargetEntity = local_108.TargetEntity;
                local_98 = local_108.InteractTargetPointAndBehaviorIndex;
                local_99 = int(local_108.ShowFailConditionIndex);
                bool local_101_2 = local_108.bShowFailFromSource;
            }
            Get local_112;
            const FC_BestInteractionTargetInfoModeZ& local_114 = local_112.opCall();
            if (local_114)
            {
                TargetEntity = local_114.TargetEntity;
                local_98 = local_114.InteractTargetPointAndBehaviorIndex;
                local_99 = int(local_114.ShowFailConditionIndex);
                bool local_101_3 = local_114.bShowFailFromSource;
            }
        }
    }
    return false;
}
bool GetCurrentInteractTipTargetInfoForUI(const FECSEntity &inout Entity, TArray<FInteractTipTargetHUDRenderInfo> &out InteractTipTargets)
{
    TArray<FInteractTipTargetHUDRenderInfo> local_4;
    InteractTipTargets = local_4;
    int local_5 = false;
    FECSEntity local_10 = FASCommonUtils::GetRiderEntity(Entity);
    FASCommonUtils::GetUniquePlayerEntity(local_10);
    Get local_22;
    const FC_SelectSocialInteractionInfo& local_24 = local_22.opCall();
    if (local_24)
    {
        if (!((local_24.InteractTarget == ENTITY_NULL)) && local_24.InteractTarget.IsValid())
        {
            return false;
        }
    }
    Get local_30;
    const FC_InteractTipTargetInfo& local_32 = local_30.opCall();
    if (local_32)
    {
        for (auto& local_46 : local_32.Targets)
        {
            FECSEntity local_18 = FECSEntity(local_46.EntityId);
            if (local_18)
            {
                Get local_54;
                const FC_InteractionTargetConfig& local_56 = local_54.opCall();
                if (local_56)
                {
                    int local_59;
                    int local_57;
                    local_57 = int(local_46.InteractPointIndex);
                    local_59 = int(local_46.BehaviorIndex);
                    if (local_57 >= 0 && (local_57 < local_56.InteractionPoints.Num()))
                    {
                        const FInteractionPoint& local_62 = local_56.InteractionPoints[local_57];
                        if (!(local_62.PointType.IsValid()))
                        {
                            continue;
                        }
                        FInteractionPointTypeConfig local_80;
                        TDataObjectPtr<FInteractionPointTypeConfig> local_104 = TDataObjectPtr<FInteractionPointTypeConfig>(local_62.PointType);
                        if (local_59 >= 0 && (local_59 < local_80.Behaviors.Num()))
                        {
                            if (!(FInteractUtils::GetInteractTipPreset(local_62, local_80.Behaviors[local_59].GetDefaultObject()).IsSet()))
                            {
                                continue;
                            }
                            FVector local_162;
                            FQuat local_172;
                            FInteractUtils::GetInteractTargetLocationAndRotationForClient(local_18, local_62, local_162, local_172, true, false);
                            local_162 = (local_172.RotateVector(local_62.UIDisplayOffsetFromInteractPoint) + local_162);
                            FInteractTipTargetHUDRenderInfo local_240;
                            local_240.HUDIconDisplayLocation = local_162;
                            InteractTipTargets.Add(local_240);
                        }
                    }
                }
            }
        }
        return !(InteractTipTargets.IsEmpty());
    }
    return false;
}
UFUNCTION()
void LocallyTriggerUIInteractAbility(const FECSEntity &inout PawnEntity, const FUIItemInteractAbility &inout ItemInteractAbility)
{
    int local_26 = 0;
    int local_32 = 0;
    FECSEntity local_4 = FASCommonUtils::GetRiderEntity(PawnEntity);
    if (local_4.IsValid())
    {
        if (ItemInteractAbility.bIsInteractTarget)
        {
            GetDefaulted local_14;
            const FC_InteractionInfoForESM& local_16 = local_14.opCall();
            if (local_16)
            {
                if (local_16.GetTargetEntity().IsValid())
                {
                    FFPTime local_22 = FFPTime(-1);
                    local_26.AbilityOwner = local_16.GetTargetEntity();
                    local_26.SignalName = ItemInteractAbility.Signal;
                    local_26.InteractTargetPointAndBehaviorIndex = local_16.GetTargetPointAndBehaviorIndex();
                }
            }
        }
        else
        {
            if (!(ItemInteractAbility.AbilityClass.IsNull()))
            {
                FFPTime local_22_2 = FFPTime(-1);
                local_32.AbilityOwner = local_4;
                local_32.AbilityClass = ItemInteractAbility.AbilityClass;
                local_32.SignalName = ItemInteractAbility.Signal;
            }
        }
    }
    return;
}
UFUNCTION()
FECSEntity GetFirstInteractSourceEntityByBehavior(const FECSEntityAdapter &inout InteractTargetEntity, const TSubclassOf<UInteractionBehaviorBase> &inout InBehaviorClass)
{
    UInteractionBehaviorBase local_30;
    Get local_4;
    const FC_RuntimeInteractTargetStatus& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_22 : local_6.GetInteractionPointStatus())
        {
            local_30 = FInteractUtils::GetInteractionBehaviorFromEntity(InteractTargetEntity.opImplConv(), local_22.GetPointAndBehaviorIndex());
            if ((InBehaviorClass == local_30.GetClass()) && (local_22.GetInteractingSourceEntities().Num() > 0))
            {
                return local_22.GetInteractingSourceEntities()[0];
            }
        }
    }
    return ENTITY_NULL;
}
bool GetCurrentInteractProgressInfoForUI(const FECSEntity &inout Entity, FVector &out HUDDisplayLocation, float32 &out InteractProgressPct, FText &out InteractProgressContent)
{
    FVector local_6;
    HUDDisplayLocation = local_6;
    InteractProgressPct = 0.0f;
    InteractProgressContent = FText();
    int local_13 = false;
    FASCommonUtils::GetRiderEntity(Entity);
    Get local_26;
    const FC_InteractionInfoForESM& local_28 = local_26.opCall();
    if (local_28)
    {
        const FECSEntity& local_30 = local_28.GetTargetEntity();
        if (local_30.IsValid())
        {
            Get local_34;
            const FC_InteractionTargetConfig& local_36 = local_34.opCall();
            if (local_36)
            {
                int local_37;
                local_37 = local_28.GetTargetPointAndBehaviorIndex().GetPointIndex();
                UInteractionBehaviorBase local_42 = FInteractUtils::GetInteractionBehaviorFromEntity(local_30, local_28.GetTargetPointAndBehaviorIndex());
                if (local_37 >= 0 && (local_37 < local_36.InteractionPoints.Num()))
                {
                    const FInteractionPoint& local_46 = local_36.InteractionPoints[local_37];
                    FVector local_52;
                    FQuat local_60;
                    FInteractUtils::GetInteractTargetLocationAndRotationForClient(local_30, local_46, local_52, local_60, true, false);
                    HUDDisplayLocation = (local_60.RotateVector(local_46.UIDisplayOffsetFromInteractPoint) + local_52);
                    InteractProgressContent = local_42.GetInteractProgressContent();
                    Get local_80;
                    const FC_LocalInteractProgress& local_82 = local_80.opCall();
                    if (local_82)
                    {
                        if (local_82.ProgressValue > 0.0f && (local_82.MaxProgressValue > 0.0f))
                        {
                            InteractProgressPct = (local_82.ProgressValue / local_82.MaxProgressValue);
                            local_13 = local_42.bShowInteractProgress;
                        }
                    }
                }
            }
        }
    }
    return (local_13 != 0);
}
void GetCurrentInteractPlayerNumInfoForUI(const FECSEntity &inout Entity, int &out CurInteractNum, int &out InteractPointNum)
{
    CurInteractNum = 0;
    InteractPointNum = 0;
    FASCommonUtils::GetRiderEntity(Entity);
    Get local_14;
    const FC_InteractionInfoForESM& local_16 = local_14.opCall();
    if (local_16)
    {
        const FECSEntity& local_20 = local_16.GetTargetEntity();
        if (local_20.IsValid())
        {
            Get local_24;
            const FC_InteractionTargetConfig& local_26 = local_24.opCall();
            if (local_26)
            {
                int local_27;
                local_27 = local_16.GetTargetPointAndBehaviorIndex().GetPointIndex();
                InteractPointNum = local_26.InteractionPoints.Num();
                if (local_27 >= 0 && (local_27 < local_26.InteractionPoints.Num()))
                {
                    Get local_34;
                    const FC_LocalInteractWithTeam& local_36 = local_34.opCall();
                    if (local_36)
                    {
                        CurInteractNum = int(local_36.InteractEntityNum);
                    }
                }
            }
        }
    }
    return;
}
UFUNCTION()
void SetEntityInteractTargetEnabled(const FECSEntity &inout Entity, const bool Enabled, const int PointIndex = -1)
{
    if ((!(!((Entity == ENTITY_NULL)))))
    {
        return;
    }
    FECSWorldPtr local_8 = Entity.GetWorld();
    FCE_SetEntityInteractTargetEnabled local_10;
    local_10.bEnabled = Enabled;
    local_10.PointIndex = PointIndex;
    return;
}
UFUNCTION()
void SetEntityInteractTargetPointEnabled(const FECSEntity &inout Entity, const int PointIndex, const bool Enabled)
{
    if ((!(!((Entity == ENTITY_NULL)))))
    {
        return;
    }
    FECSWorldPtr local_8 = Entity.GetWorld();
    FCE_SetEntityInteractTargetEnabled local_10;
    local_10.bEnabled = Enabled;
    local_10.PointIndex = PointIndex;
    return;
}
TArray<FECSEntity> GetInteractingEntitiesAtPointWithBehavior(const FECSEntity &inout InteractTargetEntity, const int PointIndex, const int BehaviorIdx)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TArray<FECSEntity> __r; return __r;
}
TArray<FECSEntity> GetInteractingEntitiesWithBehavior(const FECSEntity &inout InteractTargetEntity, const int BehaviorIdx)
{
    TArray<FECSEntity> local_4;
    Get local_8;
    const FC_RuntimeInteractTargetStatus& local_10 = local_8.opCall();
    if (local_10)
    {
        for (auto& local_26 : local_10.GetInteractionPointStatus())
        {
            if (local_26.GetPointAndBehaviorIndex().GetBehaviorIndex() == BehaviorIdx)
            {
                local_4.Append(local_26.GetInteractingSourceEntities());
            }
        }
    }
    return local_4;
}
TArray<FInteractionPointAndBehaviorIndex> GetAllSameBehaviorIndexByPointAndBehaviorIndex(const FECSEntity &inout InteractTargetEntity, const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex)
{
    TArray<FInteractionPointAndBehaviorIndex> local_4;
    int local_10 = 0;
    int local_40 = 0;
    int local_94 = 0;
    FECSEntity::Get<FC_InteractionTargetConfig> local_8 = FECSEntity::Get<FC_InteractionTargetConfig>(InteractTargetEntity);
    if (!(local_10))
    {
        return local_4;
    }
    if (PointAndBehaviorIndex.GetPointIndex() < 0 || (PointAndBehaviorIndex.GetPointIndex() >= local_10.InteractionPoints.Num()))
    {
        return local_4;
    }
    if (!(FDataObjectPtr(local_10.InteractionPoints[PointAndBehaviorIndex.GetPointIndex()].PointType).IsValid()))
    {
        return local_4;
    }
    if (PointAndBehaviorIndex.GetBehaviorIndex() < 0 || (PointAndBehaviorIndex.GetBehaviorIndex() >= local_40.Behaviors.Num()))
    {
        return local_4;
    }
    TSubclassOf<UInteractionBehaviorBase> local_66 = TSubclassOf<UInteractionBehaviorBase>(local_40.Behaviors[PointAndBehaviorIndex.GetBehaviorIndex()]);
    int local_67 = 0;
    for (; local_67 < local_10.InteractionPoints.Num(); ++local_67)
    {
        if (!(FDataObjectPtr(local_10.InteractionPoints[local_67].PointType).IsValid()))
        {
            continue;
        }
        int local_95 = 0;
        for (; local_95 < local_94.Behaviors.Num(); ++local_95)
        {
            if ((TSubclassOf<UInteractionBehaviorBase>(local_94.Behaviors[local_95]) == local_66))
            {
                FInteractionPointAndBehaviorIndex local_100;
                local_100.SetPointIndex(local_67);
                local_100.SetBehaviorIndex(local_95);
                local_4.Add(local_100);
            }
        }
    }
    return local_4;
}
bool IsInteractingWithEntity(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const int PointIndex = -1, const int BehaviorIndex = -1)
{
    Get local_4;
    const FC_RuntimeInteractTargetStatus& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_22 : local_6.GetInteractionPointStatus())
        {
            if (local_22.GetInteractingSourceEntities().Contains(InteractSource))
            {
                if (PointIndex < 0 || (local_22.GetPointAndBehaviorIndex().GetPointIndex() == PointIndex))
                {
                    if (BehaviorIndex < 0 || (local_22.GetPointAndBehaviorIndex().GetBehaviorIndex() == BehaviorIndex))
                    {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
void AddInteractingSourceEntityToTarget(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    if (FEcoCollectableUtils::IsEntityInStaticRegistry(InteractTarget))
    {
        return;
    }
    bool local_5 = !(FInteractUtils::IsInteractingWithEntity(InteractSource, InteractTarget, -1, -1));
    bool local_8 = !(false);
    Modify local_12;
    FC_RuntimeInteractTargetStatus& local_14 = local_12.opCall();
    if (local_14)
    {
        int local_6 = local_14.GetInteractionPointStatusIndex(PointAndBehaviorIndex);
        if (local_6 < 0)
        {
            local_6 = local_14.AddInteractionPointStatus(PointAndBehaviorIndex);
        }
        FRuntimeInteractionPointStatus& local_18 = local_14.GetModify_InteractionPointStatus()[local_6];
        local_18.GetInteractingSourceEntities().AddUnique(InteractSource);
        Has local_22;
        if (!(local_22.opCall()))
        {
            FC_IsBeingInteractedTag local_28;
            Assign local_26;
            local_26.opCall(local_28);
        }
    }
    return;
}
void RemoveInteractingSourceEntityFromTarget(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const int PointIndex = -1, const int BehaviorIndex = -1)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    if (FEcoCollectableUtils::IsEntityInStaticRegistry(InteractTarget))
    {
        return;
    }
    bool local_6 = false;
    Modify local_10;
    FC_RuntimeInteractTargetStatus& local_12 = local_10.opCall();
    if (local_12)
    {
        int local_16 = local_12.GetInteractionPointStatus().Num() - 1;
        for (; local_16 >= 0; --local_16)
        {
            const FRuntimeInteractionPointStatus& local_18 = local_12.GetInteractionPointStatus()[local_16];
            if (local_18.GetInteractingSourceEntities().Contains(InteractSource))
            {
                if (PointIndex < 0 || (local_18.GetPointAndBehaviorIndex().GetPointIndex() == PointIndex))
                {
                    if (BehaviorIndex < 0 || (local_18.GetPointAndBehaviorIndex().GetBehaviorIndex() == BehaviorIndex))
                    {
                        if (local_18.GetInteractingSourceEntities().Num() == 0)
                        {
                            local_12.GetModify_InteractionPointStatus().RemoveAt(local_16);
                            continue;
                        }
                    }
                }
            }
            if (local_18.GetInteractingSourceEntities().Num() > 0)
            {
                local_6 = true;
            }
        }
    }
    if (!(local_6))
    {
        Has local_24;
        bool local_19 = local_24.opCall();
        if (local_19)
        {
            Remove local_28;
            local_28.opCall();
        }
    }
    return;
}
UInteractionBehaviorBase GetInteractionBehaviorFromEntity(const FECSEntity &inout InteractTargetEntity, const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex)
{
    int local_1;
    local_1 = PointAndBehaviorIndex.GetPointIndex();
    FDataObjectPtr local_26 = FInteractUtils::GetInteractionPointTypeRowHandleFromEntity(InteractTargetEntity, local_1);
    if (!(local_26.IsValid()))
    {
        UInteractionBehaviorBase local_54;
        return local_54;
    }
    return FInteractUtils::GetInteractionBehaviorInRow(local_26, PointAndBehaviorIndex.GetBehaviorIndex());
}
UInteractionBehaviorBase GetInteractionBehaviorInRow(const FDataObjectPtr &inout PointTypeRowHandle, const int BehaviorIdx)
{
    int local_28 = 0;
    if (PointTypeRowHandle.IsValid())
    {
        TDataObjectPtr<FInteractionPointTypeConfig> local_26 = TDataObjectPtr<FInteractionPointTypeConfig>(PointTypeRowHandle);
        if (BehaviorIdx >= 0 && (BehaviorIdx < local_28.Behaviors.Num()))
        {
            TSubclassOf<UInteractionBehaviorBase> local_32 = TSubclassOf<UInteractionBehaviorBase>(local_28.Behaviors[BehaviorIdx]);
            if (!((local_32 == nullptr)))
            {
                return local_32.GetDefaultObject();
            }
        }
    }
    return nullptr;
}
FDataObjectPtr GetInteractionPointTypeRowHandleFromEntity(const FECSEntity &inout InteractTargetEntity, const int PointIndex)
{
    Get local_4;
    const FC_InteractionTargetConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (PointIndex >= 0 && (PointIndex < local_6.InteractionPoints.Num()))
        {
            return local_6.InteractionPoints[PointIndex].PointType;
        }
    }
    return FDataObjectPtr();
}
UDataTable GetInteractionPointTypeDataTable()
{
    UWorld local_8 = ECS::GetUEWorld();
    if (local_8 == nullptr)
    {
        UDataTable local_12;
        return local_12;
    }
    US_InteractionSystem local_16 = Cast<US_InteractionSystem>(AECSGameManagerActor::GetSystem(local_8, US_InteractionSystem));
    if (local_16 == nullptr)
    {
        UDataTable local_12;
        return local_12;
    }
    return local_16.InteractionPointTypeTable;
}
FDataObjectPtr GetInteractionPointTypeRowHandle(const uint64 RowName)
{
    return FDataObjectPtr(RowName);
}
FDataObjectPtr GetInteractionPointTypeRowHandle(const FName &inout RowName)
{
    UDataTable local_4 = FInteractUtils::GetInteractionPointTypeDataTable();
    if (local_4 == nullptr)
    {
        return FDataObjectPtr();
    }
    FInteractionPointTypeConfig local_48;
    if (!(local_4.FindRow(RowName, local_48)))
    {
        return FDataObjectPtr();
    }
    return FDataObjectPtr();
}
void UpdateMaxInteractDistance(const float32 MaxInteractDistance, const float32 MaxInteractTipDistance)
{
    US_InteractionSystem local_6 = Cast<US_InteractionSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_InteractionSystem));
    if (local_6 != nullptr)
    {
        local_6.MaxInteractDistance = FMath::Max(local_6.MaxInteractDistance, MaxInteractDistance);
        local_6.MaxInteractTipDistance = FMath::Max(local_6.MaxInteractTipDistance, MaxInteractTipDistance);
    }
    return;
}
bool IsInteractionPointFree(const FECSEntity &inout InteractTarget, const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex, const UInteractionBehaviorBase Behavior)
{
    Get local_4;
    const FC_RuntimeInteractTargetStatus& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.GetbRuntimeDisabled())
        {
            return false;
        }
        if (!(local_6.IsRuntimePointEnabled(PointAndBehaviorIndex.GetPointIndex())))
        {
            return false;
        }
        if (int(Behavior.MaxInteractSourceCount) <= 0 || (local_6.GetRuntimePointInteractingSourceEntitiesCount(PointAndBehaviorIndex) < int(Behavior.MaxInteractSourceCount)))
        {
            return true;
        }
    }
    return false;
}
bool GetInteractionPointAndBehaviorIndexByType(const FECSEntity &inout InteractTarget, const EInteractType InteractType, FInteractionPointAndBehaviorIndex &out InteractTargetPointAndBehaviorIndex, const bool bCheckFree = true)
{
    FInteractionPointAndBehaviorIndex local_2;
    int local_38 = 0;
    InteractTargetPointAndBehaviorIndex = local_2;
    Get local_6;
    const FC_InteractionTargetConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        int local_10 = 0;
        for (; local_10 < local_8.InteractionPoints.Num(); ++local_10)
        {
            if (!(FDataObjectPtr(local_8.InteractionPoints[local_10].PointType).IsValid()))
            {
                continue;
            }
            int local_63 = 0;
            for (; local_63 < local_38.Behaviors.Num(); ++local_63)
            {
                TSubclassOf<UInteractionBehaviorBase> local_66 = TSubclassOf<UInteractionBehaviorBase>(local_38.Behaviors[local_63]);
                if ((!((local_66 == nullptr))))
                {
                    UInteractionBehaviorBase local_70 = local_66.GetDefaultObject();
                    if ((local_70 != nullptr && (int(local_70.InteractType) == int(InteractType))))
                    {
                        if (bCheckFree)
                        {
                            FInteractionPointAndBehaviorIndex local_76;
                            local_76.SetPointIndex(local_10);
                            local_76.SetBehaviorIndex(local_63);
                            if (FInteractUtils::IsInteractionPointFree(InteractTarget, local_76, local_70))
                            {
                                InteractTargetPointAndBehaviorIndex.SetPointIndex(local_10);
                                InteractTargetPointAndBehaviorIndex.SetBehaviorIndex(local_63);
                                return true;
                            }
                        }
                        else
                        {
                            InteractTargetPointAndBehaviorIndex.SetPointIndex(local_10);
                            InteractTargetPointAndBehaviorIndex.SetBehaviorIndex(local_63);
                            return true;
                        }
                    }
                }
            }
        }
    }
    return false;
}
bool GetInteractionBehaviorClassByIndex(const FECSEntity &inout InteractTarget, const int PointIndex, const int BehaviorIndex, TSubclassOf<UInteractionBehaviorBase> &out BehaviorClass)
{
    TSubclassOf<UInteractionBehaviorBase> local_2;
    int local_36 = 0;
    BehaviorClass = local_2;
    Get local_6;
    const FC_InteractionTargetConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        if (PointIndex < local_8.InteractionPoints.Num())
        {
            if (FDataObjectPtr(local_8.InteractionPoints[PointIndex].PointType).IsValid())
            {
                if (BehaviorIndex < local_36.Behaviors.Num())
                {
                    BehaviorClass = local_36.Behaviors[BehaviorIndex];
                    return true;
                }
            }
        }
    }
    return false;
}
bool GetInteractionPointAndBehaviorIndexByBehaviorClass(const FECSEntity &inout InteractTarget, const TSubclassOf<UInteractionBehaviorBase> &inout BehaviorClass, FInteractionPointAndBehaviorIndex &out InteractTargetPointAndBehaviorIndex, const bool bCheckFree = true)
{
    FInteractionPointAndBehaviorIndex local_2;
    int local_38 = 0;
    InteractTargetPointAndBehaviorIndex = local_2;
    Get local_6;
    const FC_InteractionTargetConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        int local_10 = 0;
        for (; local_10 < local_8.InteractionPoints.Num(); ++local_10)
        {
            if (FDataObjectPtr(local_8.InteractionPoints[local_10].PointType).IsValid())
            {
                int local_63 = 0;
                for (; local_63 < local_38.Behaviors.Num(); ++local_63)
                {
                    if ((BehaviorClass == local_38.Behaviors[local_63]))
                    {
                        if (bCheckFree)
                        {
                            FInteractionPointAndBehaviorIndex local_66;
                            local_66.SetPointIndex(local_10);
                            local_66.SetBehaviorIndex(local_63);
                            if (FInteractUtils::IsInteractionPointFree(InteractTarget, local_66, BehaviorClass.GetDefaultObject()))
                            {
                                InteractTargetPointAndBehaviorIndex.SetPointIndex(local_10);
                                InteractTargetPointAndBehaviorIndex.SetBehaviorIndex(local_63);
                                return true;
                            }
                            continue;
                        }
                        InteractTargetPointAndBehaviorIndex.SetPointIndex(local_10);
                        InteractTargetPointAndBehaviorIndex.SetBehaviorIndex(local_63);
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
UInteractionBehaviorBase GetInteractionBehaviorCDO(const FECSEntity &inout InteractTarget, const int PointIndex, const int BehaviorIndex)
{
    int local_36 = 0;
    Get local_4;
    const FC_InteractionTargetConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (PointIndex >= 0 && (PointIndex < local_6.InteractionPoints.Num()))
        {
            if (FDataObjectPtr(local_6.InteractionPoints[PointIndex].PointType).IsValid())
            {
                if (BehaviorIndex >= 0 && (BehaviorIndex < local_36.Behaviors.Num()))
                {
                    return local_36.Behaviors[BehaviorIndex].GetDefaultObject();
                }
            }
        }
    }
    return nullptr;
}
bool GetAllInteractionPointAndBehaviorIndexByBehaviorClass(const FECSEntity &inout InteractTarget, const TSubclassOf<UInteractionBehaviorBase> &inout BehaviorClass, TArray<FInteractionPointAndBehaviorIndex> &out InteractTargetPointAndBehaviorIndexList, const bool bCheckFree = true)
{
    TArray<FInteractionPointAndBehaviorIndex> local_4;
    int local_40 = 0;
    InteractTargetPointAndBehaviorIndexList = local_4;
    const FC_InteractionTargetConfig& local_10 = FECSEntity::Get<FC_InteractionTargetConfig>(InteractTarget).opCall();
    if (local_10)
    {
        int local_12 = 0;
        for (; local_12 < local_10.InteractionPoints.Num(); ++local_12)
        {
            if (FDataObjectPtr(local_10.InteractionPoints[local_12].PointType).IsValid())
            {
                int local_65 = 0;
                for (; local_65 < local_40.Behaviors.Num(); ++local_65)
                {
                    if ((BehaviorClass == local_40.Behaviors[local_65]))
                    {
                        if (bCheckFree)
                        {
                            FInteractionPointAndBehaviorIndex local_68;
                            local_68.SetPointIndex(local_12);
                            local_68.SetBehaviorIndex(local_65);
                            if (FInteractUtils::IsInteractionPointFree(InteractTarget, local_68, BehaviorClass.GetDefaultObject()))
                            {
                                FInteractionPointAndBehaviorIndex local_74;
                                local_74.SetPointIndex(local_12);
                                local_74.SetBehaviorIndex(local_65);
                                InteractTargetPointAndBehaviorIndexList.Add(local_74);
                            }
                            continue;
                        }
                        FInteractionPointAndBehaviorIndex local_74;
                        local_74.SetPointIndex(local_12);
                        local_74.SetBehaviorIndex(local_65);
                        InteractTargetPointAndBehaviorIndexList.Add(local_74);
                    }
                }
            }
        }
    }
    return !(InteractTargetPointAndBehaviorIndexList.IsEmpty());
}
bool GetInteractTargetLocationAndRotation(const FECSEntity &inout InteractTargetEntity, const int PointIndex, const FFPTime &inout Time, FVector &out Location, FQuat &out Rotation, const bool bPreferViewMeshSocket = false)
{
    FVector local_6;
    Location = local_6;
    Rotation = FQuat();
    Get local_20;
    const FC_InteractionTargetConfig& local_22 = local_20.opCall();
    if (local_22)
    {
        if (PointIndex >= 0 && (PointIndex < local_22.InteractionPoints.Num()))
        {
            const FInteractionPoint& local_28 = local_22.InteractionPoints[PointIndex];
            FInteractUtils::GetInteractTargetLocationAndRotation(InteractTargetEntity, local_28, Time, Location, Rotation, bPreferViewMeshSocket, false);
            return true;
        }
    }
    return false;
}
bool GetLocationAndRotationBySocket(const FECSEntity &inout InteractTargetEntity, const FName &inout SocketName, const FFPTime &inout Time, FVector &out Location, FQuat &out Rotation, const bool bPreferViewMeshSocket = false)
{
    AGameCharacter local_78;
    USkeletalMeshComponent local_80;
    FVector local_6;
    Location = local_6;
    Rotation = FQuat();
    bool local_17 = false;
    if (!((SocketName == NAME_None)))
    {
        FTransform local_72 = FTransformUtils::GetStaticSocketTransform(InteractTargetEntity, SocketName, local_17, true, FFPTime(-1));
        if ((!(local_17) && bPreferViewMeshSocket))
        {
            local_78 = (Cast<AGameCharacter>(InteractTargetEntity.GetActor()));
            if (local_78 != nullptr)
            {
                local_80 = local_78.ViewMesh;
                if (local_80 != nullptr)
                {
                    if (local_80.DoesSocketExist(SocketName))
                    {
                        local_72 = local_80.GetSocketTransform(SocketName, ERelativeTransformSpace(0));
                        local_17 = true;
                    }
                }
            }
        }
        if (!(local_17) && !(bPreferViewMeshSocket && (Time == -1.0)))
        {
            local_72 = FTransformUtils::GetSocketTransformInGameMesh(InteractTargetEntity, SocketName, Time, local_17, FDownsampleConfig());
        }
        if (local_17)
        {
            Location = local_72.GetLocation();
            Rotation = local_72.GetRotation();
        }
    }
    return local_17;
}
void GetInteractTargetLocationAndRotationForClient(const FECSEntity &inout InteractTargetEntity, const FInteractionPoint &inout InteractionPoint, FVector &out Location, FQuat &out Rotation, const bool bPreferViewMeshSocket = false, const bool bPreferViewTransform = false)
{
    FVector local_6;
    Location = local_6;
    Rotation = FQuat();
    FFPTime local_20 = FECSInterpoUtils::GetInterpoTime(InteractTargetEntity);
    FInteractUtils::GetInteractTargetLocationAndRotation(InteractTargetEntity, InteractionPoint, local_20, Location, Rotation, bPreferViewMeshSocket, bPreferViewTransform);
    return;
}
void GetInteractTargetLocationAndRotation(const FECSEntity &inout InteractTargetEntity, const FInteractionPoint &inout InteractionPoint, const FFPTime &inout Time, FVector &out Location, FQuat &out Rotation, const bool bPreferViewMeshSocket = false, const bool bPreferViewTransform = false)
{
    AGameCharacter local_26;
    FVector local_6;
    int local_86 = 0;
    int local_92 = 0;
    Location = local_6;
    Rotation = FQuat();
    if ((InteractionPoint.bUseSocket && !((InteractionPoint.SocketName == NAME_None))))
    {
        if (FInteractUtils::GetLocationAndRotationBySocket(InteractTargetEntity, InteractionPoint.SocketName, Time, Location, Rotation, bPreferViewMeshSocket))
        {
            return;
        }
    }
    if (bPreferViewTransform)
    {
        local_26 = (Cast<AGameCharacter>(InteractTargetEntity.GetActor()));
        if (local_26 != nullptr)
        {
            FTransform local_52 = local_26.GetActorTransform();
            Location = local_52.TransformPosition(InteractionPoint.TransformOffset.GetLocation());
            Rotation = local_52.TransformRotation(InteractionPoint.TransformOffset.GetRotation());
            return;
        }
    }
    if (local_92)
    {
        FTransform local_164 = local_86 ? local_92.ToFTransformWitScale(local_86.Scale) : local_92.ToFTransform();
        Location = local_164.TransformPosition(InteractionPoint.TransformOffset.GetLocation());
        Rotation = local_164.TransformRotation(InteractionPoint.TransformOffset.GetRotation());
    }
    return;
}
UFUNCTION()
void CreateInteractActionESMTriggerEvent(const FECSEntity &inout InteractSourceEntity, const FECSEntity &inout TriggerEntity, const FInteractActionESMBBForEvent &inout InteractActionESMBBForEvent)
{
    int local_10 = 0;
    int local_26 = 0;
    FFPTime local_6 = FFPTime(-1);
    local_10.InteractSourceEntity = InteractSourceEntity;
    local_10.RealInteractTriggerEntity = TriggerEntity;
    local_10.InteractActionESMBBForEvent = InteractActionESMBBForEvent;
    Modify local_14;
    FC_InteractionInfoForESM& local_16 = local_14.opCall();
    if (local_16)
    {
        FECSWorldPtr local_20 = TriggerEntity.GetWorld();
        local_16.SetExpireTime((FFPTime(local_26.Time) + FFPTime(InteractActionESMBBForEvent.GetTriggerValidateTime())));
    }
    return;
}
UFUNCTION()
void CreateInteractActionTargetAbilityEvent(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget, const FName &inout CustomEventName, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FCE_OnAbilityCustomInteract local_12;
        FFPTime local_8 = FFPTime(-1);
        local_12.InteractTarget = InteractTarget;
        local_12.CustomEventName = CustomEventName;
        local_12.PointIndex = InteractTargetPointAndBehaviorIndex.GetPointIndex();
    }
    return;
}
void ExecuteInteractBeginAction(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
{
    UInteractionBehaviorBase local_4 = FInteractUtils::GetInteractionBehaviorFromEntity(TargetEntity, InteractTargetPointAndBehaviorIndex);
    if (local_4 != nullptr)
    {
        local_4.ExecuteBeginAction(SourceEntity, TargetEntity, InteractTargetPointAndBehaviorIndex, false);
    }
    return;
}
void ExecuteInteractEndAction(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
{
    UInteractionBehaviorBase local_4 = FInteractUtils::GetInteractionBehaviorFromEntity(TargetEntity, InteractTargetPointAndBehaviorIndex);
    if (local_4 != nullptr)
    {
        local_4.ExecuteEndAction(SourceEntity, TargetEntity, InteractTargetPointAndBehaviorIndex, false);
    }
    return;
}
void ExecuteInteractBeginActionPresentationOnly(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
{
    UInteractionBehaviorBase local_4 = FInteractUtils::GetInteractionBehaviorFromEntity(TargetEntity, InteractTargetPointAndBehaviorIndex);
    if (local_4 != nullptr)
    {
        local_4.ExecuteBeginAction(SourceEntity, TargetEntity, InteractTargetPointAndBehaviorIndex, true);
    }
    return;
}
void ExecuteInteractEndActionPresentationOnly(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
{
    UInteractionBehaviorBase local_4 = FInteractUtils::GetInteractionBehaviorFromEntity(TargetEntity, InteractTargetPointAndBehaviorIndex);
    if (local_4 != nullptr)
    {
        local_4.ExecuteEndAction(SourceEntity, TargetEntity, InteractTargetPointAndBehaviorIndex, true);
    }
    return;
}
void ExecuteInteractSuccessAction(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex)
{
    UInteractionBehaviorBase local_4 = FInteractUtils::GetInteractionBehaviorFromEntity(TargetEntity, InteractTargetPointAndBehaviorIndex);
    if (local_4 != nullptr)
    {
        local_4.OnInteractSuccess(SourceEntity, TargetEntity, InteractTargetPointAndBehaviorIndex);
    }
    return;
}
void ExecuteAutoInteractBeginAction(const FECSEntity &inout SourceEntity)
{
    Get local_4;
    const FC_AutoInteractSourceConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.AutoInteractBehavior.IsValid())
        {
            UInteractionBehaviorBase local_12 = local_6.AutoInteractBehavior.GetDefaultObject();
            FInteractionPointAndBehaviorIndex local_14;
            local_12.ExecuteBeginAction(SourceEntity, ENTITY_NULL, local_14, false);
        }
    }
    return;
}
void ExecuteAutoInteractEndAction(const FECSEntity &inout SourceEntity)
{
    Get local_4;
    const FC_AutoInteractSourceConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.AutoInteractBehavior.IsValid())
        {
            UInteractionBehaviorBase local_12 = local_6.AutoInteractBehavior.GetDefaultObject();
            FInteractionPointAndBehaviorIndex local_14;
            local_12.ExecuteEndAction(SourceEntity, ENTITY_NULL, local_14, false);
        }
    }
    return;
}
void ExecuteAutoInteractBeginActionPresentationOnly(const FECSEntity &inout SourceEntity)
{
    Get local_4;
    const FC_AutoInteractSourceConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.AutoInteractBehavior.IsValid())
        {
            UInteractionBehaviorBase local_12 = local_6.AutoInteractBehavior.GetDefaultObject();
            FInteractionPointAndBehaviorIndex local_14;
            local_12.ExecuteBeginAction(SourceEntity, ENTITY_NULL, local_14, true);
        }
    }
    return;
}
void ExecuteAutoInteractEndActionPresentationOnly(const FECSEntity &inout SourceEntity)
{
    Get local_4;
    const FC_AutoInteractSourceConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.AutoInteractBehavior.IsValid())
        {
            UInteractionBehaviorBase local_12 = local_6.AutoInteractBehavior.GetDefaultObject();
            FInteractionPointAndBehaviorIndex local_14;
            local_12.ExecuteEndAction(SourceEntity, ENTITY_NULL, local_14, true);
        }
    }
    return;
}
void ExecuteAutoInteractSuccessAction(const FECSEntity &inout SourceEntity)
{
    Get local_4;
    const FC_AutoInteractSourceConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.AutoInteractBehavior.IsValid())
        {
            UInteractionBehaviorBase local_12 = local_6.AutoInteractBehavior.GetDefaultObject();
            FInteractionPointAndBehaviorIndex local_14;
            local_12.OnInteractSuccess(SourceEntity, ENTITY_NULL, local_14);
        }
    }
    return;
}
bool EvaluateAutoInteractConditions(const FECSEntity &inout SourceEntity)
{
    Get local_4;
    const FC_AutoInteractSourceConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.AutoInteractBehavior.IsValid())
        {
            int local_15;
            UInteractionBehaviorBase local_12 = local_6.AutoInteractBehavior.GetDefaultObject();
            int local_13 = -1;
            local_15 = false;
            bool local_7 = local_12.InteractSourceCondition.Evaluate(SourceEntity) && local_12.CheckBehaviorConditions(SourceEntity, ENTITY_NULL);
            if (!(local_7))
            {
                local_7 = false;
            }
            else
            {
                FInteractionPoint local_204;
                local_7 = (int(local_12.CheckCustomCondition(SourceEntity, ENTITY_NULL, local_204, false, local_13, local_15)) == 0);
            }
            if (local_7)
            {
                return true;
            }
        }
    }
    return false;
}
float32 GetSourceInteractDistance(const FECSEntity &inout InteractSourceEntity)
{
    float32 local_1 = 0.0f;
    Get local_6;
    const FC_InteractSourceConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        local_1 = local_8.InteractDistance;
    }
    Get local_14;
    const FC_PawnRiddingMount& local_16 = local_14.opCall();
    if (local_16)
    {
        if (local_16.GetMountEntity().IsValid())
        {
            const FC_InteractSourceConfig& local_8_2 = local_6.opCall();
            if (local_8_2)
            {
                local_1 = FMath::Max(local_1, local_8_2.InteractDistance);
            }
        }
    }
    return local_1;
}
float32 GetSourceInteractTipDistance(const FECSEntity &inout InteractSourceEntity)
{
    float32 local_1 = 0.0f;
    Get local_6;
    const FC_InteractSourceConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        local_1 = local_8.InteractTipDistance;
    }
    Get local_14;
    const FC_PawnRiddingMount& local_16 = local_14.opCall();
    if (local_16)
    {
        if (local_16.GetMountEntity().IsValid())
        {
            const FC_InteractSourceConfig& local_8_2 = local_6.opCall();
            if (local_8_2)
            {
                local_1 = FMath::Max(local_1, local_8_2.InteractTipDistance);
            }
        }
    }
    return local_1;
}
bool CheckInteractTargetViewDir(const FVector &inout InteractPointLocation, const FClientInteractSourceCheckParam &inout InteractSourceCheckParam, const FInteractionPoint &inout InteractionPoint, const UInteractionBehaviorBase BehaviorConfig, const FVector2D &inout InteractPointScreenRatio, FCompareInteractionTargetParam &inout OutTargetParam)
{
    float32 local_20;
    const FInteractPointParam& local_2 = FInteractCompareUtils::GetInteractPointParam(InteractionPoint, BehaviorConfig);
    if (FInteractCompareUtils::UseViewOffsetRatio(local_2.SelectType))
    {
        float32 local_18;
        float32 local_14;
        float32 local_13 = float32((FMath::Abs((InteractPointScreenRatio.X * 2.0) - 1.0)));
        float32 local_5 = float32((FMath::Abs((InteractPointScreenRatio.Y * 2.0) - 1.0)));
        local_14 = local_2.ViewOffsetRangeRatioX;
        if (local_14 > 0.0f)
        {
            local_14 = local_2.ViewOffsetRangeRatioX;
            local_20 = FMath::Min(local_14, 1.0f);
        }
        else
        {
            local_20 = 1.0f;
        }
        float32 local_19 = local_2.ViewOffsetRangeRatioY;
        if (local_19 > 0.0f)
        {
            local_19 = local_2.ViewOffsetRangeRatioY;
            local_14 = FMath::Min(local_19, 1.0f);
        }
        else
        {
            local_14 = 1.0f;
        }
        if (local_13 > local_20 || (local_5 > local_14))
        {
            return false;
        }
        float32 local_17 = local_5 / local_14;
        local_19 = 1.0f;
        local_18 = 2.0f;
        local_18 = local_19 - ((FVector2f((local_13 / local_20), local_17).SizeSquared()) / local_18);
        OutTargetParam.Score = FMath::Clamp(local_18, 0.0f, 1.0f);
    }
    else
    {
        float32 local_18;
        FVector local_44 = (InteractPointLocation - InteractSourceCheckParam.ViewPosition).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        if (local_2.AngleToViewDir > 0.0f && ((local_2.AngleToViewDir < 90.0f)))
        {
            local_18 = FMath::Cos(FMath::DegreesToRadians(local_2.AngleToViewDir));
        }
        else
        {
            local_18 = -1.0f;
        }
        if (float32(local_44.DotProduct(InteractSourceCheckParam.ViewDir.Vector())) < local_18)
        {
            return false;
        }
    }
    return true;
}
EInteractionBehaviorEvaluateResult EvaluateInteractionBehaviorWithTarget(const FInteractSourceCheckBaseParam &inout InteractSourceCheckParam, const FECSEntity &inout InteractTargetEntity, const FInteractionPoint &inout InteractionPointConfig, const UInteractionBehaviorBase Behavior, const FVector &inout InteractPointLocation, const FQuat &inout InteractPointRotation, const bool bIsCheckingDuringInteracting, FCompareInteractionTargetParam &inout OutTargetParam)
{
    int local_2 = 0;
    float32 local_136;
    Get local_6;
    const FC_InteractionInfoForESM& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.GetTargetEntity().IsValid())
        {
            if (bIsCheckingDuringInteracting)
            {
                if ((FECSEntity(local_8.GetTargetEntity()) == local_2))
                {
                    return EInteractionBehaviorEvaluateResult(1);
                }
            }
            else
            {
                if (!(Behavior.bCanBeInteractedWhenInteracting))
                {
                    return EInteractionBehaviorEvaluateResult(2);
                }
            }
        }
    }
    if (Behavior.bIsSecondaryInteractTarget)
    {
        const FC_InteractionInfoForESM& local_8_2 = local_6.opCall();
        if (local_8_2)
        {
            if (!(local_8_2.GetbIsSecondaryInteractSource()))
            {
                return EInteractionBehaviorEvaluateResult(3);
            }
            if (Behavior.SecondaryInteractTargetConfig.bCheckSecondaryInteractType && (int(Behavior.SecondaryInteractTargetConfig.SecondaryInteractType) != int(local_8_2.GetInteractType())))
            {
                return EInteractionBehaviorEvaluateResult(4);
            }
            if (Behavior.SecondaryInteractTargetConfig.bCheckSecondaryInteractSubType && (int(Behavior.SecondaryInteractTargetConfig.SecondaryInteractSubType) != int(local_8_2.GetSubType())))
            {
                return EInteractionBehaviorEvaluateResult(5);
            }
        }
        else
        {
            return EInteractionBehaviorEvaluateResult(3);
        }
    }
    const FInteractPointParam& local_24 = FInteractCompareUtils::GetInteractPointParam(InteractionPointConfig, Behavior);
    Get local_52;
    FTransform local_76 = local_52.opCall().ToFTransform();
    FVector local_94 = (InteractPointLocation - local_76.GetLocation());
    float32 local_99 = float32(local_94.SizeSquared());
    float32 local_102 = FMath::Max(InteractSourceCheckParam.InteractDistance, local_24.DistanceMax);
    float32 local_95_2 = local_24.DistanceMin;
    if (local_95_2 > 0.0f && ((local_99 < FMath::Square(local_24.DistanceMin))))
    {
        return EInteractionBehaviorEvaluateResult(6);
    }
    if (local_102 > 0.0f && (local_99 > FMath::Square(local_102)))
    {
        return EInteractionBehaviorEvaluateResult(7);
    }
    float32 local_103 = float32((local_94.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector).DotProduct(local_76.GetRotation().GetForwardVector())));
    if (!(bIsCheckingDuringInteracting))
    {
        float32 local_95_3 = local_24.FaceYawAngle;
        if (local_95_3 > 0.0f)
        {
            float32 local_101 = FMath::DegreesToRadians(FMath::Min(local_24.FaceYawAngle, 180.0f));
            if (local_103 < FMath::Cos(local_101))
            {
                return EInteractionBehaviorEvaluateResult(8);
            }
        }
        if (local_24.AngleToSource > 0.0f)
        {
            float32 local_101_2 = FMath::Cos(FMath::DegreesToRadians(FMath::Min(local_24.AngleToSource, 180.0f)));
            if ((float32((local_94.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).opNeg().DotProduct(InteractPointRotation.GetForwardVector())))) < local_101_2)
            {
                return EInteractionBehaviorEvaluateResult(9);
            }
        }
        if (!(Behavior.InteractSourceCondition.Evaluate(local_2)))
        {
            return EInteractionBehaviorEvaluateResult(10);
        }
    }
    Has local_126;
    bool local_20 = local_126.opCall();
    if (local_20)
    {
        if (!(Behavior.InteractTargetCondition.Evaluate(InteractTargetEntity)))
        {
            return EInteractionBehaviorEvaluateResult(11);
        }
    }
    if (!(Behavior.CheckBehaviorConditions(local_2, InteractTargetEntity)))
    {
        return EInteractionBehaviorEvaluateResult(12);
    }
    if (Behavior.bTraceCheck)
    {
        FVector local_88(local_76.GetLocation());
        if (Behavior.TraceStartUpwardRatio != 0.0f)
        {
            GetDefaulted local_130;
            float32 local_101_3 = local_130.opCall().GetScaledHalfHeight() * Behavior.TraceStartUpwardRatio;
            local_88.Z += local_101_3;
        }
        if (!(FInteractUtils::TraceCheck(local_2, InteractTargetEntity, InteractionPointConfig, local_88, InteractPointLocation, InteractPointRotation, Behavior.bTraceDynamic)))
        {
            return EInteractionBehaviorEvaluateResult(13);
        }
    }
    if (!(FInteractCompareUtils::UseViewOffsetRatio(EInteractSelectType(local_24.SelectType))))
    {
        float32 local_101_4 = FMath::Sqrt(local_99) - 100.0f;
        float32 local_95_5 = FMath::Max(local_101_4, 0.0f);
        if (local_102 > 0.0f)
        {
            local_101_4 = 1.0f - (local_95_5 / local_102);
            local_136 = FMath::Clamp(local_101_4, 0.0f, 1.0f);
        }
        else
        {
            local_136 = 0.5f;
        }
        OutTargetParam.Score = FMath::Clamp((local_136 * 0.3f) + (((local_103 + 1.0f) / 2.0f) * 0.7f), 0.0f, 1.0f);
    }
    return EInteractionBehaviorEvaluateResult(1);
}
EInteractionBehaviorEvaluateResult EvaluateInteractionBehaviorWithTipTarget(const FInteractSourceCheckBaseParam &inout InteractSourceCheckParam, const FECSEntity &inout InteractTargetEntity, const FInteractionPoint &inout InteractionPointConfig, const UInteractionBehaviorBase Behavior, const FInteractTipParam &inout InteractTipParam, const FVector &inout InteractPointLocation, const FQuat &inout InteractPointRotation, const EInteractionBehaviorEvaluateResult PrevResult)
{
    int local_2 = 0;
    bool local_3 = false;
    bool local_5 = false;
    switch (int(PrevResult))
    {
    case 0:
    {
        local_3 = true;
        break;
    }
    case 1:
    {
        local_5 = true;
        break;
    }
    case 6:
    case 7:
    case 8:
    case 9:
    {
        break;
    }
    case 2:
    case 3:
    case 4:
    case 5:
    default:
    {
        return PrevResult;
    }
    }
    if (local_3)
    {
        Get local_12;
        const FC_InteractionInfoForESM& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.GetTargetEntity().IsValid() && !(Behavior.bCanBeInteractedWhenInteracting))
            {
                return EInteractionBehaviorEvaluateResult(2);
            }
        }
        if (Behavior.bIsSecondaryInteractTarget)
        {
            const FC_InteractionInfoForESM& local_14_2 = local_12.opCall();
            if (local_14_2)
            {
                if (!(local_14_2.GetbIsSecondaryInteractSource()))
                {
                    return EInteractionBehaviorEvaluateResult(3);
                }
                if (Behavior.SecondaryInteractTargetConfig.bCheckSecondaryInteractType && (int(Behavior.SecondaryInteractTargetConfig.SecondaryInteractType) != int(local_14_2.GetInteractType())))
                {
                    return EInteractionBehaviorEvaluateResult(4);
                }
                if (Behavior.SecondaryInteractTargetConfig.bCheckSecondaryInteractSubType && (int(Behavior.SecondaryInteractTargetConfig.SecondaryInteractSubType) != int(local_14_2.GetSubType())))
                {
                    return EInteractionBehaviorEvaluateResult(5);
                }
            }
            else
            {
                return EInteractionBehaviorEvaluateResult(3);
            }
        }
    }
    Get local_48;
    FTransform local_72 = local_48.opCall().ToFTransform();
    FVector local_90 = (InteractPointLocation - local_72.GetLocation());
    float32 local_95 = float32(local_90.SizeSquared());
    float32 local_98 = FMath::Max(InteractSourceCheckParam.InteractTipDistance, InteractTipParam.DistanceMax);
    if (InteractTipParam.DistanceMin > 0.0f && ((local_95 < FMath::Square(InteractTipParam.DistanceMin))))
    {
        return EInteractionBehaviorEvaluateResult(6);
    }
    if (local_98 > 0.0f && ((local_95 > FMath::Square(local_98))))
    {
        return EInteractionBehaviorEvaluateResult(7);
    }
    float32 local_99 = float32((local_90.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector).DotProduct(local_72.GetRotation().GetForwardVector())));
    if (InteractTipParam.FaceYawAngle > 0.0f)
    {
        float32 local_91 = FMath::DegreesToRadians(FMath::Min(InteractTipParam.FaceYawAngle, 180.0f));
        if (local_99 < FMath::Cos(local_91))
        {
            return EInteractionBehaviorEvaluateResult(8);
        }
    }
    if (InteractTipParam.AngleToSource > 0.0f)
    {
        float32 local_91_2 = FMath::Cos(FMath::DegreesToRadians(FMath::Min(InteractTipParam.AngleToSource, 180.0f)));
        if ((float32((local_90.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).opNeg().DotProduct(InteractPointRotation.GetForwardVector())))) < local_91_2)
        {
            return EInteractionBehaviorEvaluateResult(9);
        }
    }
    if (local_5)
    {
        return EInteractionBehaviorEvaluateResult(1);
    }
    if (!(Behavior.InteractSourceCondition.Evaluate(local_2)))
    {
        return EInteractionBehaviorEvaluateResult(10);
    }
    Has local_122;
    bool local_4 = local_122.opCall();
    if (local_4)
    {
        if (!(Behavior.InteractTargetCondition.Evaluate(InteractTargetEntity)))
        {
            return EInteractionBehaviorEvaluateResult(11);
        }
    }
    if (!(Behavior.CheckBehaviorConditions(local_2, InteractTargetEntity)))
    {
        return EInteractionBehaviorEvaluateResult(12);
    }
    if (Behavior.bTraceCheck)
    {
        FVector local_84(local_72.GetLocation());
        if (Behavior.TraceStartUpwardRatio != 0.0f)
        {
            GetDefaulted local_126;
            float32 local_91_3 = local_126.opCall().GetScaledHalfHeight() * Behavior.TraceStartUpwardRatio;
            local_84.Z += local_91_3;
        }
        if (!(FInteractUtils::TraceCheck(local_2, InteractTargetEntity, InteractionPointConfig, local_84, InteractPointLocation, InteractPointRotation, Behavior.bTraceDynamic)))
        {
            return EInteractionBehaviorEvaluateResult(13);
        }
    }
    return EInteractionBehaviorEvaluateResult(1);
}
bool TraceCheck(const FECSEntity &inout InteractSourceEntity, const FECSEntity &inout InteractTargetEntity, const FInteractionPoint &inout InteractionPointConfig, const FVector &inout SourceLocation, const FVector &inout InteractPointLocation, const FQuat &inout InteractPointRotation, const bool bTraceDynamic)
{
    bool local_116;
    FHitResult local_66;
    FCollisionQueryParams local_104;
    local_104.bTraceComplex = false;
    local_104.AddIgnoredEntityId(InteractSourceEntity.GetIdValue());
    Get local_110;
    const FC_PawnRiddingMount& local_112 = local_110.opCall();
    if (local_112)
    {
        local_104.AddIgnoredEntityId(local_112.GetMountEntity().GetIdValue());
    }
    local_104.AddIgnoredEntityId(InteractTargetEntity.GetIdValue());
    if (bTraceDynamic)
    {
        int local_114;
        int local_113;
        local_114 = 19;
        local_113 = local_114;
    }
    else
    {
        int local_114;
        int local_113;
        local_114 = 18;
        local_113 = local_114;
    }
    local_116 = false;
    if (InteractionPointConfig.TraceCheckOffsets.Num() > 0)
    {
        int local_113;
        local_116 = true;
        for (auto& local_132 : InteractionPointConfig.TraceCheckOffsets)
        {
            FVector local_144 = (InteractPointLocation + InteractPointRotation.RotateVector(FVector(local_132)));
            FCollisionResponseParams local_158;
            if (!(FPhysicsUtils::LineTraceSingle(InteractSourceEntity, true, EPhysicsTraceTag(36), local_66, SourceLocation, local_144, ECollisionChannel(local_113), local_104, local_158)))
            {
                local_116 = false;
                break;
            }
        }
    }
    else
    {
        int local_113;
        FCollisionResponseParams local_158;
        local_116 = FPhysicsUtils::LineTraceSingle(InteractSourceEntity, true, EPhysicsTraceTag(36), local_66, SourceLocation, InteractPointLocation, ECollisionChannel(local_113), local_104, local_158);
    }
    return !(local_116);
}
bool CheckWithinInteractSourceMaxNumber(const FECSEntity &inout InteractTargetEntity, const UInteractionBehaviorBase BehaviorConfig, const int PointIndex, const int BehaviorIndex)
{
    int local_8 = 0;
    if (FEcoCollectableUtils::IsEntityInStaticRegistry(InteractTargetEntity))
    {
        return true;
    }
    if ((local_8 && (int(BehaviorConfig.MaxInteractSourceCount) > 0)))
    {
        TArray<FECSEntity> local_20 = FInteractUtils::GetInteractingEntitiesAtPointWithBehavior(InteractTargetEntity, PointIndex, BehaviorIndex);
        int local_10 = local_20.Num();
        Get local_26;
        const FC_PendingInteractSourceCount& local_28 = local_26.opCall();
        if (local_28)
        {
            local_10 = local_10 + local_28.GetPendingCount(PointIndex, BehaviorIndex);
        }
        if (local_10 >= int(BehaviorConfig.MaxInteractSourceCount))
        {
            return false;
        }
    }
    return true;
}
bool CheckPassedInteractionCondition(const FECSEntity &inout InteractSourceEntity, const FECSEntity &inout InteractTargetEntity, const FInteractionPointAndBehaviorIndex &inout InteractTargetPointAndBehaviorIndex, const bool bIsCheckingDuringInteracting = false)
{
    int local_3;
    int local_5;
    int local_16 = 0;
    int local_22 = 0;
    int local_52 = 0;
    if ((InteractSourceEntity == InteractTargetEntity) || !(InteractSourceEntity.IsActive()) || !(InteractTargetEntity.IsActive()))
    {
        return false;
    }
    local_3 = InteractTargetPointAndBehaviorIndex.GetPointIndex();
    local_5 = InteractTargetPointAndBehaviorIndex.GetBehaviorIndex();
    UInteractionBehaviorBase local_10 = FInteractUtils::GetInteractionBehaviorFromEntity(InteractTargetEntity, InteractTargetPointAndBehaviorIndex);
    if (local_10 == nullptr)
    {
        return false;
    }
    if (local_3 < 0 || (local_3 >= local_16.InteractionPoints.Num()))
    {
        return false;
    }
    if (!(local_22) || local_22.GetbRuntimeDisabled() || !(local_22.IsRuntimePointEnabled(local_3)))
    {
        return false;
    }
    if (!(bIsCheckingDuringInteracting))
    {
        if (!(FInteractUtils::CheckWithinInteractSourceMaxNumber(InteractTargetEntity, local_10, local_3, local_5)))
        {
            return false;
        }
    }
    const FInteractionPoint& local_24 = local_16.InteractionPoints[local_3];
    FInteractSourceCheckBaseParam local_32 = FInteractUtils::BuildInteractSourceCheckBaseParam(InteractSourceEntity);
    int local_42 = int(local_24.AvailableSourceTypeMask) & int(local_32.SourceType);
    if (local_42 == 0)
    {
        return false;
    }
    FECSWorldPtr local_46 = InteractSourceEntity.GetWorld();
    FFPTime local_56 = FTransformUtils::GetPlayerRollbackTime(InteractSourceEntity, local_52);
    FVector local_62;
    FQuat local_72;
    FInteractUtils::GetInteractTargetLocationAndRotation(InteractTargetEntity, local_24, local_56, local_62, local_72, false, false);
    FCompareInteractionTargetParam local_82;
    if ((int(FInteractUtils::EvaluateInteractionBehaviorWithTarget(local_32, InteractTargetEntity, local_24, local_10, local_62, local_72, bIsCheckingDuringInteracting, local_82))) != 1)
    {
        return false;
    }
    bool local_2 = false;
    if (int(local_10.CheckCustomCondition(InteractSourceEntity, InteractTargetEntity, local_24, bIsCheckingDuringInteracting, -1, local_2)) != 0)
    {
        return false;
    }
    return true;
}
void SetInteractionBlocked(const FECSEntity &inout InteractionTarget, const bool bNewBlocked)
{
    ModifyOrAdd local_4;
    FC_BlockInteractionRuntime& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetbBlocked(bNewBlocked);
    }
    return;
}
FInteractSourceCheckBaseParam BuildInteractSourceCheckBaseParam(const FECSEntity &inout Entity)
{
    FInteractSourceCheckBaseParam local_8;
    FInteractSourceCheckBaseParam __r;
    local_8.InteractSourceEntity = Entity;
    Get local_12;
    const FC_InteractSourceConfig& local_14 = local_12.opCall();
    if (local_14)
    {
        local_8.SourceType = local_14.InteractSourceType;
        local_8.InteractDistance = local_14.InteractDistance;
        local_8.InteractTipDistance = local_14.InteractTipDistance;
    }
    Get local_22;
    if (local_22.opCall())
    {
        const FC_InteractSourceConfig& local_14_2 = local_12.opCall();
        if (local_14_2)
        {
            local_8.InteractDistance = FMath::Max(local_8.InteractDistance, local_14_2.InteractDistance);
            local_8.InteractTipDistance = FMath::Max(local_8.InteractTipDistance, local_14_2.InteractTipDistance);
        }
    }
    return __r;
}
FClientInteractSourceCheckParam BuildClientInteractSourceCheckParam(const FECSEntity &inout Entity, const FC_TransformHistory &inout TransformHistory)
{
    int local_64 = 0;
    FClientInteractSourceCheckParam __r;
    FClientInteractSourceCheckParam local_32 = FClientInteractSourceCheckParam(FInteractUtils::BuildInteractSourceCheckBaseParam(Entity));
    FECSWorldPtr local_58 = Entity.GetWorld();
    local_32.ViewPosition = FCharacterInputUtils::GetViewPosition(Entity, TransformHistory, local_64.Time);
    local_32.ViewDir = FCharacterInputUtils::GetViewInputDir(Entity, local_64.Time);
    local_32.ViewportSize = WidgetLayout::GetViewportSize(__GetWorldContext());
    return __r;
}
}
