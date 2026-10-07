
namespace __INTENRAL_FCS_EcologyConfigContext_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyConfigContext> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyConfigContext>();
    const FCS_EcologyConfigContext DefaultValue = FCS_EcologyConfigContext();
}
namespace __INTENRAL_FCS_EcologyDataCacheContext_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyDataCacheContext> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyDataCacheContext>();
    const FCS_EcologyDataCacheContext DefaultValue = FCS_EcologyDataCacheContext();
}
namespace __INTENRAL_FCS_EcologyScriptGlobalContext_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyScriptGlobalContext> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyScriptGlobalContext>();
    const FCS_EcologyScriptGlobalContext DefaultValue = FCS_EcologyScriptGlobalContext();
}
namespace __INTENRAL_FCS_EcologyWorldInfo_NS
{
    const TECSComponentDerivedPtr<FCS_EcologyWorldInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_EcologyWorldInfo>();
    const FCS_EcologyWorldInfo DefaultValue = FCS_EcologyWorldInfo();

}
struct FEntityArray
{
    UPROPERTY()
    TArray<FECSEntityId> Slot;

    FEntityArray()
    {
        return;
    }
}

struct FEcologyWorldState
{
    UPROPERTY()
    FGameplayTagContainer TimeGameplayTags;
    UPROPERTY()
    int TimeSegments = -1;


}

struct FCS_EcologyConfigContext : FECSSingleton
{
    UPROPERTY()
    TMap<FConfigGUID, FECSEntityId> EntityConfigMap;
    UPROPERTY()
    FEcologyLoadPolicy EditorLoadPolicy;
    UPROPERTY()
    TArray<FBox2D> LoadRegions;

    FCS_EcologyConfigContext()
    {
        return;
    }
}

struct FCS_EcologyDataCacheContext : FECSSingleton
{
    UPROPERTY()
    FEcologyDataCache DataCache;

    FCS_EcologyDataCacheContext()
    {
        return;
    }
}

struct FCS_EcologyScriptGlobalContext : FECSSingleton
{
    UPROPERTY()
    TMap<FECSEntityId, FECSEntityId> EntityConfig2RuntimeMap;
    UPROPERTY()
    FEcologyVoxelScene VoxelScene;
    UPROPERTY()
    FEcologyWorldState WorldState;
    UPROPERTY()
    FRandomGenerator EcologyGlobalRandom;
    UPROPERTY()
    int EcologyGlobalRandomSeed;


}

struct FCS_EcologyWorldInfo : FECSSingleton
{
    UPROPERTY()
    int BaseWorldMonsterLevel = 1;
    UPROPERTY()
    TDataObjectPtr<FEcologyLevelDataObject> EcologyLevelConfig;


}

