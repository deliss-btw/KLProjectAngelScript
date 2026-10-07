
namespace __INTENRAL_FC_EnvSurfaceImpactFXRecord_NS
{
    const TECSComponentDerivedPtr<FC_EnvSurfaceImpactFXRecord> DerivedPtr = TECSComponentDerivedPtr<FC_EnvSurfaceImpactFXRecord>();
    const FC_EnvSurfaceImpactFXRecord DefaultValue = FC_EnvSurfaceImpactFXRecord();
}
namespace __INTENRAL_FCE_WeaponHitSurfaceEvent_NS
{
    const TECSEventDerivedPtr<FCE_WeaponHitSurfaceEvent> DerivedPtr = TECSEventDerivedPtr<FCE_WeaponHitSurfaceEvent>();
}
namespace __INTENRAL_FCE_EnvSurfaceImpactFXRecordToRemove_NS
{
    const TECSEventDerivedPtr<FCE_EnvSurfaceImpactFXRecordToRemove> DerivedPtr = TECSEventDerivedPtr<FCE_EnvSurfaceImpactFXRecordToRemove>();
}
namespace __INTENRAL_FCE_CheckEnvSurfaceHit_NS
{
    const TECSEventDerivedPtr<FCE_CheckEnvSurfaceHit> DerivedPtr = TECSEventDerivedPtr<FCE_CheckEnvSurfaceHit>();
}
namespace __INTENRAL_FCE_EnvSurfaceImpactFXEvent_NS
{
    const TECSEventDerivedPtr<FCE_EnvSurfaceImpactFXEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EnvSurfaceImpactFXEvent>();

}
struct FCE_WeaponHitSurfaceEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity WeaponEntity;
    UPROPERTY()
    FVector HitPoint;
    UPROPERTY()
    FVector HitNormal;
    UPROPERTY()
    FVector AttackDirection;

    FCE_WeaponHitSurfaceEvent()
    {
        return;
    }
}

struct FC_EnvSurfaceImpactFXRecord : FECSComponent
{
    UPROPERTY()
    TSet<FName> AttackIdentifierSet;

    FC_EnvSurfaceImpactFXRecord()
    {
        return;
    }
}

struct FCE_EnvSurfaceImpactFXRecordToRemove : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSet<FName> AttackIdentifierSet;

    FCE_EnvSurfaceImpactFXRecordToRemove()
    {
        return;
    }
}

struct FEnvSurfaceLineTraceConfig
{
    UPROPERTY()
    FAttachRefName SocketName;
    UPROPERTY()
    FVector TraceStartOffset = FVector::ZeroVector;
    UPROPERTY()
    FVector TraceDir = FVector::ForwardVector;
    UPROPERTY()
    EImpactRotationType ImpactRotationType = EImpactRotationType(1);
    UPROPERTY()
    float32 VFXDelay = 0.0f;
    UPROPERTY()
    float32 MinTraceDistanceOffset = 0.0f;
    UPROPERTY()
    float32 MinTraceTimeOffset = 0.0f;


}

struct FCE_CheckEnvSurfaceHit : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName AttackIdentifier;
    UPROPERTY()
    FStrikeEventData StrikeEventData;
    UPROPERTY()
    FDataObjectPtr HitDecal;
    UPROPERTY()
    float32 MinTraceDistanceOffset = 0.0f;
    UPROPERTY()
    float32 MinTraceTimeOffset = 0.0f;


}

struct FCE_EnvSurfaceImpactFXEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bDurational = false;
    UPROPERTY()
    FVector ImpactPosition;
    UPROPERTY()
    FVector ImpactOutDir;
    UPROPERTY()
    FRotator3f ImpactRotation;
    UPROPERTY()
    FName ImpactSurfaceTypeName;
    UPROPERTY()
    ECharacterBodySize CharacterBodySize;
    UPROPERTY()
    EArealStrikeEnvSurfaceFXStyle_Sparks FXStyle_Sparks;


}

struct FEnvHitPresentationData
{
    UPROPERTY()
    UPrimitiveComponent HitPrimitiveComp;
    UPROPERTY()
    FVector HitFanPlaneNormal;
    UPROPERTY()
    FVector HitLocation;
    UPROPERTY()
    FVector HitNormal;
    UPROPERTY()
    FName HitBoneName;
    UPROPERTY()
    UPhysicalMaterial PhysicsMaterial = nullptr;
    UPROPERTY()
    FName SurfaceName;

    FEnvHitPresentationData()
    {
        return;
    }
}

namespace ECSFunc_FC_EnvSurfaceImpactFXRecord
{
UFUNCTION()
bool HasEnvSurfaceImpactFXRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EnvSurfaceImpactFXRecord);
}
FC_EnvSurfaceImpactFXRecord& AssignEnvSurfaceImpactFXRecord(const FECSEntity &inout Entity, const FC_EnvSurfaceImpactFXRecord &inout DefaultValue = FC_EnvSurfaceImpactFXRecord())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EnvSurfaceImpactFXRecord, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEnvSurfaceImpactFXRecord_BP(const FECSEntity &inout Entity, const FC_EnvSurfaceImpactFXRecord &inout DefaultValue = FC_EnvSurfaceImpactFXRecord())
{
    ECSFunc_FC_EnvSurfaceImpactFXRecord::AssignEnvSurfaceImpactFXRecord(Entity, DefaultValue);
    return;
}
FC_EnvSurfaceImpactFXRecord& ModifyEnvSurfaceImpactFXRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EnvSurfaceImpactFXRecord));
    return local_12.GetComp();
}
FC_EnvSurfaceImpactFXRecord& ModifyOrAddEnvSurfaceImpactFXRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EnvSurfaceImpactFXRecord));
    return local_12.GetComp();
}
const FC_EnvSurfaceImpactFXRecord& GetEnvSurfaceImpactFXRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EnvSurfaceImpactFXRecord));
    return local_12.GetComp();
}
UFUNCTION()
FC_EnvSurfaceImpactFXRecord GetEnvSurfaceImpactFXRecord_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EnvSurfaceImpactFXRecord __r;
    bValid = false;
    bValid = ECSFunc_FC_EnvSurfaceImpactFXRecord::GetEnvSurfaceImpactFXRecord(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EnvSurfaceImpactFXRecord GetDefaultedEnvSurfaceImpactFXRecord(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EnvSurfaceImpactFXRecord __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EnvSurfaceImpactFXRecord);
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
FC_EnvSurfaceImpactFXRecord GetDefaultedEnvSurfaceImpactFXRecord_BP(const FECSEntity &inout Entity)
{
    FC_EnvSurfaceImpactFXRecord __r;
    return __r;
}
UFUNCTION()
bool RemoveEnvSurfaceImpactFXRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EnvSurfaceImpactFXRecord);
}
}
FECSMonitorRuntimeView __GetMonitorEnvSurfaceImpactFXRecordOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvSurfaceImpactFXRecordOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvSurfaceImpactFXRecordOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvSurfaceImpactFXRecordOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnvSurfaceImpactFXRecordOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, bMustHandleAll);
}
void __MonitorEnvSurfaceImpactFXRecordLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnvSurfaceImpactFXRecordActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnvSurfaceImpactFXRecordModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EnvSurfaceImpactFXRecord, bFixedFrame, Details);
    return;
}
