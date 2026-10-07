
namespace __INTENRAL_FC_DamageFactionRelation_NS
{
    const TECSComponentDerivedPtr<FC_DamageFactionRelation> DerivedPtr = TECSComponentDerivedPtr<FC_DamageFactionRelation>();
    const FC_DamageFactionRelation DefaultValue = FC_DamageFactionRelation();

}
struct FC_DamageFactionRelation : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<EFactionRelation> m_Relations;

    FC_DamageFactionRelation()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DamageFactionRelation(const FC_DamageFactionRelation &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Relations = Other.m_Relations;
        return;
    }
    FC_DamageFactionRelation opAssign(const FC_DamageFactionRelation &inout Other)
    {
        FC_DamageFactionRelation __r;
        this.SetRelations(Other.GetRelations());
        return __r;
    }
    const TArray<EFactionRelation> GetRelations() const property
    {
        const TArray<EFactionRelation> __r;
        return __r;
    }
    TArray<EFactionRelation> GetModify_Relations() property
    {
        TArray<EFactionRelation> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRelations(const TArray<EFactionRelation> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Relations = __Value;
        return;
    }
}

namespace ECSFunc_FC_DamageFactionRelation
{
UFUNCTION()
bool HasDamageFactionRelation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DamageFactionRelation);
}
FC_DamageFactionRelation& AssignDamageFactionRelation(const FECSEntity &inout Entity, const FC_DamageFactionRelation &inout DefaultValue = FC_DamageFactionRelation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DamageFactionRelation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDamageFactionRelation_BP(const FECSEntity &inout Entity, const FC_DamageFactionRelation &inout DefaultValue = FC_DamageFactionRelation())
{
    ECSFunc_FC_DamageFactionRelation::AssignDamageFactionRelation(Entity, DefaultValue);
    return;
}
FC_DamageFactionRelation& ModifyDamageFactionRelation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DamageFactionRelation));
    return local_12.GetComp();
}
FC_DamageFactionRelation& ModifyOrAddDamageFactionRelation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DamageFactionRelation));
    return local_12.GetComp();
}
const FC_DamageFactionRelation& GetDamageFactionRelation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DamageFactionRelation));
    return local_12.GetComp();
}
UFUNCTION()
FC_DamageFactionRelation GetDamageFactionRelation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DamageFactionRelation& local_4 = ECSFunc_FC_DamageFactionRelation::GetDamageFactionRelation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DamageFactionRelation();
}
const FC_DamageFactionRelation GetDefaultedDamageFactionRelation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DamageFactionRelation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DamageFactionRelation);
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
FC_DamageFactionRelation GetDefaultedDamageFactionRelation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DamageFactionRelation::GetDefaultedDamageFactionRelation(Entity);
}
UFUNCTION()
bool RemoveDamageFactionRelation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DamageFactionRelation);
}
}
FECSMonitorRuntimeView __GetMonitorDamageFactionRelationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DamageFactionRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageFactionRelationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DamageFactionRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageFactionRelationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DamageFactionRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageFactionRelationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DamageFactionRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDamageFactionRelationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DamageFactionRelation, bFixedFrame, bMustHandleAll);
}
void __MonitorDamageFactionRelationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DamageFactionRelation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageFactionRelationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DamageFactionRelation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDamageFactionRelationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DamageFactionRelation, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DamageFactionRelation &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DamageFactionRelation &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DamageFactionRelation &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DamageFactionRelation
{
int __IndexOf_Relations()
{
    return 0;
}
}
