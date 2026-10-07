
namespace __INTENRAL_FC_VisualScaleModifyBlendInAndHold_NS
{
    const TECSComponentDerivedPtr<FC_VisualScaleModifyBlendInAndHold> DerivedPtr = TECSComponentDerivedPtr<FC_VisualScaleModifyBlendInAndHold>();
    const FC_VisualScaleModifyBlendInAndHold DefaultValue = FC_VisualScaleModifyBlendInAndHold();
}
namespace __INTENRAL_FC_VisualScaleModifyBlendOut_NS
{
    const TECSComponentDerivedPtr<FC_VisualScaleModifyBlendOut> DerivedPtr = TECSComponentDerivedPtr<FC_VisualScaleModifyBlendOut>();
    const FC_VisualScaleModifyBlendOut DefaultValue = FC_VisualScaleModifyBlendOut();

}
struct FC_VisualScaleModifyBlendInAndHold : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_InitialVisualScale;
    UPROPERTY()
    FVector m_TargetVisualScale;
    UPROPERTY()
    FFPTime m_BlendInStartTime;
    UPROPERTY()
    float32 m_BlendInTime;

    FC_VisualScaleModifyBlendInAndHold()
    {
        this.m_BlendInTime = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_VisualScaleModifyBlendInAndHold(const FC_VisualScaleModifyBlendInAndHold &inout Other)
    {
        this.m_BlendInTime = 0.0f;
        this.__InitDirtyFlags();
        this.m_InitialVisualScale = Other.m_InitialVisualScale;
        this.m_TargetVisualScale = Other.m_TargetVisualScale;
        this.m_BlendInStartTime = Other.m_BlendInStartTime;
        this.m_BlendInTime = Other.m_BlendInTime;
        return;
    }
    FC_VisualScaleModifyBlendInAndHold opAssign(const FC_VisualScaleModifyBlendInAndHold &inout Other)
    {
        FC_VisualScaleModifyBlendInAndHold __r;
        this.SetInitialVisualScale(Other.GetInitialVisualScale());
        this.SetTargetVisualScale(Other.GetTargetVisualScale());
        this.SetBlendInStartTime(Other.GetBlendInStartTime());
        this.SetBlendInTime(Other.GetBlendInTime());
        return __r;
    }
    const FVector GetInitialVisualScale() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_InitialVisualScale() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInitialVisualScale(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InitialVisualScale = __Value;
        return;
    }
    const FVector GetTargetVisualScale() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetVisualScale() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTargetVisualScale(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetVisualScale = __Value;
        return;
    }
    const FFPTime GetBlendInStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_BlendInStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetBlendInStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BlendInStartTime = __Value;
        return;
    }
    float32 GetBlendInTime() const property
    {
        return this.m_BlendInTime;
    }
    void SetBlendInTime(const float32 __Value) property
    {
        if (this.m_BlendInTime == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_BlendInTime = __Value;
        return;
    }
}

struct FC_VisualScaleModifyBlendOut : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_InitialVisualScale;
    UPROPERTY()
    FVector m_TargetVisualScale;
    UPROPERTY()
    FFPTime m_BlendOutStartTime;
    UPROPERTY()
    FFPTime m_RemoveTime;
    UPROPERTY()
    float32 m_BlendOutTime;

    FC_VisualScaleModifyBlendOut()
    {
        this.m_BlendOutTime = 0.0f;
        this.__InitDirtyFlags();
        return;
    }
    FC_VisualScaleModifyBlendOut(const FC_VisualScaleModifyBlendOut &inout Other)
    {
        this.m_BlendOutTime = 0.0f;
        this.__InitDirtyFlags();
        this.m_InitialVisualScale = Other.m_InitialVisualScale;
        this.m_TargetVisualScale = Other.m_TargetVisualScale;
        this.m_BlendOutStartTime = Other.m_BlendOutStartTime;
        this.m_RemoveTime = Other.m_RemoveTime;
        this.m_BlendOutTime = Other.m_BlendOutTime;
        return;
    }
    FC_VisualScaleModifyBlendOut opAssign(const FC_VisualScaleModifyBlendOut &inout Other)
    {
        FC_VisualScaleModifyBlendOut __r;
        this.SetInitialVisualScale(Other.GetInitialVisualScale());
        this.SetTargetVisualScale(Other.GetTargetVisualScale());
        this.SetBlendOutStartTime(Other.GetBlendOutStartTime());
        this.SetRemoveTime(Other.GetRemoveTime());
        this.SetBlendOutTime(Other.GetBlendOutTime());
        return __r;
    }
    const FVector GetInitialVisualScale() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_InitialVisualScale() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInitialVisualScale(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InitialVisualScale = __Value;
        return;
    }
    const FVector GetTargetVisualScale() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetVisualScale() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTargetVisualScale(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetVisualScale = __Value;
        return;
    }
    const FFPTime GetBlendOutStartTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_BlendOutStartTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetBlendOutStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BlendOutStartTime = __Value;
        return;
    }
    const FFPTime GetRemoveTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_RemoveTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetRemoveTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RemoveTime = __Value;
        return;
    }
    float32 GetBlendOutTime() const property
    {
        return this.m_BlendOutTime;
    }
    void SetBlendOutTime(const float32 __Value) property
    {
        if (this.m_BlendOutTime == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_BlendOutTime = __Value;
        return;
    }
}

