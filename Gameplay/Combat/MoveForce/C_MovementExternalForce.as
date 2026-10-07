
namespace ExternalForce
{
    const FGameplayTag IgnoreExternalForceTag = FGameplayTag();
}
namespace __INTENRAL_FC_MovementRadialForce_NS
{
    const TECSComponentDerivedPtr<FC_MovementRadialForce> DerivedPtr = TECSComponentDerivedPtr<FC_MovementRadialForce>();
    const FC_MovementRadialForce DefaultValue = FC_MovementRadialForce();
}
namespace __INTENRAL_FC_MovementBoxForce_NS
{
    const TECSComponentDerivedPtr<FC_MovementBoxForce> DerivedPtr = TECSComponentDerivedPtr<FC_MovementBoxForce>();
    const FC_MovementBoxForce DefaultValue = FC_MovementBoxForce();

}
struct FC_MovementRadialForce : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Radius;
    UPROPERTY()
    float32 m_InnerRadius;
    UPROPERTY()
    float32 m_Force;
    UPROPERTY()
    float32 m_MaxSpeed;
    UPROPERTY()
    float32 m_Duration;
    UPROPERTY()
    int m_EnableFactionRelation;
    UPROPERTY()
    FFPTime m_StartSeconds;

    FC_MovementRadialForce()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MovementRadialForce(const FC_MovementRadialForce &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MovementRadialForce opAssign(const FC_MovementRadialForce &inout Other)
    {
        FC_MovementRadialForce __r;
        this.SetRadius(Other.GetRadius());
        this.SetInnerRadius(Other.GetInnerRadius());
        this.SetForce(Other.GetForce());
        this.SetMaxSpeed(Other.GetMaxSpeed());
        this.SetDuration(Other.GetDuration());
        this.SetEnableFactionRelation(Other.GetEnableFactionRelation());
        this.SetStartSeconds(Other.GetStartSeconds());
        return __r;
    }
    float32 GetRadius() const property
    {
        return this.m_Radius;
    }
    void SetRadius(const float32 __Value) property
    {
        if (this.m_Radius == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Radius = __Value;
        return;
    }
    float32 GetInnerRadius() const property
    {
        return this.m_InnerRadius;
    }
    void SetInnerRadius(const float32 __Value) property
    {
        if (this.m_InnerRadius == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InnerRadius = __Value;
        return;
    }
    float32 GetForce() const property
    {
        return this.m_Force;
    }
    void SetForce(const float32 __Value) property
    {
        if (this.m_Force == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Force = __Value;
        return;
    }
    float32 GetMaxSpeed() const property
    {
        return this.m_MaxSpeed;
    }
    void SetMaxSpeed(const float32 __Value) property
    {
        if (this.m_MaxSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MaxSpeed = __Value;
        return;
    }
    float32 GetDuration() const property
    {
        return this.m_Duration;
    }
    void SetDuration(const float32 __Value) property
    {
        if (this.m_Duration == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Duration = __Value;
        return;
    }
    int GetEnableFactionRelation() const property
    {
        return this.m_EnableFactionRelation;
    }
    void SetEnableFactionRelation(const int __Value) property
    {
        if (this.m_EnableFactionRelation == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_EnableFactionRelation = __Value;
        return;
    }
    const FFPTime GetStartSeconds() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartSeconds() property
    {
        FFPTime __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetStartSeconds(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_StartSeconds = __Value;
        return;
    }
}

struct FC_MovementBoxForce : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_HalfExtend;
    UPROPERTY()
    float32 m_Force;
    UPROPERTY()
    float32 m_MaxSpeed;
    UPROPERTY()
    float32 m_Duration;
    UPROPERTY()
    int m_EnableFactionRelation;
    UPROPERTY()
    FFPTime m_StartSeconds;

    FC_MovementBoxForce()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MovementBoxForce(const FC_MovementBoxForce &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MovementBoxForce opAssign(const FC_MovementBoxForce &inout Other)
    {
        FC_MovementBoxForce __r;
        this.SetHalfExtend(Other.GetHalfExtend());
        this.SetForce(Other.GetForce());
        this.SetMaxSpeed(Other.GetMaxSpeed());
        this.SetDuration(Other.GetDuration());
        this.SetEnableFactionRelation(Other.GetEnableFactionRelation());
        this.SetStartSeconds(Other.GetStartSeconds());
        return __r;
    }
    const FVector GetHalfExtend() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_HalfExtend() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetHalfExtend(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HalfExtend = __Value;
        return;
    }
    float32 GetForce() const property
    {
        return this.m_Force;
    }
    void SetForce(const float32 __Value) property
    {
        if (this.m_Force == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Force = __Value;
        return;
    }
    float32 GetMaxSpeed() const property
    {
        return this.m_MaxSpeed;
    }
    void SetMaxSpeed(const float32 __Value) property
    {
        if (this.m_MaxSpeed == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MaxSpeed = __Value;
        return;
    }
    float32 GetDuration() const property
    {
        return this.m_Duration;
    }
    void SetDuration(const float32 __Value) property
    {
        if (this.m_Duration == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Duration = __Value;
        return;
    }
    int GetEnableFactionRelation() const property
    {
        return this.m_EnableFactionRelation;
    }
    void SetEnableFactionRelation(const int __Value) property
    {
        if (this.m_EnableFactionRelation == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_EnableFactionRelation = __Value;
        return;
    }
    const FFPTime GetStartSeconds() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_StartSeconds() property
    {
        FFPTime __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetStartSeconds(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_StartSeconds = __Value;
        return;
    }
}

namespace ECSFunc_FC_MovementRadialForce
{
UFUNCTION()
bool HasMovementRadialForce(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MovementRadialForce);
}
FC_MovementRadialForce& AssignMovementRadialForce(const FECSEntity &inout Entity, const FC_MovementRadialForce &inout DefaultValue = FC_MovementRadialForce())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MovementRadialForce, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMovementRadialForce_BP(const FECSEntity &inout Entity, const FC_MovementRadialForce &inout DefaultValue = FC_MovementRadialForce())
{
    ECSFunc_FC_MovementRadialForce::AssignMovementRadialForce(Entity, DefaultValue);
    return;
}
FC_MovementRadialForce& ModifyMovementRadialForce(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MovementRadialForce));
    return local_12.GetComp();
}
FC_MovementRadialForce& ModifyOrAddMovementRadialForce(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MovementRadialForce));
    return local_12.GetComp();
}
const FC_MovementRadialForce& GetMovementRadialForce(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MovementRadialForce));
    return local_12.GetComp();
}
UFUNCTION()
FC_MovementRadialForce GetMovementRadialForce_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MovementRadialForce& local_4 = ECSFunc_FC_MovementRadialForce::GetMovementRadialForce(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MovementRadialForce();
}
const FC_MovementRadialForce GetDefaultedMovementRadialForce(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MovementRadialForce __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MovementRadialForce);
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
FC_MovementRadialForce GetDefaultedMovementRadialForce_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MovementRadialForce::GetDefaultedMovementRadialForce(Entity);
}
UFUNCTION()
bool RemoveMovementRadialForce(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MovementRadialForce);
}
}
FECSMonitorRuntimeView __GetMonitorMovementRadialForceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MovementRadialForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementRadialForceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MovementRadialForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementRadialForceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MovementRadialForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementRadialForceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MovementRadialForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementRadialForceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MovementRadialForce, bFixedFrame, bMustHandleAll);
}
void __MonitorMovementRadialForceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MovementRadialForce, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementRadialForceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MovementRadialForce, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementRadialForceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MovementRadialForce, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MovementBoxForce
{
UFUNCTION()
bool HasMovementBoxForce(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MovementBoxForce);
}
FC_MovementBoxForce& AssignMovementBoxForce(const FECSEntity &inout Entity, const FC_MovementBoxForce &inout DefaultValue = FC_MovementBoxForce())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MovementBoxForce, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMovementBoxForce_BP(const FECSEntity &inout Entity, const FC_MovementBoxForce &inout DefaultValue = FC_MovementBoxForce())
{
    ECSFunc_FC_MovementBoxForce::AssignMovementBoxForce(Entity, DefaultValue);
    return;
}
FC_MovementBoxForce& ModifyMovementBoxForce(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MovementBoxForce));
    return local_12.GetComp();
}
FC_MovementBoxForce& ModifyOrAddMovementBoxForce(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MovementBoxForce));
    return local_12.GetComp();
}
const FC_MovementBoxForce& GetMovementBoxForce(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MovementBoxForce));
    return local_12.GetComp();
}
UFUNCTION()
FC_MovementBoxForce GetMovementBoxForce_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MovementBoxForce& local_4 = ECSFunc_FC_MovementBoxForce::GetMovementBoxForce(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MovementBoxForce();
}
const FC_MovementBoxForce GetDefaultedMovementBoxForce(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MovementBoxForce __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MovementBoxForce);
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
FC_MovementBoxForce GetDefaultedMovementBoxForce_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MovementBoxForce::GetDefaultedMovementBoxForce(Entity);
}
UFUNCTION()
bool RemoveMovementBoxForce(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MovementBoxForce);
}
}
FECSMonitorRuntimeView __GetMonitorMovementBoxForceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MovementBoxForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementBoxForceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MovementBoxForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementBoxForceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MovementBoxForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementBoxForceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MovementBoxForce, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementBoxForceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MovementBoxForce, bFixedFrame, bMustHandleAll);
}
void __MonitorMovementBoxForceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MovementBoxForce, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementBoxForceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MovementBoxForce, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementBoxForceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MovementBoxForce, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MovementRadialForce &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MovementRadialForce &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MovementRadialForce &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MovementRadialForce
{
int __IndexOf_Radius()
{
    return 0;
}
int __IndexOf_InnerRadius()
{
    return 1;
}
int __IndexOf_Force()
{
    return 2;
}
int __IndexOf_MaxSpeed()
{
    return 3;
}
int __IndexOf_Duration()
{
    return 4;
}
int __IndexOf_EnableFactionRelation()
{
    return 5;
}
int __IndexOf_StartSeconds()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MovementBoxForce &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MovementBoxForce &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MovementBoxForce &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MovementBoxForce
{
int __IndexOf_HalfExtend()
{
    return 0;
}
int __IndexOf_Force()
{
    return 1;
}
int __IndexOf_MaxSpeed()
{
    return 2;
}
int __IndexOf_Duration()
{
    return 3;
}
int __IndexOf_EnableFactionRelation()
{
    return 4;
}
int __IndexOf_StartSeconds()
{
    return 5;
}
}
