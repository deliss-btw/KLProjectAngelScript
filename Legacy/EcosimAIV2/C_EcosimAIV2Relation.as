
enum EEcosimAIV2ActionExpressionMeaning
{
    None,
    Regret,
}

enum EEcosimAIV2TargetRelation
{
    None,
    Threat,
    Enemy,
    Forgive,
}

namespace __INTENRAL_FC_EcosimAIV2DamageRelationOverride_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2DamageRelationOverride> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2DamageRelationOverride>();
    const FC_EcosimAIV2DamageRelationOverride DefaultValue = FC_EcosimAIV2DamageRelationOverride();
}
namespace __INTENRAL_FC_EcosimAIV2TargetRelation_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2TargetRelation> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2TargetRelation>();
    const FC_EcosimAIV2TargetRelation DefaultValue = FC_EcosimAIV2TargetRelation();
}
namespace __INTENRAL_FC_EcosimAIV2HitDamageTmpMemory_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2HitDamageTmpMemory> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2HitDamageTmpMemory>();
    const FC_EcosimAIV2HitDamageTmpMemory DefaultValue = FC_EcosimAIV2HitDamageTmpMemory();
}
namespace __INTENRAL_FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent>();

}
struct FEcosimAIV2DamageRelationOverrideData
{
    UPROPERTY()
    EFactionRelation m_DamageRelation = EFactionRelation(1);


    EFactionRelation GetDamageRelation() const property
    {
        return this.m_DamageRelation;
    }
    void SetDamageRelation(const EFactionRelation __Value) property
    {
        this.m_DamageRelation = __Value;
        return;
    }
}

struct FC_EcosimAIV2DamageRelationOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FTargetEntity, FEcosimAIV2DamageRelationOverrideData> m_DamageRelationOverrideMap;

    FC_EcosimAIV2DamageRelationOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EcosimAIV2DamageRelationOverride(const FC_EcosimAIV2DamageRelationOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DamageRelationOverrideMap = Other.m_DamageRelationOverrideMap;
        return;
    }
    FC_EcosimAIV2DamageRelationOverride opAssign(const FC_EcosimAIV2DamageRelationOverride &inout Other)
    {
        FC_EcosimAIV2DamageRelationOverride __r;
        this.SetDamageRelationOverrideMap(Other.GetDamageRelationOverrideMap());
        return __r;
    }
    const TMap<FTargetEntity, FEcosimAIV2DamageRelationOverrideData> GetDamageRelationOverrideMap() const property
    {
        const TMap<FTargetEntity, FEcosimAIV2DamageRelationOverrideData> __r;
        return __r;
    }
    TMap<FTargetEntity, FEcosimAIV2DamageRelationOverrideData> GetModify_DamageRelationOverrideMap() property
    {
        TMap<FTargetEntity, FEcosimAIV2DamageRelationOverrideData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDamageRelationOverrideMap(const TMap<FTargetEntity, FEcosimAIV2DamageRelationOverrideData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DamageRelationOverrideMap = __Value;
        return;
    }
}

struct FEcosimAIV2TargetRelationDetail
{
    UPROPERTY()
    EEcosimAIV2TargetRelation TargetRelation;
    UPROPERTY()
    FFPTime EnterTime;


}

struct FC_EcosimAIV2TargetRelation : FECSComponent
{
    UPROPERTY()
    TMap<FTargetEntity, FEcosimAIV2TargetRelationDetail> TargetRelationMap;

    FC_EcosimAIV2TargetRelation()
    {
        return;
    }
}

struct FC_EcosimAIV2HitDamageTmpMemory : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntity, FFPTime> HitDamageTmpMemory;

    FC_EcosimAIV2HitDamageTmpMemory()
    {
        return;
    }
}

