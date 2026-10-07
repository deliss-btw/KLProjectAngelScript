
namespace __INTENRAL_FC_RotationRuntimeInfo_NS
{
    const TECSComponentDerivedPtr<FC_RotationRuntimeInfo> DerivedPtr = TECSComponentDerivedPtr<FC_RotationRuntimeInfo>();
    const FC_RotationRuntimeInfo DefaultValue = FC_RotationRuntimeInfo();
}
namespace __INTENRAL_FC_RotationByTime_NS
{
    const TECSComponentDerivedPtr<FC_RotationByTime> DerivedPtr = TECSComponentDerivedPtr<FC_RotationByTime>();
    const FC_RotationByTime DefaultValue = FC_RotationByTime();
}
namespace __INTENRAL_FC_RotationWithDecreaseAngleVelocity_NS
{
    const TECSComponentDerivedPtr<FC_RotationWithDecreaseAngleVelocity> DerivedPtr = TECSComponentDerivedPtr<FC_RotationWithDecreaseAngleVelocity>();
    const FC_RotationWithDecreaseAngleVelocity DefaultValue = FC_RotationWithDecreaseAngleVelocity();

}
struct FC_RotationRuntimeInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_RotationBeginTime;
    UPROPERTY()
    FFPTime m_RotationTotalTime;
    UPROPERTY()
    FQuat4f m_DeltaRotation;

    FC_RotationRuntimeInfo()
    {
        this.m_RotationBeginTime = 0;
        this.m_DeltaRotation = FQuat4f::Identity;
        this.__InitDirtyFlags();
        return;
    }
    FC_RotationRuntimeInfo(const FC_RotationRuntimeInfo &inout Other)
    {
        this.m_RotationBeginTime = 0;
        this.m_DeltaRotation = FQuat4f::Identity;
        this.__InitDirtyFlags();
        this.m_RotationBeginTime = Other.m_RotationBeginTime;
        this.m_RotationTotalTime = Other.m_RotationTotalTime;
        this.m_DeltaRotation = Other.m_DeltaRotation;
        return;
    }
    FC_RotationRuntimeInfo opAssign(const FC_RotationRuntimeInfo &inout Other)
    {
        FC_RotationRuntimeInfo __r;
        this.SetRotationBeginTime(Other.GetRotationBeginTime());
        this.SetRotationTotalTime(Other.GetRotationTotalTime());
        this.SetDeltaRotation(Other.GetDeltaRotation());
        return __r;
    }
    const FFPTime GetRotationBeginTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RotationBeginTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRotationBeginTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RotationBeginTime = __Value;
        return;
    }
    const FFPTime GetRotationTotalTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RotationTotalTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRotationTotalTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RotationTotalTime = __Value;
        return;
    }
    const FQuat4f GetDeltaRotation() const property
    {
        const FQuat4f __r;
        return __r;
    }
    FQuat4f GetModify_DeltaRotation() property
    {
        FQuat4f __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetDeltaRotation(const FQuat4f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DeltaRotation = __Value;
        return;
    }
}

struct FC_RotationByTime : FECSComponent
{
    UPROPERTY()
    float32 StartTime = 0.0f;
    UPROPERTY()
    float32 EndTime = 0.0f;
    UPROPERTY()
    bool bUseVelocityCurve = false;
    UPROPERTY()
    float32 AngularVelocityConst = 0.0f;
    UPROPERTY()
    FRuntimeFloatCurve AngularVelocityCurve;
    UPROPERTY()
    FVector3f RotationAxis = FVector3f::ForwardVector;


    float32 GetAngularVelocity(const float32 Time) const
    {
        if (this.bUseVelocityCurve)
        {
            return this.AngularVelocityCurve.GetFloatValue(Time / (this.EndTime - this.StartTime), 0.0f);
        }
        else
        {
            return this.AngularVelocityConst;
        }
    }
}

