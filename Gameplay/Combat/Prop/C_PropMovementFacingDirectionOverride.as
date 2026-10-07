
namespace __INTENRAL_FC_PropMovementFacingDirectionOverride_NS
{
    const TECSComponentDerivedPtr<FC_PropMovementFacingDirectionOverride> DerivedPtr = TECSComponentDerivedPtr<FC_PropMovementFacingDirectionOverride>();
    const FC_PropMovementFacingDirectionOverride DefaultValue = FC_PropMovementFacingDirectionOverride();

}
struct FC_PropMovementFacingDirectionOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_FacingDirectionVector;
    UPROPERTY()
    bool m_bRemoveAfterAccessed;

    FC_PropMovementFacingDirectionOverride()
    {
        this.m_bRemoveAfterAccessed = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_PropMovementFacingDirectionOverride(const FC_PropMovementFacingDirectionOverride &inout Other)
    {
        this.m_bRemoveAfterAccessed = false;
        this.__InitDirtyFlags();
        this.m_FacingDirectionVector = Other.m_FacingDirectionVector;
        this.m_bRemoveAfterAccessed = Other.m_bRemoveAfterAccessed;
        return;
    }
    FC_PropMovementFacingDirectionOverride opAssign(const FC_PropMovementFacingDirectionOverride &inout Other)
    {
        FC_PropMovementFacingDirectionOverride __r;
        this.SetFacingDirectionVector(Other.GetFacingDirectionVector());
        this.SetbRemoveAfterAccessed(Other.GetbRemoveAfterAccessed());
        return __r;
    }
    const FVector GetFacingDirectionVector() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_FacingDirectionVector() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFacingDirectionVector(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FacingDirectionVector = __Value;
        return;
    }
    bool GetbRemoveAfterAccessed() const property
    {
        return this.m_bRemoveAfterAccessed;
    }
    void SetbRemoveAfterAccessed(const bool __Value) property
    {
        if (!(this.m_bRemoveAfterAccessed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bRemoveAfterAccessed = __Value;
        return;
    }
}

namespace ECSFunc_FC_PropMovementFacingDirectionOverride
{
UFUNCTION()
bool HasPropMovementFacingDirectionOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropMovementFacingDirectionOverride);
}
FC_PropMovementFacingDirectionOverride& AssignPropMovementFacingDirectionOverride(const FECSEntity &inout Entity, const FC_PropMovementFacingDirectionOverride &inout DefaultValue = FC_PropMovementFacingDirectionOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropMovementFacingDirectionOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropMovementFacingDirectionOverride_BP(const FECSEntity &inout Entity, const FC_PropMovementFacingDirectionOverride &inout DefaultValue = FC_PropMovementFacingDirectionOverride())
{
    ECSFunc_FC_PropMovementFacingDirectionOverride::AssignPropMovementFacingDirectionOverride(Entity, DefaultValue);
    return;
}
FC_PropMovementFacingDirectionOverride& ModifyPropMovementFacingDirectionOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropMovementFacingDirectionOverride));
    return local_12.GetComp();
}
FC_PropMovementFacingDirectionOverride& ModifyOrAddPropMovementFacingDirectionOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropMovementFacingDirectionOverride));
    return local_12.GetComp();
}
const FC_PropMovementFacingDirectionOverride& GetPropMovementFacingDirectionOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropMovementFacingDirectionOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropMovementFacingDirectionOverride GetPropMovementFacingDirectionOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PropMovementFacingDirectionOverride& local_4 = ECSFunc_FC_PropMovementFacingDirectionOverride::GetPropMovementFacingDirectionOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PropMovementFacingDirectionOverride();
}
const FC_PropMovementFacingDirectionOverride GetDefaultedPropMovementFacingDirectionOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropMovementFacingDirectionOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropMovementFacingDirectionOverride);
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
FC_PropMovementFacingDirectionOverride GetDefaultedPropMovementFacingDirectionOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PropMovementFacingDirectionOverride::GetDefaultedPropMovementFacingDirectionOverride(Entity);
}
UFUNCTION()
bool RemovePropMovementFacingDirectionOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropMovementFacingDirectionOverride);
}
}
FECSMonitorRuntimeView __GetMonitorPropMovementFacingDirectionOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementFacingDirectionOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementFacingDirectionOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementFacingDirectionOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementFacingDirectionOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorPropMovementFacingDirectionOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropMovementFacingDirectionOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropMovementFacingDirectionOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropMovementFacingDirectionOverride, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PropMovementFacingDirectionOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PropMovementFacingDirectionOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PropMovementFacingDirectionOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PropMovementFacingDirectionOverride
{
int __IndexOf_FacingDirectionVector()
{
    return 0;
}
int __IndexOf_bRemoveAfterAccessed()
{
    return 1;
}
}