struct FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity HitDamageSource;

    FCE_EcosimAIV2TryRemoveHitDamageMemoryEvent()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2DamageRelationOverride
{
UFUNCTION()
bool HasEcosimAIV2DamageRelationOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DamageRelationOverride);
}
FC_EcosimAIV2DamageRelationOverride& AssignEcosimAIV2DamageRelationOverride(const FECSEntity &inout Entity, const FC_EcosimAIV2DamageRelationOverride &inout DefaultValue = FC_EcosimAIV2DamageRelationOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DamageRelationOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2DamageRelationOverride_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2DamageRelationOverride &inout DefaultValue = FC_EcosimAIV2DamageRelationOverride())
{
    ECSFunc_FC_EcosimAIV2DamageRelationOverride::AssignEcosimAIV2DamageRelationOverride(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2DamageRelationOverride& ModifyEcosimAIV2DamageRelationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DamageRelationOverride));
    return local_12.GetComp();
}
FC_EcosimAIV2DamageRelationOverride& ModifyOrAddEcosimAIV2DamageRelationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DamageRelationOverride));
    return local_12.GetComp();
}
const FC_EcosimAIV2DamageRelationOverride& GetEcosimAIV2DamageRelationOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DamageRelationOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2DamageRelationOverride GetEcosimAIV2DamageRelationOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2DamageRelationOverride& local_4 = ECSFunc_FC_EcosimAIV2DamageRelationOverride::GetEcosimAIV2DamageRelationOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2DamageRelationOverride();
}
const FC_EcosimAIV2DamageRelationOverride GetDefaultedEcosimAIV2DamageRelationOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2DamageRelationOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DamageRelationOverride);
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
FC_EcosimAIV2DamageRelationOverride GetDefaultedEcosimAIV2DamageRelationOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2DamageRelationOverride::GetDefaultedEcosimAIV2DamageRelationOverride(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2DamageRelationOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DamageRelationOverride);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DamageRelationOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DamageRelationOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DamageRelationOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DamageRelationOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DamageRelationOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2DamageRelationOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2DamageRelationOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2DamageRelationOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2DamageRelationOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2TargetRelation
{
UFUNCTION()
bool HasEcosimAIV2TargetRelation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TargetRelation);
}
FC_EcosimAIV2TargetRelation& AssignEcosimAIV2TargetRelation(const FECSEntity &inout Entity, const FC_EcosimAIV2TargetRelation &inout DefaultValue = FC_EcosimAIV2TargetRelation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TargetRelation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2TargetRelation_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2TargetRelation &inout DefaultValue = FC_EcosimAIV2TargetRelation())
{
    ECSFunc_FC_EcosimAIV2TargetRelation::AssignEcosimAIV2TargetRelation(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2TargetRelation& ModifyEcosimAIV2TargetRelation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TargetRelation));
    return local_12.GetComp();
}
FC_EcosimAIV2TargetRelation& ModifyOrAddEcosimAIV2TargetRelation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TargetRelation));
    return local_12.GetComp();
}
const FC_EcosimAIV2TargetRelation& GetEcosimAIV2TargetRelation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TargetRelation));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2TargetRelation GetEcosimAIV2TargetRelation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2TargetRelation __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2TargetRelation::GetEcosimAIV2TargetRelation(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2TargetRelation GetDefaultedEcosimAIV2TargetRelation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2TargetRelation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TargetRelation);
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
FC_EcosimAIV2TargetRelation GetDefaultedEcosimAIV2TargetRelation_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2TargetRelation __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2TargetRelation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2TargetRelation);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TargetRelationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2TargetRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TargetRelationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2TargetRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TargetRelationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2TargetRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TargetRelationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2TargetRelation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2TargetRelationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2TargetRelation, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2TargetRelationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2TargetRelation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TargetRelationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2TargetRelation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2TargetRelationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2TargetRelation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2HitDamageTmpMemory
{
UFUNCTION()
bool HasEcosimAIV2HitDamageTmpMemory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2HitDamageTmpMemory);
}
FC_EcosimAIV2HitDamageTmpMemory& AssignEcosimAIV2HitDamageTmpMemory(const FECSEntity &inout Entity, const FC_EcosimAIV2HitDamageTmpMemory &inout DefaultValue = FC_EcosimAIV2HitDamageTmpMemory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2HitDamageTmpMemory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2HitDamageTmpMemory_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2HitDamageTmpMemory &inout DefaultValue = FC_EcosimAIV2HitDamageTmpMemory())
{
    ECSFunc_FC_EcosimAIV2HitDamageTmpMemory::AssignEcosimAIV2HitDamageTmpMemory(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2HitDamageTmpMemory& ModifyEcosimAIV2HitDamageTmpMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2HitDamageTmpMemory));
    return local_12.GetComp();
}
FC_EcosimAIV2HitDamageTmpMemory& ModifyOrAddEcosimAIV2HitDamageTmpMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2HitDamageTmpMemory));
    return local_12.GetComp();
}
const FC_EcosimAIV2HitDamageTmpMemory& GetEcosimAIV2HitDamageTmpMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2HitDamageTmpMemory));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2HitDamageTmpMemory GetEcosimAIV2HitDamageTmpMemory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2HitDamageTmpMemory __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2HitDamageTmpMemory::GetEcosimAIV2HitDamageTmpMemory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2HitDamageTmpMemory GetDefaultedEcosimAIV2HitDamageTmpMemory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2HitDamageTmpMemory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2HitDamageTmpMemory);
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
FC_EcosimAIV2HitDamageTmpMemory GetDefaultedEcosimAIV2HitDamageTmpMemory_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2HitDamageTmpMemory __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2HitDamageTmpMemory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2HitDamageTmpMemory);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2HitDamageTmpMemoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2HitDamageTmpMemoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2HitDamageTmpMemoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2HitDamageTmpMemoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2HitDamageTmpMemoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2HitDamageTmpMemoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2HitDamageTmpMemoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2HitDamageTmpMemoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2HitDamageTmpMemory, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EcosimAIV2DamageRelationOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EcosimAIV2DamageRelationOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EcosimAIV2DamageRelationOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EcosimAIV2DamageRelationOverride
{
int __IndexOf_DamageRelationOverrideMap()
{
    return 0;
}
}