struct FC_RotationWithDecreaseAngleVelocity : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bEnable;
    UPROPERTY()
    float32 m_AngleVelocity;
    UPROPERTY()
    float32 m_DecreaseAngleVelocityRate;
    UPROPERTY()
    FVector3f m_RotationAxis;

    FC_RotationWithDecreaseAngleVelocity()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RotationWithDecreaseAngleVelocity(const FC_RotationWithDecreaseAngleVelocity &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RotationWithDecreaseAngleVelocity opAssign(const FC_RotationWithDecreaseAngleVelocity &inout Other)
    {
        FC_RotationWithDecreaseAngleVelocity __r;
        this.SetbEnable(Other.GetbEnable());
        this.SetAngleVelocity(Other.GetAngleVelocity());
        this.SetDecreaseAngleVelocityRate(Other.GetDecreaseAngleVelocityRate());
        this.SetRotationAxis(Other.GetRotationAxis());
        return __r;
    }
    bool GetbEnable() const property
    {
        return this.m_bEnable;
    }
    void SetbEnable(const bool __Value) property
    {
        if (!(this.m_bEnable) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bEnable = __Value;
        return;
    }
    float32 GetAngleVelocity() const property
    {
        return this.m_AngleVelocity;
    }
    void SetAngleVelocity(const float32 __Value) property
    {
        if (this.m_AngleVelocity == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AngleVelocity = __Value;
        return;
    }
    float32 GetDecreaseAngleVelocityRate() const property
    {
        return this.m_DecreaseAngleVelocityRate;
    }
    void SetDecreaseAngleVelocityRate(const float32 __Value) property
    {
        if (this.m_DecreaseAngleVelocityRate == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DecreaseAngleVelocityRate = __Value;
        return;
    }
    FVector3f GetRotationAxis() const property
    {
        FVector3f __r;
        return __r;
    }
    FVector3f GetModify_RotationAxis() property
    {
        FVector3f __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetRotationAxis(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RotationAxis = __Value;
        return;
    }
}

namespace ECSFunc_FC_RotationRuntimeInfo
{
UFUNCTION()
bool HasRotationRuntimeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RotationRuntimeInfo);
}
FC_RotationRuntimeInfo& AssignRotationRuntimeInfo(const FECSEntity &inout Entity, const FC_RotationRuntimeInfo &inout DefaultValue = FC_RotationRuntimeInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RotationRuntimeInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRotationRuntimeInfo_BP(const FECSEntity &inout Entity, const FC_RotationRuntimeInfo &inout DefaultValue = FC_RotationRuntimeInfo())
{
    ECSFunc_FC_RotationRuntimeInfo::AssignRotationRuntimeInfo(Entity, DefaultValue);
    return;
}
FC_RotationRuntimeInfo& ModifyRotationRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RotationRuntimeInfo));
    return local_12.GetComp();
}
FC_RotationRuntimeInfo& ModifyOrAddRotationRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RotationRuntimeInfo));
    return local_12.GetComp();
}
const FC_RotationRuntimeInfo& GetRotationRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RotationRuntimeInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_RotationRuntimeInfo GetRotationRuntimeInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RotationRuntimeInfo& local_4 = ECSFunc_FC_RotationRuntimeInfo::GetRotationRuntimeInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RotationRuntimeInfo();
}
const FC_RotationRuntimeInfo GetDefaultedRotationRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RotationRuntimeInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RotationRuntimeInfo);
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
FC_RotationRuntimeInfo GetDefaultedRotationRuntimeInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RotationRuntimeInfo::GetDefaultedRotationRuntimeInfo(Entity);
}
UFUNCTION()
bool RemoveRotationRuntimeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RotationRuntimeInfo);
}
}
FECSMonitorRuntimeView __GetMonitorRotationRuntimeInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RotationRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationRuntimeInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RotationRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationRuntimeInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RotationRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationRuntimeInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RotationRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationRuntimeInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RotationRuntimeInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorRotationRuntimeInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RotationRuntimeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationRuntimeInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RotationRuntimeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationRuntimeInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RotationRuntimeInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RotationByTime
{
UFUNCTION()
bool HasRotationByTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RotationByTime);
}
FC_RotationByTime& AssignRotationByTime(const FECSEntity &inout Entity, const FC_RotationByTime &inout DefaultValue = FC_RotationByTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RotationByTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRotationByTime_BP(const FECSEntity &inout Entity, const FC_RotationByTime &inout DefaultValue = FC_RotationByTime())
{
    ECSFunc_FC_RotationByTime::AssignRotationByTime(Entity, DefaultValue);
    return;
}
FC_RotationByTime& ModifyRotationByTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RotationByTime));
    return local_12.GetComp();
}
FC_RotationByTime& ModifyOrAddRotationByTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RotationByTime));
    return local_12.GetComp();
}
const FC_RotationByTime& GetRotationByTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RotationByTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_RotationByTime GetRotationByTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_RotationByTime __r;
    bValid = false;
    bValid = ECSFunc_FC_RotationByTime::GetRotationByTime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_RotationByTime GetDefaultedRotationByTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RotationByTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RotationByTime);
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
FC_RotationByTime GetDefaultedRotationByTime_BP(const FECSEntity &inout Entity)
{
    FC_RotationByTime __r;
    return __r;
}
UFUNCTION()
bool RemoveRotationByTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RotationByTime);
}
}
FECSMonitorRuntimeView __GetMonitorRotationByTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RotationByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationByTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RotationByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationByTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RotationByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationByTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RotationByTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationByTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RotationByTime, bFixedFrame, bMustHandleAll);
}
void __MonitorRotationByTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RotationByTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationByTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RotationByTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationByTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RotationByTime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RotationWithDecreaseAngleVelocity
{
UFUNCTION()
bool HasRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RotationWithDecreaseAngleVelocity);
}
FC_RotationWithDecreaseAngleVelocity& AssignRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity, const FC_RotationWithDecreaseAngleVelocity &inout DefaultValue = FC_RotationWithDecreaseAngleVelocity())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RotationWithDecreaseAngleVelocity, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRotationWithDecreaseAngleVelocity_BP(const FECSEntity &inout Entity, const FC_RotationWithDecreaseAngleVelocity &inout DefaultValue = FC_RotationWithDecreaseAngleVelocity())
{
    ECSFunc_FC_RotationWithDecreaseAngleVelocity::AssignRotationWithDecreaseAngleVelocity(Entity, DefaultValue);
    return;
}
FC_RotationWithDecreaseAngleVelocity& ModifyRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RotationWithDecreaseAngleVelocity));
    return local_12.GetComp();
}
FC_RotationWithDecreaseAngleVelocity& ModifyOrAddRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RotationWithDecreaseAngleVelocity));
    return local_12.GetComp();
}
const FC_RotationWithDecreaseAngleVelocity& GetRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RotationWithDecreaseAngleVelocity));
    return local_12.GetComp();
}
UFUNCTION()
FC_RotationWithDecreaseAngleVelocity GetRotationWithDecreaseAngleVelocity_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RotationWithDecreaseAngleVelocity& local_4 = ECSFunc_FC_RotationWithDecreaseAngleVelocity::GetRotationWithDecreaseAngleVelocity(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RotationWithDecreaseAngleVelocity();
}
const FC_RotationWithDecreaseAngleVelocity GetDefaultedRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RotationWithDecreaseAngleVelocity __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RotationWithDecreaseAngleVelocity);
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
FC_RotationWithDecreaseAngleVelocity GetDefaultedRotationWithDecreaseAngleVelocity_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RotationWithDecreaseAngleVelocity::GetDefaultedRotationWithDecreaseAngleVelocity(Entity);
}
UFUNCTION()
bool RemoveRotationWithDecreaseAngleVelocity(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RotationWithDecreaseAngleVelocity);
}
}
FECSMonitorRuntimeView __GetMonitorRotationWithDecreaseAngleVelocityOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationWithDecreaseAngleVelocityOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationWithDecreaseAngleVelocityOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationWithDecreaseAngleVelocityOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRotationWithDecreaseAngleVelocityOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, bMustHandleAll);
}
void __MonitorRotationWithDecreaseAngleVelocityLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationWithDecreaseAngleVelocityActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationWithDecreaseAngleVelocityModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RotationWithDecreaseAngleVelocity, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RotationRuntimeInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RotationRuntimeInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RotationRuntimeInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RotationRuntimeInfo
{
int __IndexOf_RotationBeginTime()
{
    return 0;
}
int __IndexOf_RotationTotalTime()
{
    return 1;
}
int __IndexOf_DeltaRotation()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RotationWithDecreaseAngleVelocity &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RotationWithDecreaseAngleVelocity &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RotationWithDecreaseAngleVelocity &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RotationWithDecreaseAngleVelocity
{
int __IndexOf_bEnable()
{
    return 0;
}
int __IndexOf_AngleVelocity()
{
    return 1;
}
int __IndexOf_DecreaseAngleVelocityRate()
{
    return 2;
}
int __IndexOf_RotationAxis()
{
    return 3;
}
}
