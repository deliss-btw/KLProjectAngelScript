
namespace __INTENRAL_FC_GuidingPathPoints_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathPoints> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathPoints>();
    const FC_GuidingPathPoints DefaultValue = FC_GuidingPathPoints();
}
namespace __INTENRAL_FC_GuidingPathUpdateInfo_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathUpdateInfo> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathUpdateInfo>();
    const FC_GuidingPathUpdateInfo DefaultValue = FC_GuidingPathUpdateInfo();
}
namespace __INTENRAL_FC_GuidingPathTarget_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathTarget> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathTarget>();
    const FC_GuidingPathTarget DefaultValue = FC_GuidingPathTarget();
}
namespace __INTENRAL_FC_PendingRemoveGuidingPathTargetTag_NS
{
    const TECSComponentDerivedPtr<FC_PendingRemoveGuidingPathTargetTag> DerivedPtr = TECSComponentDerivedPtr<FC_PendingRemoveGuidingPathTargetTag>();
    const FC_PendingRemoveGuidingPathTargetTag DefaultValue = FC_PendingRemoveGuidingPathTargetTag();
}
namespace __INTENRAL_FC_SetLevelSpotConfigForGuidingPathTargetDeferTag_NS
{
    const TECSComponentDerivedPtr<FC_SetLevelSpotConfigForGuidingPathTargetDeferTag> DerivedPtr = TECSComponentDerivedPtr<FC_SetLevelSpotConfigForGuidingPathTargetDeferTag>();
    const FC_SetLevelSpotConfigForGuidingPathTargetDeferTag DefaultValue = FC_SetLevelSpotConfigForGuidingPathTargetDeferTag();
}
namespace __INTENRAL_FC_GuidingPathTargetActor_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathTargetActor> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathTargetActor>();
    const FC_GuidingPathTargetActor DefaultValue = FC_GuidingPathTargetActor();
}
namespace __INTENRAL_FC_GuidingSplineActor_NS
{
    const TECSComponentDerivedPtr<FC_GuidingSplineActor> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingSplineActor>();
    const FC_GuidingSplineActor DefaultValue = FC_GuidingSplineActor();
}
namespace __INTENRAL_FC_GuidingPathDrapeState_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathDrapeState> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathDrapeState>();
    const FC_GuidingPathDrapeState DefaultValue = FC_GuidingPathDrapeState();
}
namespace __INTENRAL_FC_GuidingPathShowCooldown_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathShowCooldown> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathShowCooldown>();
    const FC_GuidingPathShowCooldown DefaultValue = FC_GuidingPathShowCooldown();
}
namespace __INTENRAL_FC_GuidingPathRequestThrottle_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathRequestThrottle> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathRequestThrottle>();
    const FC_GuidingPathRequestThrottle DefaultValue = FC_GuidingPathRequestThrottle();
}
namespace __INTENRAL_FC_GuidingPathManualUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathManualUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathManualUpdateTag>();
    const FC_GuidingPathManualUpdateTag DefaultValue = FC_GuidingPathManualUpdateTag();
}
namespace __INTENRAL_FC_GuidingPathFailTipsCooldown_NS
{
    const TECSComponentDerivedPtr<FC_GuidingPathFailTipsCooldown> DerivedPtr = TECSComponentDerivedPtr<FC_GuidingPathFailTipsCooldown>();
    const FC_GuidingPathFailTipsCooldown DefaultValue = FC_GuidingPathFailTipsCooldown();
}
namespace __INTENRAL_FC_RegionPathNodeTag_NS
{
    const TECSComponentDerivedPtr<FC_RegionPathNodeTag> DerivedPtr = TECSComponentDerivedPtr<FC_RegionPathNodeTag>();
    const FC_RegionPathNodeTag DefaultValue = FC_RegionPathNodeTag();
}
namespace __INTENRAL_FCE_RequestGuidingPathEvent_NS
{
    const TECSEventDerivedPtr<FCE_RequestGuidingPathEvent> DerivedPtr = TECSEventDerivedPtr<FCE_RequestGuidingPathEvent>();
}
namespace __INTENRAL_FCE_StopGuidingPathEvent_NS
{
    const TECSEventDerivedPtr<FCE_StopGuidingPathEvent> DerivedPtr = TECSEventDerivedPtr<FCE_StopGuidingPathEvent>();
}
namespace __INTENRAL_FCE_ResetGuidingPathNiagaraEvent_NS
{
    const TECSEventDerivedPtr<FCE_ResetGuidingPathNiagaraEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ResetGuidingPathNiagaraEvent>();
}
namespace __INTENRAL_FCE_ResetGuidingTargetEffectEvent_NS
{
    const TECSEventDerivedPtr<FCE_ResetGuidingTargetEffectEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ResetGuidingTargetEffectEvent>();
}
namespace __INTENRAL_FCE_GuidingPathServerUpdate_NS
{
    const TECSEventDerivedPtr<FCE_GuidingPathServerUpdate> DerivedPtr = TECSEventDerivedPtr<FCE_GuidingPathServerUpdate>();
}
namespace __INTENRAL_FCE_GuidingPathFindFailedEvent_NS
{
    const TECSEventDerivedPtr<FCE_GuidingPathFindFailedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_GuidingPathFindFailedEvent>();

}
struct FC_GuidingPathPoints : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bLastFindPathSuccess;
    UPROPERTY()
    bool m_bGoodSourceLocation;
    UPROPERTY()
    bool m_bGoodTargetlocation;
    UPROPERTY()
    FVector m_TargetLocation;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> m_TargetEntityPrefabConfig;
    UPROPERTY()
    TArray<FVector> m_Points;
    UPROPERTY()
    int m_PathSource;
    UPROPERTY()
    bool m_bStraightened;

    FC_GuidingPathPoints()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_GuidingPathPoints(const FC_GuidingPathPoints &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_GuidingPathPoints opAssign(const FC_GuidingPathPoints &inout Other)
    {
        FC_GuidingPathPoints __r;
        this.SetbLastFindPathSuccess(Other.GetbLastFindPathSuccess());
        this.SetbGoodSourceLocation(Other.GetbGoodSourceLocation());
        this.SetbGoodTargetlocation(Other.GetbGoodTargetlocation());
        this.SetTargetLocation(Other.GetTargetLocation());
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetTargetEntityPrefabConfig(Other.GetTargetEntityPrefabConfig());
        this.SetPoints(Other.GetPoints());
        this.SetPathSource(Other.GetPathSource());
        this.SetbStraightened(Other.GetbStraightened());
        return __r;
    }
    bool GetbLastFindPathSuccess() const property
    {
        return this.m_bLastFindPathSuccess;
    }
    void SetbLastFindPathSuccess(const bool __Value) property
    {
        if (!(this.m_bLastFindPathSuccess) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bLastFindPathSuccess = __Value;
        return;
    }
    bool GetbGoodSourceLocation() const property
    {
        return this.m_bGoodSourceLocation;
    }
    void SetbGoodSourceLocation(const bool __Value) property
    {
        if (!(this.m_bGoodSourceLocation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bGoodSourceLocation = __Value;
        return;
    }
    bool GetbGoodTargetlocation() const property
    {
        return this.m_bGoodTargetlocation;
    }
    void SetbGoodTargetlocation(const bool __Value) property
    {
        if (!(this.m_bGoodTargetlocation) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bGoodTargetlocation = __Value;
        return;
    }
    const FVector GetTargetLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetLocation() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TargetLocation = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TargetEntity = __Value;
        return;
    }
    const TDataObjectPtr<FBasePrefabConfig> GetTargetEntityPrefabConfig() const property
    {
        const TDataObjectPtr<FBasePrefabConfig> __r;
        return __r;
    }
    TDataObjectPtr<FBasePrefabConfig> GetModify_TargetEntityPrefabConfig() property
    {
        TDataObjectPtr<FBasePrefabConfig> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetTargetEntityPrefabConfig(const TDataObjectPtr<FBasePrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_TargetEntityPrefabConfig = __Value;
        return;
    }
    TArray<FVector> GetPoints() const property
    {
        TArray<FVector> __r;
        return __r;
    }
    TArray<FVector> GetModify_Points() property
    {
        TArray<FVector> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetPoints(const TArray<FVector> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_Points = __Value;
        return;
    }
    int GetPathSource() const property
    {
        return this.m_PathSource;
    }
    void SetPathSource(const int __Value) property
    {
        if (this.m_PathSource == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_PathSource = __Value;
        return;
    }
    bool GetbStraightened() const property
    {
        return this.m_bStraightened;
    }
    void SetbStraightened(const bool __Value) property
    {
        if (!(this.m_bStraightened) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bStraightened = __Value;
        return;
    }
}

struct FC_GuidingPathUpdateInfo : FECSComponent
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FVector TargetLocation;
    UPROPERTY()
    bool bHasDownwardResolvedTarget = false;
    UPROPERTY()
    FECSEntity DownwardResolveTargetEntity;
    UPROPERTY()
    FVector DownwardResolveSourceLocation;
    UPROPERTY()
    FVector DownwardResolvedTargetLocation;
    UPROPERTY()
    FVector DownwardResolvePlayerLocation;
    UPROPERTY()
    FFPTime LastUpdateTime = -1;
    UPROPERTY()
    FVector LastUpdateLocation;
    UPROPERTY()
    bool bPendingManualResult = false;


}

struct FC_GuidingPathTarget : FECSComponent
{
    UPROPERTY()
    TArray<FECSEntity> GuidingPlayers;

    FC_GuidingPathTarget()
    {
        return;
    }
}

struct FC_PendingRemoveGuidingPathTargetTag : FECSComponent
{
    FC_PendingRemoveGuidingPathTargetTag()
    {
        return;
    }
}

struct FC_SetLevelSpotConfigForGuidingPathTargetDeferTag : FECSComponent
{
    FC_SetLevelSpotConfigForGuidingPathTargetDeferTag()
    {
        return;
    }
}

struct FCE_RequestGuidingPathEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector2D TargetLocation2D;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FVector TargetLocation;
    UPROPERTY()
    bool bHasTargetLocation = false;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_StopGuidingPathEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_StopGuidingPathEvent()
    {
        return;
    }
}

struct FC_GuidingPathTargetActor : FECSComponent
{
    UPROPERTY()
    TWeakObjectPtr<AActor> TargetActor;
    UPROPERTY()
    TWeakObjectPtr<UNiagaraComponent> NiagaraComponent;
    UPROPERTY()
    FFPTime LastActivateTime = -1;
    UPROPERTY()
    bool bIsFirstDisplay;
    UPROPERTY()
    bool bIsHiddenByDistance = false;


}

struct FC_GuidingSplineActor : FECSComponent
{
    UPROPERTY()
    TWeakObjectPtr<AGuidingSplineActor> GuidingSplineActor;
    UPROPERTY()
    TWeakObjectPtr<USplineComponent> SplineComponent;
    UPROPERTY()
    TWeakObjectPtr<UNiagaraComponent> NiagaraComponent;
    UPROPERTY()
    FFPTime LastActivateTime = -1;
    UPROPERTY()
    int ActivateTimesRemain = 0;


}

struct FC_GuidingPathDrapeState : FECSComponent
{
    UPROPERTY()
    TArray<FVector> RawSamples;
    UPROPERTY()
    TArray<FVector> DrapedPoints;
    UPROPERTY()
    TArray<int> SampleHit;
    UPROPERTY()
    int Cursor = 0;
    UPROPERTY()
    int Phase = 0;
    UPROPERTY()
    FVector StartSnapshot;
    UPROPERTY()
    int PathSourceSnapshot = 0;
    UPROPERTY()
    int RefreshQueued = 0;


}

struct FC_GuidingPathShowCooldown : FECSComponent
{
    UPROPERTY()
    FFPTime LastShowTime;

    FC_GuidingPathShowCooldown()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_GuidingPathRequestThrottle : FECSComponent
{
    UPROPERTY()
    FFPTime LastFireTime;
    UPROPERTY()
    bool bHasNewRequest;
    UPROPERTY()
    bool bPending;
    UPROPERTY()
    int PendingKind;
    UPROPERTY()
    FECSEntity PendingTargetEntity;
    UPROPERTY()
    FVector2D PendingTargetLocation2D;
    UPROPERTY()
    FVector PendingTargetLocation;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> PendingMarkConfig;

    FC_GuidingPathRequestThrottle()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_GuidingPathManualUpdateTag : FECSComponent
{
    FC_GuidingPathManualUpdateTag()
    {
        return;
    }
}

struct FC_GuidingPathFailTipsCooldown : FECSComponent
{
    UPROPERTY()
    FFPTime LastTipTime;

    FC_GuidingPathFailTipsCooldown()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FCE_ResetGuidingPathNiagaraEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ResetGuidingPathNiagaraEvent()
    {
        return;
    }
}

struct FCE_ResetGuidingTargetEffectEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ResetGuidingTargetEffectEvent()
    {
        return;
    }
}

struct FCE_GuidingPathServerUpdate : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_GuidingPathServerUpdate()
    {
        return;
    }
}

struct FCE_GuidingPathFindFailedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector TargetLocation;

    FCE_GuidingPathFindFailedEvent()
    {
        return;
    }
}

struct FC_RegionPathNodeTag : FECSComponent
{
    FC_RegionPathNodeTag()
    {
        return;
    }
}

namespace ECSFunc_FC_GuidingPathPoints
{
UFUNCTION()
bool HasGuidingPathPoints(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathPoints);
}
FC_GuidingPathPoints& AssignGuidingPathPoints(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout DefaultValue = FC_GuidingPathPoints())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathPoints, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathPoints_BP(const FECSEntity &inout Entity, const FC_GuidingPathPoints &inout DefaultValue = FC_GuidingPathPoints())
{
    ECSFunc_FC_GuidingPathPoints::AssignGuidingPathPoints(Entity, DefaultValue);
    return;
}
FC_GuidingPathPoints& ModifyGuidingPathPoints(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathPoints));
    return local_12.GetComp();
}
FC_GuidingPathPoints& ModifyOrAddGuidingPathPoints(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathPoints));
    return local_12.GetComp();
}
const FC_GuidingPathPoints& GetGuidingPathPoints(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathPoints));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathPoints GetGuidingPathPoints_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GuidingPathPoints& local_4 = ECSFunc_FC_GuidingPathPoints::GetGuidingPathPoints(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GuidingPathPoints();
}
const FC_GuidingPathPoints GetDefaultedGuidingPathPoints(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathPoints __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathPoints);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathPoints GetDefaultedGuidingPathPoints_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GuidingPathPoints::GetDefaultedGuidingPathPoints(Entity);
}
UFUNCTION()
bool RemoveGuidingPathPoints(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathPoints);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathPointsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathPoints, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathPointsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathPoints, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathPointsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathPoints, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathPointsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathPoints, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathPointsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathPoints, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathPointsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathPoints, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathPointsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathPoints, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathPointsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathPoints, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathUpdateInfo
{
UFUNCTION()
bool HasGuidingPathUpdateInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathUpdateInfo);
}
FC_GuidingPathUpdateInfo& AssignGuidingPathUpdateInfo(const FECSEntity &inout Entity, const FC_GuidingPathUpdateInfo &inout DefaultValue = FC_GuidingPathUpdateInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathUpdateInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathUpdateInfo_BP(const FECSEntity &inout Entity, const FC_GuidingPathUpdateInfo &inout DefaultValue = FC_GuidingPathUpdateInfo())
{
    ECSFunc_FC_GuidingPathUpdateInfo::AssignGuidingPathUpdateInfo(Entity, DefaultValue);
    return;
}
FC_GuidingPathUpdateInfo& ModifyGuidingPathUpdateInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathUpdateInfo));
    return local_12.GetComp();
}
FC_GuidingPathUpdateInfo& ModifyOrAddGuidingPathUpdateInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathUpdateInfo));
    return local_12.GetComp();
}
const FC_GuidingPathUpdateInfo& GetGuidingPathUpdateInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathUpdateInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathUpdateInfo GetGuidingPathUpdateInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathUpdateInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathUpdateInfo::GetGuidingPathUpdateInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathUpdateInfo GetDefaultedGuidingPathUpdateInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathUpdateInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathUpdateInfo);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathUpdateInfo GetDefaultedGuidingPathUpdateInfo_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathUpdateInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathUpdateInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathUpdateInfo);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathUpdateInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathUpdateInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathUpdateInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathUpdateInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathUpdateInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathUpdateInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathUpdateInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathUpdateInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathUpdateInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathUpdateInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathUpdateInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathUpdateInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathUpdateInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathUpdateInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathUpdateInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathUpdateInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathTarget
{
UFUNCTION()
bool HasGuidingPathTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTarget);
}
FC_GuidingPathTarget& AssignGuidingPathTarget(const FECSEntity &inout Entity, const FC_GuidingPathTarget &inout DefaultValue = FC_GuidingPathTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathTarget_BP(const FECSEntity &inout Entity, const FC_GuidingPathTarget &inout DefaultValue = FC_GuidingPathTarget())
{
    ECSFunc_FC_GuidingPathTarget::AssignGuidingPathTarget(Entity, DefaultValue);
    return;
}
FC_GuidingPathTarget& ModifyGuidingPathTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTarget));
    return local_12.GetComp();
}
FC_GuidingPathTarget& ModifyOrAddGuidingPathTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTarget));
    return local_12.GetComp();
}
const FC_GuidingPathTarget& GetGuidingPathTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathTarget GetGuidingPathTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathTarget __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathTarget::GetGuidingPathTarget(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathTarget GetDefaultedGuidingPathTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTarget);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathTarget GetDefaultedGuidingPathTarget_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathTarget __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTarget);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PendingRemoveGuidingPathTargetTag
{
UFUNCTION()
bool HasPendingRemoveGuidingPathTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PendingRemoveGuidingPathTargetTag);
}
FC_PendingRemoveGuidingPathTargetTag& AssignPendingRemoveGuidingPathTargetTag(const FECSEntity &inout Entity, const FC_PendingRemoveGuidingPathTargetTag &inout DefaultValue = FC_PendingRemoveGuidingPathTargetTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PendingRemoveGuidingPathTargetTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPendingRemoveGuidingPathTargetTag_BP(const FECSEntity &inout Entity, const FC_PendingRemoveGuidingPathTargetTag &inout DefaultValue = FC_PendingRemoveGuidingPathTargetTag())
{
    ECSFunc_FC_PendingRemoveGuidingPathTargetTag::AssignPendingRemoveGuidingPathTargetTag(Entity, DefaultValue);
    return;
}
FC_PendingRemoveGuidingPathTargetTag& ModifyPendingRemoveGuidingPathTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PendingRemoveGuidingPathTargetTag));
    return local_12.GetComp();
}
FC_PendingRemoveGuidingPathTargetTag& ModifyOrAddPendingRemoveGuidingPathTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PendingRemoveGuidingPathTargetTag));
    return local_12.GetComp();
}
const FC_PendingRemoveGuidingPathTargetTag& GetPendingRemoveGuidingPathTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PendingRemoveGuidingPathTargetTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PendingRemoveGuidingPathTargetTag GetPendingRemoveGuidingPathTargetTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PendingRemoveGuidingPathTargetTag& local_4 = ECSFunc_FC_PendingRemoveGuidingPathTargetTag::GetPendingRemoveGuidingPathTargetTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PendingRemoveGuidingPathTargetTag();
}
const FC_PendingRemoveGuidingPathTargetTag GetDefaultedPendingRemoveGuidingPathTargetTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PendingRemoveGuidingPathTargetTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PendingRemoveGuidingPathTargetTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PendingRemoveGuidingPathTargetTag GetDefaultedPendingRemoveGuidingPathTargetTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PendingRemoveGuidingPathTargetTag::GetDefaultedPendingRemoveGuidingPathTargetTag(Entity);
}
UFUNCTION()
bool RemovePendingRemoveGuidingPathTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PendingRemoveGuidingPathTargetTag);
}
}
FECSMonitorRuntimeView __GetMonitorPendingRemoveGuidingPathTargetTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingRemoveGuidingPathTargetTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingRemoveGuidingPathTargetTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingRemoveGuidingPathTargetTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingRemoveGuidingPathTargetTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPendingRemoveGuidingPathTargetTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingRemoveGuidingPathTargetTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingRemoveGuidingPathTargetTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PendingRemoveGuidingPathTargetTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SetLevelSpotConfigForGuidingPathTargetDeferTag
{
UFUNCTION()
bool HasSetLevelSpotConfigForGuidingPathTargetDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SetLevelSpotConfigForGuidingPathTargetDeferTag);
}
FC_SetLevelSpotConfigForGuidingPathTargetDeferTag& AssignSetLevelSpotConfigForGuidingPathTargetDeferTag(const FECSEntity &inout Entity, const FC_SetLevelSpotConfigForGuidingPathTargetDeferTag &inout DefaultValue = FC_SetLevelSpotConfigForGuidingPathTargetDeferTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSetLevelSpotConfigForGuidingPathTargetDeferTag_BP(const FECSEntity &inout Entity, const FC_SetLevelSpotConfigForGuidingPathTargetDeferTag &inout DefaultValue = FC_SetLevelSpotConfigForGuidingPathTargetDeferTag())
{
    ECSFunc_FC_SetLevelSpotConfigForGuidingPathTargetDeferTag::AssignSetLevelSpotConfigForGuidingPathTargetDeferTag(Entity, DefaultValue);
    return;
}
FC_SetLevelSpotConfigForGuidingPathTargetDeferTag& ModifySetLevelSpotConfigForGuidingPathTargetDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SetLevelSpotConfigForGuidingPathTargetDeferTag));
    return local_12.GetComp();
}
FC_SetLevelSpotConfigForGuidingPathTargetDeferTag& ModifyOrAddSetLevelSpotConfigForGuidingPathTargetDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SetLevelSpotConfigForGuidingPathTargetDeferTag));
    return local_12.GetComp();
}
const FC_SetLevelSpotConfigForGuidingPathTargetDeferTag& GetSetLevelSpotConfigForGuidingPathTargetDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SetLevelSpotConfigForGuidingPathTargetDeferTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SetLevelSpotConfigForGuidingPathTargetDeferTag GetSetLevelSpotConfigForGuidingPathTargetDeferTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SetLevelSpotConfigForGuidingPathTargetDeferTag& local_4 = ECSFunc_FC_SetLevelSpotConfigForGuidingPathTargetDeferTag::GetSetLevelSpotConfigForGuidingPathTargetDeferTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SetLevelSpotConfigForGuidingPathTargetDeferTag();
}
const FC_SetLevelSpotConfigForGuidingPathTargetDeferTag GetDefaultedSetLevelSpotConfigForGuidingPathTargetDeferTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SetLevelSpotConfigForGuidingPathTargetDeferTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SetLevelSpotConfigForGuidingPathTargetDeferTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_SetLevelSpotConfigForGuidingPathTargetDeferTag GetDefaultedSetLevelSpotConfigForGuidingPathTargetDeferTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SetLevelSpotConfigForGuidingPathTargetDeferTag::GetDefaultedSetLevelSpotConfigForGuidingPathTargetDeferTag(Entity);
}
UFUNCTION()
bool RemoveSetLevelSpotConfigForGuidingPathTargetDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SetLevelSpotConfigForGuidingPathTargetDeferTag);
}
}
FECSMonitorRuntimeView __GetMonitorSetLevelSpotConfigForGuidingPathTargetDeferTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSetLevelSpotConfigForGuidingPathTargetDeferTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSetLevelSpotConfigForGuidingPathTargetDeferTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSetLevelSpotConfigForGuidingPathTargetDeferTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSetLevelSpotConfigForGuidingPathTargetDeferTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSetLevelSpotConfigForGuidingPathTargetDeferTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSetLevelSpotConfigForGuidingPathTargetDeferTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSetLevelSpotConfigForGuidingPathTargetDeferTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SetLevelSpotConfigForGuidingPathTargetDeferTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathTargetActor
{
UFUNCTION()
bool HasGuidingPathTargetActor(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetActor);
}
FC_GuidingPathTargetActor& AssignGuidingPathTargetActor(const FECSEntity &inout Entity, const FC_GuidingPathTargetActor &inout DefaultValue = FC_GuidingPathTargetActor())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetActor, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathTargetActor_BP(const FECSEntity &inout Entity, const FC_GuidingPathTargetActor &inout DefaultValue = FC_GuidingPathTargetActor())
{
    ECSFunc_FC_GuidingPathTargetActor::AssignGuidingPathTargetActor(Entity, DefaultValue);
    return;
}
FC_GuidingPathTargetActor& ModifyGuidingPathTargetActor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetActor));
    return local_12.GetComp();
}
FC_GuidingPathTargetActor& ModifyOrAddGuidingPathTargetActor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetActor));
    return local_12.GetComp();
}
const FC_GuidingPathTargetActor& GetGuidingPathTargetActor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetActor));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathTargetActor GetGuidingPathTargetActor_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathTargetActor __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathTargetActor::GetGuidingPathTargetActor(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathTargetActor GetDefaultedGuidingPathTargetActor(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathTargetActor __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetActor);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathTargetActor GetDefaultedGuidingPathTargetActor_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathTargetActor __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathTargetActor(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathTargetActor);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetActorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathTargetActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetActorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathTargetActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetActorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathTargetActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetActorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathTargetActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathTargetActorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathTargetActor, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathTargetActorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathTargetActor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathTargetActorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathTargetActor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathTargetActorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathTargetActor, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingSplineActor
{
UFUNCTION()
bool HasGuidingSplineActor(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingSplineActor);
}
FC_GuidingSplineActor& AssignGuidingSplineActor(const FECSEntity &inout Entity, const FC_GuidingSplineActor &inout DefaultValue = FC_GuidingSplineActor())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingSplineActor, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingSplineActor_BP(const FECSEntity &inout Entity, const FC_GuidingSplineActor &inout DefaultValue = FC_GuidingSplineActor())
{
    ECSFunc_FC_GuidingSplineActor::AssignGuidingSplineActor(Entity, DefaultValue);
    return;
}
FC_GuidingSplineActor& ModifyGuidingSplineActor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingSplineActor));
    return local_12.GetComp();
}
FC_GuidingSplineActor& ModifyOrAddGuidingSplineActor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingSplineActor));
    return local_12.GetComp();
}
const FC_GuidingSplineActor& GetGuidingSplineActor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingSplineActor));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingSplineActor GetGuidingSplineActor_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingSplineActor __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingSplineActor::GetGuidingSplineActor(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingSplineActor GetDefaultedGuidingSplineActor(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingSplineActor __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingSplineActor);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingSplineActor GetDefaultedGuidingSplineActor_BP(const FECSEntity &inout Entity)
{
    FC_GuidingSplineActor __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingSplineActor(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingSplineActor);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingSplineActorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingSplineActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingSplineActorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingSplineActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingSplineActorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingSplineActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingSplineActorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingSplineActor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingSplineActorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingSplineActor, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingSplineActorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingSplineActor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingSplineActorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingSplineActor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingSplineActorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingSplineActor, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathDrapeState
{
UFUNCTION()
bool HasGuidingPathDrapeState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathDrapeState);
}
FC_GuidingPathDrapeState& AssignGuidingPathDrapeState(const FECSEntity &inout Entity, const FC_GuidingPathDrapeState &inout DefaultValue = FC_GuidingPathDrapeState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathDrapeState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathDrapeState_BP(const FECSEntity &inout Entity, const FC_GuidingPathDrapeState &inout DefaultValue = FC_GuidingPathDrapeState())
{
    ECSFunc_FC_GuidingPathDrapeState::AssignGuidingPathDrapeState(Entity, DefaultValue);
    return;
}
FC_GuidingPathDrapeState& ModifyGuidingPathDrapeState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathDrapeState));
    return local_12.GetComp();
}
FC_GuidingPathDrapeState& ModifyOrAddGuidingPathDrapeState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathDrapeState));
    return local_12.GetComp();
}
const FC_GuidingPathDrapeState& GetGuidingPathDrapeState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathDrapeState));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathDrapeState GetGuidingPathDrapeState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathDrapeState __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathDrapeState::GetGuidingPathDrapeState(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathDrapeState GetDefaultedGuidingPathDrapeState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathDrapeState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathDrapeState);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathDrapeState GetDefaultedGuidingPathDrapeState_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathDrapeState __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathDrapeState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathDrapeState);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathDrapeStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathDrapeState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathDrapeStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathDrapeState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathDrapeStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathDrapeState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathDrapeStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathDrapeState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathDrapeStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathDrapeState, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathDrapeStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathDrapeState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathDrapeStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathDrapeState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathDrapeStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathDrapeState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathShowCooldown
{
UFUNCTION()
bool HasGuidingPathShowCooldown(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathShowCooldown);
}
FC_GuidingPathShowCooldown& AssignGuidingPathShowCooldown(const FECSEntity &inout Entity, const FC_GuidingPathShowCooldown &inout DefaultValue = FC_GuidingPathShowCooldown())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathShowCooldown, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathShowCooldown_BP(const FECSEntity &inout Entity, const FC_GuidingPathShowCooldown &inout DefaultValue = FC_GuidingPathShowCooldown())
{
    ECSFunc_FC_GuidingPathShowCooldown::AssignGuidingPathShowCooldown(Entity, DefaultValue);
    return;
}
FC_GuidingPathShowCooldown& ModifyGuidingPathShowCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathShowCooldown));
    return local_12.GetComp();
}
FC_GuidingPathShowCooldown& ModifyOrAddGuidingPathShowCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathShowCooldown));
    return local_12.GetComp();
}
const FC_GuidingPathShowCooldown& GetGuidingPathShowCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathShowCooldown));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathShowCooldown GetGuidingPathShowCooldown_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathShowCooldown __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathShowCooldown::GetGuidingPathShowCooldown(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathShowCooldown GetDefaultedGuidingPathShowCooldown(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathShowCooldown __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathShowCooldown);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathShowCooldown GetDefaultedGuidingPathShowCooldown_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathShowCooldown __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathShowCooldown(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathShowCooldown);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathShowCooldownOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathShowCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathShowCooldownOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathShowCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathShowCooldownOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathShowCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathShowCooldownOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathShowCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathShowCooldownOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathShowCooldown, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathShowCooldownLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathShowCooldown, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathShowCooldownActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathShowCooldown, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathShowCooldownModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathShowCooldown, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathRequestThrottle
{
UFUNCTION()
bool HasGuidingPathRequestThrottle(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathRequestThrottle);
}
FC_GuidingPathRequestThrottle& AssignGuidingPathRequestThrottle(const FECSEntity &inout Entity, const FC_GuidingPathRequestThrottle &inout DefaultValue = FC_GuidingPathRequestThrottle())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathRequestThrottle, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathRequestThrottle_BP(const FECSEntity &inout Entity, const FC_GuidingPathRequestThrottle &inout DefaultValue = FC_GuidingPathRequestThrottle())
{
    ECSFunc_FC_GuidingPathRequestThrottle::AssignGuidingPathRequestThrottle(Entity, DefaultValue);
    return;
}
FC_GuidingPathRequestThrottle& ModifyGuidingPathRequestThrottle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathRequestThrottle));
    return local_12.GetComp();
}
FC_GuidingPathRequestThrottle& ModifyOrAddGuidingPathRequestThrottle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathRequestThrottle));
    return local_12.GetComp();
}
const FC_GuidingPathRequestThrottle& GetGuidingPathRequestThrottle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathRequestThrottle));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathRequestThrottle GetGuidingPathRequestThrottle_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathRequestThrottle __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathRequestThrottle::GetGuidingPathRequestThrottle(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathRequestThrottle GetDefaultedGuidingPathRequestThrottle(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathRequestThrottle __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathRequestThrottle);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathRequestThrottle GetDefaultedGuidingPathRequestThrottle_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathRequestThrottle __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathRequestThrottle(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathRequestThrottle);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathRequestThrottleOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathRequestThrottle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathRequestThrottleOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathRequestThrottle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathRequestThrottleOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathRequestThrottle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathRequestThrottleOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathRequestThrottle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathRequestThrottleOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathRequestThrottle, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathRequestThrottleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathRequestThrottle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathRequestThrottleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathRequestThrottle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathRequestThrottleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathRequestThrottle, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathManualUpdateTag
{
UFUNCTION()
bool HasGuidingPathManualUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathManualUpdateTag);
}
FC_GuidingPathManualUpdateTag& AssignGuidingPathManualUpdateTag(const FECSEntity &inout Entity, const FC_GuidingPathManualUpdateTag &inout DefaultValue = FC_GuidingPathManualUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathManualUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathManualUpdateTag_BP(const FECSEntity &inout Entity, const FC_GuidingPathManualUpdateTag &inout DefaultValue = FC_GuidingPathManualUpdateTag())
{
    ECSFunc_FC_GuidingPathManualUpdateTag::AssignGuidingPathManualUpdateTag(Entity, DefaultValue);
    return;
}
FC_GuidingPathManualUpdateTag& ModifyGuidingPathManualUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathManualUpdateTag));
    return local_12.GetComp();
}
FC_GuidingPathManualUpdateTag& ModifyOrAddGuidingPathManualUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathManualUpdateTag));
    return local_12.GetComp();
}
const FC_GuidingPathManualUpdateTag& GetGuidingPathManualUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathManualUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathManualUpdateTag GetGuidingPathManualUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GuidingPathManualUpdateTag& local_4 = ECSFunc_FC_GuidingPathManualUpdateTag::GetGuidingPathManualUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GuidingPathManualUpdateTag();
}
const FC_GuidingPathManualUpdateTag GetDefaultedGuidingPathManualUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathManualUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathManualUpdateTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathManualUpdateTag GetDefaultedGuidingPathManualUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GuidingPathManualUpdateTag::GetDefaultedGuidingPathManualUpdateTag(Entity);
}
UFUNCTION()
bool RemoveGuidingPathManualUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathManualUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathManualUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathManualUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathManualUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathManualUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathManualUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathManualUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathManualUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathManualUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathManualUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathManualUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathManualUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathManualUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathManualUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathManualUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathManualUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathManualUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GuidingPathFailTipsCooldown
{
UFUNCTION()
bool HasGuidingPathFailTipsCooldown(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathFailTipsCooldown);
}
FC_GuidingPathFailTipsCooldown& AssignGuidingPathFailTipsCooldown(const FECSEntity &inout Entity, const FC_GuidingPathFailTipsCooldown &inout DefaultValue = FC_GuidingPathFailTipsCooldown())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathFailTipsCooldown, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGuidingPathFailTipsCooldown_BP(const FECSEntity &inout Entity, const FC_GuidingPathFailTipsCooldown &inout DefaultValue = FC_GuidingPathFailTipsCooldown())
{
    ECSFunc_FC_GuidingPathFailTipsCooldown::AssignGuidingPathFailTipsCooldown(Entity, DefaultValue);
    return;
}
FC_GuidingPathFailTipsCooldown& ModifyGuidingPathFailTipsCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathFailTipsCooldown));
    return local_12.GetComp();
}
FC_GuidingPathFailTipsCooldown& ModifyOrAddGuidingPathFailTipsCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathFailTipsCooldown));
    return local_12.GetComp();
}
const FC_GuidingPathFailTipsCooldown& GetGuidingPathFailTipsCooldown(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathFailTipsCooldown));
    return local_12.GetComp();
}
UFUNCTION()
FC_GuidingPathFailTipsCooldown GetGuidingPathFailTipsCooldown_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_GuidingPathFailTipsCooldown __r;
    bValid = false;
    bValid = ECSFunc_FC_GuidingPathFailTipsCooldown::GetGuidingPathFailTipsCooldown(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_GuidingPathFailTipsCooldown GetDefaultedGuidingPathFailTipsCooldown(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GuidingPathFailTipsCooldown __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathFailTipsCooldown);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GuidingPathFailTipsCooldown GetDefaultedGuidingPathFailTipsCooldown_BP(const FECSEntity &inout Entity)
{
    FC_GuidingPathFailTipsCooldown __r;
    return __r;
}
UFUNCTION()
bool RemoveGuidingPathFailTipsCooldown(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GuidingPathFailTipsCooldown);
}
}
FECSMonitorRuntimeView __GetMonitorGuidingPathFailTipsCooldownOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathFailTipsCooldownOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathFailTipsCooldownOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathFailTipsCooldownOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGuidingPathFailTipsCooldownOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, bMustHandleAll);
}
void __MonitorGuidingPathFailTipsCooldownLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathFailTipsCooldownActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGuidingPathFailTipsCooldownModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GuidingPathFailTipsCooldown, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RegionPathNodeTag
{
UFUNCTION()
bool HasRegionPathNodeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RegionPathNodeTag);
}
FC_RegionPathNodeTag& AssignRegionPathNodeTag(const FECSEntity &inout Entity, const FC_RegionPathNodeTag &inout DefaultValue = FC_RegionPathNodeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RegionPathNodeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRegionPathNodeTag_BP(const FECSEntity &inout Entity, const FC_RegionPathNodeTag &inout DefaultValue = FC_RegionPathNodeTag())
{
    ECSFunc_FC_RegionPathNodeTag::AssignRegionPathNodeTag(Entity, DefaultValue);
    return;
}
FC_RegionPathNodeTag& ModifyRegionPathNodeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RegionPathNodeTag));
    return local_12.GetComp();
}
FC_RegionPathNodeTag& ModifyOrAddRegionPathNodeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RegionPathNodeTag));
    return local_12.GetComp();
}
const FC_RegionPathNodeTag& GetRegionPathNodeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RegionPathNodeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_RegionPathNodeTag GetRegionPathNodeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RegionPathNodeTag& local_4 = ECSFunc_FC_RegionPathNodeTag::GetRegionPathNodeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RegionPathNodeTag();
}
const FC_RegionPathNodeTag GetDefaultedRegionPathNodeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RegionPathNodeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RegionPathNodeTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_RegionPathNodeTag GetDefaultedRegionPathNodeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RegionPathNodeTag::GetDefaultedRegionPathNodeTag(Entity);
}
UFUNCTION()
bool RemoveRegionPathNodeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RegionPathNodeTag);
}
}
FECSMonitorRuntimeView __GetMonitorRegionPathNodeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RegionPathNodeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionPathNodeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RegionPathNodeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionPathNodeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RegionPathNodeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionPathNodeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RegionPathNodeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRegionPathNodeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RegionPathNodeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorRegionPathNodeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RegionPathNodeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRegionPathNodeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RegionPathNodeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRegionPathNodeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RegionPathNodeTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_GuidingPathPoints &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_GuidingPathPoints &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GuidingPathPoints &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GuidingPathPoints
{
int __IndexOf_bLastFindPathSuccess()
{
    return 0;
}
int __IndexOf_bGoodSourceLocation()
{
    return 1;
}
int __IndexOf_bGoodTargetlocation()
{
    return 2;
}
int __IndexOf_TargetLocation()
{
    return 3;
}
int __IndexOf_TargetEntity()
{
    return 4;
}
int __IndexOf_TargetEntityPrefabConfig()
{
    return 5;
}
int __IndexOf_Points()
{
    return 6;
}
int __IndexOf_PathSource()
{
    return 7;
}
int __IndexOf_bStraightened()
{
    return 8;
}
}
