

// NOTE: class defaults are not authored in this module: FASBossTrackingWaitForDiscovered (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FASBossTrackingWaitForDiscovered : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    FECSEntity BossEntity;
    UPROPERTY()
    float32 DiscoverDistance;
    UPROPERTY()
    float32 CheckInterval;
    UPROPERTY()
    float32 ElapsedSinceLastCheck;
    UPROPERTY()
    FECSAsyncActionDelegate_Entity OnDiscovered;

    FASBossTrackingWaitForDiscovered()
    {
        this.DiscoverDistance = 3000.0f;
        this.CheckInterval = 0.5f;
        this.ElapsedSinceLastCheck = 0.0f;
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        this.ElapsedSinceLastCheck = 0.0f;
        XLog(ELog(22), FString().Append("BossTracking AsyncAction: started, boss=").Append(this.BossEntity.ToString()).Append(", distance=").Append(this.DiscoverDistance).Append(", interval=").Append(this.CheckInterval));
        return;
    }
    bool IsTickable_Implementation()
    {
        return true;
    }
    void Tick_Implementation(const float32 DeltaTime)
    {
        bool local_3;
        this.ElapsedSinceLastCheck += DeltaTime;
        if (this.ElapsedSinceLastCheck < this.CheckInterval)
        {
            return;
        }
        this.ElapsedSinceLastCheck = 0.0f;
        if (!(this.BossEntity.IsValid()))
        {
            local_3 = true;
        }
        else
        {
            Has local_8;
            local_3 = local_8.opCall();
        }
        if (local_3)
        {
            XLog(ELog(22), "BossTracking AsyncAction: boss invalid or dead, finishing");
            this.MarkFinished();
            return;
        }
        FECSEntity local_14;
        if (::BlueprintFunctions_BossTracking::BossTracking_FindNearestPlayerNearTarget(this.BossEntity, this.DiscoverDistance, local_14))
        {
            XLog(ELog(22), FString().Append("BossTracking AsyncAction: discovered by proximity, discoverer=").Append(local_14.ToString()));
            this.OnDiscovered.Broadcast(local_14);
            this.MarkFinished();
        }
        return;
    }
    void Init(const FECSEntity &inout InBossEntity, const float32 InDiscoverDistance = 3000.0f, const float32 InCheckInterval = 0.5f)
    {
        this.BossEntity = InBossEntity;
        this.DiscoverDistance = InDiscoverDistance;
        this.CheckInterval = InCheckInterval;
        return;
    }
}

struct FASBossTrackingWaitForChangeArea : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    FECSEntity BossEntity;
    UPROPERTY()
    float32 CheckInterval;
    UPROPERTY()
    float32 ElapsedSinceLastCheck;
    UPROPERTY()
    EFlockBehaviorState LastKnownState;
    UPROPERTY()
    bool bWasInChangeArea;
    UPROPERTY()
    bool bInitialized;
    UPROPERTY()
    FECSAsyncActionDelegate OnChangeAreaStarted;
    UPROPERTY()
    FECSAsyncActionDelegate OnChangeAreaFinished;

    FASBossTrackingWaitForChangeArea()
    {
        this.CheckInterval = 0.5f;
        this.ElapsedSinceLastCheck = 0.0f;
        this.LastKnownState = EFlockBehaviorState(0);
        this.bWasInChangeArea = false;
        this.bInitialized = false;
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        this.ElapsedSinceLastCheck = 0.0f;
        this.bInitialized = false;
        this.bWasInChangeArea = false;
        XLog(ELog(22), FString().Append("BossTracking ChangeArea AsyncAction: started, boss=").Append(this.BossEntity.ToString()).Append(", interval=").Append(this.CheckInterval));
        return;
    }
    bool IsTickable_Implementation()
    {
        return true;
    }
    void Tick_Implementation(const float32 DeltaTime)
    {
        bool local_3;
        FC_EcologyFlockBehaviorComponent local_24;
        this.ElapsedSinceLastCheck += DeltaTime;
        if (this.ElapsedSinceLastCheck < (this.CheckInterval))
        {
            return;
        }
        this.ElapsedSinceLastCheck = 0.0f;
        if (!(this.BossEntity.IsValid()))
        {
            local_3 = true;
        }
        else
        {
            Has local_8;
            local_3 = local_8.opCall();
        }
        if (local_3)
        {
            XLog(ELog(22), "BossTracking ChangeArea AsyncAction: boss invalid or dead, finishing");
            this.MarkFinished();
            return;
        }
        if (!(::FEcologyUtils::GetFlockEntity(this.BossEntity).IsValid()))
        {
            return;
        }
        if (!(local_24))
        {
            return;
        }
        EFlockBehaviorState local_25 = local_24.MainState;
        if (!(this.bInitialized))
        {
            this.LastKnownState = EFlockBehaviorState(local_25);
            this.bWasInChangeArea = (int(local_25) == 2);
            this.bInitialized = true;
            return;
        }
        if (int(local_25) == int(this.LastKnownState))
        {
            return;
        }
        if (int(local_25) == 2 && (int(this.LastKnownState) != 2))
        {
            this.bWasInChangeArea = true;
            XLog(ELog(22), FString().Append("BossTracking ChangeArea AsyncAction: boss entered ChangeArea"));
            this.OnChangeAreaStarted.Broadcast();
        }
        else
        {
            if (int(this.LastKnownState) == 2 && (int(local_25) != 2))
            {
                this.bWasInChangeArea = false;
                XLog(ELog(22), FString().Append("BossTracking ChangeArea AsyncAction: boss finished ChangeArea, newState=").Append(int(local_25)));
                this.OnChangeAreaFinished.Broadcast();
            }
        }
        this.LastKnownState = EFlockBehaviorState(local_25);
        return;
    }
    void Init(const FECSEntity &inout InBossEntity, const float32 InCheckInterval = 0.5f)
    {
        this.BossEntity = InBossEntity;
        this.CheckInterval = InCheckInterval;
        return;
    }
}

