
enum ECommonTipsType
{
    Normal,
    Weak,
    Important,
}

namespace __INTENRAL_FCS_CommonTipsManager_NS
{
    const TECSComponentDerivedPtr<FCS_CommonTipsManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CommonTipsManager>();
    const FCS_CommonTipsManager DefaultValue = FCS_CommonTipsManager();

}
struct FPendingCommonTipsInfo
{
    UPROPERTY()
    ECommonTipsType Type;
    UPROPERTY()
    FText Content;
    UPROPERTY()
    float32 Lifetime;
    UPROPERTY()
    FEUIModelContainer TypeSpecificModels;


}

struct FDisplayingCommonTipsInfo
{
    UPROPERTY()
    FEUIWidgetRef ViewRef;
    UPROPERTY()
    int PopupId;
    UPROPERTY()
    FText Content;
    UPROPERTY()
    FFPTime OpenTime;
    UPROPERTY()
    float32 Lifetime;

    FDisplayingCommonTipsInfo()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FCommonTipsParam
{
    UPROPERTY()
    float32 LifetimeOverride = 0.0f;
    UPROPERTY()
    bool bAllowSameContent;
    UPROPERTY()
    int Priority = -2000000000;


}

struct FCS_CommonTipsManager : FECSSingleton
{
    UPROPERTY()
    TMap<int, FPendingCommonTipsInfo> PendingTips;
    UPROPERTY()
    TMap<ECommonTipsType, FDisplayingCommonTipsInfo> DisplayingTips;

    FCS_CommonTipsManager()
    {
        return;
    }
}

namespace ECSFunc_FCS_CommonTipsManager
{
UFUNCTION()
bool HasCommonTipsManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommonTipsManager);
}
FCS_CommonTipsManager& AssignCommonTipsManager(const FECSWorldPtr &inout World, const FCS_CommonTipsManager &inout DefaultValue = FCS_CommonTipsManager())
{
    UScriptStruct local_6 = FCS_CommonTipsManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommonTipsManager_BP(const FECSWorldPtr &inout World, const FCS_CommonTipsManager &inout DefaultValue = FCS_CommonTipsManager())
{
    ECSFunc_FCS_CommonTipsManager::AssignCommonTipsManager(World, DefaultValue);
    return;
}
FCS_CommonTipsManager& ModifyCommonTipsManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonTipsManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommonTipsManager& ModifyOrAddCommonTipsManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonTipsManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommonTipsManager& GetCommonTipsManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonTipsManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommonTipsManager GetCommonTipsManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommonTipsManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommonTipsManager::GetCommonTipsManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommonTipsManager GetDefaultedCommonTipsManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommonTipsManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommonTipsManager);
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
FCS_CommonTipsManager GetDefaultedCommonTipsManager_BP(const FECSWorldPtr &inout World)
{
    FCS_CommonTipsManager __r;
    return __r;
}
UFUNCTION()
bool RemoveCommonTipsManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommonTipsManager);
}
}
void __MonitorCommonTipsManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommonTipsManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonTipsManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommonTipsManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonTipsManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommonTipsManager, bFixedFrame, Details);
    return;
}
