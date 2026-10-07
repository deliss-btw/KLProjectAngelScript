
namespace FVM_CommissionLeaderboardItem
{
    const int ModelId = 0;
}
namespace FVM_CommissionLeaderboardPlayer
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnGamepadSelect = FEUIModelCallbackSignature();

}
struct FCommissionLeaderboardItemData
{
    UPROPERTY()
    int Rank;
    UPROPERTY()
    TEUIModelRef<FM_CommissionLeaderboardEntry> EntryModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommissionLeaderboard> OwnerLeaderboard;


}

struct FVM_CommissionLeaderboardItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Rank;
    UPROPERTY()
    TEUIModelRef<FM_CommissionLeaderboardEntry> m_EntryModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommissionLeaderboard> m_OwnerLeaderboard;

    FVM_CommissionLeaderboardItem()
    {
        this.m_Rank = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionLeaderboardItem' by default constructor.");
        return;
    }
    FVM_CommissionLeaderboardItem(const FVM_CommissionLeaderboardItem &inout Other)
    {
        this.m_Rank = 0;
        this.m_Rank = int(Other.m_Rank);
        this.m_EntryModel = Other.m_EntryModel;
        this.m_OwnerLeaderboard = Other.m_OwnerLeaderboard;
        return;
    }
    FVM_CommissionLeaderboardItem(const int InRank, const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout InEntryModel, const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout InOwnerLeaderboard)
    {
        this.m_Rank = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetRank(InRank);
        this.SetEntryModel(InEntryModel);
        this.SetOwnerLeaderboard(InOwnerLeaderboard);
        return;
    }
    FVM_CommissionLeaderboardItem& opAssign(const FVM_CommissionLeaderboardItem &inout Other)
    {
        this.m_Rank = int(Other.m_Rank);
        this.m_EntryModel = Other.m_EntryModel;
        return Other.m_OwnerLeaderboard;
    }
    FText GetCostTimeText() const
    {
        int local_9;
        if (!(this.GetEntryModel().IsValid()))
        {
            return FText();
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2 = this.GetEntryModel();
        local_9 = GetCostTimeSec();
        return ::CommissionUtils::GetRaceCommissionTimeText(local_9);
    }
    FDateTime GetFinishTime() const
    {
        if (!(this.GetEntryModel().IsValid()))
        {
            return FDateTime();
        }
        return FDateTime::FromUnixTimestamp(FMath::IntegerDivisionTrunc(this.GetEntryModel().opArrow().GetTimestampMs(), 1000));
    }
    FText GetFinishDateText() const
    {
        return KLText::FormatDateTimeAsText(this.GetFinishTime(), CommonTimeFormat::TextMD, "");
    }
    FText GetFinishTimeText() const
    {
        return KLText::FormatDateTimeAsText(this.GetFinishTime(), CommonTimeFormat::HM, "");
    }
    FText GetPlayerName() const
    {
        int local_12 = 0;
        bool local_3 = !(this.GetEntryModel().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FM_CommissionLeaderboardEntry> local_2 = this.GetEntryModel();
            local_3 = (GetPlayerList().Num() == 0);
        }
        if (local_3)
        {
            return FText();
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2_2 = this.GetEntryModel();
        if (!(local_12.IsValid()))
        {
            return FText();
        }
        if (GetNickNameAttr().HasValue())
        {
            return FText::FromString();
        }
        return FText();
    }
    FSoftBrush GetPlayerIcon() const
    {
        int local_54 = 0;
        bool local_3 = !(this.GetEntryModel().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FM_CommissionLeaderboardEntry> local_2 = this.GetEntryModel();
            local_3 = (GetPlayerList().Num() == 0);
        }
        if (local_3)
        {
            return FSoftBrush();
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2_2 = this.GetEntryModel();
        if (!(local_54.IsValid()))
        {
            return FSoftBrush();
        }
        if (GetCurrentAvatarAttr().HasValue())
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_102;
            if (local_102)
            {
            }
            else
            {
            }
        }
        return FSoftBrush();
    }
    bool GetIsTeam() const
    {
        if (!(this.GetEntryModel().IsValid()))
        {
            return false;
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2 = this.GetEntryModel();
        return (GetPlayerList().Num() > 1);
    }
    int GetPlayerCount() const
    {
        if (!(this.GetEntryModel().IsValid()))
        {
            return 0;
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2 = this.GetEntryModel();
        return GetPlayerList().Num();
    }
    TArray<TEUIModelRef<FVM_CommissionLeaderboardPlayer>> GetPlayerList() const
    {
        TArray<TEUIModelRef<FVM_CommissionLeaderboardPlayer>> local_4;
        if (!(this.GetEntryModel().IsValid()))
        {
            return local_4;
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_6 = this.GetEntryModel();
        for (auto& local_22 : GetPlayerList())
        {
            local_4.Add(TEUIModelRef<FVM_CommissionLeaderboardPlayer>(::FVM_CommissionLeaderboardPlayer::Create(this.GetContext().Manager, this.GetOwnerLeaderboard(), this.GetEntryModel(), local_22)));
        }
        while (local_4.Num() < 4)
        {
            TEUIModelRef<FM_Player> local_34;
            local_4.Add(TEUIModelRef<FVM_CommissionLeaderboardPlayer>(::FVM_CommissionLeaderboardPlayer::Create(this.GetContext().Manager, this.GetOwnerLeaderboard(), this.GetEntryModel(), local_34)));
        }
        return local_4;
    }
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> GetFirstPlayer() const
    {
        bool local_3 = !(this.GetEntryModel().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FM_CommissionLeaderboardEntry> local_2 = this.GetEntryModel();
            local_3 = (GetPlayerList().Num() == 0);
        }
        if (local_3)
        {
            return TEUIModelRef<FVM_CommissionLeaderboardPlayer>();
        }
        return TEUIModelRef<FVM_CommissionLeaderboardPlayer>(::FVM_CommissionLeaderboardPlayer::Create(this.GetContext().Manager, this.GetOwnerLeaderboard(), this.GetEntryModel(), this.GetEntryModel().opArrow().GetPlayerList()[0]));
    }
    int GetPlayerCountStyleIndex() const
    {
        if (this.GetEntryModel().opArrow().GetOwnerLeaderboard())
        {
            CastTo local_12;
            TDataObjectPtr<FRaceCommissionConfig> local_36 = local_12.opCall();
            if (local_36)
            {
                return int(local_36.opArrow().RaceMode) == 2 ? 1 : 0;
            }
        }
        return 1;
    }
    int GetRankStyleIndex() const
    {
        if (this.GetRank() <= 3)
        {
            return (this.GetRank() - 1);
        }
        return 3;
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
    TEUIModelRef<FM_CommissionLeaderboardEntry> GetEntryModel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_EntryModel;
    }
    void SetEntryModel(const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout __Value) property
    {
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2;
        local_2 = this.m_EntryModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EntryModel = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommissionLeaderboard> GetOwnerLeaderboard() const property
    {
        this.TrackPropertyRead(2);
        return this.m_OwnerLeaderboard;
    }
    void SetOwnerLeaderboard(const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommissionLeaderboard> local_2;
        local_2 = this.m_OwnerLeaderboard;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OwnerLeaderboard = __Value;
        return;
    }
}

struct FVM_CommissionLeaderboardPlayer : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommissionLeaderboard> m_OwnerLeaderboard;
    UPROPERTY()
    TEUIModelRef<FM_CommissionLeaderboardEntry> m_EntryModel;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_PlayerModel;

    FVM_CommissionLeaderboardPlayer()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionLeaderboardPlayer' by default constructor.");
        return;
    }
    FVM_CommissionLeaderboardPlayer(const FVM_CommissionLeaderboardPlayer &inout Other)
    {
        this.m_OwnerLeaderboard = Other.m_OwnerLeaderboard;
        this.m_EntryModel = Other.m_EntryModel;
        this.m_PlayerModel = Other.m_PlayerModel;
        return;
    }
    FVM_CommissionLeaderboardPlayer(const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout InOwnerLeaderboard, const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout InEntryModel, const TEUIModelRef<FM_Player> &inout InPlayerModel)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOwnerLeaderboard(InOwnerLeaderboard);
        this.SetEntryModel(InEntryModel);
        this.SetPlayerModel(InPlayerModel);
        return;
    }
    FVM_CommissionLeaderboardPlayer& opAssign(const FVM_CommissionLeaderboardPlayer &inout Other)
    {
        this.m_OwnerLeaderboard = Other.m_OwnerLeaderboard;
        this.m_EntryModel = Other.m_EntryModel;
        return Other.m_PlayerModel;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayerBasicItem() const
    {
        if (!(this.IsValid()))
        {
            return TEUIModelRef<FVM_PlayerBasicItem>();
        }
        TEUIModelRef<FM_Player> local_6 = this.GetPlayerModel();
        FPlayerBriefInfo local_24;
        local_24.GetBriefInfo();
        return TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, local_24));
    }
    bool IsValid() const
    {
        return this.GetOwnerLeaderboard().IsValid() && this.GetPlayerModel().IsValid();
    }
    bool IsSelected() const
    {
        if (!(this.IsValid()))
        {
            return false;
        }
        TEUIModelWeakRef<FVM_CommissionLeaderboard> local_4 = this.GetOwnerLeaderboard();
        TEUIModelRef<FVM_CommissionLeaderboardPlayer> local_6;
        local_6.GetSelectedPlayer();
        return (local_6 == FEUIModelRef(this));
    }
    void OnClicked()
    {
        this.SelectPlayer(true);
        return;
    }
    void OnGamepadSelect()
    {
        this.SelectPlayer(false);
        return;
    }
    void SelectPlayer(const bool bShowTipsIfSelf)
    {
        if (!(this.IsValid()))
        {
            return;
        }
        if (this.GetPlayerModel().opArrow().IsLocalPlayer())
        {
            if (bShowTipsIfSelf)
            {
                FCommonTipsParam local_12;
                ::CommonPopup::WeakTips(NSLOCTEXT("CommissionLeaderboard", "CannotViewSelf", "ж— жі•жџҐзњ‹и‡Єиє«дїЎжЃЇ"), local_12);
            }
            return;
        }
        TEUIModelRef<FVM_CommissionLeaderboardPlayer> local_16 = TEUIModelRef<FVM_CommissionLeaderboardPlayer>(this);
        TEUIModelWeakRef<FVM_CommissionLeaderboard> local_14 = this.GetOwnerLeaderboard();
        local_16.SelectPlayer();
        return;
    }
    TEUIModelWeakRef<FVM_CommissionLeaderboard> GetOwnerLeaderboard() const property
    {
        this.TrackPropertyRead(0);
        return this.m_OwnerLeaderboard;
    }
    void SetOwnerLeaderboard(const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommissionLeaderboard> local_2;
        local_2 = this.m_OwnerLeaderboard;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OwnerLeaderboard = __Value;
        return;
    }
    TEUIModelRef<FM_CommissionLeaderboardEntry> GetEntryModel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_EntryModel;
    }
    void SetEntryModel(const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout __Value) property
    {
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_2;
        local_2 = this.m_EntryModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EntryModel = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetPlayerModel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_PlayerModel;
    }
    void SetPlayerModel(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_PlayerModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerModel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionLeaderboardItem
{
    UPROPERTY()
    FText CostTimeText;
    UPROPERTY()
    FDateTime FinishTime;
    UPROPERTY()
    FText FinishDateText;
    UPROPERTY()
    FText FinishTimeText;
    UPROPERTY()
    FText PlayerName;
    UPROPERTY()
    FSoftBrush PlayerIcon;
    UPROPERTY()
    bool IsTeam;
    UPROPERTY()
    int PlayerCount;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommissionLeaderboardPlayer>> PlayerList;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> FirstPlayer;
    UPROPERTY()
    int PlayerCountStyleIndex;
    UPROPERTY()
    int RankStyleIndex;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionLeaderboardItem> Self;


}

struct __GeneratedProperties_FVM_CommissionLeaderboardPlayer
{
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> PlayerBasicItem;
    UPROPERTY()
    bool IsValid;
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> Self;


}

namespace FVM_CommissionLeaderboardItem
{
FVM_CommissionLeaderboardItem& Create(const UObject ContextObject, const int Rank, const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout EntryModel, const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout OwnerLeaderboard)
{
    return FVM_CommissionLeaderboardItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Rank, EntryModel, OwnerLeaderboard);
}
FVM_CommissionLeaderboardItem CreateByManager(const UEUIManagerSubsystem Manager, const int Rank, const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout EntryModel, const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout OwnerLeaderboard)
{
    FVM_CommissionLeaderboardItem __r;
    TEUIModelRef<FVM_CommissionLeaderboardItem> local_6 = TEUIModelRef<FVM_CommissionLeaderboardItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionLeaderboardItem::ModelId, 0, Rank, EntryModel, OwnerLeaderboard));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Rank";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostTimeText";
    local_14.TypeName = "FText";
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
    local_14.PropertyName = "PlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommissionLeaderboardPlayer>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FirstPlayer";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionLeaderboardPlayer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerCountStyleIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RankStyleIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionLeaderboardItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionLeaderboardItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionLeaderboardItem;
}
int __UIGetter_Rank(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetRank();
}
FText __UIGetter_CostTimeText(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetCostTimeText();
}
FDateTime __UIGetter_FinishTime(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetFinishTime();
}
FText __UIGetter_FinishDateText(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetFinishDateText();
}
FText __UIGetter_FinishTimeText(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetFinishTimeText();
}
FText __UIGetter_PlayerName(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetPlayerName();
}
FSoftBrush __UIGetter_PlayerIcon(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetPlayerIcon();
}
bool __UIGetter_IsTeam(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetIsTeam();
}
int __UIGetter_PlayerCount(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetPlayerCount();
}
TArray<TEUIModelRef<FVM_CommissionLeaderboardPlayer>> __UIGetter_PlayerList(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetPlayerList();
}
TEUIModelRef<FVM_CommissionLeaderboardPlayer> __UIGetter_FirstPlayer(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetFirstPlayer();
}
int __UIGetter_PlayerCountStyleIndex(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetPlayerCountStyleIndex();
}
int __UIGetter_RankStyleIndex(const FVM_CommissionLeaderboardItem &inout Model)
{
    return Model.GetRankStyleIndex();
}
TEUIModelRef<FVM_CommissionLeaderboardItem> __UIGetter_Self(const FVM_CommissionLeaderboardItem &inout Model)
{
    return TEUIModelRef<FVM_CommissionLeaderboardItem>(Model);
}
int __IndexOf_Rank()
{
    return 0;
}
int __IndexOf_EntryModel()
{
    return 1;
}
int __IndexOf_OwnerLeaderboard()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommissionLeaderboardItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommissionLeaderboardPlayer
{
FVM_CommissionLeaderboardPlayer& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout OwnerLeaderboard, const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout EntryModel, const TEUIModelRef<FM_Player> &inout PlayerModel)
{
    return FVM_CommissionLeaderboardPlayer::CreateByManager(EUIInternal::GetContextManager(ContextObject), OwnerLeaderboard, EntryModel, PlayerModel);
}
FVM_CommissionLeaderboardPlayer CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_CommissionLeaderboard> &inout OwnerLeaderboard, const TEUIModelRef<FM_CommissionLeaderboardEntry> &inout EntryModel, const TEUIModelRef<FM_Player> &inout PlayerModel)
{
    FVM_CommissionLeaderboardPlayer __r;
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> local_6 = TEUIModelRef<FVM_CommissionLeaderboardPlayer>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionLeaderboardPlayer::ModelId, 0, OwnerLeaderboard, EntryModel, PlayerModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerBasicItem";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerBasicItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsValid";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionLeaderboardPlayer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionLeaderboardPlayer;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionLeaderboardPlayer;
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_PlayerBasicItem(const FVM_CommissionLeaderboardPlayer &inout Model)
{
    return Model.GetPlayerBasicItem();
}
bool __UIGetter_IsValid(const FVM_CommissionLeaderboardPlayer &inout Model)
{
    return Model.IsValid();
}
bool __UIGetter_IsSelected(const FVM_CommissionLeaderboardPlayer &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_CommissionLeaderboardPlayer> __UIGetter_Self(const FVM_CommissionLeaderboardPlayer &inout Model)
{
    return TEUIModelRef<FVM_CommissionLeaderboardPlayer>(Model);
}
int __IndexOf_OwnerLeaderboard()
{
    return 0;
}
int __IndexOf_EntryModel()
{
    return 1;
}
int __IndexOf_PlayerModel()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommissionLeaderboardPlayer
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
