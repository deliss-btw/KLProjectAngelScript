
namespace __INTENRAL_FC_NormalPropLayoutInfo_NS
{
    const TECSComponentDerivedPtr<FC_NormalPropLayoutInfo> DerivedPtr = TECSComponentDerivedPtr<FC_NormalPropLayoutInfo>();
    const FC_NormalPropLayoutInfo DefaultValue = FC_NormalPropLayoutInfo();

}
struct FC_NormalPropLayoutInfo : FECSComponent
{
    UPROPERTY()
    FNormalPropLayoutInfo LayoutInfo;

    FC_NormalPropLayoutInfo()
    {
        return;
    }
}

namespace ECSFunc_FC_NormalPropLayoutInfo
{
UFUNCTION()
bool HasNormalPropLayoutInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_NormalPropLayoutInfo);
}
FC_NormalPropLayoutInfo& AssignNormalPropLayoutInfo(const FECSEntity &inout Entity, const FC_NormalPropLayoutInfo &inout DefaultValue = FC_NormalPropLayoutInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_NormalPropLayoutInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignNormalPropLayoutInfo_BP(const FECSEntity &inout Entity, const FC_NormalPropLayoutInfo &inout DefaultValue = FC_NormalPropLayoutInfo())
{
    ECSFunc_FC_NormalPropLayoutInfo::AssignNormalPropLayoutInfo(Entity, DefaultValue);
    return;
}
FC_NormalPropLayoutInfo& ModifyNormalPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_NormalPropLayoutInfo));
    return local_12.GetComp();
}
FC_NormalPropLayoutInfo& ModifyOrAddNormalPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_NormalPropLayoutInfo));
    return local_12.GetComp();
}
const FC_NormalPropLayoutInfo& GetNormalPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_NormalPropLayoutInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_NormalPropLayoutInfo GetNormalPropLayoutInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_NormalPropLayoutInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_NormalPropLayoutInfo::GetNormalPropLayoutInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_NormalPropLayoutInfo GetDefaultedNormalPropLayoutInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_NormalPropLayoutInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_NormalPropLayoutInfo);
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
FC_NormalPropLayoutInfo GetDefaultedNormalPropLayoutInfo_BP(const FECSEntity &inout Entity)
{
    FC_NormalPropLayoutInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveNormalPropLayoutInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_NormalPropLayoutInfo);
}
}
FECSMonitorRuntimeView __GetMonitorNormalPropLayoutInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_NormalPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNormalPropLayoutInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_NormalPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNormalPropLayoutInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_NormalPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNormalPropLayoutInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_NormalPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorNormalPropLayoutInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_NormalPropLayoutInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorNormalPropLayoutInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_NormalPropLayoutInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNormalPropLayoutInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_NormalPropLayoutInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorNormalPropLayoutInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_NormalPropLayoutInfo, bFixedFrame, Details);
    return;
}
