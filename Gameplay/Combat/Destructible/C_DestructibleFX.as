
namespace __INTENRAL_FC_DestructibleFX_NS
{
    const TECSComponentDerivedPtr<FC_DestructibleFX> DerivedPtr = TECSComponentDerivedPtr<FC_DestructibleFX>();
    const FC_DestructibleFX DefaultValue = FC_DestructibleFX();

}
struct FC_DestructibleFX : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    EImpactType m_ImpactType;
    UPROPERTY()
    EImpactStrength m_ImpactStrength;
    UPROPERTY()
    FVector m_ForceDirection;

    FC_DestructibleFX()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DestructibleFX(const FC_DestructibleFX &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DestructibleFX opAssign(const FC_DestructibleFX &inout Other)
    {
        FC_DestructibleFX __r;
        this.SetImpactType(Other.GetImpactType());
        this.SetImpactStrength(Other.GetImpactStrength());
        this.SetForceDirection(Other.GetForceDirection());
        return __r;
    }
    EImpactType GetImpactType() const property
    {
        return this.m_ImpactType;
    }
    void SetImpactType(const EImpactType __Value) property
    {
        if (int(this.m_ImpactType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ImpactType = __Value;
        return;
    }
    EImpactStrength GetImpactStrength() const property
    {
        return this.m_ImpactStrength;
    }
    void SetImpactStrength(const EImpactStrength __Value) property
    {
        if (int(this.m_ImpactStrength) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ImpactStrength = __Value;
        return;
    }
    const FVector GetForceDirection() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_ForceDirection() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetForceDirection(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ForceDirection = __Value;
        return;
    }
}

namespace ECSFunc_FC_DestructibleFX
{
UFUNCTION()
bool HasDestructibleFX(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DestructibleFX);
}
FC_DestructibleFX& AssignDestructibleFX(const FECSEntity &inout Entity, const FC_DestructibleFX &inout DefaultValue = FC_DestructibleFX())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DestructibleFX, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDestructibleFX_BP(const FECSEntity &inout Entity, const FC_DestructibleFX &inout DefaultValue = FC_DestructibleFX())
{
    ECSFunc_FC_DestructibleFX::AssignDestructibleFX(Entity, DefaultValue);
    return;
}
FC_DestructibleFX& ModifyDestructibleFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DestructibleFX));
    return local_12.GetComp();
}
FC_DestructibleFX& ModifyOrAddDestructibleFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DestructibleFX));
    return local_12.GetComp();
}
const FC_DestructibleFX& GetDestructibleFX(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DestructibleFX));
    return local_12.GetComp();
}
UFUNCTION()
FC_DestructibleFX GetDestructibleFX_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DestructibleFX& local_4 = ECSFunc_FC_DestructibleFX::GetDestructibleFX(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DestructibleFX();
}
const FC_DestructibleFX GetDefaultedDestructibleFX(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DestructibleFX __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DestructibleFX);
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
FC_DestructibleFX GetDefaultedDestructibleFX_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DestructibleFX::GetDefaultedDestructibleFX(Entity);
}
UFUNCTION()
bool RemoveDestructibleFX(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DestructibleFX);
}
}
FECSMonitorRuntimeView __GetMonitorDestructibleFXOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DestructibleFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleFXOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DestructibleFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleFXOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DestructibleFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleFXOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DestructibleFX, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDestructibleFXOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DestructibleFX, bFixedFrame, bMustHandleAll);
}
void __MonitorDestructibleFXLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DestructibleFX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleFXActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DestructibleFX, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDestructibleFXModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DestructibleFX, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DestructibleFX &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DestructibleFX &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DestructibleFX &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DestructibleFX
{
int __IndexOf_ImpactType()
{
    return 0;
}
int __IndexOf_ImpactStrength()
{
    return 1;
}
int __IndexOf_ForceDirection()
{
    return 2;
}
}
