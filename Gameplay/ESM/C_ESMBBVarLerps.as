
namespace __INTENRAL_FC_ESMBBVarLerps_NS
{
    const TECSComponentDerivedPtr<FC_ESMBBVarLerps> DerivedPtr = TECSComponentDerivedPtr<FC_ESMBBVarLerps>();
    const FC_ESMBBVarLerps DefaultValue = FC_ESMBBVarLerps();

}
struct FESMBBVarLerpKey
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_TimeStart;
    UPROPERTY()
    FFPTime m_TimeEnd;
    UPROPERTY()
    FName m_VarName;
    UPROPERTY()
    float32 m_FromValue;
    UPROPERTY()
    float32 m_TargetValue;

    FESMBBVarLerpKey()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FESMBBVarLerpKey(const FESMBBVarLerpKey &inout Other)
    {
        this.m_FromValue = 0.0f;
        this.m_TargetValue = 0.0f;
        this.m_TimeStart = Other.m_TimeStart;
        this.m_TimeEnd = Other.m_TimeEnd;
        this.m_VarName = Other.m_VarName;
        this.m_FromValue = Other.m_FromValue;
        this.m_TargetValue = Other.m_TargetValue;
        return;
    }
    FESMBBVarLerpKey opAssign(const FESMBBVarLerpKey &inout Other)
    {
        FESMBBVarLerpKey __r;
        this.SetTimeStart(Other.GetTimeStart());
        this.SetTimeEnd(Other.GetTimeEnd());
        this.SetVarName(Other.GetVarName());
        this.SetFromValue(Other.GetFromValue());
        this.SetTargetValue(Other.GetTargetValue());
        return __r;
    }
    const FFPTime GetTimeStart() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TimeStart() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTimeStart(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimeStart = __Value;
        return;
    }
    const FFPTime GetTimeEnd() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TimeEnd() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTimeEnd(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TimeEnd = __Value;
        return;
    }
    FName GetVarName() const property
    {
        return this.m_VarName;
    }
    void SetVarName(const FName &inout __Value) property
    {
        if ((this.m_VarName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_VarName = __Value;
        return;
    }
    float32 GetFromValue() const property
    {
        return this.m_FromValue;
    }
    void SetFromValue(const float32 __Value) property
    {
        if (this.m_FromValue == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FromValue = __Value;
        return;
    }
    float32 GetTargetValue() const property
    {
        return this.m_TargetValue;
    }
    void SetTargetValue(const float32 __Value) property
    {
        if (this.m_TargetValue == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TargetValue = __Value;
        return;
    }
}

struct FC_ESMBBVarLerps : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FESMBBVarLerpKey> m_LerpKeys;

    FC_ESMBBVarLerps()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ESMBBVarLerps(const FC_ESMBBVarLerps &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LerpKeys = Other.m_LerpKeys;
        return;
    }
    FC_ESMBBVarLerps opAssign(const FC_ESMBBVarLerps &inout Other)
    {
        FC_ESMBBVarLerps __r;
        this.SetLerpKeys(Other.GetLerpKeys());
        return __r;
    }
    const TArray<FESMBBVarLerpKey> GetLerpKeys() const property
    {
        const TArray<FESMBBVarLerpKey> __r;
        return __r;
    }
    TArray<FESMBBVarLerpKey> GetModify_LerpKeys() property
    {
        TArray<FESMBBVarLerpKey> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLerpKeys(const TArray<FESMBBVarLerpKey> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LerpKeys = __Value;
        return;
    }
}

namespace ECSFunc_FC_ESMBBVarLerps
{
UFUNCTION()
bool HasESMBBVarLerps(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ESMBBVarLerps);
}
FC_ESMBBVarLerps& AssignESMBBVarLerps(const FECSEntity &inout Entity, const FC_ESMBBVarLerps &inout DefaultValue = FC_ESMBBVarLerps())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ESMBBVarLerps, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignESMBBVarLerps_BP(const FECSEntity &inout Entity, const FC_ESMBBVarLerps &inout DefaultValue = FC_ESMBBVarLerps())
{
    ECSFunc_FC_ESMBBVarLerps::AssignESMBBVarLerps(Entity, DefaultValue);
    return;
}
FC_ESMBBVarLerps& ModifyESMBBVarLerps(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ESMBBVarLerps));
    return local_12.GetComp();
}
FC_ESMBBVarLerps& ModifyOrAddESMBBVarLerps(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ESMBBVarLerps));
    return local_12.GetComp();
}
const FC_ESMBBVarLerps& GetESMBBVarLerps(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ESMBBVarLerps));
    return local_12.GetComp();
}
UFUNCTION()
FC_ESMBBVarLerps GetESMBBVarLerps_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ESMBBVarLerps& local_4 = ECSFunc_FC_ESMBBVarLerps::GetESMBBVarLerps(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ESMBBVarLerps();
}
const FC_ESMBBVarLerps GetDefaultedESMBBVarLerps(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ESMBBVarLerps __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ESMBBVarLerps);
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
FC_ESMBBVarLerps GetDefaultedESMBBVarLerps_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ESMBBVarLerps::GetDefaultedESMBBVarLerps(Entity);
}
UFUNCTION()
bool RemoveESMBBVarLerps(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ESMBBVarLerps);
}
}
FECSMonitorRuntimeView __GetMonitorESMBBVarLerpsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ESMBBVarLerps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMBBVarLerpsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ESMBBVarLerps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMBBVarLerpsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ESMBBVarLerps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMBBVarLerpsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ESMBBVarLerps, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorESMBBVarLerpsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ESMBBVarLerps, bFixedFrame, bMustHandleAll);
}
void __MonitorESMBBVarLerpsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ESMBBVarLerps, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorESMBBVarLerpsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ESMBBVarLerps, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorESMBBVarLerpsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ESMBBVarLerps, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FESMBBVarLerpKey &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FESMBBVarLerpKey &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FESMBBVarLerpKey
{
int __IndexOf_TimeStart()
{
    return 0;
}
int __IndexOf_TimeEnd()
{
    return 1;
}
int __IndexOf_VarName()
{
    return 2;
}
int __IndexOf_FromValue()
{
    return 3;
}
int __IndexOf_TargetValue()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ESMBBVarLerps &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ESMBBVarLerps &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ESMBBVarLerps &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ESMBBVarLerps
{
int __IndexOf_LerpKeys()
{
    return 0;
}
}
