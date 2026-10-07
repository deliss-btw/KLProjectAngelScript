
namespace __INTENRAL_FCS_TeleporterActivatedConditionManager_NS
{
    const TECSComponentDerivedPtr<FCS_TeleporterActivatedConditionManager> DerivedPtr = TECSComponentDerivedPtr<FCS_TeleporterActivatedConditionManager>();
    const FCS_TeleporterActivatedConditionManager DefaultValue = FCS_TeleporterActivatedConditionManager();

}
struct FCS_TeleporterActivatedConditionManager : FECSSingleton
{
    UPROPERTY()
    TArray<FConditionInstanceHandle> ConditionInstances;

    FCS_TeleporterActivatedConditionManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_TeleporterActivatedConditionManager
{
UFUNCTION()
bool HasTeleporterActivatedConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TeleporterActivatedConditionManager);
}
FCS_TeleporterActivatedConditionManager& AssignTeleporterActivatedConditionManager(const FECSWorldPtr &inout World, const FCS_TeleporterActivatedConditionManager &inout DefaultValue = FCS_TeleporterActivatedConditionManager())
{
    UScriptStruct local_6 = FCS_TeleporterActivatedConditionManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTeleporterActivatedConditionManager_BP(const FECSWorldPtr &inout World, const FCS_TeleporterActivatedConditionManager &inout DefaultValue = FCS_TeleporterActivatedConditionManager())
{
    ECSFunc_FCS_TeleporterActivatedConditionManager::AssignTeleporterActivatedConditionManager(World, DefaultValue);
    return;
}
FCS_TeleporterActivatedConditionManager& ModifyTeleporterActivatedConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeleporterActivatedConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TeleporterActivatedConditionManager& ModifyOrAddTeleporterActivatedConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeleporterActivatedConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TeleporterActivatedConditionManager& GetTeleporterActivatedConditionManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeleporterActivatedConditionManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TeleporterActivatedConditionManager GetTeleporterActivatedConditionManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TeleporterActivatedConditionManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_TeleporterActivatedConditionManager::GetTeleporterActivatedConditionManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TeleporterActivatedConditionManager GetDefaultedTeleporterActivatedConditionManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TeleporterActivatedConditionManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TeleporterActivatedConditionManager);
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
FCS_TeleporterActivatedConditionManager GetDefaultedTeleporterActivatedConditionManager_BP(const FECSWorldPtr &inout World)
{
    FCS_TeleporterActivatedConditionManager __r;
    return __r;
}
UFUNCTION()
bool RemoveTeleporterActivatedConditionManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TeleporterActivatedConditionManager);
}
}
void __MonitorTeleporterActivatedConditionManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TeleporterActivatedConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleporterActivatedConditionManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TeleporterActivatedConditionManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeleporterActivatedConditionManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TeleporterActivatedConditionManager, bFixedFrame, Details);
    return;
}
