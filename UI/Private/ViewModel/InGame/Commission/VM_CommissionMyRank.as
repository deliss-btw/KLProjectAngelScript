
namespace FVM_CommissionMyRank
{
    const int ModelId = 0;

}
struct FVM_CommissionMyRank : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> m_CommissionConfig;
    UPROPERTY()
    int m_Rank;
    UPROPERTY()
    bool m_bIsRanked;
    UPROPERTY()
    int m_BestCostTimeSec;
    UPROPERTY()
    bool m_bIsLoading;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommissionLeaderboard> m_LeaderboardViewModel;

    FVM_CommissionMyRank()
    {
        this.m_Rank = 0;
        this.m_bIsRanked = false;
        this.m_BestCostTimeSec = 0;
        this.m_bIsLoading = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionMyRank' by default constructor.");
        return;
    }
    FVM_CommissionMyRank(const FVM_CommissionMyRank &inout Other)
    {
        this.m_Rank = 0;
        this.m_bIsRanked = false;
        this.m_BestCostTimeSec = 0;
        this.m_bIsLoading = false;
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_Rank = int(Other.m_Rank);
        this.m_bIsRanked = Other.m_bIsRanked;
        this.m_BestCostTimeSec = int(Other.m_BestCostTimeSec);
        this.m_bIsLoading = Other.m_bIsLoading;
        this.m_LeaderboardViewModel = Other.m_LeaderboardViewModel;
        return;
    }
    FVM_CommissionMyRank(const TDataObjectPtr<FCommissionConfig> &inout InCommissionConfig)
    {
        this.m_Rank = 0;
        this.m_bIsRanked = false;
        this.m_BestCostTimeSec = 0;
        this.m_bIsLoading = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionConfig(InCommissionConfig);
        return;
    }
    FVM_CommissionMyRank& opAssign(const FVM_CommissionMyRank &inout Other)
    {
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_Rank = int(Other.m_Rank);
        this.m_bIsRanked = Other.m_bIsRanked;
        this.m_BestCostTimeSec = int(Other.m_BestCostTimeSec);
        this.m_bIsLoading = Other.m_bIsLoading;
        return Other.m_LeaderboardViewModel;
    }
    FText GetRankText() const
    {
        FText local_6;
        if (!(this.GetbIsRanked()))
        {
            NSLOCTEXT(local_6, "Unranked");
            return local_6;
        }
        FText::AsNumber(this.GetRank(), local_6);
        return FText::Format(NSLOCTEXT("RankFormat", "з¬¬{0}еђЌ"), local_6);
    }
    FText GetBestCostTimeText() const
    {
        if (this.GetBestCostTimeSec() <= 0)
        {
            return FText();
        }
        return ::CommissionUtils::GetRaceCommissionTimeText(this.GetBestCostTimeSec());
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayer() const
    {
        return TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().opArrow().GetBriefInfo()));
    }
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> GetLeaderboardPlayer() const
    {
        if (!(this.GetLeaderboardViewModel().IsValid()))
        {
            return TEUIModelRef<FVM_CommissionLeaderboardPlayer>();
        }
        TEUIModelRef<FM_CommissionLeaderboard> local_8 = ::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager).GetOrCreateLeaderboard(this.GetCommissionConfig());
        if (!(local_8.IsValid()))
        {
            return TEUIModelRef<FVM_CommissionLeaderboardPlayer>();
        }
        return TEUIModelRef<FVM_CommissionLeaderboardPlayer>(::FVM_CommissionLeaderboardPlayer::Create(this.GetManager(), this.GetLeaderboardViewModel(), local_8.opArrow().GetMyEntry(), ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData()));
    }
    FText GetPlayerName() const
    {
        return FText::FromString(::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().opArrow().GetNickName());
    }
    bool HasFinished() const
    {
        return (this.GetBestCostTimeSec() > 0);
    }
    FDateTime GetFinishTime() const
    {
        TEUIModelRef<FM_CommissionLeaderboard> local_2 = ::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager).GetOrCreateLeaderboard(this.GetCommissionConfig());
        if (!(local_2.IsValid()))
        {
            return FDateTime();
        }
        FDateTime local_20 = local_2.opArrow().GetMyEntry() ? FDateTime::FromUnixTimestamp(FMath::IntegerDivisionTrunc(local_2.opArrow().GetMyEntry().opArrow().GetTimestampMs(), 1000)) : local_8;
        return local_20;
    }
    FText GetFinishDateText() const
    {
        return KLText::FormatDateTimeAsText(this.GetFinishTime(), CommonTimeFormat::TextMD, "");
    }
    FText GetFinishTimeText() const
    {
        return KLText::FormatDateTimeAsText(this.GetFinishTime(), CommonTimeFormat::HM, "");
    }
    TArray<TEUIModelRef<FVM_PlayerBasicItem>> GetPlayerList() const
    {
        if (!(::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager).GetOrCreateLeaderboard(this.GetCommissionConfig()).IsValid()))
        {
            return TArray<TEUIModelRef<FVM_PlayerBasicItem>>();
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_14;
        local_14.GetMyEntry();
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_12;
        if (!(local_12.IsValid()))
        {
            return TArray<TEUIModelRef<FVM_PlayerBasicItem>>();
        }
        TArray<TEUIModelRef<FVM_PlayerBasicItem>> local_18;
        for (auto& local_32 : GetPlayerList())
        {
            local_18.Add(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, local_32.opArrow().GetBriefInfo())));
        }
        return local_18;
    }
    bool HasTeam() const
    {
        TEUIModelRef<FM_CommissionLeaderboard> local_2 = ::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager).GetOrCreateLeaderboard(this.GetCommissionConfig());
        if (!(local_2))
        {
            return false;
        }
        return local_2.opArrow().GetMyEntry() && (local_2.opArrow().GetMyEntry().opArrow().GetPlayerList().Num() > 1);
    }
    void PostConstruct()
    {
        this.SetbIsLoading(true);
        ::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager).RequestMyRank(this.GetCommissionConfig());
        return;
    }
    void OnMyRankUpdated(const FMsg_CommissionMyRankUpdated &inout Msg)
    {
        int local_15;
        if (0 != 0)
        {
            return;
        }
        if (!(::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager).GetOrCreateLeaderboard(this.GetCommissionConfig()).IsValid()))
        {
            return;
        }
        this.SetbIsLoading(false);
        FM_CommissionLeaderboard local_10;
        int local_12 = local_10.GetEffectiveMyRank();
        this.SetRank(local_12);
        this.SetbIsRanked((local_12 > 0));
        if (local_10.GetMyEntry().IsValid())
        {
            TEUIModelRef<FM_CommissionLeaderboardEntry> local_14 = local_10.GetMyEntry();
            local_15 = GetCostTimeSec();
        }
        else
        {
            local_15 = 0;
        }
        this.SetBestCostTimeSec(local_15);
        return;
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
    int GetRank() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Rank;
    }
    void SetRank(const int __Value) property
    {
        if (this.m_Rank == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Rank = __Value;
        return;
    }
    bool GetbIsRanked() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsRanked;
    }
    void SetbIsRanked(const bool __Value) property
    {
        if (!(this.m_bIsRanked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsRanked = __Value;
        return;
    }
    int GetBestCostTimeSec() const property
    {
        this.TrackPropertyRead(3);
        return this.m_BestCostTimeSec;
    }
    void SetBestCostTimeSec(const int __Value) property
    {
        if (this.m_BestCostTimeSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_BestCostTimeSec = __Value;
        return;
    }
    bool GetbIsLoading() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsLoading;
    }
    void SetbIsLoading(const bool __Value) property
    {
        if (!(this.m_bIsLoading) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsLoading = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommissionLeaderboard> GetLeaderboardViewModel() const property
    {
        this.TrackPropertyRead(5);
        return this.m_LeaderboardViewModel;
    }
    void SetLeaderboardViewModel(const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommissionLeaderboard> local_2;
        local_2 = this.m_LeaderboardViewModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LeaderboardViewModel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionMyRank
{
    UPROPERTY()
    FText RankText;
    UPROPERTY()
    FText BestCostTimeText;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> Player;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> LeaderboardPlayer;
    UPROPERTY()
    FText PlayerName;
    UPROPERTY()
    bool HasFinished;
    UPROPERTY()
    FDateTime FinishTime;
    UPROPERTY()
    FText FinishDateText;
    UPROPERTY()
    FText FinishTimeText;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PlayerBasicItem>> PlayerList;
    UPROPERTY()
    bool HasTeam;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionMyRank> Self;


}

namespace FVM_CommissionMyRank
{
FVM_CommissionMyRank& Create(const UObject ContextObject, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    return FVM_CommissionMyRank::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionConfig);
}
FVM_CommissionMyRank CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    FVM_CommissionMyRank __r;
    TEUIModelRef<FVM_CommissionMyRank> local_6 = TEUIModelRef<FVM_CommissionMyRank>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionMyRank::ModelId, 0, CommissionConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Rank";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsRanked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestCostTimeSec";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsLoading";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RankText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestCostTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Player";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerBasicItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeaderboardPlayer";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionLeaderboardPlayer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasFinished";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FinishTime";
    local_14.TypeName = "FDateTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FinishDateText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FinishTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_PlayerBasicItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionMyRank>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionMyRank;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnMyRankUpdated";
    local_26.MessageTypeName = "Msg_CommissionMyRankUpdated";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionMyRank;
}
void __OnMyRankUpdated(FVM_CommissionMyRank &inout Model, const FMsg_CommissionMyRankUpdated &inout Message)
{
    Model.OnMyRankUpdated(Message);
    return;
}
int __UIGetter_Rank(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetRank();
}
bool __UIGetter_bIsRanked(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetbIsRanked();
}
int __UIGetter_BestCostTimeSec(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetBestCostTimeSec();
}
bool __UIGetter_bIsLoading(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetbIsLoading();
}
FText __UIGetter_RankText(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetRankText();
}
FText __UIGetter_BestCostTimeText(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetBestCostTimeText();
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_Player(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetPlayer();
}
TEUIModelRef<FVM_CommissionLeaderboardPlayer> __UIGetter_LeaderboardPlayer(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetLeaderboardPlayer();
}
FText __UIGetter_PlayerName(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetPlayerName();
}
bool __UIGetter_HasFinished(const FVM_CommissionMyRank &inout Model)
{
    return Model.HasFinished();
}
FDateTime __UIGetter_FinishTime(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetFinishTime();
}
FText __UIGetter_FinishDateText(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetFinishDateText();
}
FText __UIGetter_FinishTimeText(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetFinishTimeText();
}
TArray<TEUIModelRef<FVM_PlayerBasicItem>> __UIGetter_PlayerList(const FVM_CommissionMyRank &inout Model)
{
    return Model.GetPlayerList();
}
bool __UIGetter_HasTeam(const FVM_CommissionMyRank &inout Model)
{
    return Model.HasTeam();
}
TEUIModelRef<FVM_CommissionMyRank> __UIGetter_Self(const FVM_CommissionMyRank &inout Model)
{
    return TEUIModelRef<FVM_CommissionMyRank>(Model);
}
int __IndexOf_CommissionConfig()
{
    return 0;
}
int __IndexOf_Rank()
{
    return 1;
}
int __IndexOf_bIsRanked()
{
    return 2;
}
int __IndexOf_BestCostTimeSec()
{
    return 3;
}
int __IndexOf_bIsLoading()
{
    return 4;
}
int __IndexOf_LeaderboardViewModel()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_CommissionMyRank
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
