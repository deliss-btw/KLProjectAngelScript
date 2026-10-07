
namespace __INTENRAL_FC_HookMoveConfig_NS
{
    const TECSComponentDerivedPtr<FC_HookMoveConfig> DerivedPtr = TECSComponentDerivedPtr<FC_HookMoveConfig>();
    const FC_HookMoveConfig DefaultValue = FC_HookMoveConfig();
}
namespace __INTENRAL_FC_RuntimeHookMoveTarget_NS
{
    const TECSComponentDerivedPtr<FC_RuntimeHookMoveTarget> DerivedPtr = TECSComponentDerivedPtr<FC_RuntimeHookMoveTarget>();
    const FC_RuntimeHookMoveTarget DefaultValue = FC_RuntimeHookMoveTarget();

}
struct FHookMoveTargetRangeConfig
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector3f m_Offset = FVector3f::ZeroVector;
    UPROPERTY()
    float32 m_CrossOverRadius = 0.0f;
    UPROPERTY()
    float32 m_LockDistRatio = 0.5f;

    FHookMoveTargetRangeConfig(const FHookMoveTargetRangeConfig &inout Other)
    {
        this.m_Offset = Other.m_Offset;
        this.m_CrossOverRadius = Other.m_CrossOverRadius;
        this.m_LockDistRatio = Other.m_LockDistRatio;
        return;
    }
    FHookMoveTargetRangeConfig opAssign(const FHookMoveTargetRangeConfig &inout Other)
    {
        FHookMoveTargetRangeConfig __r;
        this.SetOffset(Other.GetOffset());
        this.SetCrossOverRadius(Other.GetCrossOverRadius());
        this.SetLockDistRatio(Other.GetLockDistRatio());
        return __r;
    }
    const FVector3f GetOffset() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_Offset() property
    {
        FVector3f __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetOffset(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Offset = __Value;
        return;
    }
    float32 GetCrossOverRadius() const property
    {
        return this.m_CrossOverRadius;
    }
    void SetCrossOverRadius(const float32 __Value) property
    {
        if (this.m_CrossOverRadius == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CrossOverRadius = __Value;
        return;
    }
    float32 GetLockDistRatio() const property
    {
        return this.m_LockDistRatio;
    }
    void SetLockDistRatio(const float32 __Value) property
    {
        if (this.m_LockDistRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LockDistRatio = __Value;
        return;
    }
}

struct FHookMoveApproachConfig
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bAccurateApproach;
    UPROPERTY()
    float32 m_MaxApproachTime;
    UPROPERTY()
    float32 m_FinalDownSpeed;

    FHookMoveApproachConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHookMoveApproachConfig(const FHookMoveApproachConfig &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FHookMoveApproachConfig opAssign(const FHookMoveApproachConfig &inout Other)
    {
        FHookMoveApproachConfig __r;
        this.SetbAccurateApproach(Other.GetbAccurateApproach());
        this.SetMaxApproachTime(Other.GetMaxApproachTime());
        this.SetFinalDownSpeed(Other.GetFinalDownSpeed());
        return __r;
    }
    bool GetbAccurateApproach() const property
    {
        return this.m_bAccurateApproach;
    }
    void SetbAccurateApproach(const bool __Value) property
    {
        if (!(this.m_bAccurateApproach) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bAccurateApproach = __Value;
        return;
    }
    float32 GetMaxApproachTime() const property
    {
        return this.m_MaxApproachTime;
    }
    void SetMaxApproachTime(const float32 __Value) property
    {
        if (this.m_MaxApproachTime == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MaxApproachTime = __Value;
        return;
    }
    float32 GetFinalDownSpeed() const property
    {
        return this.m_FinalDownSpeed;
    }
    void SetFinalDownSpeed(const float32 __Value) property
    {
        if (this.m_FinalDownSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FinalDownSpeed = __Value;
        return;
    }
}

struct FC_HookMoveConfig : FECSComponent
{
    UPROPERTY()
    float32 MoveSpeed = 1500.0f;
    UPROPERTY()
    FHookMoveApproachConfig ApproachConfig;
    UPROPERTY()
    TArray<FHookMoveTargetRangeConfig> TargetRangeConfigs;
    UPROPERTY()
    FRuntimeFloatCurve SpeedCurve = FRuntimeCurveUtils::CreateConst(1.0f);
    UPROPERTY()
    FRuntimeFloatCurve HorizontalSpeedByDistCurve = FRuntimeCurveUtils::CreateConst(1.0f);


}

struct FC_RuntimeHookMoveTarget : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FFPTime m_TotalMoveTime;
    UPROPERTY()
    bool m_bIsApproaching;
    UPROPERTY()
    FVector m_TargetLocation;
    UPROPERTY()
    FVector m_InitTargetLocation;
    UPROPERTY()
    FVector m_FinalTargetLocation;
    UPROPERTY()
    float32 m_TargetLerpRatio;
    UPROPERTY()
    float32 m_DistanceToTarget;
    UPROPERTY()
    float32 m_InitDistanceToTarget;
    UPROPERTY()
    float32 m_ApproachingVerticalSpeed;
    UPROPERTY()
    float32 m_MoveSpeed;
    UPROPERTY()
    FHookMoveTargetRangeConfig m_TargetRangeConfig;
    UPROPERTY()
    bool m_bUseDefaultTarget;

    FC_RuntimeHookMoveTarget()
    {
        this.m_TotalMoveTime = -1;
        this.m_bIsApproaching = false;
        this.m_TargetLerpRatio = 0.0f;
        this.m_DistanceToTarget = 0.0f;
        this.m_InitDistanceToTarget = 0.0f;
        this.m_ApproachingVerticalSpeed = 0.0f;
        this.m_MoveSpeed = 0.0f;
        this.m_bUseDefaultTarget = true;
        this.__InitDirtyFlags();
        return;
    }
    FC_RuntimeHookMoveTarget(const FC_RuntimeHookMoveTarget &inout Other)
    {
        this.m_TotalMoveTime = -1;
        this.m_bIsApproaching = false;
        this.m_TargetLerpRatio = 0.0f;
        this.m_DistanceToTarget = 0.0f;
        this.m_InitDistanceToTarget = 0.0f;
        this.m_ApproachingVerticalSpeed = 0.0f;
        this.m_MoveSpeed = 0.0f;
        this.m_bUseDefaultTarget = true;
        this.__InitDirtyFlags();
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_TotalMoveTime = Other.m_TotalMoveTime;
        this.m_bIsApproaching = Other.m_bIsApproaching;
        this.m_TargetLocation = Other.m_TargetLocation;
        this.m_InitTargetLocation = Other.m_InitTargetLocation;
        this.m_FinalTargetLocation = Other.m_FinalTargetLocation;
        this.m_TargetLerpRatio = Other.m_TargetLerpRatio;
        this.m_DistanceToTarget = Other.m_DistanceToTarget;
        this.m_InitDistanceToTarget = Other.m_InitDistanceToTarget;
        this.m_ApproachingVerticalSpeed = Other.m_ApproachingVerticalSpeed;
        this.m_MoveSpeed = Other.m_MoveSpeed;
        this.m_TargetRangeConfig = Other.m_TargetRangeConfig;
        this.m_bUseDefaultTarget = Other.m_bUseDefaultTarget;
        return;
    }
    FC_RuntimeHookMoveTarget opAssign(const FC_RuntimeHookMoveTarget &inout Other)
    {
        FC_RuntimeHookMoveTarget __r;
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetTotalMoveTime(Other.GetTotalMoveTime());
        this.SetbIsApproaching(Other.GetbIsApproaching());
        this.SetTargetLocation(Other.GetTargetLocation());
        this.SetInitTargetLocation(Other.GetInitTargetLocation());
        this.SetFinalTargetLocation(Other.GetFinalTargetLocation());
        this.SetTargetLerpRatio(Other.GetTargetLerpRatio());
        this.SetDistanceToTarget(Other.GetDistanceToTarget());
        this.SetInitDistanceToTarget(Other.GetInitDistanceToTarget());
        this.SetApproachingVerticalSpeed(Other.GetApproachingVerticalSpeed());
        this.SetMoveSpeed(Other.GetMoveSpeed());
        this.SetTargetRangeConfig(Other.GetTargetRangeConfig());
        this.SetbUseDefaultTarget(Other.GetbUseDefaultTarget());
        return __r;
    }
    void Reset(const FECSEntity &inout Target, const FVector &inout Locaction)
    {
        this.SetTargetEntity(Target);
        this.SetTotalMoveTime(FFPTime(-1));
        this.SetbIsApproaching(false);
        this.SetTargetLocation(Locaction);
        this.SetInitTargetLocation(Locaction);
        this.SetFinalTargetLocation(Locaction);
        this.SetTargetLerpRatio(0.0f);
        this.SetDistanceToTarget(0.0f);
        this.SetInitDistanceToTarget(0.0f);
        this.SetApproachingVerticalSpeed(0.0f);
        this.SetMoveSpeed(0.0f);
        FHookMoveTargetRangeConfig local_12;
        this.SetTargetRangeConfig(local_12);
        this.SetbUseDefaultTarget(true);
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
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    const FFPTime GetTotalMoveTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TotalMoveTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTotalMoveTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TotalMoveTime = __Value;
        return;
    }
    bool GetbIsApproaching() const property
    {
        return this.m_bIsApproaching;
    }
    void SetbIsApproaching(const bool __Value) property
    {
        if (!(this.m_bIsApproaching) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bIsApproaching = __Value;
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
    const FVector GetInitTargetLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_InitTargetLocation() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetInitTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_InitTargetLocation = __Value;
        return;
    }
    const FVector GetFinalTargetLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FinalTargetLocation() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetFinalTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_FinalTargetLocation = __Value;
        return;
    }
    float32 GetTargetLerpRatio() const property
    {
        return this.m_TargetLerpRatio;
    }
    void SetTargetLerpRatio(const float32 __Value) property
    {
        if (this.m_TargetLerpRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_TargetLerpRatio = __Value;
        return;
    }
    float32 GetDistanceToTarget() const property
    {
        return this.m_DistanceToTarget;
    }
    void SetDistanceToTarget(const float32 __Value) property
    {
        if (this.m_DistanceToTarget == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_DistanceToTarget = __Value;
        return;
    }
    float32 GetInitDistanceToTarget() const property
    {
        return this.m_InitDistanceToTarget;
    }
    void SetInitDistanceToTarget(const float32 __Value) property
    {
        if (this.m_InitDistanceToTarget == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_InitDistanceToTarget = __Value;
        return;
    }
    float32 GetApproachingVerticalSpeed() const property
    {
        return this.m_ApproachingVerticalSpeed;
    }
    void SetApproachingVerticalSpeed(const float32 __Value) property
    {
        if (this.m_ApproachingVerticalSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_ApproachingVerticalSpeed = __Value;
        return;
    }
    float32 GetMoveSpeed() const property
    {
        return this.m_MoveSpeed;
    }
    void SetMoveSpeed(const float32 __Value) property
    {
        if (this.m_MoveSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_MoveSpeed = __Value;
        return;
    }
    const FHookMoveTargetRangeConfig GetTargetRangeConfig() const property
    {
        const FHookMoveTargetRangeConfig __r;
        return __r;
    }
    FHookMoveTargetRangeConfig GetTargetRangeConfig() property
    {
        FHookMoveTargetRangeConfig __r;
        return __r;
    }
    void SetTargetRangeConfig(const FHookMoveTargetRangeConfig &inout __Value) property
    {
        this.m_TargetRangeConfig = __Value;
        return;
    }
    bool GetbUseDefaultTarget() const property
    {
        return this.m_bUseDefaultTarget;
    }
    void SetbUseDefaultTarget(const bool __Value) property
    {
        if (!(this.m_bUseDefaultTarget) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_bUseDefaultTarget = __Value;
        return;
    }
}

namespace ECSFunc_FC_HookMoveConfig
{
UFUNCTION()
bool HasHookMoveConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_HookMoveConfig);
}
FC_HookMoveConfig& AssignHookMoveConfig(const FECSEntity &inout Entity, const FC_HookMoveConfig &inout DefaultValue = FC_HookMoveConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_HookMoveConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignHookMoveConfig_BP(const FECSEntity &inout Entity, const FC_HookMoveConfig &inout DefaultValue = FC_HookMoveConfig())
{
    ECSFunc_FC_HookMoveConfig::AssignHookMoveConfig(Entity, DefaultValue);
    return;
}
FC_HookMoveConfig& ModifyHookMoveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_HookMoveConfig));
    return local_12.GetComp();
}
FC_HookMoveConfig& ModifyOrAddHookMoveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_HookMoveConfig));
    return local_12.GetComp();
}
const FC_HookMoveConfig& GetHookMoveConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_HookMoveConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_HookMoveConfig GetHookMoveConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_HookMoveConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_HookMoveConfig::GetHookMoveConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_HookMoveConfig GetDefaultedHookMoveConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_HookMoveConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_HookMoveConfig);
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
FC_HookMoveConfig GetDefaultedHookMoveConfig_BP(const FECSEntity &inout Entity)
{
    FC_HookMoveConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveHookMoveConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_HookMoveConfig);
}
}
FECSMonitorRuntimeView __GetMonitorHookMoveConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_HookMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHookMoveConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_HookMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHookMoveConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_HookMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHookMoveConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_HookMoveConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorHookMoveConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_HookMoveConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorHookMoveConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_HookMoveConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHookMoveConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_HookMoveConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHookMoveConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_HookMoveConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RuntimeHookMoveTarget
{
UFUNCTION()
bool HasRuntimeHookMoveTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RuntimeHookMoveTarget);
}
FC_RuntimeHookMoveTarget& AssignRuntimeHookMoveTarget(const FECSEntity &inout Entity, const FC_RuntimeHookMoveTarget &inout DefaultValue = FC_RuntimeHookMoveTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RuntimeHookMoveTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRuntimeHookMoveTarget_BP(const FECSEntity &inout Entity, const FC_RuntimeHookMoveTarget &inout DefaultValue = FC_RuntimeHookMoveTarget())
{
    ECSFunc_FC_RuntimeHookMoveTarget::AssignRuntimeHookMoveTarget(Entity, DefaultValue);
    return;
}
FC_RuntimeHookMoveTarget& ModifyRuntimeHookMoveTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RuntimeHookMoveTarget));
    return local_12.GetComp();
}
FC_RuntimeHookMoveTarget& ModifyOrAddRuntimeHookMoveTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RuntimeHookMoveTarget));
    return local_12.GetComp();
}
const FC_RuntimeHookMoveTarget& GetRuntimeHookMoveTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RuntimeHookMoveTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_RuntimeHookMoveTarget GetRuntimeHookMoveTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RuntimeHookMoveTarget& local_4 = ECSFunc_FC_RuntimeHookMoveTarget::GetRuntimeHookMoveTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RuntimeHookMoveTarget();
}
const FC_RuntimeHookMoveTarget GetDefaultedRuntimeHookMoveTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RuntimeHookMoveTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RuntimeHookMoveTarget);
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
FC_RuntimeHookMoveTarget GetDefaultedRuntimeHookMoveTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RuntimeHookMoveTarget::GetDefaultedRuntimeHookMoveTarget(Entity);
}
UFUNCTION()
bool RemoveRuntimeHookMoveTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RuntimeHookMoveTarget);
}
}
FECSMonitorRuntimeView __GetMonitorRuntimeHookMoveTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RuntimeHookMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeHookMoveTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RuntimeHookMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeHookMoveTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RuntimeHookMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeHookMoveTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RuntimeHookMoveTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeHookMoveTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RuntimeHookMoveTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorRuntimeHookMoveTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RuntimeHookMoveTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeHookMoveTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RuntimeHookMoveTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeHookMoveTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RuntimeHookMoveTarget, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_RuntimeHookMoveTarget_bIsApproaching(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbIsApproaching();
    return;
}
void GetEntityBBVar_RuntimeHookMoveTarget_TargetLocation(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().GetTargetLocation());
    return;
}
void GetEntityBBVar_RuntimeHookMoveTarget_DistanceToTarget(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetDistanceToTarget();
    return;
}
void GetEntityBBVar_RuntimeHookMoveTarget_MoveSpeed(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetMoveSpeed();
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FHookMoveTargetRangeConfig &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FHookMoveTargetRangeConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FHookMoveTargetRangeConfig
{
int __IndexOf_Offset()
{
    return 0;
}
int __IndexOf_CrossOverRadius()
{
    return 1;
}
int __IndexOf_LockDistRatio()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FHookMoveApproachConfig &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FHookMoveApproachConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FHookMoveApproachConfig
{
int __IndexOf_bAccurateApproach()
{
    return 0;
}
int __IndexOf_MaxApproachTime()
{
    return 1;
}
int __IndexOf_FinalDownSpeed()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_RuntimeHookMoveTarget &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_RuntimeHookMoveTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RuntimeHookMoveTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RuntimeHookMoveTarget
{
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_TotalMoveTime()
{
    return 1;
}
int __IndexOf_bIsApproaching()
{
    return 2;
}
int __IndexOf_TargetLocation()
{
    return 3;
}
int __IndexOf_InitTargetLocation()
{
    return 4;
}
int __IndexOf_FinalTargetLocation()
{
    return 5;
}
int __IndexOf_TargetLerpRatio()
{
    return 6;
}
int __IndexOf_DistanceToTarget()
{
    return 7;
}
int __IndexOf_InitDistanceToTarget()
{
    return 8;
}
int __IndexOf_ApproachingVerticalSpeed()
{
    return 9;
}
int __IndexOf_MoveSpeed()
{
    return 10;
}
int __IndexOf_TargetRangeConfig()
{
    return 11;
}
int __IndexOf_bUseDefaultTarget()
{
    return 14;
}
}
