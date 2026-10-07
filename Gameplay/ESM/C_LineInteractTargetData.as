
enum ELineInteractTargetType
{
    InteractTarget,
    LockTarget,
    CustomBB,
    CustomEntity,
    RelativeOffset,
}

namespace __INTENRAL_FC_LineInteractTargetData_NS
{
    const TECSComponentDerivedPtr<FC_LineInteractTargetData> DerivedPtr = TECSComponentDerivedPtr<FC_LineInteractTargetData>();
    const FC_LineInteractTargetData DefaultValue = FC_LineInteractTargetData();

}
struct FC_LineInteractTargetData : FECSComponent
{
    UPROPERTY()
    ELineInteractTargetType LineInteractTarget;
    UPROPERTY()
    FNameHandle_EntityBBVarVector TargetBBName;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntity;
    UPROPERTY()
    FECSEntity CachedEntity;
    UPROPERTY()
    FName BoneName;
    UPROPERTY()
    FVector Offset;
    UPROPERTY()
    FVector NoLockTargetWorldLocation;


}

namespace ECSFunc_FC_LineInteractTargetData
{
UFUNCTION()
bool HasLineInteractTargetData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LineInteractTargetData);
}
FC_LineInteractTargetData& AssignLineInteractTargetData(const FECSEntity &inout Entity, const FC_LineInteractTargetData &inout DefaultValue = FC_LineInteractTargetData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LineInteractTargetData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLineInteractTargetData_BP(const FECSEntity &inout Entity, const FC_LineInteractTargetData &inout DefaultValue = FC_LineInteractTargetData())
{
    ECSFunc_FC_LineInteractTargetData::AssignLineInteractTargetData(Entity, DefaultValue);
    return;
}
FC_LineInteractTargetData& ModifyLineInteractTargetData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LineInteractTargetData));
    return local_12.GetComp();
}
FC_LineInteractTargetData& ModifyOrAddLineInteractTargetData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LineInteractTargetData));
    return local_12.GetComp();
}
const FC_LineInteractTargetData& GetLineInteractTargetData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LineInteractTargetData));
    return local_12.GetComp();
}
UFUNCTION()
FC_LineInteractTargetData GetLineInteractTargetData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LineInteractTargetData __r;
    bValid = false;
    bValid = ECSFunc_FC_LineInteractTargetData::GetLineInteractTargetData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LineInteractTargetData GetDefaultedLineInteractTargetData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LineInteractTargetData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LineInteractTargetData);
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
FC_LineInteractTargetData GetDefaultedLineInteractTargetData_BP(const FECSEntity &inout Entity)
{
    FC_LineInteractTargetData __r;
    return __r;
}
UFUNCTION()
bool RemoveLineInteractTargetData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LineInteractTargetData);
}
}
FECSMonitorRuntimeView __GetMonitorLineInteractTargetDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LineInteractTargetData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLineInteractTargetDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LineInteractTargetData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLineInteractTargetDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LineInteractTargetData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLineInteractTargetDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LineInteractTargetData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLineInteractTargetDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LineInteractTargetData, bFixedFrame, bMustHandleAll);
}
void __MonitorLineInteractTargetDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LineInteractTargetData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLineInteractTargetDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LineInteractTargetData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLineInteractTargetDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LineInteractTargetData, bFixedFrame, Details);
    return;
}
