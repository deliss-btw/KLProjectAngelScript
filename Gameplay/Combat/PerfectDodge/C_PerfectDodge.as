
namespace __INTENRAL_FC_PerfectDodge_NS
{
    const TECSComponentDerivedPtr<FC_PerfectDodge> DerivedPtr = TECSComponentDerivedPtr<FC_PerfectDodge>();
    const FC_PerfectDodge DefaultValue = FC_PerfectDodge();
}
namespace __INTENRAL_FC_PerfectDodgeDummyShapeRequest_NS
{
    const TECSComponentDerivedPtr<FC_PerfectDodgeDummyShapeRequest> DerivedPtr = TECSComponentDerivedPtr<FC_PerfectDodgeDummyShapeRequest>();
    const FC_PerfectDodgeDummyShapeRequest DefaultValue = FC_PerfectDodgeDummyShapeRequest();

}
struct FC_PerfectDodge : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bIsDummy;
    UPROPERTY()
    FECSEntity m_DummyEntity;
    UPROPERTY()
    FECSEntity m_OwnerEntity;
    UPROPERTY()
    int m_HitCount;

    FC_PerfectDodge()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PerfectDodge(const FC_PerfectDodge &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_PerfectDodge opAssign(const FC_PerfectDodge &inout Other)
    {
        FC_PerfectDodge __r;
        this.SetbIsDummy(Other.GetbIsDummy());
        this.SetDummyEntity(Other.GetDummyEntity());
        this.SetOwnerEntity(Other.GetOwnerEntity());
        this.SetHitCount(Other.GetHitCount());
        return __r;
    }
    FECSEntity GetFinalHitEntity(const FECSEntity &inout CmptEntity) const
    {
        FECSEntity local_10;
        if (this.GetbIsDummy())
        {
            local_10 = this.GetOwnerEntity();
        }
        else
        {
            local_10 = CmptEntity;
        }
        return local_10;
    }
    bool GetbIsDummy() const property
    {
        return this.m_bIsDummy;
    }
    void SetbIsDummy(const bool __Value) property
    {
        if (!(this.m_bIsDummy) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsDummy = __Value;
        return;
    }
    const FECSEntity GetDummyEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_DummyEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDummyEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DummyEntity = __Value;
        return;
    }
    FECSEntity GetOwnerEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OwnerEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetOwnerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_OwnerEntity = __Value;
        return;
    }
    int GetHitCount() const property
    {
        return this.m_HitCount;
    }
    void SetHitCount(const int __Value) property
    {
        if (this.m_HitCount == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_HitCount = __Value;
        return;
    }
}

struct FC_PerfectDodgeDummyShapeRequest : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FCollisionShapeInfo m_Shape;

    FC_PerfectDodgeDummyShapeRequest()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PerfectDodgeDummyShapeRequest(const FC_PerfectDodgeDummyShapeRequest &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Shape = Other.m_Shape;
        return;
    }
    FC_PerfectDodgeDummyShapeRequest opAssign(const FC_PerfectDodgeDummyShapeRequest &inout Other)
    {
        FC_PerfectDodgeDummyShapeRequest __r;
        this.SetShape(Other.GetShape());
        return __r;
    }
    const FCollisionShapeInfo GetShape() const property
    {
        const FCollisionShapeInfo __r;
        return __r;
    }
    FCollisionShapeInfo GetShape() property
    {
        FCollisionShapeInfo __r;
        return __r;
    }
    void SetShape(const FCollisionShapeInfo &inout __Value) property
    {
        this.m_Shape = __Value;
        return;
    }
}

