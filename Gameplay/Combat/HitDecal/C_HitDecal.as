
namespace __INTENRAL_FC_MeleeHitDecalSpawner_NS
{
    const TECSComponentDerivedPtr<FC_MeleeHitDecalSpawner> DerivedPtr = TECSComponentDerivedPtr<FC_MeleeHitDecalSpawner>();
    const FC_MeleeHitDecalSpawner DefaultValue = FC_MeleeHitDecalSpawner();
}
namespace __INTENRAL_FCE_BeginCastMeleeHitDecal_NS
{
    const TECSEventDerivedPtr<FCE_BeginCastMeleeHitDecal> DerivedPtr = TECSEventDerivedPtr<FCE_BeginCastMeleeHitDecal>();

}
struct FHitDecalFanCaster
{
    UPROPERTY()
    float32 InnerRadius = 20.0f;
    UPROPERTY()
    float32 OuterRadius = 100.0f;
    UPROPERTY()
    FVector CenterOffset;
    UPROPERTY()
    FRotator Rotation;
    UPROPERTY()
    float32 Angle = 90.0f;
    UPROPERTY()
    float32 AngleOffset = 0.0f;
    UPROPERTY()
    int NumDivision = 6;
    UPROPERTY()
    bool bIsCCW = true;


}

struct FMeleeHitDecalCasterConfig
{
    UPROPERTY()
    FDataObjectPtr DecalCfgTableRow;
    UPROPERTY()
    FHitDecalFanCaster CasterShape;

    FMeleeHitDecalCasterConfig()
    {
        return;
    }
}

struct FPendigMeleeHitDecal
{
    UPROPERTY()
    FMeleeHitDecalCasterConfig CasterConfig;
    UPROPERTY()
    float32 HitEventTimeout = 0.2f;


}

struct FCE_BeginCastMeleeHitDecal : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    FMeleeHitDecalCasterConfig CasterConfig;

    FCE_BeginCastMeleeHitDecal()
    {
        return;
    }
}

struct FC_MeleeHitDecalSpawner : FECSComponent
{
    UPROPERTY()
    TMap<FName, FPendigMeleeHitDecal> PendingMeleeDecals;

    FC_MeleeHitDecalSpawner()
    {
        return;
    }
}

namespace ECSFunc_FC_MeleeHitDecalSpawner
{
UFUNCTION()
bool HasMeleeHitDecalSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MeleeHitDecalSpawner);
}
FC_MeleeHitDecalSpawner& AssignMeleeHitDecalSpawner(const FECSEntity &inout Entity, const FC_MeleeHitDecalSpawner &inout DefaultValue = FC_MeleeHitDecalSpawner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MeleeHitDecalSpawner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMeleeHitDecalSpawner_BP(const FECSEntity &inout Entity, const FC_MeleeHitDecalSpawner &inout DefaultValue = FC_MeleeHitDecalSpawner())
{
    ECSFunc_FC_MeleeHitDecalSpawner::AssignMeleeHitDecalSpawner(Entity, DefaultValue);
    return;
}
FC_MeleeHitDecalSpawner& ModifyMeleeHitDecalSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MeleeHitDecalSpawner));
    return local_12.GetComp();
}
FC_MeleeHitDecalSpawner& ModifyOrAddMeleeHitDecalSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MeleeHitDecalSpawner));
    return local_12.GetComp();
}
const FC_MeleeHitDecalSpawner& GetMeleeHitDecalSpawner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MeleeHitDecalSpawner));
    return local_12.GetComp();
}
UFUNCTION()
FC_MeleeHitDecalSpawner GetMeleeHitDecalSpawner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_MeleeHitDecalSpawner __r;
    bValid = false;
    bValid = ECSFunc_FC_MeleeHitDecalSpawner::GetMeleeHitDecalSpawner(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_MeleeHitDecalSpawner GetDefaultedMeleeHitDecalSpawner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MeleeHitDecalSpawner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MeleeHitDecalSpawner);
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
FC_MeleeHitDecalSpawner GetDefaultedMeleeHitDecalSpawner_BP(const FECSEntity &inout Entity)
{
    FC_MeleeHitDecalSpawner __r;
    return __r;
}
UFUNCTION()
bool RemoveMeleeHitDecalSpawner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MeleeHitDecalSpawner);
}
}
FECSMonitorRuntimeView __GetMonitorMeleeHitDecalSpawnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MeleeHitDecalSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMeleeHitDecalSpawnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MeleeHitDecalSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMeleeHitDecalSpawnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MeleeHitDecalSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMeleeHitDecalSpawnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MeleeHitDecalSpawner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMeleeHitDecalSpawnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MeleeHitDecalSpawner, bFixedFrame, bMustHandleAll);
}
void __MonitorMeleeHitDecalSpawnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MeleeHitDecalSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMeleeHitDecalSpawnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MeleeHitDecalSpawner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMeleeHitDecalSpawnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MeleeHitDecalSpawner, bFixedFrame, Details);
    return;
}