struct FASBossTrackingWaitForBossSpawned : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    float32 CheckInterval;
    UPROPERTY()
    float32 ElapsedSinceLastCheck;
    UPROPERTY()
    FECSAsyncActionDelegate OnBossSpawned;

    FASBossTrackingWaitForBossSpawned()
    {
        this.CheckInterval = 0.5f;
        this.ElapsedSinceLastCheck = 0.0f;
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        this.ElapsedSinceLastCheck = 0.0f;
        TArray<FECSEntity> local_12 = ::CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(1);
        if (!(local_12.IsEmpty()))
        {
            XLog(ELog(22), FString().Append("BossTracking WaitForBossSpawned: boss already exists at Activate, entity=").Append(local_12[0].ToString()));
            this.OnBossSpawned.Broadcast();
            this.MarkFinished();
            return;
        }
        XLog(ELog(22), FString().Append("BossTracking WaitForBossSpawned: started, interval=").Append(this.CheckInterval));
        return;
    }
    bool IsTickable_Implementation()
    {
        return true;
    }
    void Tick_Implementation(const float32 DeltaTime)
    {
        this.ElapsedSinceLastCheck += DeltaTime;
        if (this.ElapsedSinceLastCheck < this.CheckInterval)
        {
            return;
        }
        this.ElapsedSinceLastCheck = 0.0f;
        TArray<FECSEntity> local_14 = ::CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(1);
        if (!(local_14.IsEmpty()))
        {
            XLog(ELog(22), FString().Append("BossTracking WaitForBossSpawned: boss spawned, entity=").Append(local_14[0].ToString()));
            this.OnBossSpawned.Broadcast();
            this.MarkFinished();
        }
        return;
    }
    void Init(const float32 InCheckInterval = 0.5f)
    {
        this.CheckInterval = InCheckInterval;
        return;
    }
}

