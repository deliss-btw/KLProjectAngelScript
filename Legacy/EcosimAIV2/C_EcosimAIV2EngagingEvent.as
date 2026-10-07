
namespace __INTENRAL_FC_EcosimAIV2EntityEngagingInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2EntityEngagingInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2EntityEngagingInfo>();
    const FC_EcosimAIV2EntityEngagingInfo DefaultValue = FC_EcosimAIV2EntityEngagingInfo();
}
namespace __INTENRAL_FCS_EcosimAIV2WorldCell_NS
{
    const TECSComponentDerivedPtr<FCS_EcosimAIV2WorldCell> DerivedPtr = TECSComponentDerivedPtr<FCS_EcosimAIV2WorldCell>();
    const FCS_EcosimAIV2WorldCell DefaultValue = FCS_EcosimAIV2WorldCell();
}
namespace __INTENRAL_FCE_EcosimAIV2EntityEngagingTargetChange_NS
{
    const TECSEventDerivedPtr<FCE_EcosimAIV2EntityEngagingTargetChange> DerivedPtr = TECSEventDerivedPtr<FCE_EcosimAIV2EntityEngagingTargetChange>();

}
struct FCE_EcosimAIV2EntityEngagingTargetChange : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FTargetEntity> AddedEntities;
    UPROPERTY()
    TArray<FTargetEntity> RemovedEntities;

    FCE_EcosimAIV2EntityEngagingTargetChange()
    {
        return;
    }
}

struct FC_EcosimAIV2EntityEngagingInfo : FECSComponent
{
    UPROPERTY()
    TArray<FTargetEntity> EngagingTargetEntityList;
    UPROPERTY()
    TArray<uint64> Last9CellVersions;

    FC_EcosimAIV2EntityEngagingInfo()
    {
        return;
    }
}

struct FEcosimAIV2WorldCellContent
{
    UPROPERTY()
    TArray<FTargetEntity> EntityList;
    UPROPERTY()
    uint64 Version = 0;


    void IncreaseCellVersion()
    {
        ++this.Version;
        return;
    }
}

struct FCS_EcosimAIV2WorldCell : FECSSingleton
{
    UPROPERTY()
    float32 CellSize = 2560.0f;
    UPROPERTY()
    float32 CheckCellMoveOffsetSquared = 10000.0f;
    UPROPERTY()
    TMap<FVector2D, FEcosimAIV2WorldCellContent> CellContentMap;
    UPROPERTY()
    TMap<FTargetEntity, FVector2D> EntityCellIndexMap;
    UPROPERTY()
    TMap<FTargetEntity, FVector2D> EntityLastCellIndexMap;
    UPROPERTY()
    TMap<FTargetEntity, FVector> EntityLastPositionMap;
    UPROPERTY()
    TArray<FTargetEntity> AllEntityList;


}

namespace ECSFunc_FC_EcosimAIV2EntityEngagingInfo
{
UFUNCTION()
bool HasEcosimAIV2EntityEngagingInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityEngagingInfo);
}
FC_EcosimAIV2EntityEngagingInfo& AssignEcosimAIV2EntityEngagingInfo(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityEngagingInfo &inout DefaultValue = FC_EcosimAIV2EntityEngagingInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityEngagingInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2EntityEngagingInfo_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityEngagingInfo &inout DefaultValue = FC_EcosimAIV2EntityEngagingInfo())
{
    ECSFunc_FC_EcosimAIV2EntityEngagingInfo::AssignEcosimAIV2EntityEngagingInfo(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2EntityEngagingInfo& ModifyEcosimAIV2EntityEngagingInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityEngagingInfo));
    return local_12.GetComp();
}
FC_EcosimAIV2EntityEngagingInfo& ModifyOrAddEcosimAIV2EntityEngagingInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityEngagingInfo));
    return local_12.GetComp();
}
const FC_EcosimAIV2EntityEngagingInfo& GetEcosimAIV2EntityEngagingInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityEngagingInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2EntityEngagingInfo GetEcosimAIV2EntityEngagingInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2EntityEngagingInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2EntityEngagingInfo::GetEcosimAIV2EntityEngagingInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2EntityEngagingInfo GetDefaultedEcosimAIV2EntityEngagingInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2EntityEngagingInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityEngagingInfo);
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
FC_EcosimAIV2EntityEngagingInfo GetDefaultedEcosimAIV2EntityEngagingInfo_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2EntityEngagingInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2EntityEngagingInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2EntityEngagingInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityEngagingInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityEngagingInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityEngagingInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityEngagingInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2EntityEngagingInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2EntityEngagingInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityEngagingInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2EntityEngagingInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2EntityEngagingInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcosimAIV2WorldCell
{
UFUNCTION()
bool HasEcosimAIV2WorldCell(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcosimAIV2WorldCell);
}
FCS_EcosimAIV2WorldCell& AssignEcosimAIV2WorldCell(const FECSWorldPtr &inout World, const FCS_EcosimAIV2WorldCell &inout DefaultValue = FCS_EcosimAIV2WorldCell())
{
    UScriptStruct local_6 = FCS_EcosimAIV2WorldCell;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2WorldCell_BP(const FECSWorldPtr &inout World, const FCS_EcosimAIV2WorldCell &inout DefaultValue = FCS_EcosimAIV2WorldCell())
{
    ECSFunc_FCS_EcosimAIV2WorldCell::AssignEcosimAIV2WorldCell(World, DefaultValue);
    return;
}
FCS_EcosimAIV2WorldCell& ModifyEcosimAIV2WorldCell(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2WorldCell;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcosimAIV2WorldCell& ModifyOrAddEcosimAIV2WorldCell(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2WorldCell;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcosimAIV2WorldCell& GetEcosimAIV2WorldCell(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2WorldCell;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcosimAIV2WorldCell GetEcosimAIV2WorldCell_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcosimAIV2WorldCell __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcosimAIV2WorldCell::GetEcosimAIV2WorldCell(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcosimAIV2WorldCell GetDefaultedEcosimAIV2WorldCell(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcosimAIV2WorldCell __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcosimAIV2WorldCell);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_EcosimAIV2WorldCell GetDefaultedEcosimAIV2WorldCell_BP(const FECSWorldPtr &inout World)
{
    FCS_EcosimAIV2WorldCell __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2WorldCell(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcosimAIV2WorldCell);
}
}
void __MonitorEcosimAIV2WorldCellLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcosimAIV2WorldCell, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2WorldCellActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcosimAIV2WorldCell, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2WorldCellModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcosimAIV2WorldCell, bFixedFrame, Details);
    return;
}
