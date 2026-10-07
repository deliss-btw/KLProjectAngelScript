
enum ECommonPopupQueueType
{
    Default,
    Simpletips,
    Importanttips,
    SmallSideHint,
    WeakTips,
    BigSideHint,
    Banner,
    Request,
    NewsTicker,
    Loading,
}

enum ECommonPopupOccupyRule
{
    Wait,
    Interrupt,
    Blocked,
}

namespace __INTENRAL_FCS_CommonPopupManager_NS
{
    const TECSComponentDerivedPtr<FCS_CommonPopupManager> DerivedPtr = TECSComponentDerivedPtr<FCS_CommonPopupManager>();
    const FCS_CommonPopupManager DefaultValue = FCS_CommonPopupManager();
}
namespace __INTENRAL_FCS_CommonPopupManagerRecord_NS
{
    const TECSComponentDerivedPtr<FCS_CommonPopupManagerRecord> DerivedPtr = TECSComponentDerivedPtr<FCS_CommonPopupManagerRecord>();
    const FCS_CommonPopupManagerRecord DefaultValue = FCS_CommonPopupManagerRecord();

}
struct FCommonPopupInfo
{
    UPROPERTY()
    int PopupId;
    UPROPERTY()
    FGameplayTag PopupType;
    UPROPERTY()
    int Priority;

    FCommonPopupInfo()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FCommonPopupInfo(const int InPopupId, const FGameplayTag &inout InPopupType, const int InPriority = 0)
    {
        this.PopupId = 0;
        this.Priority = 0;
        this.PopupId = InPopupId;
        this.PopupType = InPopupType;
        this.Priority = InPriority;
        return;
    }
    bool IsValid() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
}

struct FCommonPopupInfoSorter
{
    FCommonPopupInfoSorter()
    {
        return;
    }
    bool opCall(const FCommonPopupInfo &inout A, const FCommonPopupInfo &inout B) const
    {
        if (int(A.Priority) != int(B.Priority))
        {
            return (A.Priority > B.Priority);
        }
        return (A.PopupId < B.PopupId);
    }
}

struct FCommonPopupQueueRule
{
    UPROPERTY()
    TArray<FFilteredGameplayTag> PopupTypes;

    FCommonPopupQueueRule()
    {
        return;
    }
}

struct FCommonPopupQueueRuleList
{
    UPROPERTY()
    FCommonPopupQueueRule Rule;
    UPROPERTY()
    FCommonPopupInfo DisplayingPopup;
    UPROPERTY()
    TArray<FCommonPopupInfo> QueuedPopups;

    FCommonPopupQueueRuleList()
    {
        return;
    }
}

struct FCommonPopupQueueTypeList
{
    UPROPERTY()
    TArray<ECommonPopupQueueType> QueueTypes;

    FCommonPopupQueueTypeList()
    {
        return;
    }
}

struct FCS_CommonPopupManager : FECSSingleton
{
    UPROPERTY()
    int NextPopupId = 0;
    UPROPERTY()
    bool bInitialized = false;
    UPROPERTY()
    TMap<ECommonPopupQueueType, FCommonPopupQueueRuleList> QueuedPopups;
    UPROPERTY()
    TMap<FGameplayTag, FCommonPopupQueueTypeList> CachedPopupTypes;
    UPROPERTY()
    TMap<ECommonPopupQueueType, FFPTime> CollectStartTime;
    UPROPERTY()
    TMap<int, FFPTime> DisplayingStartTime;
    UPROPERTY()
    TSet<int> StuckWarnedPopupIds;


    void EnsureInitialized()
    {
        TArrayIterator<FFilteredGameplayTag> local_42;
        if (this.bInitialized)
        {
            return;
        }
        this.bInitialized = true;
        for (auto& local_24 : ::CommonPopupSettings::Get().ShardQueueRules)
        {
            for (; local_42.CanProceed;)
            {
                FFilteredGameplayTag& local_50 = local_42.Proceed();
                if (!(this.CachedPopupTypes.Contains(local_50.opImplConv())))
                {
                    FGameplayTag local_52 = local_50.opImplConv();
                }
                this.CachedPopupTypes[local_50.opImplConv()].QueueTypes.AddUnique(local_24.GetKey());
            }
        }
        if (!(this.QueuedPopups.Contains(ECommonPopupQueueType(0))))
        {
            ECommonPopupQueueType local_36;
            this.QueuedPopups.Add(local_36, 0);
        }
        return;
    }
    void GetQueueTypesForTag(const FGameplayTag &inout PopupType, TArray<ECommonPopupQueueType> &inout OutQueueTypes)
    {
        this.EnsureInitialized();
        OutQueueTypes.Empty(0);
        if (this.CachedPopupTypes.Contains(PopupType))
        {
            OutQueueTypes = this.CachedPopupTypes[PopupType].QueueTypes;
        }
        if (OutQueueTypes.IsEmpty())
        {
            OutQueueTypes.Add(ECommonPopupQueueType(0));
        }
        return;
    }
    bool GetPopupsList(const FGameplayTag &inout PopupType, TArray<FCommonPopupInfo> &inout OutPopupsList)
    {
        ECommonPopupQueueType local_8;
        this.EnsureInitialized();
        TArray<ECommonPopupQueueType> local_4;
        this.GetQueueTypesForTag(PopupType, local_4);
        if (local_4.IsEmpty())
        {
            local_8 = ECommonPopupQueueType(0);
        }
        else
        {
            local_8 = local_4[0];
        }
        if (this.QueuedPopups.Contains(local_8))
        {
            OutPopupsList.Empty(0);
            FCommonPopupQueueRuleList& local_12 = this.QueuedPopups[local_8];
            if (local_12.DisplayingPopup.IsValid())
            {
                OutPopupsList.Add(local_12.DisplayingPopup);
            }
            OutPopupsList.Append(local_12.QueuedPopups);
            return true;
        }
        return false;
    }
    int GeneratePopupId(const ECommonPopupQueueType QueueType)
    {
        int local_1 = this.NextPopupId;
        ++this.NextPopupId;
        if (this.NextPopupId < 0)
        {
            this.NextPopupId = 0;
        }
        return local_1;
    }
}