namespace BlueprintFunctions_BossTracking
{
UFUNCTION()
void BossTracking_HideCommissionTargetMinimapIcons()
{
    TArray<FECSEntity> local_10 = CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(0);
    for (auto& local_26 : local_10)
    {
        BlueprintFunctions_BossTracking::BossTracking_HideEntityMinimapIcon(local_26);
    }
    XLog(ELog(22), FString().Append("BossTracking_HideCommissionTargetMinimapIcons: hidden ").Append(local_10.Num()).Append(" targets"));
    return;
}
UFUNCTION()
void BossTracking_ShowCommissionTargetMinimapIcons()
{
    TArray<FECSEntity> local_10 = CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(0);
    for (auto& local_26 : local_10)
    {
        BlueprintFunctions_BossTracking::BossTracking_ShowEntityMinimapIcon(local_26);
    }
    XLog(ELog(22), FString().Append("BossTracking_ShowCommissionTargetMinimapIcons: shown ").Append(local_10.Num()).Append(" targets"));
    return;
}
UFUNCTION()
void BossTracking_HideEntityMinimapIcon(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Entity.AddGameplayTag(GameplayTags::Level_Prop_Invisible, NAME_None);
    return;
}
UFUNCTION()
void BossTracking_ShowEntityMinimapIcon(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    Entity.RemoveGameplayTag(GameplayTags::Level_Prop_Invisible, NAME_None);
    return;
}
UFUNCTION()
void BossTracking_GetCommissionTargetEntities(TArray<FECSEntity> &out Targets)
{
    TArray<FECSEntity> local_4;
    Targets = local_4;
    Targets = CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(0);
    return;
}
UFUNCTION()
TDataObjectPtr<FCommissionEntryRuleConfig> BossTracking_GetEntryRuleConfig()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_CommissionDSGlobalInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.EntryRuleConfig;
    }
    return TDataObjectPtr<FCommissionEntryRuleConfig>(nullptr);
}
UFUNCTION()
bool BossTracking_IsBossTrackingRule()
{
    return BlueprintFunctions_BossTracking::BossTracking_GetEntryRuleConfig().IsSet() && (0 == 2);
}
UFUNCTION()
bool BossTracking_CheckAnyPlayerNearTarget(const FECSEntity &inout TargetEntity, const float32 DiscoverDistance = 3000.0f)
{
    Has local_6;
    int local_140 = 0;
    if (!(TargetEntity.IsValid()) || !(local_6.opCall()))
    {
        return false;
    }
    Get local_18;
    FVector local_14 = local_18.opCall().GetPosition();
    float32 local_20 = DiscoverDistance * DiscoverDistance;
    FECSRuntimeView local_60 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_64;
    local_64.opCall();
    FECSRuntimeViewIterator local_98 = local_60.Iterator();
    for (; local_98.CanProceed;)
    {
        local_98.Proceed();
        if (!(local_140.GetPlayerPawnEntity().IsValid()) || !(local_6.opCall()))
        {
            continue;
        }
        if (float32(local_14.DistSquared(FVector(local_18.opCall().GetPosition()))) <= local_20)
        {
            return true;
        }
    }
    return false;
}
UFUNCTION()
bool BossTracking_FindNearestPlayerNearTarget(const FECSEntity &inout TargetEntity, const float32 DiscoverDistance, FECSEntity &out NearestPlayerEntity)
{
    Has local_10;
    FECSEntity local_4;
    int local_146 = 0;
    NearestPlayerEntity = local_4;
    if (!(TargetEntity.IsValid()) || !(local_10.opCall()))
    {
        return false;
    }
    Get local_22;
    FVector local_18 = local_22.opCall().GetPosition();
    float32 local_24 = DiscoverDistance * DiscoverDistance;
    float32 local_25 = 3.4028235e38f;
    FECSRuntimeView local_66 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_70;
    local_70.opCall();
    FECSRuntimeViewIterator local_104 = local_66.Iterator();
    for (; local_104.CanProceed;)
    {
        local_104.Proceed();
        if (!(local_146.GetPlayerPawnEntity().IsValid()) || !(local_10.opCall()))
        {
            continue;
        }
        float32 local_23 = float32(local_18.DistSquared(FVector(local_22.opCall().GetPosition())));
        if (local_23 <= local_24 && (local_23 < local_25))
        {
            local_25 = local_23;
            NearestPlayerEntity = local_146.GetPlayerPawnEntity();
        }
    }
    return NearestPlayerEntity.IsValid();
}
UFUNCTION()
bool BossTracking_CheckAnyTargetDiscovered(const float32 DiscoverDistance = 3000.0f, FECSEntity &out DiscoveredTarget = FECSEntity())
{
    FECSEntity local_4;
    DiscoveredTarget = local_4;
    TArray<FECSEntity> local_14 = CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(0);
    for (auto& local_30 : local_14)
    {
        if (BlueprintFunctions_BossTracking::BossTracking_CheckAnyPlayerNearTarget(local_30, DiscoverDistance))
        {
            DiscoveredTarget = local_30;
            return true;
        }
    }
    return false;
}
UFUNCTION()
bool BossTracking_IsBossInCombat(const FECSEntity &inout BossEntity)
{
    if (!(BossEntity.IsValid()))
    {
        return false;
    }
    Get local_6;
    const FC_AITargetingV2& local_8 = local_6.opCall();
    if (local_8)
    {
        return (local_8.TargetsHostilityMap.Num() > 0);
    }
    return false;
}
UFUNCTION()
void BossTracking_ShowTrackingArea(const FVector &inout WorldCenter, const float32 Radius)
{
    int local_20 = 0;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Has local_8;
    bool local_9 = local_8.opCall();
    bool local_10 = false;
    if (local_9)
    {
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        Get local_14;
        local_10 = local_14.opCall().GetbVisible();
    }
    FECSWorldPtr local_4_3 = ECS::GetECSWorld();
    local_20.SetbVisible(true);
    local_20.SetWorldCenter(MinimapUtils::GamePositionToMapPosition(WorldCenter));
    local_20.SetRadius(Radius);
    XLog(ELog(22), FString().Append("[DIAG-BossTrack] ShowTrackingArea: existed=").Append(local_9).Append(", wasVisible=").Append(local_10).Append(", center=").Append(WorldCenter).Append(", mapCenter=").Append(local_20.GetWorldCenter()).Append(", radius=").Append(Radius));
    return;
}
UFUNCTION()
void BossTracking_ClearTrackingArea()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_BossTrackingArea& local_8 = local_6.opCall();
    if (local_8)
    {
        bool local_10;
        local_10 = local_8.GetbVisible();
        local_8.SetbVisible(false);
        XLog(ELog(22), FString().Append("[DIAG-BossTrack] ClearTrackingArea: wasVisible=").Append(local_10));
    }
    else
    {
        XWarning(ELog(22), "[DIAG-BossTrack] ClearTrackingArea: singleton does NOT exist, skip");
    }
    return;
}
UFUNCTION()
void BossTracking_UpdateTrackingArea(const FVector &inout NewWorldCenter, const float32 NewRadius)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_BossTrackingArea& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.SetWorldCenter(MinimapUtils::GamePositionToMapPosition(NewWorldCenter));
        local_8.SetRadius(NewRadius);
        XLog(ELog(22), FString().Append("[DIAG-BossTrack] UpdateTrackingArea: mapCenter=").Append(local_8.GetWorldCenter()).Append(", radius=").Append(NewRadius));
    }
    return;
}
UFUNCTION()
bool BossTracking_RefreshTrackingAreaFromVolume(const FECSEntity &inout BossEntity, const float32 FallbackRadius = 5000.0f)
{
    Has local_6;
    if (!(BossEntity.IsValid()) || !(local_6.opCall()))
    {
        return false;
    }
    Get local_18;
    FVector local_14 = local_18.opCall().GetPosition();
    if (BlueprintFunctions_BossTracking::BossTracking_ShowTrackingAreaFromVolume(local_14))
    {
        return true;
    }
    BlueprintFunctions_BossTracking::BossTracking_ShowTrackingArea(local_14, FallbackRadius);
    return true;
}
UFUNCTION()
bool BossTracking_IsTrackingAreaVisible()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_BossTrackingArea& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.GetbVisible();
    }
    return false;
}
UFUNCTION()
bool BossTracking_ShowTrackingAreaFromVolume(const FVector &inout BossWorldPosition)
{
    float32 local_7;
    FVector local_6;
    if (!(BossTrackingVolumeUtils::PickRandomOverlappingVolumeCircle(BossWorldPosition, local_6, local_7)))
    {
        return false;
    }
    BlueprintFunctions_BossTracking::BossTracking_ShowTrackingArea(local_6, local_7);
    return true;
}
}
namespace BossTrackingVolumeUtils
{
void FindOverlappingTrackingVolumes(const FVector &inout WorldPosition, TArray<ABossTrackingVolume> &out OverlappingVolumes)
{
    TArray<ABossTrackingVolume> local_4;
    OverlappingVolumes = local_4;
    TArray<ABossTrackingVolume> local_8;
    GetAllActorsOfClass(local_8);
    for (auto local_24 : local_8)
    {
        if (local_24 == nullptr)
        {
            continue;
        }
        if (local_24.QuickEncompassesPoint(WorldPosition))
        {
            OverlappingVolumes.Add(local_24);
        }
    }
    return;
}
bool PickRandomOverlappingVolumeCircle(const FVector &inout WorldPosition, FVector &out Center, float32 &out Radius)
{
    FVector local_6;
    Center = local_6;
    Radius = 0.0f;
    TArray<ABossTrackingVolume> local_12 = TArray<ABossTrackingVolume>();
    BossTrackingVolumeUtils::FindOverlappingTrackingVolumes(WorldPosition, local_12);
    if (local_12.Num() == 0)
    {
        XWarning(ELog(22), FString().Append("BossTrackingVolumeUtils: no volume overlaps position ").Append(WorldPosition));
        Center = FVector::ZeroVector;
        Radius = 0.0f;
        return false;
    }
    ABossTrackingVolume local_26 = local_12[FMath::RandRange(0, (local_12.Num() - 1))];
    FVector2D local_34 = local_26.GetBoundsCenter2D();
    Center = FVector(local_34.X, local_34.Y, 0.0);
    Radius = local_26.GetMinEnclosingCircleRadius();
    XLog(ELog(22), FString().Append("BossTrackingVolumeUtils: picked ").Append(local_26.GetName()).Append(" from ").Append(local_12.Num()).Append(" candidates, center=").Append(Center).Append(", radius=").Append(Radius));
    return true;
}
}