namespace ECSFunc_FC_PerfectDodge
{
UFUNCTION()
bool HasPerfectDodge(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodge);
}
FC_PerfectDodge& AssignPerfectDodge(const FECSEntity &inout Entity, const FC_PerfectDodge &inout DefaultValue = FC_PerfectDodge())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodge, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPerfectDodge_BP(const FECSEntity &inout Entity, const FC_PerfectDodge &inout DefaultValue = FC_PerfectDodge())
{
    ECSFunc_FC_PerfectDodge::AssignPerfectDodge(Entity, DefaultValue);
    return;
}
FC_PerfectDodge& ModifyPerfectDodge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodge));
    return local_12.GetComp();
}
FC_PerfectDodge& ModifyOrAddPerfectDodge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodge));
    return local_12.GetComp();
}
const FC_PerfectDodge& GetPerfectDodge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodge));
    return local_12.GetComp();
}
UFUNCTION()
FC_PerfectDodge GetPerfectDodge_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PerfectDodge& local_4 = ECSFunc_FC_PerfectDodge::GetPerfectDodge(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PerfectDodge();
}
const FC_PerfectDodge GetDefaultedPerfectDodge(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PerfectDodge __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodge);
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
FC_PerfectDodge GetDefaultedPerfectDodge_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PerfectDodge::GetDefaultedPerfectDodge(Entity);
}
UFUNCTION()
bool RemovePerfectDodge(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodge);
}
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PerfectDodge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PerfectDodge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PerfectDodge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PerfectDodge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PerfectDodge, bFixedFrame, bMustHandleAll);
}
void __MonitorPerfectDodgeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PerfectDodge, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPerfectDodgeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PerfectDodge, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPerfectDodgeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PerfectDodge, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PerfectDodgeDummyShapeRequest
{
UFUNCTION()
bool HasPerfectDodgeDummyShapeRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodgeDummyShapeRequest);
}
FC_PerfectDodgeDummyShapeRequest& AssignPerfectDodgeDummyShapeRequest(const FECSEntity &inout Entity, const FC_PerfectDodgeDummyShapeRequest &inout DefaultValue = FC_PerfectDodgeDummyShapeRequest())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodgeDummyShapeRequest, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPerfectDodgeDummyShapeRequest_BP(const FECSEntity &inout Entity, const FC_PerfectDodgeDummyShapeRequest &inout DefaultValue = FC_PerfectDodgeDummyShapeRequest())
{
    ECSFunc_FC_PerfectDodgeDummyShapeRequest::AssignPerfectDodgeDummyShapeRequest(Entity, DefaultValue);
    return;
}
FC_PerfectDodgeDummyShapeRequest& ModifyPerfectDodgeDummyShapeRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodgeDummyShapeRequest));
    return local_12.GetComp();
}
FC_PerfectDodgeDummyShapeRequest& ModifyOrAddPerfectDodgeDummyShapeRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodgeDummyShapeRequest));
    return local_12.GetComp();
}
const FC_PerfectDodgeDummyShapeRequest& GetPerfectDodgeDummyShapeRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodgeDummyShapeRequest));
    return local_12.GetComp();
}
UFUNCTION()
FC_PerfectDodgeDummyShapeRequest GetPerfectDodgeDummyShapeRequest_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PerfectDodgeDummyShapeRequest& local_4 = ECSFunc_FC_PerfectDodgeDummyShapeRequest::GetPerfectDodgeDummyShapeRequest(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PerfectDodgeDummyShapeRequest();
}
const FC_PerfectDodgeDummyShapeRequest GetDefaultedPerfectDodgeDummyShapeRequest(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PerfectDodgeDummyShapeRequest __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodgeDummyShapeRequest);
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
FC_PerfectDodgeDummyShapeRequest GetDefaultedPerfectDodgeDummyShapeRequest_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PerfectDodgeDummyShapeRequest::GetDefaultedPerfectDodgeDummyShapeRequest(Entity);
}
UFUNCTION()
bool RemovePerfectDodgeDummyShapeRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PerfectDodgeDummyShapeRequest);
}
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeDummyShapeRequestOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeDummyShapeRequestOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeDummyShapeRequestOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeDummyShapeRequestOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPerfectDodgeDummyShapeRequestOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, bMustHandleAll);
}
void __MonitorPerfectDodgeDummyShapeRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPerfectDodgeDummyShapeRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPerfectDodgeDummyShapeRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PerfectDodgeDummyShapeRequest, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PerfectDodge &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PerfectDodge &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PerfectDodge &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PerfectDodge
{
int __IndexOf_bIsDummy()
{
    return 0;
}
int __IndexOf_DummyEntity()
{
    return 1;
}
int __IndexOf_OwnerEntity()
{
    return 2;
}
int __IndexOf_HitCount()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PerfectDodgeDummyShapeRequest &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PerfectDodgeDummyShapeRequest &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PerfectDodgeDummyShapeRequest &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PerfectDodgeDummyShapeRequest
{
int __IndexOf_Shape()
{
    return 0;
}
}
