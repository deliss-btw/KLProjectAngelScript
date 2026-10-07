
namespace __INTENRAL_FC_EcologyPropLayoutInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcologyPropLayoutInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyPropLayoutInfo>();
    const FC_EcologyPropLayoutInfo DefaultValue = FC_EcologyPropLayoutInfo();

}
struct FEcologyPropLayoutInfo
{
    UPROPERTY()
    int BakedOrderIndex = -1;
    UPROPERTY()
    FConfigGUID SpawnerGUID;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> SpawnerBoundWeatherVolume;
    UPROPERTY()
    int ResourcePointIndex;
    UPROPERTY()
    TDataObjectPtr<FEcologyPropLayoutDef> EcologyPropDef;


}

struct FC_EcologyPropLayoutInfo : FECSComponent
{
    UPROPERTY()
    FEcologyPropLayoutInfo LayoutInfo;
    UPROPERTY()
    FECSEntityId CachedSpawnerEntityId;

    FC_EcologyPropLayoutInfo()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyPropLayoutInfo
{
UFUNCTION()
bool HasEcologyPropLayoutInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropLayoutInfo);
}
FC_EcologyPropLayoutInfo& AssignEcologyPropLayoutInfo(const FECSEntity &inout Entity, const FC_EcologyPropLayoutInfo &inout DefaultValue = FC_EcologyPropLayoutInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropLayoutInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyPropLayoutInfo_BP(const FECSEntity &inout Entity, const FC_EcologyPropLayoutInfo &inout DefaultValue = FC_EcologyPropLayoutInfo())
{
    ECSFunc_FC_EcologyPropLayoutInfo::AssignEcologyPropLayoutInfo(Entity, DefaultValue);
    return;
}
FC_EcologyPropLayoutInfo& ModifyEcologyPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropLayoutInfo));
    return local_12.GetComp();
}
FC_EcologyPropLayoutInfo& ModifyOrAddEcologyPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropLayoutInfo));
    return local_12.GetComp();
}
const FC_EcologyPropLayoutInfo& GetEcologyPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropLayoutInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyPropLayoutInfo GetEcologyPropLayoutInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyPropLayoutInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyPropLayoutInfo::GetEcologyPropLayoutInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyPropLayoutInfo GetDefaultedEcologyPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyPropLayoutInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropLayoutInfo);
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
FC_EcologyPropLayoutInfo GetDefaultedEcologyPropLayoutInfo_BP(const FECSEntity &inout Entity)
{
    FC_EcologyPropLayoutInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyPropLayoutInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyPropLayoutInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyPropLayoutInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropLayoutInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropLayoutInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropLayoutInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPropLayoutInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyPropLayoutInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyPropLayoutInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPropLayoutInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyPropLayoutInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPropLayoutInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyPropLayoutInfo, bFixedFrame, Details);
    return;
}
