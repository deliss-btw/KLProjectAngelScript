
namespace __INTENRAL_FC_EntityHitCollider_NS
{
    const TECSComponentDerivedPtr<FC_EntityHitCollider> DerivedPtr = TECSComponentDerivedPtr<FC_EntityHitCollider>();
    const FC_EntityHitCollider DefaultValue = FC_EntityHitCollider();

}
struct FC_EntityHitCollider : FECSComponent
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    FVector m_LastPosition;
    UPROPERTY()
    FPropMovementExtraConfig m_ExtraConfig;

    FC_EntityHitCollider()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EntityHitCollider(const FC_EntityHitCollider &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Entity = Other.m_Entity;
        this.m_LastPosition = Other.m_LastPosition;
        this.m_ExtraConfig = Other.m_ExtraConfig;
        return;
    }
    FC_EntityHitCollider opAssign(const FC_EntityHitCollider &inout Other)
    {
        FC_EntityHitCollider __r;
        this.SetEntity(Other.GetEntity());
        this.SetLastPosition(Other.GetLastPosition());
        this.SetExtraConfig(Other.GetExtraConfig());
        return __r;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Entity = __Value;
        return;
    }
    const FVector GetLastPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastPosition() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetLastPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LastPosition = __Value;
        return;
    }
    const FPropMovementExtraConfig GetExtraConfig() const property
    {
        const FPropMovementExtraConfig __r;
        return __r;
    }
    FPropMovementExtraConfig GetExtraConfig() property
    {
        FPropMovementExtraConfig __r;
        return __r;
    }
    void SetExtraConfig(const FPropMovementExtraConfig &inout __Value) property
    {
        this.m_ExtraConfig = __Value;
        return;
    }
}

namespace ECSFunc_FC_EntityHitCollider
{
UFUNCTION()
bool HasEntityHitCollider(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityHitCollider);
}
FC_EntityHitCollider& AssignEntityHitCollider(const FECSEntity &inout Entity, const FC_EntityHitCollider &inout DefaultValue = FC_EntityHitCollider())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityHitCollider, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityHitCollider_BP(const FECSEntity &inout Entity, const FC_EntityHitCollider &inout DefaultValue = FC_EntityHitCollider())
{
    ECSFunc_FC_EntityHitCollider::AssignEntityHitCollider(Entity, DefaultValue);
    return;
}
FC_EntityHitCollider& ModifyEntityHitCollider(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityHitCollider));
    return local_12.GetComp();
}
FC_EntityHitCollider& ModifyOrAddEntityHitCollider(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityHitCollider));
    return local_12.GetComp();
}
const FC_EntityHitCollider& GetEntityHitCollider(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityHitCollider));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityHitCollider GetEntityHitCollider_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EntityHitCollider& local_4 = ECSFunc_FC_EntityHitCollider::GetEntityHitCollider(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EntityHitCollider();
}
const FC_EntityHitCollider GetDefaultedEntityHitCollider(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityHitCollider __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityHitCollider);
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
FC_EntityHitCollider GetDefaultedEntityHitCollider_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EntityHitCollider::GetDefaultedEntityHitCollider(Entity);
}
UFUNCTION()
bool RemoveEntityHitCollider(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityHitCollider);
}
}
FECSMonitorRuntimeView __GetMonitorEntityHitColliderOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityHitCollider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityHitColliderOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityHitCollider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityHitColliderOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityHitCollider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityHitColliderOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityHitCollider, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityHitColliderOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityHitCollider, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityHitColliderLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityHitCollider, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityHitColliderActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityHitCollider, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityHitColliderModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityHitCollider, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FC_EntityHitCollider &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FC_EntityHitCollider &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EntityHitCollider &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EntityHitCollider
{
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_LastPosition()
{
    return 1;
}
int __IndexOf_ExtraConfig()
{
    return 2;
}
}