namespace ECSFunc_FC_VisualScaleModifyBlendInAndHold
{
UFUNCTION()
bool HasVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendInAndHold);
}
FC_VisualScaleModifyBlendInAndHold& AssignVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity, const FC_VisualScaleModifyBlendInAndHold &inout DefaultValue = FC_VisualScaleModifyBlendInAndHold())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendInAndHold, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignVisualScaleModifyBlendInAndHold_BP(const FECSEntity &inout Entity, const FC_VisualScaleModifyBlendInAndHold &inout DefaultValue = FC_VisualScaleModifyBlendInAndHold())
{
    ECSFunc_FC_VisualScaleModifyBlendInAndHold::AssignVisualScaleModifyBlendInAndHold(Entity, DefaultValue);
    return;
}
FC_VisualScaleModifyBlendInAndHold& ModifyVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendInAndHold));
    return local_12.GetComp();
}
FC_VisualScaleModifyBlendInAndHold& ModifyOrAddVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendInAndHold));
    return local_12.GetComp();
}
const FC_VisualScaleModifyBlendInAndHold& GetVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendInAndHold));
    return local_12.GetComp();
}
UFUNCTION()
FC_VisualScaleModifyBlendInAndHold GetVisualScaleModifyBlendInAndHold_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_VisualScaleModifyBlendInAndHold& local_4 = ECSFunc_FC_VisualScaleModifyBlendInAndHold::GetVisualScaleModifyBlendInAndHold(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_VisualScaleModifyBlendInAndHold();
}
const FC_VisualScaleModifyBlendInAndHold GetDefaultedVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_VisualScaleModifyBlendInAndHold __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendInAndHold);
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
FC_VisualScaleModifyBlendInAndHold GetDefaultedVisualScaleModifyBlendInAndHold_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_VisualScaleModifyBlendInAndHold::GetDefaultedVisualScaleModifyBlendInAndHold(Entity);
}
UFUNCTION()
bool RemoveVisualScaleModifyBlendInAndHold(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendInAndHold);
}
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendInAndHoldOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendInAndHoldOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendInAndHoldOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendInAndHoldOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendInAndHoldOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, bMustHandleAll);
}
void __MonitorVisualScaleModifyBlendInAndHoldLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVisualScaleModifyBlendInAndHoldActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVisualScaleModifyBlendInAndHoldModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_VisualScaleModifyBlendInAndHold, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_VisualScaleModifyBlendOut
{
UFUNCTION()
bool HasVisualScaleModifyBlendOut(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendOut);
}
FC_VisualScaleModifyBlendOut& AssignVisualScaleModifyBlendOut(const FECSEntity &inout Entity, const FC_VisualScaleModifyBlendOut &inout DefaultValue = FC_VisualScaleModifyBlendOut())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendOut, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignVisualScaleModifyBlendOut_BP(const FECSEntity &inout Entity, const FC_VisualScaleModifyBlendOut &inout DefaultValue = FC_VisualScaleModifyBlendOut())
{
    ECSFunc_FC_VisualScaleModifyBlendOut::AssignVisualScaleModifyBlendOut(Entity, DefaultValue);
    return;
}
FC_VisualScaleModifyBlendOut& ModifyVisualScaleModifyBlendOut(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendOut));
    return local_12.GetComp();
}
FC_VisualScaleModifyBlendOut& ModifyOrAddVisualScaleModifyBlendOut(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendOut));
    return local_12.GetComp();
}
const FC_VisualScaleModifyBlendOut& GetVisualScaleModifyBlendOut(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendOut));
    return local_12.GetComp();
}
UFUNCTION()
FC_VisualScaleModifyBlendOut GetVisualScaleModifyBlendOut_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_VisualScaleModifyBlendOut& local_4 = ECSFunc_FC_VisualScaleModifyBlendOut::GetVisualScaleModifyBlendOut(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_VisualScaleModifyBlendOut();
}
const FC_VisualScaleModifyBlendOut GetDefaultedVisualScaleModifyBlendOut(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_VisualScaleModifyBlendOut __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendOut);
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
FC_VisualScaleModifyBlendOut GetDefaultedVisualScaleModifyBlendOut_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_VisualScaleModifyBlendOut::GetDefaultedVisualScaleModifyBlendOut(Entity);
}
UFUNCTION()
bool RemoveVisualScaleModifyBlendOut(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_VisualScaleModifyBlendOut);
}
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendOutOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_VisualScaleModifyBlendOut, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendOutOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_VisualScaleModifyBlendOut, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendOutOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_VisualScaleModifyBlendOut, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendOutOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_VisualScaleModifyBlendOut, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVisualScaleModifyBlendOutOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_VisualScaleModifyBlendOut, bFixedFrame, bMustHandleAll);
}
void __MonitorVisualScaleModifyBlendOutLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_VisualScaleModifyBlendOut, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVisualScaleModifyBlendOutActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_VisualScaleModifyBlendOut, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVisualScaleModifyBlendOutModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_VisualScaleModifyBlendOut, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_VisualScaleModifyBlendInAndHold &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_VisualScaleModifyBlendInAndHold &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_VisualScaleModifyBlendInAndHold &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_VisualScaleModifyBlendInAndHold
{
int __IndexOf_InitialVisualScale()
{
    return 0;
}
int __IndexOf_TargetVisualScale()
{
    return 1;
}
int __IndexOf_BlendInStartTime()
{
    return 2;
}
int __IndexOf_BlendInTime()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_VisualScaleModifyBlendOut &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_VisualScaleModifyBlendOut &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_VisualScaleModifyBlendOut &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_VisualScaleModifyBlendOut
{
int __IndexOf_InitialVisualScale()
{
    return 0;
}
int __IndexOf_TargetVisualScale()
{
    return 1;
}
int __IndexOf_BlendOutStartTime()
{
    return 2;
}
int __IndexOf_RemoveTime()
{
    return 3;
}
int __IndexOf_BlendOutTime()
{
    return 4;
}
}
