
namespace __INTENRAL_FC_PrefabUID_NS
{
    const TECSComponentDerivedPtr<FC_PrefabUID> DerivedPtr = TECSComponentDerivedPtr<FC_PrefabUID>();
    const FC_PrefabUID DefaultValue = FC_PrefabUID();
}
namespace __INTENRAL_FC_PrefabDebugInfo_NS
{
    const TECSComponentDerivedPtr<FC_PrefabDebugInfo> DerivedPtr = TECSComponentDerivedPtr<FC_PrefabDebugInfo>();
    const FC_PrefabDebugInfo DefaultValue = FC_PrefabDebugInfo();

}
struct FC_PrefabUID : FECSComponent
{
    UPROPERTY()
    FConfigGUID UID;
    UPROPERTY()
    FString AliasName;

    FC_PrefabUID()
    {
        return;
    }
}

struct FC_PrefabDebugInfo : FECSComponent
{
    UPROPERTY()
    FString ActorPath;

    FC_PrefabDebugInfo()
    {
        return;
    }
}

namespace ECSFunc_FC_PrefabUID
{
UFUNCTION()
bool HasPrefabUID(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PrefabUID);
}
FC_PrefabUID& AssignPrefabUID(const FECSEntity &inout Entity, const FC_PrefabUID &inout DefaultValue = FC_PrefabUID())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PrefabUID, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPrefabUID_BP(const FECSEntity &inout Entity, const FC_PrefabUID &inout DefaultValue = FC_PrefabUID())
{
    ECSFunc_FC_PrefabUID::AssignPrefabUID(Entity, DefaultValue);
    return;
}
FC_PrefabUID& ModifyPrefabUID(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PrefabUID));
    return local_12.GetComp();
}
FC_PrefabUID& ModifyOrAddPrefabUID(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PrefabUID));
    return local_12.GetComp();
}
const FC_PrefabUID& GetPrefabUID(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PrefabUID));
    return local_12.GetComp();
}
UFUNCTION()
FC_PrefabUID GetPrefabUID_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PrefabUID __r;
    bValid = false;
    bValid = ECSFunc_FC_PrefabUID::GetPrefabUID(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PrefabUID GetDefaultedPrefabUID(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PrefabUID __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PrefabUID);
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
FC_PrefabUID GetDefaultedPrefabUID_BP(const FECSEntity &inout Entity)
{
    FC_PrefabUID __r;
    return __r;
}
UFUNCTION()
bool RemovePrefabUID(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PrefabUID);
}
}
FECSMonitorRuntimeView __GetMonitorPrefabUIDOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PrefabUID, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabUIDOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PrefabUID, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabUIDOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PrefabUID, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabUIDOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PrefabUID, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabUIDOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PrefabUID, bFixedFrame, bMustHandleAll);
}
void __MonitorPrefabUIDLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PrefabUID, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabUIDActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PrefabUID, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabUIDModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PrefabUID, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PrefabDebugInfo
{
UFUNCTION()
bool HasPrefabDebugInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PrefabDebugInfo);
}
FC_PrefabDebugInfo& AssignPrefabDebugInfo(const FECSEntity &inout Entity, const FC_PrefabDebugInfo &inout DefaultValue = FC_PrefabDebugInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PrefabDebugInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPrefabDebugInfo_BP(const FECSEntity &inout Entity, const FC_PrefabDebugInfo &inout DefaultValue = FC_PrefabDebugInfo())
{
    ECSFunc_FC_PrefabDebugInfo::AssignPrefabDebugInfo(Entity, DefaultValue);
    return;
}
FC_PrefabDebugInfo& ModifyPrefabDebugInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PrefabDebugInfo));
    return local_12.GetComp();
}
FC_PrefabDebugInfo& ModifyOrAddPrefabDebugInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PrefabDebugInfo));
    return local_12.GetComp();
}
const FC_PrefabDebugInfo& GetPrefabDebugInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PrefabDebugInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_PrefabDebugInfo GetPrefabDebugInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PrefabDebugInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_PrefabDebugInfo::GetPrefabDebugInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PrefabDebugInfo GetDefaultedPrefabDebugInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PrefabDebugInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PrefabDebugInfo);
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
FC_PrefabDebugInfo GetDefaultedPrefabDebugInfo_BP(const FECSEntity &inout Entity)
{
    FC_PrefabDebugInfo __r;
    return __r;
}
UFUNCTION()
bool RemovePrefabDebugInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PrefabDebugInfo);
}
}
FECSMonitorRuntimeView __GetMonitorPrefabDebugInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PrefabDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabDebugInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PrefabDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabDebugInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PrefabDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabDebugInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PrefabDebugInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPrefabDebugInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PrefabDebugInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorPrefabDebugInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PrefabDebugInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabDebugInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PrefabDebugInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPrefabDebugInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PrefabDebugInfo, bFixedFrame, Details);
    return;
}
