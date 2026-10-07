
namespace FM_CommissionLeaderboardEntry
{
    const int ModelId = 0;
}
namespace FM_CommissionLeaderboard
{
    const int ModelId = 0;
}
namespace FMS_CommissionLeaderboardManager
{
    const int ModelId = 0;

}
struct FMsg_CommissionLeaderboardUpdated : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;

    FMsg_CommissionLeaderboardUpdated()
    {
        return;
    }
}

struct FMsg_CommissionMyRankUpdated : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;

    FMsg_CommissionMyRankUpdated()
    {
        return;
    }
}

struct FM_CommissionLeaderboardEntry : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    int m_Rank;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Player>> m_PlayerList;
    UPROPERTY()
    int m_CostTimeSec;
    UPROPERTY()
    int64 m_TimestampMs;
    UPROPERTY()
    FEUIModelWeakRef m_Leaderboard;

    FM_CommissionLeaderboardEntry()
    {
        this.m_Rank = 0;
        this.m_CostTimeSec = 0;
        this.m_TimestampMs = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_CommissionLeaderboardEntry' by default constructor.");
        return;
    }
    FM_CommissionLeaderboardEntry(const FM_CommissionLeaderboardEntry &inout Other)
    {
        this.m_Rank = 0;
        this.m_CostTimeSec = 0;
        this.m_TimestampMs = 0;
        this.m_Rank = int(Other.m_Rank);
        this.m_PlayerList = Other.m_PlayerList;
        this.m_CostTimeSec = int(Other.m_CostTimeSec);
        this.m_TimestampMs = Other.m_TimestampMs;
        this.m_Leaderboard = Other.m_Leaderboard;
        return;
    }
    FM_CommissionLeaderboardEntry(const TEUIModelRef<FM_CommissionLeaderboard> &inout InLeaderboard)
    {
        this.m_Rank = 0;
        this.m_CostTimeSec = 0;
        this.m_TimestampMs = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        FEUIModelRef local_8;
        this.SetLeaderboard(FEUIModelWeakRef(local_8));
        return;
    }
    FM_CommissionLeaderboardEntry& opAssign(const FM_CommissionLeaderboardEntry &inout Other)
    {
        this.m_Rank = int(Other.m_Rank);
        this.m_PlayerList = Other.m_PlayerList;
        this.m_CostTimeSec = int(Other.m_CostTimeSec);
        this.m_TimestampMs = Other.m_TimestampMs;
        return Other.m_Leaderboard;
    }
    TEUIModelRef<FM_CommissionLeaderboard> GetOwnerLeaderboard() const
    {
        return TEUIModelRef<FM_CommissionLeaderboard>(this.GetLeaderboard().AsRef());
    }
    int GetRank() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Rank;
    }
    void SetRank(const int __Value) property
    {
        if (this.m_Rank == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Rank = __Value;
        return;
    }
    TArray<TEUIModelRef<FM_Player>> GetPlayerList() const property
    {
        TArray<TEUIModelRef<FM_Player>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FM_Player>> GetModify_PlayerList() property
    {
        TArray<TEUIModelRef<FM_Player>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerList(const TArray<TEUIModelRef<FM_Player>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerList = __Value;
        return;
    }
    int GetCostTimeSec() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CostTimeSec;
    }
    void SetCostTimeSec(const int __Value) property
    {
        if (this.m_CostTimeSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CostTimeSec = __Value;
        return;
    }
    int64 GetTimestampMs() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TimestampMs;
    }
    void SetTimestampMs(const int64 __Value) property
    {
        if (this.m_TimestampMs == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TimestampMs = __Value;
        return;
    }
    const FEUIModelWeakRef GetLeaderboard() const property
    {
        const FEUIModelWeakRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelWeakRef GetModify_Leaderboard() property
    {
        FEUIModelWeakRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetLeaderboard(const FEUIModelWeakRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Leaderboard = __Value;
        return;
    }
}

struct FM_CommissionLeaderboard : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> m_CommissionConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FM_CommissionLeaderboardEntry>> m_EntryList;
    UPROPERTY()
    int m_TotalCount;
    UPROPERTY()
    bool m_bIsLoading;
    UPROPERTY()
    FDateTime m_LastFetchTime;
    UPROPERTY()
    TEUIModelRef<FM_CommissionLeaderboardEntry> m_MyEntry;
    UPROPERTY()
    bool m_bMyRankLoaded;
    UPROPERTY()
    FDateTime m_MyRankLastFetchTime;
    UPROPERTY()
    bool bLeaderboardLoaded;
    UPROPERTY()
    bool bLeaderboardStale;

    FM_CommissionLeaderboard()
    {
        this.m_TotalCount = 0;
        this.m_bIsLoading = false;
        this.m_bMyRankLoaded = false;
        this.bLeaderboardLoaded = false;
        this.bLeaderboardStale = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_CommissionLeaderboard(const FM_CommissionLeaderboard &inout Other)
    {
        this.m_TotalCount = 0;
        this.m_bIsLoading = false;
        this.m_bMyRankLoaded = false;
        this.bLeaderboardLoaded = false;
        this.bLeaderboardStale = false;
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_EntryList = Other.m_EntryList;
        this.m_TotalCount = int(Other.m_TotalCount);
        this.m_bIsLoading = Other.m_bIsLoading;
        this.m_LastFetchTime = Other.m_LastFetchTime;
        this.m_MyEntry = Other.m_MyEntry;
        this.m_bMyRankLoaded = Other.m_bMyRankLoaded;
        this.m_MyRankLastFetchTime = Other.m_MyRankLastFetchTime;
        return;
    }
    FM_CommissionLeaderboard& opAssign(const FM_CommissionLeaderboard &inout Other)
    {
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_EntryList = Other.m_EntryList;
        this.m_TotalCount = int(Other.m_TotalCount);
        this.m_bIsLoading = Other.m_bIsLoading;
        this.m_LastFetchTime = Other.m_LastFetchTime;
        this.m_MyEntry = Other.m_MyEntry;
        this.m_bMyRankLoaded = Other.m_bMyRankLoaded;
        return Other.m_MyRankLastFetchTime;
    }
    bool IsCacheValid() const
    {
        if (this.bLeaderboardStale)
        {
            return false;
        }
        float32 local_5 = ::CommissionUtils::GetCommissionSettings().LeaderboardCacheDurationSec;
        return ((FDateTime::Now() - this.GetLastFetchTime()).GetTotalSeconds() < local_5);
    }
    bool IsMyRankCacheValid() const
    {
        float32 local_5 = ::CommissionUtils::GetCommissionSettings().LeaderboardCacheDurationSec;
        return ((FDateTime::Now() - this.GetMyRankLastFetchTime()).GetTotalSeconds() < local_5);
    }
    int GetEffectiveMyRank() const
    {
        if (this.GetbMyRankLoaded() && this.GetMyEntry().IsValid())
        {
            TEUIModelRef<FM_CommissionLeaderboardEntry> local_2 = this.GetMyEntry();
            return GetRank();
        }
        return 0;
    }
    TDataObjectPtr<FCommissionConfig> GetCommissionConfig() const property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FCommissionConfig> GetModify_CommissionConfig() property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionConfig = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_CommissionLeaderboardEntry>> GetEntryList() const property
    {
        const TArray<TEUIModelRef<FM_CommissionLeaderboardEntry>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FM_CommissionLeaderboardEntry>> GetModify_EntryList() property
    {
        TArray<TEUIModelRef<FM_CommissionLeaderboardEntry>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEntryList(const TArray<TEUIModelRef<FM_CommissionLeaderboardEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EntryList = __Value;
        return;
    }
    int GetTotalCount() const property
    {
        this.TrackPropertyRead(2);
        return this.m_TotalCount;
    }
    void SetTotalCount(const int __Value) property
    {
        if (this.m_TotalCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TotalCount = __Value;
        return;
    }
    bool GetbIsLoading() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsLoading;
    }
    void SetbIsLoading(const bool __Value) property
    {
        if (!(this.m_bIsLoading) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsLoading = __Value;
        return;
    }
    const FDateTime GetLastFetchTime() const property
    {
        const FDateTime __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FDateTime GetModify_LastFetchTime() property
    {
        FDateTime __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetLastFetchTime(const FDateTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_LastFetchTime = __Value;
        return;
    }
    TEUIModelRef<FM_CommissionLeaderboardEntry> GetMyEntry() const property
    {
        this.TrackPropertyRead(5);
        return this.m_MyEntry;
    }
    void SetMyEntry(const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout __Value) property
    {
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2;
        local_2 = this.m_MyEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MyEntry = __Value;
        return;
    }
    bool GetbMyRankLoaded() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bMyRankLoaded;
    }
    void SetbMyRankLoaded(const bool __Value) property
    {
        if (!(this.m_bMyRankLoaded) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bMyRankLoaded = __Value;
        return;
    }
    const FDateTime GetMyRankLastFetchTime() const property
    {
        const FDateTime __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FDateTime GetModify_MyRankLastFetchTime() property
    {
        FDateTime __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetMyRankLastFetchTime(const FDateTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_MyRankLastFetchTime = __Value;
        return;
    }
}

struct FMS_CommissionLeaderboardManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FCommissionConfig>, TEUIModelRef<FM_CommissionLeaderboard>> m_LeaderboardMap;

    FMS_CommissionLeaderboardManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommissionLeaderboardManager(const FMS_CommissionLeaderboardManager &inout Other)
    {
        this.m_LeaderboardMap = Other.m_LeaderboardMap;
        return;
    }
    FMS_CommissionLeaderboardManager& opAssign(const FMS_CommissionLeaderboardManager &inout Other)
    {
        return Other.m_LeaderboardMap;
    }
    TEUIModelRef<FM_CommissionLeaderboard> GetOrCreateLeaderboard(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
    {
        if (this.GetLeaderboardMap().Contains(CommissionConfig))
        {
            return this.GetLeaderboardMap()[CommissionConfig];
        }
        FM_CommissionLeaderboard& local_4 = ::FM_CommissionLeaderboard::Create(this.GetContext().Manager);
        local_4.SetCommissionConfig(CommissionConfig);
        this.GetModify_LeaderboardMap().Add(CommissionConfig, TEUIModelRef<FM_CommissionLeaderboard>(local_4));
        return (TEUIModelRef<FM_CommissionLeaderboard>(local_4));
    }
    void RequestLeaderboard(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
    {
        FM_CommissionLeaderboard& local_6;
        int local_10 = 0;
        int local_45 = 0;
        this.GetOrCreateLeaderboard(CommissionConfig);
        if (local_6.IsCacheValid() && !(local_6.GetbIsLoading()))
        {
            FEUIModelRef local_16 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_10.CommissionConfig = CommissionConfig;
            return;
        }
        if (local_6.GetbIsLoading())
        {
            return;
        }
        local_6.SetbIsLoading(true);
        FPbGetCommissionLeaderboardReq local_44;
        local_44.SetCommissionId(local_45);
        local_44.SetStartRank(1);
        local_44.SetCount(100);
        this.SendProto(local_44.ToWrapper());
        return;
    }
    void RequestMyRank(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
    {
        FM_CommissionLeaderboard& local_6;
        int local_10 = 0;
        int local_45 = 0;
        this.GetOrCreateLeaderboard(CommissionConfig);
        if (local_6.IsMyRankCacheValid())
        {
            FEUIModelRef local_16 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_10.CommissionConfig = CommissionConfig;
            return;
        }
        FPbGetCommissionMyRankReq local_44;
        local_44.SetCommissionId(local_45);
        this.SendProto(local_44.ToWrapper());
        return;
    }
    void GS_OnGetCommissionLeaderboardRsp(const FPbGetCommissionLeaderboardRsp &inout Rsp)
    {
        GetDataObjectByGSDataId<FCommissionConfig> local_58;
        TEUIModelRef<FM_CommissionLeaderboard> local_110;
        int local_148 = 0;
        int local_180 = 0;
        if (Rsp.GetRetcode() != 0)
        {
            XError(ELog(27), FString().Append("GetCommissionLeaderboard failed, retcode=").Append(Rsp.GetRetcode()));
            int local_59 = Rsp.GetCommissionId();
            TDataObjectPtr<FCommissionConfig> local_34 = local_58.opImplConv();
            if (this.GetLeaderboardMap().Find(local_34, local_110))
            {
                false.SetbIsLoading();
            }
            return;
        }
        int local_59_2 = Rsp.GetCommissionId();
        TDataObjectPtr<FCommissionConfig> local_34_2 = local_58.opImplConv();
        if (!(local_34_2))
        {
            XError(ELog(27), FString().Append("GetCommissionLeaderboard failed, invalid commission config data id: ").Append(Rsp.GetCommissionId()));
            return;
        }
        this.GetOrCreateLeaderboard(local_34_2);
        FM_CommissionLeaderboard local_114;
        local_114.SetbIsLoading(false);
        local_114.SetLastFetchTime(FDateTime::Now());
        local_114.bLeaderboardLoaded = true;
        local_114.bLeaderboardStale = false;
        local_114.SetTotalCount(::NumericUtils::AsInt32(Rsp.GetTotalCount()));
        local_114.GetModify_EntryList().Empty(Rsp.GetEntryList_Num());
        int local_117 = 0;
        if (::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData().IsValid())
        {
            local_117 = GetPlayerUid();
        }
        bool local_123 = false;
        int local_124 = 0;
        for (; local_124 < Rsp.GetEntryList_Num(); )
        {
            FPbLeaderboardEntry local_136 = Rsp.GetEntryList_Index(local_124);
            local_110 = TEUIModelRef<FM_CommissionLeaderboard>(local_114);
            local_148.SetRank(::NumericUtils::AsInt32(local_136.GetRank()));
            local_148.SetCostTimeSec(::NumericUtils::AsInt32(local_136.GetCostTimeSec()));
            local_148.SetTimestampMs(local_136.GetTimestampMs());
            local_148.GetModify_PlayerList().Empty(local_136.GetPlayerList_Num());
            int local_151 = 0;
            for (; local_151 < local_136.GetPlayerList_Num(); ++local_151)
            {
                FPbPlayerBriefInfo local_162 = local_136.GetPlayerList_Index(local_151);
                TEUIModelRef<FM_Player> local_122 = ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(local_162);
                local_148.GetModify_PlayerList().Add(local_122);
                if (!(local_123) && (local_117 > 0) && (local_162.GetUid() == local_117))
                {
                    local_114.SetMyEntry(TEUIModelRef<FM_CommissionLeaderboardEntry>(local_148));
                    local_123 = true;
                }
            }
            local_114.GetModify_EntryList().Add(TEUIModelRef<FM_CommissionLeaderboardEntry>(local_148));
            ++local_124;
        }
        FEUIModelRef local_186 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_180.CommissionConfig = local_34_2;
        return;
    }
    void GS_OnGetCommissionMyRankRsp(const FPbGetCommissionMyRankRsp &inout Rsp)
    {
        int local_118 = 0;
        int local_150 = 0;
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(27), FString().Append("GetCommissionMyRank failed, retcode=").Append(Rsp.GetRetcode()));
            return;
        }
        int local_59 = Rsp.GetCommissionId();
        GetDataObjectByGSDataId<FCommissionConfig> local_58;
        TDataObjectPtr<FCommissionConfig> local_34 = local_58.opImplConv();
        if (!(local_34))
        {
            XError(ELog(27), FString().Append("GetCommissionMyRank failed, invalid commission config data id: ").Append(Rsp.GetCommissionId()));
            return;
        }
        this.GetOrCreateLeaderboard(local_34);
        FM_CommissionLeaderboard local_114;
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_116 = local_114.GetMyEntry();
        if (!(local_116.IsValid()))
        {
            TEUIModelRef<FM_CommissionLeaderboardEntry> local_116_2 = TEUIModelRef<FM_CommissionLeaderboardEntry>(::FM_CommissionLeaderboardEntry::Create(this.GetContext().Manager, (TEUIModelRef<FM_CommissionLeaderboard>(local_114))));
            local_114.SetMyEntry(local_116_2);
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_116_3 = local_114.GetMyEntry();
        local_114.bLeaderboardStale = (local_118.GetRank() != ::NumericUtils::AsInt32(Rsp.GetRank()));
        local_118.SetRank(::NumericUtils::AsInt32(Rsp.GetRank()));
        local_118.SetCostTimeSec(::NumericUtils::AsInt32(Rsp.GetBestCostTimeSec()));
        local_118.SetTimestampMs(Rsp.GetBestTimeTimestampMs());
        local_118.GetModify_PlayerList().Empty(Rsp.GetPlayerList_Num());
        int local_121 = 0;
        for (; local_121 < Rsp.GetPlayerList_Num(); )
        {
            local_118.GetModify_PlayerList().Add(::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(Rsp.GetPlayerList_Index(local_121)));
            ++local_121;
        }
        local_114.SetbMyRankLoaded(true);
        local_114.SetMyRankLastFetchTime(FDateTime::Now());
        FEUIModelRef local_156 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_150.CommissionConfig = local_34;
        return;
    }
    const TMap<TDataObjectPtr<FCommissionConfig>, TEUIModelRef<FM_CommissionLeaderboard>> GetLeaderboardMap() const property
    {
        const TMap<TDataObjectPtr<FCommissionConfig>, TEUIModelRef<FM_CommissionLeaderboard>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FCommissionConfig>, TEUIModelRef<FM_CommissionLeaderboard>> GetModify_LeaderboardMap() property
    {
        TMap<TDataObjectPtr<FCommissionConfig>, TEUIModelRef<FM_CommissionLeaderboard>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLeaderboardMap(const TMap<TDataObjectPtr<FCommissionConfig>, TEUIModelRef<FM_CommissionLeaderboard>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LeaderboardMap = __Value;
        return;
    }
}

namespace FM_CommissionLeaderboardEntry
{
FM_CommissionLeaderboardEntry& Create(const UObject ContextObject, const TEUIModelRef<FM_CommissionLeaderboard> &inout Leaderboard)
{
    return FM_CommissionLeaderboardEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), Leaderboard);
}
FM_CommissionLeaderboardEntry CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_CommissionLeaderboard> &inout Leaderboard)
{
    FM_CommissionLeaderboardEntry __r;
    TEUIModelRef<FM_CommissionLeaderboardEntry> local_6 = TEUIModelRef<FM_CommissionLeaderboardEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_CommissionLeaderboardEntry::ModelId, 0, Leaderboard));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_CommissionLeaderboardEntry;
}
int __IndexOf_Rank()
{
    return 0;
}
int __IndexOf_PlayerList()
{
    return 1;
}
int __IndexOf_CostTimeSec()
{
    return 2;
}
int __IndexOf_TimestampMs()
{
    return 3;
}
int __IndexOf_Leaderboard()
{
    return 4;
}
}
namespace FM_CommissionLeaderboard
{
FM_CommissionLeaderboard& Create(const UObject ContextObject)
{
    return FM_CommissionLeaderboard::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_CommissionLeaderboard CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_CommissionLeaderboard __r;
    TEUIModelRef<FM_CommissionLeaderboard> local_6 = TEUIModelRef<FM_CommissionLeaderboard>(EUIInternal::MakeModelWithManager(Manager, FM_CommissionLeaderboard::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_CommissionLeaderboard;
}
int __IndexOf_CommissionConfig()
{
    return 0;
}
int __IndexOf_EntryList()
{
    return 1;
}
int __IndexOf_TotalCount()
{
    return 2;
}
int __IndexOf_bIsLoading()
{
    return 3;
}
int __IndexOf_LastFetchTime()
{
    return 4;
}
int __IndexOf_MyEntry()
{
    return 5;
}
int __IndexOf_bMyRankLoaded()
{
    return 6;
}
int __IndexOf_MyRankLastFetchTime()
{
    return 7;
}
}
namespace FMS_CommissionLeaderboardManager
{
FMS_CommissionLeaderboardManager& Get(const UObject ContextObject)
{
    return FMS_CommissionLeaderboardManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommissionLeaderboardManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommissionLeaderboardManager __r;
    TEUIModelRef<FMS_CommissionLeaderboardManager> local_6 = TEUIModelRef<FMS_CommissionLeaderboardManager>(EUIInternal::MakeModelWithManager(Manager, FMS_CommissionLeaderboardManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnGetCommissionLeaderboardRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnGetCommissionMyRankRsp";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommissionLeaderboardManager;
}
void __GS_OnGetCommissionLeaderboardRsp(FMS_CommissionLeaderboardManager &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGetCommissionLeaderboardRsp(FPbGetCommissionLeaderboardRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnGetCommissionMyRankRsp(FMS_CommissionLeaderboardManager &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGetCommissionMyRankRsp(FPbGetCommissionMyRankRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_LeaderboardMap()
{
    return 0;
}
}
