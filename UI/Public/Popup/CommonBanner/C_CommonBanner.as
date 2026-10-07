
enum EBannerBGType
{
    Normal,
    Important,
    NormalFailed,
    ImportantFailed,
}

enum EBannerWidgetType
{
    Default,
    MissionChapter,
    LevelUp,
    FeatureUnlock,
}

namespace __INTENRAL_FCS_CommonBannerManager_NS
{
    const TECSComponentDerivedPtr<FCS_CommonBannerManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CommonBannerManager>();
    const FCS_CommonBannerManager DefaultValue = FCS_CommonBannerManager();

}
struct FCommonBannerInfo
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Tips;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    EBannerBGType BGType;
    UPROPERTY()
    EBannerWidgetType BannerType;
    UPROPERTY()
    bool bEnd;
    UPROPERTY()
    float32 Lifetime;
    UPROPERTY()
    int Priority = 0;


}

struct FCS_CommonBannerManager : FECSSingleton
{
    UPROPERTY()
    TMap<int, FCommonBannerInfo> PendingBanners;
    UPROPERTY()
    FEUIWidgetRef DisplayingBanner;
    UPROPERTY()
    int DisplayingBannerPopupId;
    UPROPERTY()
    float32 DisplayingBannerLifetime;

    FCS_CommonBannerManager()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

namespace ECSFunc_FCS_CommonBannerManager
{
UFUNCTION()
bool HasCommonBannerManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommonBannerManager);
}
FCS_CommonBannerManager& AssignCommonBannerManager(const FECSWorldPtr &inout World, const FCS_CommonBannerManager &inout DefaultValue = FCS_CommonBannerManager())
{
    UScriptStruct local_6 = FCS_CommonBannerManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommonBannerManager_BP(const FECSWorldPtr &inout World, const FCS_CommonBannerManager &inout DefaultValue = FCS_CommonBannerManager())
{
    ECSFunc_FCS_CommonBannerManager::AssignCommonBannerManager(World, DefaultValue);
    return;
}
FCS_CommonBannerManager& ModifyCommonBannerManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonBannerManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommonBannerManager& ModifyOrAddCommonBannerManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonBannerManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommonBannerManager& GetCommonBannerManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonBannerManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommonBannerManager GetCommonBannerManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommonBannerManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommonBannerManager::GetCommonBannerManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommonBannerManager GetDefaultedCommonBannerManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommonBannerManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommonBannerManager);
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
FCS_CommonBannerManager GetDefaultedCommonBannerManager_BP(const FECSWorldPtr &inout World)
{
    FCS_CommonBannerManager __r;
    return __r;
}
UFUNCTION()
bool RemoveCommonBannerManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommonBannerManager);
}
}
void __MonitorCommonBannerManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommonBannerManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonBannerManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommonBannerManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonBannerManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommonBannerManager, bFixedFrame, Details);
    return;
}