struct FCS_CommonPopupManagerRecord : FECSSingleton
{
    UPROPERTY()
    TSet<ECommonPopupQueueType> DisplayingChangedQueues;
    UPROPERTY()
    TMap<ECommonPopupQueueType, FCommonPopupQueueRuleList> RemovedPopups;

    FCS_CommonPopupManagerRecord()
    {
        return;
    }
}

namespace ECSFunc_FCS_CommonPopupManager
{
UFUNCTION()
bool HasCommonPopupManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommonPopupManager);
}
FCS_CommonPopupManager& AssignCommonPopupManager(const FECSWorldPtr &inout World, const FCS_CommonPopupManager &inout DefaultValue = FCS_CommonPopupManager())
{
    UScriptStruct local_6 = FCS_CommonPopupManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommonPopupManager_BP(const FECSWorldPtr &inout World, const FCS_CommonPopupManager &inout DefaultValue = FCS_CommonPopupManager())
{
    ECSFunc_FCS_CommonPopupManager::AssignCommonPopupManager(World, DefaultValue);
    return;
}
FCS_CommonPopupManager& ModifyCommonPopupManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonPopupManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommonPopupManager& ModifyOrAddCommonPopupManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonPopupManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommonPopupManager& GetCommonPopupManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonPopupManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommonPopupManager GetCommonPopupManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommonPopupManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommonPopupManager::GetCommonPopupManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommonPopupManager GetDefaultedCommonPopupManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommonPopupManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommonPopupManager);
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
FCS_CommonPopupManager GetDefaultedCommonPopupManager_BP(const FECSWorldPtr &inout World)
{
    FCS_CommonPopupManager __r;
    return __r;
}
UFUNCTION()
bool RemoveCommonPopupManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommonPopupManager);
}
}
void __MonitorCommonPopupManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommonPopupManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonPopupManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommonPopupManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonPopupManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommonPopupManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CommonPopupManagerRecord
{
UFUNCTION()
bool HasCommonPopupManagerRecord(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommonPopupManagerRecord);
}
FCS_CommonPopupManagerRecord& AssignCommonPopupManagerRecord(const FECSWorldPtr &inout World, const FCS_CommonPopupManagerRecord &inout DefaultValue = FCS_CommonPopupManagerRecord())
{
    UScriptStruct local_6 = FCS_CommonPopupManagerRecord;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommonPopupManagerRecord_BP(const FECSWorldPtr &inout World, const FCS_CommonPopupManagerRecord &inout DefaultValue = FCS_CommonPopupManagerRecord())
{
    ECSFunc_FCS_CommonPopupManagerRecord::AssignCommonPopupManagerRecord(World, DefaultValue);
    return;
}
FCS_CommonPopupManagerRecord& ModifyCommonPopupManagerRecord(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonPopupManagerRecord;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommonPopupManagerRecord& ModifyOrAddCommonPopupManagerRecord(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonPopupManagerRecord;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommonPopupManagerRecord& GetCommonPopupManagerRecord(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommonPopupManagerRecord;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommonPopupManagerRecord GetCommonPopupManagerRecord_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommonPopupManagerRecord __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommonPopupManagerRecord::GetCommonPopupManagerRecord(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommonPopupManagerRecord GetDefaultedCommonPopupManagerRecord(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommonPopupManagerRecord __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommonPopupManagerRecord);
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
FCS_CommonPopupManagerRecord GetDefaultedCommonPopupManagerRecord_BP(const FECSWorldPtr &inout World)
{
    FCS_CommonPopupManagerRecord __r;
    return __r;
}
UFUNCTION()
bool RemoveCommonPopupManagerRecord(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommonPopupManagerRecord);
}
}
void __MonitorCommonPopupManagerRecordLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommonPopupManagerRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonPopupManagerRecordActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommonPopupManagerRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommonPopupManagerRecordModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommonPopupManagerRecord, bFixedFrame, Details);
    return;
}
