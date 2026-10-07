
namespace __INTENRAL_FC_EcologyPointRuntimeInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcologyPointRuntimeInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcologyPointRuntimeInfo>();
    const FC_EcologyPointRuntimeInfo DefaultValue = FC_EcologyPointRuntimeInfo();

}
struct FC_EcologyPointRuntimeInfo : FECSComponent
{
    UPROPERTY()
    FGameplayTag DomainTag;

    FC_EcologyPointRuntimeInfo()
    {
        return;
    }
}

namespace ECSFunc_FC_EcologyPointRuntimeInfo
{
UFUNCTION()
bool HasEcologyPointRuntimeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcologyPointRuntimeInfo);
}
FC_EcologyPointRuntimeInfo& AssignEcologyPointRuntimeInfo(const FECSEntity &inout Entity, const FC_EcologyPointRuntimeInfo &inout DefaultValue = FC_EcologyPointRuntimeInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcologyPointRuntimeInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcologyPointRuntimeInfo_BP(const FECSEntity &inout Entity, const FC_EcologyPointRuntimeInfo &inout DefaultValue = FC_EcologyPointRuntimeInfo())
{
    ECSFunc_FC_EcologyPointRuntimeInfo::AssignEcologyPointRuntimeInfo(Entity, DefaultValue);
    return;
}
FC_EcologyPointRuntimeInfo& ModifyEcologyPointRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcologyPointRuntimeInfo));
    return local_12.GetComp();
}
FC_EcologyPointRuntimeInfo& ModifyOrAddEcologyPointRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcologyPointRuntimeInfo));
    return local_12.GetComp();
}
const FC_EcologyPointRuntimeInfo& GetEcologyPointRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcologyPointRuntimeInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcologyPointRuntimeInfo GetEcologyPointRuntimeInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcologyPointRuntimeInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_EcologyPointRuntimeInfo::GetEcologyPointRuntimeInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcologyPointRuntimeInfo GetDefaultedEcologyPointRuntimeInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcologyPointRuntimeInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcologyPointRuntimeInfo);
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
FC_EcologyPointRuntimeInfo GetDefaultedEcologyPointRuntimeInfo_BP(const FECSEntity &inout Entity)
{
    FC_EcologyPointRuntimeInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyPointRuntimeInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcologyPointRuntimeInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcologyPointRuntimeInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcologyPointRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPointRuntimeInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcologyPointRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPointRuntimeInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcologyPointRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPointRuntimeInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcologyPointRuntimeInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcologyPointRuntimeInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcologyPointRuntimeInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcologyPointRuntimeInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcologyPointRuntimeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPointRuntimeInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcologyPointRuntimeInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyPointRuntimeInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcologyPointRuntimeInfo, bFixedFrame, Details);
    return;
}
