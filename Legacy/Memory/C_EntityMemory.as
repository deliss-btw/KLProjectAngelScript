
namespace __INTENRAL_FC_EntityMemoryInfo_NS
{
    const TECSComponentDerivedPtr<FC_EntityMemoryInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EntityMemoryInfo>();
    const FC_EntityMemoryInfo DefaultValue = FC_EntityMemoryInfo();

}
struct FC_EntityMemoryInfo : FECSComponent
{
    UPROPERTY()
    TArray<FString> EntitySimpleMemoryList;

    FC_EntityMemoryInfo()
    {
        return;
    }
}

namespace ECSFunc_FC_EntityMemoryInfo
{
UFUNCTION()
bool HasEntityMemoryInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityMemoryInfo);
}
FC_EntityMemoryInfo& AssignEntityMemoryInfo(const FECSEntity &inout Entity, const FC_EntityMemoryInfo &inout DefaultValue = FC_EntityMemoryInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityMemoryInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityMemoryInfo_BP(const FECSEntity &inout Entity, const FC_EntityMemoryInfo &inout DefaultValue = FC_EntityMemoryInfo())
{
    ECSFunc_FC_EntityMemoryInfo::AssignEntityMemoryInfo(Entity, DefaultValue);
    return;
}
FC_EntityMemoryInfo& ModifyEntityMemoryInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityMemoryInfo));
    return local_12.GetComp();
}
FC_EntityMemoryInfo& ModifyOrAddEntityMemoryInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityMemoryInfo));
    return local_12.GetComp();
}
const FC_EntityMemoryInfo& GetEntityMemoryInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityMemoryInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityMemoryInfo GetEntityMemoryInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EntityMemoryInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_EntityMemoryInfo::GetEntityMemoryInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EntityMemoryInfo GetDefaultedEntityMemoryInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityMemoryInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityMemoryInfo);
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
FC_EntityMemoryInfo GetDefaultedEntityMemoryInfo_BP(const FECSEntity &inout Entity)
{
    FC_EntityMemoryInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveEntityMemoryInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityMemoryInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEntityMemoryInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityMemoryInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityMemoryInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityMemoryInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityMemoryInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityMemoryInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityMemoryInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityMemoryInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityMemoryInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityMemoryInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityMemoryInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityMemoryInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityMemoryInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityMemoryInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityMemoryInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityMemoryInfo, bFixedFrame, Details);
    return;
}
