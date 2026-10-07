
enum ESpawnFXTranformMode
{
    World,
    RelativeToOwner,
}

enum ESpawnFXSpecialTranformOffset
{
    None,
    DropDownToGround,
}

namespace __INTENRAL_FC_SpawnInstantFXPeriod_NS
{
    const TECSComponentDerivedPtr<FC_SpawnInstantFXPeriod> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnInstantFXPeriod>();
    const FC_SpawnInstantFXPeriod DefaultValue = FC_SpawnInstantFXPeriod();

}
struct FSpawnFXParam
{
    UPROPERTY()
    FFXConfig FXConfig;
    UPROPERTY()
    ESpawnFXTranformMode SpawnPositionMode = ESpawnFXTranformMode(1);
    UPROPERTY()
    FVector SpawnPositionOffset = FVector::ZeroVector;
    UPROPERTY()
    ESpawnFXTranformMode SpawnRotationMode = ESpawnFXTranformMode(1);
    UPROPERTY()
    FRotator SpawnRotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    ESpawnFXSpecialTranformOffset SpecialTransformOffset = ESpawnFXSpecialTranformOffset(0);
    UPROPERTY()
    float32 MaxDropDownDistance = 1000.0f;


}

struct FC_SpawnInstantFXPeriod : FECSComponent
{
    UPROPERTY()
    TArray<FSpawnFXParam> SpawnFXParams;
    UPROPERTY()
    float32 SpawnPeriod = 0.2f;


}

namespace ECSFunc_FC_SpawnInstantFXPeriod
{
UFUNCTION()
bool HasSpawnInstantFXPeriod(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnInstantFXPeriod);
}
FC_SpawnInstantFXPeriod& AssignSpawnInstantFXPeriod(const FECSEntity &inout Entity, const FC_SpawnInstantFXPeriod &inout DefaultValue = FC_SpawnInstantFXPeriod())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnInstantFXPeriod, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnInstantFXPeriod_BP(const FECSEntity &inout Entity, const FC_SpawnInstantFXPeriod &inout DefaultValue = FC_SpawnInstantFXPeriod())
{
    ECSFunc_FC_SpawnInstantFXPeriod::AssignSpawnInstantFXPeriod(Entity, DefaultValue);
    return;
}
FC_SpawnInstantFXPeriod& ModifySpawnInstantFXPeriod(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnInstantFXPeriod));
    return local_12.GetComp();
}
FC_SpawnInstantFXPeriod& ModifyOrAddSpawnInstantFXPeriod(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnInstantFXPeriod));
    return local_12.GetComp();
}
const FC_SpawnInstantFXPeriod& GetSpawnInstantFXPeriod(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnInstantFXPeriod));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnInstantFXPeriod GetSpawnInstantFXPeriod_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SpawnInstantFXPeriod __r;
    bValid = false;
    bValid = ECSFunc_FC_SpawnInstantFXPeriod::GetSpawnInstantFXPeriod(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SpawnInstantFXPeriod GetDefaultedSpawnInstantFXPeriod(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnInstantFXPeriod __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnInstantFXPeriod);
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
FC_SpawnInstantFXPeriod GetDefaultedSpawnInstantFXPeriod_BP(const FECSEntity &inout Entity)
{
    FC_SpawnInstantFXPeriod __r;
    return __r;
}
UFUNCTION()
bool RemoveSpawnInstantFXPeriod(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnInstantFXPeriod);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnInstantFXPeriodOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnInstantFXPeriod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnInstantFXPeriodOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnInstantFXPeriod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnInstantFXPeriodOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnInstantFXPeriod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnInstantFXPeriodOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnInstantFXPeriod, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnInstantFXPeriodOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnInstantFXPeriod, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnInstantFXPeriodLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnInstantFXPeriod, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnInstantFXPeriodActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnInstantFXPeriod, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnInstantFXPeriodModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnInstantFXPeriod, bFixedFrame, Details);
    return;
}
