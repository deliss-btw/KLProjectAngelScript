
namespace __INTENRAL_FC_ThrowPredictActiveTag_NS
{
    const TECSComponentDerivedPtr<FC_ThrowPredictActiveTag> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowPredictActiveTag>();
    const FC_ThrowPredictActiveTag DefaultValue = FC_ThrowPredictActiveTag();
}
namespace __INTENRAL_FC_ThrowPredictBlendInTime_NS
{
    const TECSComponentDerivedPtr<FC_ThrowPredictBlendInTime> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowPredictBlendInTime>();
    const FC_ThrowPredictBlendInTime DefaultValue = FC_ThrowPredictBlendInTime();
}
namespace __INTENRAL_FC_ThrowPredictBlendOutTime_NS
{
    const TECSComponentDerivedPtr<FC_ThrowPredictBlendOutTime> DerivedPtr = TECSComponentDerivedPtr<FC_ThrowPredictBlendOutTime>();
    const FC_ThrowPredictBlendOutTime DefaultValue = FC_ThrowPredictBlendOutTime();

}
struct FC_ThrowPredictActiveTag : FECSComponent
{
    FC_ThrowPredictActiveTag()
    {
        return;
    }
}

struct FC_ThrowPredictBlendInTime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_BlendServerToPredictTime;

    FC_ThrowPredictBlendInTime()
    {
        this.m_BlendServerToPredictTime = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_ThrowPredictBlendInTime(const FC_ThrowPredictBlendInTime &inout Other)
    {
        this.m_BlendServerToPredictTime = 0.0f;
        this.__InitDirtyFlags();
        this.m_BlendServerToPredictTime = Other.m_BlendServerToPredictTime;
        return;
    }
    FC_ThrowPredictBlendInTime opAssign(const FC_ThrowPredictBlendInTime &inout Other)
    {
        FC_ThrowPredictBlendInTime __r;
        this.SetBlendServerToPredictTime(Other.GetBlendServerToPredictTime());
        return __r;
    }
    float32 GetBlendServerToPredictTime() const property
    {
        return this.m_BlendServerToPredictTime;
    }
    void SetBlendServerToPredictTime(const float32 __Value) property
    {
        if (this.m_BlendServerToPredictTime == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BlendServerToPredictTime = __Value;
        return;
    }
}

struct FC_ThrowPredictBlendOutTime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_BlendPredictToServerTime;

    FC_ThrowPredictBlendOutTime()
    {
        this.m_BlendPredictToServerTime = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_ThrowPredictBlendOutTime(const FC_ThrowPredictBlendOutTime &inout Other)
    {
        this.m_BlendPredictToServerTime = 0.0f;
        this.__InitDirtyFlags();
        this.m_BlendPredictToServerTime = Other.m_BlendPredictToServerTime;
        return;
    }
    FC_ThrowPredictBlendOutTime opAssign(const FC_ThrowPredictBlendOutTime &inout Other)
    {
        FC_ThrowPredictBlendOutTime __r;
        this.SetBlendPredictToServerTime(Other.GetBlendPredictToServerTime());
        return __r;
    }
    float32 GetBlendPredictToServerTime() const property
    {
        return this.m_BlendPredictToServerTime;
    }
    void SetBlendPredictToServerTime(const float32 __Value) property
    {
        if (this.m_BlendPredictToServerTime == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BlendPredictToServerTime = __Value;
        return;
    }
}

namespace ECSFunc_FC_ThrowPredictActiveTag
{
UFUNCTION()
bool HasThrowPredictActiveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictActiveTag);
}
FC_ThrowPredictActiveTag& AssignThrowPredictActiveTag(const FECSEntity &inout Entity, const FC_ThrowPredictActiveTag &inout DefaultValue = FC_ThrowPredictActiveTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictActiveTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowPredictActiveTag_BP(const FECSEntity &inout Entity, const FC_ThrowPredictActiveTag &inout DefaultValue = FC_ThrowPredictActiveTag())
{
    ECSFunc_FC_ThrowPredictActiveTag::AssignThrowPredictActiveTag(Entity, DefaultValue);
    return;
}
FC_ThrowPredictActiveTag& ModifyThrowPredictActiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictActiveTag));
    return local_12.GetComp();
}
FC_ThrowPredictActiveTag& ModifyOrAddThrowPredictActiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictActiveTag));
    return local_12.GetComp();
}
const FC_ThrowPredictActiveTag& GetThrowPredictActiveTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictActiveTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowPredictActiveTag GetThrowPredictActiveTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowPredictActiveTag& local_4 = ECSFunc_FC_ThrowPredictActiveTag::GetThrowPredictActiveTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowPredictActiveTag();
}
const FC_ThrowPredictActiveTag GetDefaultedThrowPredictActiveTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowPredictActiveTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictActiveTag);
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
FC_ThrowPredictActiveTag GetDefaultedThrowPredictActiveTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowPredictActiveTag::GetDefaultedThrowPredictActiveTag(Entity);
}
UFUNCTION()
bool RemoveThrowPredictActiveTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictActiveTag);
}
}
FECSMonitorRuntimeView __GetMonitorThrowPredictActiveTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowPredictActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictActiveTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowPredictActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictActiveTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowPredictActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictActiveTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowPredictActiveTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictActiveTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowPredictActiveTag, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowPredictActiveTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowPredictActiveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictActiveTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowPredictActiveTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictActiveTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowPredictActiveTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowPredictBlendInTime
{
UFUNCTION()
bool HasThrowPredictBlendInTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendInTime);
}
FC_ThrowPredictBlendInTime& AssignThrowPredictBlendInTime(const FECSEntity &inout Entity, const FC_ThrowPredictBlendInTime &inout DefaultValue = FC_ThrowPredictBlendInTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendInTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowPredictBlendInTime_BP(const FECSEntity &inout Entity, const FC_ThrowPredictBlendInTime &inout DefaultValue = FC_ThrowPredictBlendInTime())
{
    ECSFunc_FC_ThrowPredictBlendInTime::AssignThrowPredictBlendInTime(Entity, DefaultValue);
    return;
}
FC_ThrowPredictBlendInTime& ModifyThrowPredictBlendInTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendInTime));
    return local_12.GetComp();
}
FC_ThrowPredictBlendInTime& ModifyOrAddThrowPredictBlendInTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendInTime));
    return local_12.GetComp();
}
const FC_ThrowPredictBlendInTime& GetThrowPredictBlendInTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendInTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowPredictBlendInTime GetThrowPredictBlendInTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowPredictBlendInTime& local_4 = ECSFunc_FC_ThrowPredictBlendInTime::GetThrowPredictBlendInTime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowPredictBlendInTime();
}
const FC_ThrowPredictBlendInTime GetDefaultedThrowPredictBlendInTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowPredictBlendInTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendInTime);
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
FC_ThrowPredictBlendInTime GetDefaultedThrowPredictBlendInTime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowPredictBlendInTime::GetDefaultedThrowPredictBlendInTime(Entity);
}
UFUNCTION()
bool RemoveThrowPredictBlendInTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendInTime);
}
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendInTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowPredictBlendInTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendInTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowPredictBlendInTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendInTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowPredictBlendInTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendInTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowPredictBlendInTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendInTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowPredictBlendInTime, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowPredictBlendInTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowPredictBlendInTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictBlendInTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowPredictBlendInTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictBlendInTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowPredictBlendInTime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ThrowPredictBlendOutTime
{
UFUNCTION()
bool HasThrowPredictBlendOutTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendOutTime);
}
FC_ThrowPredictBlendOutTime& AssignThrowPredictBlendOutTime(const FECSEntity &inout Entity, const FC_ThrowPredictBlendOutTime &inout DefaultValue = FC_ThrowPredictBlendOutTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendOutTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignThrowPredictBlendOutTime_BP(const FECSEntity &inout Entity, const FC_ThrowPredictBlendOutTime &inout DefaultValue = FC_ThrowPredictBlendOutTime())
{
    ECSFunc_FC_ThrowPredictBlendOutTime::AssignThrowPredictBlendOutTime(Entity, DefaultValue);
    return;
}
FC_ThrowPredictBlendOutTime& ModifyThrowPredictBlendOutTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendOutTime));
    return local_12.GetComp();
}
FC_ThrowPredictBlendOutTime& ModifyOrAddThrowPredictBlendOutTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendOutTime));
    return local_12.GetComp();
}
const FC_ThrowPredictBlendOutTime& GetThrowPredictBlendOutTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendOutTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_ThrowPredictBlendOutTime GetThrowPredictBlendOutTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ThrowPredictBlendOutTime& local_4 = ECSFunc_FC_ThrowPredictBlendOutTime::GetThrowPredictBlendOutTime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ThrowPredictBlendOutTime();
}
const FC_ThrowPredictBlendOutTime GetDefaultedThrowPredictBlendOutTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ThrowPredictBlendOutTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendOutTime);
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
FC_ThrowPredictBlendOutTime GetDefaultedThrowPredictBlendOutTime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ThrowPredictBlendOutTime::GetDefaultedThrowPredictBlendOutTime(Entity);
}
UFUNCTION()
bool RemoveThrowPredictBlendOutTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ThrowPredictBlendOutTime);
}
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendOutTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ThrowPredictBlendOutTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendOutTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ThrowPredictBlendOutTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendOutTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ThrowPredictBlendOutTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendOutTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ThrowPredictBlendOutTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorThrowPredictBlendOutTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ThrowPredictBlendOutTime, bFixedFrame, bMustHandleAll);
}
void __MonitorThrowPredictBlendOutTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ThrowPredictBlendOutTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictBlendOutTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ThrowPredictBlendOutTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorThrowPredictBlendOutTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ThrowPredictBlendOutTime, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ThrowPredictBlendInTime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ThrowPredictBlendInTime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ThrowPredictBlendInTime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ThrowPredictBlendInTime
{
int __IndexOf_BlendServerToPredictTime()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ThrowPredictBlendOutTime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ThrowPredictBlendOutTime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ThrowPredictBlendOutTime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ThrowPredictBlendOutTime
{
int __IndexOf_BlendPredictToServerTime()
{
    return 0;
}
}