namespace ECSFunc_FCS_EcologyConfigContext
{
UFUNCTION()
bool HasEcologyConfigContext(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyConfigContext);
}
FCS_EcologyConfigContext& AssignEcologyConfigContext(const FECSWorldPtr &inout World, const FCS_EcologyConfigContext &inout DefaultValue = FCS_EcologyConfigContext())
{
    UScriptStruct local_6 = FCS_EcologyConfigContext;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyConfigContext_BP(const FECSWorldPtr &inout World, const FCS_EcologyConfigContext &inout DefaultValue = FCS_EcologyConfigContext())
{
    ECSFunc_FCS_EcologyConfigContext::AssignEcologyConfigContext(World, DefaultValue);
    return;
}
FCS_EcologyConfigContext& ModifyEcologyConfigContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyConfigContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyConfigContext& ModifyOrAddEcologyConfigContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyConfigContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyConfigContext& GetEcologyConfigContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyConfigContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyConfigContext GetEcologyConfigContext_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyConfigContext __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyConfigContext::GetEcologyConfigContext(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyConfigContext GetDefaultedEcologyConfigContext(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyConfigContext __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyConfigContext);
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
FCS_EcologyConfigContext GetDefaultedEcologyConfigContext_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyConfigContext __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyConfigContext(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyConfigContext);
}
}
void __MonitorEcologyConfigContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyConfigContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyConfigContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyConfigContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyConfigContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyConfigContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcologyDataCacheContext
{
UFUNCTION()
bool HasEcologyDataCacheContext(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyDataCacheContext);
}
FCS_EcologyDataCacheContext& AssignEcologyDataCacheContext(const FECSWorldPtr &inout World, const FCS_EcologyDataCacheContext &inout DefaultValue = FCS_EcologyDataCacheContext())
{
    UScriptStruct local_6 = FCS_EcologyDataCacheContext;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyDataCacheContext_BP(const FECSWorldPtr &inout World, const FCS_EcologyDataCacheContext &inout DefaultValue = FCS_EcologyDataCacheContext())
{
    ECSFunc_FCS_EcologyDataCacheContext::AssignEcologyDataCacheContext(World, DefaultValue);
    return;
}
FCS_EcologyDataCacheContext& ModifyEcologyDataCacheContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDataCacheContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyDataCacheContext& ModifyOrAddEcologyDataCacheContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDataCacheContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyDataCacheContext& GetEcologyDataCacheContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyDataCacheContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyDataCacheContext GetEcologyDataCacheContext_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyDataCacheContext __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyDataCacheContext::GetEcologyDataCacheContext(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyDataCacheContext GetDefaultedEcologyDataCacheContext(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyDataCacheContext __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyDataCacheContext);
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
FCS_EcologyDataCacheContext GetDefaultedEcologyDataCacheContext_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyDataCacheContext __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyDataCacheContext(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyDataCacheContext);
}
}
void __MonitorEcologyDataCacheContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyDataCacheContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDataCacheContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyDataCacheContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyDataCacheContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyDataCacheContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcologyScriptGlobalContext
{
UFUNCTION()
bool HasEcologyScriptGlobalContext(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyScriptGlobalContext);
}
FCS_EcologyScriptGlobalContext& AssignEcologyScriptGlobalContext(const FECSWorldPtr &inout World, const FCS_EcologyScriptGlobalContext &inout DefaultValue = FCS_EcologyScriptGlobalContext())
{
    UScriptStruct local_6 = FCS_EcologyScriptGlobalContext;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyScriptGlobalContext_BP(const FECSWorldPtr &inout World, const FCS_EcologyScriptGlobalContext &inout DefaultValue = FCS_EcologyScriptGlobalContext())
{
    ECSFunc_FCS_EcologyScriptGlobalContext::AssignEcologyScriptGlobalContext(World, DefaultValue);
    return;
}
FCS_EcologyScriptGlobalContext& ModifyEcologyScriptGlobalContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyScriptGlobalContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyScriptGlobalContext& ModifyOrAddEcologyScriptGlobalContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyScriptGlobalContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyScriptGlobalContext& GetEcologyScriptGlobalContext(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyScriptGlobalContext;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyScriptGlobalContext GetEcologyScriptGlobalContext_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyScriptGlobalContext __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyScriptGlobalContext::GetEcologyScriptGlobalContext(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyScriptGlobalContext GetDefaultedEcologyScriptGlobalContext(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyScriptGlobalContext __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyScriptGlobalContext);
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
FCS_EcologyScriptGlobalContext GetDefaultedEcologyScriptGlobalContext_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyScriptGlobalContext __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyScriptGlobalContext(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyScriptGlobalContext);
}
}
void __MonitorEcologyScriptGlobalContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyScriptGlobalContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyScriptGlobalContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyScriptGlobalContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyScriptGlobalContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyScriptGlobalContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcologyWorldInfo
{
UFUNCTION()
bool HasEcologyWorldInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcologyWorldInfo);
}
FCS_EcologyWorldInfo& AssignEcologyWorldInfo(const FECSWorldPtr &inout World, const FCS_EcologyWorldInfo &inout DefaultValue = FCS_EcologyWorldInfo())
{
    UScriptStruct local_6 = FCS_EcologyWorldInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcologyWorldInfo_BP(const FECSWorldPtr &inout World, const FCS_EcologyWorldInfo &inout DefaultValue = FCS_EcologyWorldInfo())
{
    ECSFunc_FCS_EcologyWorldInfo::AssignEcologyWorldInfo(World, DefaultValue);
    return;
}
FCS_EcologyWorldInfo& ModifyEcologyWorldInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyWorldInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcologyWorldInfo& ModifyOrAddEcologyWorldInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyWorldInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcologyWorldInfo& GetEcologyWorldInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcologyWorldInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcologyWorldInfo GetEcologyWorldInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcologyWorldInfo __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcologyWorldInfo::GetEcologyWorldInfo(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcologyWorldInfo GetDefaultedEcologyWorldInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcologyWorldInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcologyWorldInfo);
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
FCS_EcologyWorldInfo GetDefaultedEcologyWorldInfo_BP(const FECSWorldPtr &inout World)
{
    FCS_EcologyWorldInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveEcologyWorldInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcologyWorldInfo);
}
}
void __MonitorEcologyWorldInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcologyWorldInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyWorldInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcologyWorldInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcologyWorldInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcologyWorldInfo, bFixedFrame, Details);
    return;
}
