
namespace __INTENRAL_FC_RecordHeatmapData_NS
{
    const TECSComponentDerivedPtr<FC_RecordHeatmapData> DerivedPtr = TECSComponentDerivedPtr<FC_RecordHeatmapData>();
    const FC_RecordHeatmapData DefaultValue = FC_RecordHeatmapData();

}
struct FC_RecordHeatmapData : FECSComponent
{
    UPROPERTY()
    FVector LastLocation;
    UPROPERTY()
    FString SaveFilePath;
    UPROPERTY()
    float32 DistanceThreshold = 5000.0f;


}

namespace ECSFunc_FC_RecordHeatmapData
{
UFUNCTION()
bool HasRecordHeatmapData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RecordHeatmapData);
}
FC_RecordHeatmapData& AssignRecordHeatmapData(const FECSEntity &inout Entity, const FC_RecordHeatmapData &inout DefaultValue = FC_RecordHeatmapData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RecordHeatmapData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRecordHeatmapData_BP(const FECSEntity &inout Entity, const FC_RecordHeatmapData &inout DefaultValue = FC_RecordHeatmapData())
{
    ECSFunc_FC_RecordHeatmapData::AssignRecordHeatmapData(Entity, DefaultValue);
    return;
}
FC_RecordHeatmapData& ModifyRecordHeatmapData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RecordHeatmapData));
    return local_12.GetComp();
}
FC_RecordHeatmapData& ModifyOrAddRecordHeatmapData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RecordHeatmapData));
    return local_12.GetComp();
}
const FC_RecordHeatmapData& GetRecordHeatmapData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RecordHeatmapData));
    return local_12.GetComp();
}
UFUNCTION()
FC_RecordHeatmapData GetRecordHeatmapData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_RecordHeatmapData __r;
    bValid = false;
    bValid = ECSFunc_FC_RecordHeatmapData::GetRecordHeatmapData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_RecordHeatmapData GetDefaultedRecordHeatmapData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RecordHeatmapData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RecordHeatmapData);
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
FC_RecordHeatmapData GetDefaultedRecordHeatmapData_BP(const FECSEntity &inout Entity)
{
    FC_RecordHeatmapData __r;
    return __r;
}
UFUNCTION()
bool RemoveRecordHeatmapData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RecordHeatmapData);
}
}
FECSMonitorRuntimeView __GetMonitorRecordHeatmapDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RecordHeatmapData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRecordHeatmapDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RecordHeatmapData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRecordHeatmapDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RecordHeatmapData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRecordHeatmapDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RecordHeatmapData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRecordHeatmapDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RecordHeatmapData, bFixedFrame, bMustHandleAll);
}
void __MonitorRecordHeatmapDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RecordHeatmapData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRecordHeatmapDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RecordHeatmapData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRecordHeatmapDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RecordHeatmapData, bFixedFrame, Details);
    return;
}
