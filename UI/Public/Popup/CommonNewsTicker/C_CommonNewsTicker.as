
namespace __INTENRAL_FCS_CommonNewsTickerManager_NS
{
    const TECSComponentDerivedPtr<FCS_CommonNewsTickerManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CommonNewsTickerManager>();
    const FCS_CommonNewsTickerManager DefaultValue = FCS_CommonNewsTickerManager();

}
struct FCommonNewsTickerInfo
{
    UPROPERTY()
    FText Content;
    UPROPERTY()
    int RepeatCount = 1;
    UPROPERTY()
    int Priority = 0;


}

struct FCS_CommonNewsTickerManager : FECSSingleton
{
    UPROPERTY()
    TMap<int, FCommonNewsTickerInfo> PendingTickers;
    UPROPERTY()
    FEUIWidgetRef DisplayingTicker;
    UPROPERTY()
    int DisplayingTickerPopupId;
    UPROPERTY()
    float32 DisplayingTickerRepeatCount;

    FCS_CommonNewsTickerManager()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

namespace ECSFunc_FCS_CommonNewsTickerManager
{
UFUNCTION()
bool HasCommonNewsTickerManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommonNewsTickerManager);
}
FCS_CommonNewsTickerManager& AssignCommonNewsTickerManager(const FECSWorldPtr &inout World, const FCS_CommonNewsTickerManager &inout DefaultValue = FCS_CommonNewsTickerManager())
{
    UScriptStruct local_6 = FCS_CommonNewsTickerManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommonNewsTickerManager_BP(const FECSWorldPtr &inout World, const FCS_CommonNewsTickerManager &inout DefaultValue = FCS_CommonNewsTickerManager())
{
    ECSFunc_FCS_CommonNewsTickerManager::AssignCommonNewsTickerManager(World, DefaultValue);
    return;
}
FCS_CommonNewsTickerManager& ModifyCommonNewsTickerManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonNewsTickerManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommonNewsTickerManager& ModifyOrAddCommonNewsTickerManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonNewsTickerManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommonNewsTickerManager& GetCommonNewsTickerManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonNewsTickerManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommonNewsTickerManager GetCommonNewsTickerManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommonNewsTickerManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommonNewsTickerManager::GetCommonNewsTickerManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommonNewsTickerManager GetDefaultedCommonNewsTickerManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommonNewsTickerManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommonNewsTickerManager);
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
FCS_CommonNewsTickerManager GetDefaultedCommonNewsTickerManager_BP(const FECSWorldPtr &inout World)
{
    FCS_CommonNewsTickerManager __r;
    return __r;
}
UFUNCTION()
bool RemoveCommonNewsTickerManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommonNewsTickerManager);
}
}
void __MonitorCommonNewsTickerManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommonNewsTickerManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonNewsTickerManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommonNewsTickerManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonNewsTickerManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommonNewsTickerManager, bFixedFrame, Details);
    return;
}
