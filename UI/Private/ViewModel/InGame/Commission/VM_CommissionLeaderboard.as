
namespace FVM_CommissionLeaderboard
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnCommissionDropdownSelected = FEUIModelCallbackSignature();

}
struct FVM_CommissionLeaderboard : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_CommissionDropdown;
    UPROPERTY()
    TArray<FEUIModelContainer> m_LeaderboardItems;
    UPROPERTY()
    bool m_bIsLoading;
    UPROPERTY()
    bool m_bIsEmpty;
    UPROPERTY()
    int m_TotalCount;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> m_CommissionConfig;
    UPROPERTY()
    TArray<TDataObjectPtr<FCommissionConfig>> m_AllCommissionConfigs;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDesc> m_LeaderboardHoverTitleAndDesc;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> m_SelectedPlayer;
    UPROPERTY()
    bool m_bDefaultSelectionApplied;

    FVM_CommissionLeaderboard()
    {
        this.m_bIsLoading = false;
        this.m_bIsEmpty = false;
        this.m_TotalCount = 0;
        this.m_bDefaultSelectionApplied = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.InitDropdown(TDataObjectPtr<FCommissionConfig>());
        return;
    }
    FVM_CommissionLeaderboard(const FVM_CommissionLeaderboard &inout Other)
    {
        this.m_bIsLoading = false;
        this.m_bIsEmpty = false;
        this.m_TotalCount = 0;
        this.m_bDefaultSelectionApplied = false;
        this.m_CommissionDropdown = Other.m_CommissionDropdown;
        this.m_LeaderboardItems = Other.m_LeaderboardItems;
        this.m_bIsLoading = Other.m_bIsLoading;
        this.m_bIsEmpty = Other.m_bIsEmpty;
        this.m_TotalCount = int(Other.m_TotalCount);
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_AllCommissionConfigs = Other.m_AllCommissionConfigs;
        this.m_LeaderboardHoverTitleAndDesc = Other.m_LeaderboardHoverTitleAndDesc;
        this.m_SelectedPlayer = Other.m_SelectedPlayer;
        this.m_bDefaultSelectionApplied = Other.m_bDefaultSelectionApplied;
        return;
    }
    FVM_CommissionLeaderboard(const TDataObjectPtr<FCommissionConfig> &inout InCommissionConfig)
    {
        this.m_bIsLoading = false;
        this.m_bIsEmpty = false;
        this.m_TotalCount = 0;
        this.m_bDefaultSelectionApplied = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.InitDropdown(InCommissionConfig);
        return;
    }
    FVM_CommissionLeaderboard opAssign(const FVM_CommissionLeaderboard &inout Other)
    {
        FVM_CommissionLeaderboard __r;
        this.m_CommissionDropdown = Other.m_CommissionDropdown;
        this.m_LeaderboardItems = Other.m_LeaderboardItems;
        this.m_bIsLoading = Other.m_bIsLoading;
        this.m_bIsEmpty = Other.m_bIsEmpty;
        this.m_TotalCount = int(Other.m_TotalCount);
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_AllCommissionConfigs = Other.m_AllCommissionConfigs;
        this.m_LeaderboardHoverTitleAndDesc = Other.m_LeaderboardHoverTitleAndDesc;
        this.m_SelectedPlayer = Other.m_SelectedPlayer;
        this.m_bDefaultSelectionApplied = Other.m_bDefaultSelectionApplied;
        return __r;
    }
    void PostConstruct()
    {
        const UCommissionSettings local_2;
        GetGameplaySettings<UCommissionSettings> local_4;
        local_2 = local_4;
        this.SetLeaderboardHoverTitleAndDesc(TEUIModelRef<FVM_TitleAndDesc>(::FVM_TitleAndDesc::Create(this.GetManager(), local_2.RaceCommissionLeaderboardHoverTitle, local_2.RaceCommissionLeaderboardHoverDesc)));
        return;
    }
    TEUIModelRef<FVM_CommissionMyRank> GetMyRank() const
    {
        FVM_CommissionMyRank& local_4 = ::FVM_CommissionMyRank::Create(this.GetManager(), this.GetCommissionConfig());
        local_4.SetLeaderboardViewModel(TEUIModelWeakRef<FVM_CommissionLeaderboard>(this));
        return TEUIModelRef<FVM_CommissionMyRank>(local_4);
    }
    void RefreshLeaderBoard()
    {
        if (!(this.GetCommissionConfig()))
        {
            return;
        }
        this.SetbIsLoading(true);
        ::FMS_CommissionLeaderboardManager::Get(this.GetManager()).RequestLeaderboard(this.GetCommissionConfig());
        return;
    }
    void OnLeaderboardUpdated(const FMsg_CommissionLeaderboardUpdated &inout Msg)
    {
        if (0 != 0)
        {
            return;
        }
        TEUIModelRef<FM_CommissionLeaderboard> local_6 = ::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager).GetOrCreateLeaderboard(this.GetCommissionConfig());
        if (!(local_6.IsValid()))
        {
            return;
        }
        FM_CommissionLeaderboard local_10;
        this.SetbIsLoading(local_10.GetbIsLoading());
        this.SetTotalCount(local_10.GetTotalCount());
        this.GetModify_LeaderboardItems().Empty(local_10.GetEntryList().Num());
        for (auto& local_26 : local_10.GetEntryList())
        {
            if (!(local_26.IsValid()))
            {
                continue;
            }
            FCommissionLeaderboardItemData local_32;
            local_32.Rank = GetRank();
            local_32.EntryModel = local_26;
            local_32.OwnerLeaderboard = TEUIModelWeakRef<FVM_CommissionLeaderboard>(this);
            FEUIModelContainer::MakeCached<FCommissionLeaderboardItemData> local_48;
            this.GetModify_LeaderboardItems().Add(local_48.opImplConv());
        }
        this.SetbIsEmpty((this.GetLeaderboardItems().Num() == 0));
        if (!(this.GetbDefaultSelectionApplied()))
        {
            this.ApplyDefaultSelection(local_6);
        }
        return;
    }
    void OnCommissionDropdownSelected(const int SelectedIndex)
    {
        if (this.GetAllCommissionConfigs().IsValidIndex(SelectedIndex))
        {
            this.SetCommissionConfig(this.GetAllCommissionConfigs()[SelectedIndex]);
            this.SetbDefaultSelectionApplied(false);
            this.SetSelectedPlayer(TEUIModelRef<FVM_CommissionLeaderboardPlayer>());
        }
        return;
    }
    void SelectPlayer(const TEUIModelRef<FVM_CommissionLeaderboardPlayer> &inout InPlayerVM)
    {
        if (!(InPlayerVM.IsValid()))
        {
            return;
        }
        this.SetSelectedPlayer(InPlayerVM);
        TEUIModelRef<FM_Player> local_6;
        local_6.GetPlayerModel();
        TEUIModelRef<FM_Player> local_4;
        if (local_4.IsValid())
        {
            ::FVM_SocialViewPage::SetupPage(this.GetManager(), local_4, ESocialViewPageOpenType(8), 0);
        }
        return;
    }
    void InitDropdown(const TDataObjectPtr<FCommissionConfig> &inout SelectedCommissionConfig)
    {
        int local_1 = 0;
        TArray<FEUIModelContainer> local_6;
        TDataObjectIterator<FRaceCommissionConfig> local_22;
        for (; local_22; )
        {
            if ((local_22.GetDataPtr() == SelectedCommissionConfig.opImplConv()))
            {
                local_1 = local_6.Num();
            }
            TDataObjectPtr<FCommissionConfig> local_96;
            this.GetModify_AllCommissionConfigs().Add(local_96);
            UEUIManagerSubsystem local_98 = this.GetManager();
            local_6.Add(FEUIModelContainer());
            local_22.Next();
        }
        FOnCommonDropdownSelected local_134;
        local_134.Add(this, FVM_CommissionLeaderboard::OnCommissionDropdownSelected);
        this.SetCommissionDropdown(TEUIModelRef<FVM_CommonDropdown>(::FVM_CommonDropdown::Create(this.GetManager(), local_6, FCommonDropdownDefaultOption(local_1), local_134)));
        if (this.GetAllCommissionConfigs().IsValidIndex(local_1))
        {
            this.SetCommissionConfig(this.GetAllCommissionConfigs()[local_1]);
        }
        return;
    }
    void ApplyDefaultSelection(const TEUIModelRef<FM_CommissionLeaderboard> &inout LeaderboardRef)
    {
        FM_CommissionLeaderboard& local_4;
        if (!(LeaderboardRef.IsValid()))
        {
            return;
        }
        int local_5 = 0;
        if (::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().IsValid())
        {
            local_5 = GetPlayerUid();
        }
        for (auto& local_26 : local_4.GetEntryList())
        {
            if (!(local_26.IsValid()))
            {
                continue;
            }
            for (auto& local_40 : GetPlayerList())
            {
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                if (local_5 != 0 && (GetPlayerUid() == local_5))
                {
                    continue;
                }
                TEUIModelRef<FVM_CommissionLeaderboardPlayer> local_44 = TEUIModelRef<FVM_CommissionLeaderboardPlayer>(::FVM_CommissionLeaderboardPlayer::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_CommissionLeaderboard>(this)), local_26, local_40));
                this.SelectPlayer(local_44);
                this.SetbDefaultSelectionApplied(true);
                return;
            }
        }
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetCommissionDropdown() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommissionDropdown;
    }
    void SetCommissionDropdown(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_CommissionDropdown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionDropdown = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetLeaderboardItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_LeaderboardItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetLeaderboardItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LeaderboardItems = __Value;
        return;
    }
    bool GetbIsLoading() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsLoading;
    }
    void SetbIsLoading(const bool __Value) property
    {
        if (!(this.m_bIsLoading) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsLoading = __Value;
        return;
    }
    bool GetbIsEmpty() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsEmpty;
    }
    void SetbIsEmpty(const bool __Value) property
    {
        if (!(this.m_bIsEmpty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsEmpty = __Value;
        return;
    }
    int GetTotalCount() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TotalCount;
    }
    void SetTotalCount(const int __Value) property
    {
        if (this.m_TotalCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TotalCount = __Value;
        return;
    }
    TDataObjectPtr<FCommissionConfig> GetCommissionConfig() const property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TDataObjectPtr<FCommissionConfig> GetModify_CommissionConfig() property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CommissionConfig = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FCommissionConfig>> GetAllCommissionConfigs() const property
    {
        const TArray<TDataObjectPtr<FCommissionConfig>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TDataObjectPtr<FCommissionConfig>> GetModify_AllCommissionConfigs() property
    {
        TArray<TDataObjectPtr<FCommissionConfig>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetAllCommissionConfigs(const TArray<TDataObjectPtr<FCommissionConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AllCommissionConfigs = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDesc> GetLeaderboardHoverTitleAndDesc() const property
    {
        this.TrackPropertyRead(7);
        return this.m_LeaderboardHoverTitleAndDesc;
    }
    void SetLeaderboardHoverTitleAndDesc(const TEUIModelRef<FVM_TitleAndDesc> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDesc> local_2;
        local_2 = this.m_LeaderboardHoverTitleAndDesc;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LeaderboardHoverTitleAndDesc = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionLeaderboardPlayer> GetSelectedPlayer() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SelectedPlayer;
    }
    void SetSelectedPlayer(const TEUIModelRef<FVM_CommissionLeaderboardPlayer> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionLeaderboardPlayer> local_2;
        local_2 = this.m_SelectedPlayer;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SelectedPlayer = __Value;
        return;
    }
    bool GetbDefaultSelectionApplied() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bDefaultSelectionApplied;
    }
    void SetbDefaultSelectionApplied(const bool __Value) property
    {
        if (!(this.m_bDefaultSelectionApplied) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bDefaultSelectionApplied = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionLeaderboard
{
    UPROPERTY()
    TEUIModelRef<FVM_CommissionMyRank> MyRank;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionLeaderboard> Self;

    __GeneratedProperties_FVM_CommissionLeaderboard()
    {
        return;
    }
}

namespace FVM_CommissionLeaderboard
{
FVM_CommissionLeaderboard& Create(const UObject ContextObject)
{
    return FVM_CommissionLeaderboard::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommissionLeaderboard CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommissionLeaderboard __r;
    TEUIModelRef<FVM_CommissionLeaderboard> local_6 = TEUIModelRef<FVM_CommissionLeaderboard>(EUIInternal::MakeModelWithManager(Manager, FVM_CommissionLeaderboard::ModelId));
    return __r;
}
FVM_CommissionLeaderboard& Create(const UObject ContextObject, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    return FVM_CommissionLeaderboard::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionConfig);
}
FVM_CommissionLeaderboard CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    FVM_CommissionLeaderboard __r;
    TEUIModelRef<FVM_CommissionLeaderboard> local_6 = TEUIModelRef<FVM_CommissionLeaderboard>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionLeaderboard::ModelId, 0, CommissionConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommissionDropdown";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeaderboardItems";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsLoading";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TotalCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeaderboardHoverTitleAndDesc";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedPlayer";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionLeaderboardPlayer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MyRank";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionMyRank>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionLeaderboard>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionLeaderboard;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshLeaderBoard";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMsgHandleDefine local_30;
    local_30.FunctionName = "__OnLeaderboardUpdated";
    local_30.MessageTypeName = "Msg_CommissionLeaderboardUpdated";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionLeaderboard;
}
void __OnLeaderboardUpdated(FVM_CommissionLeaderboard &inout Model, const FMsg_CommissionLeaderboardUpdated &inout Message)
{
    Model.OnLeaderboardUpdated(Message);
    return;
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_CommissionDropdown(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetCommissionDropdown();
}
TArray<FEUIModelContainer> __UIGetter_LeaderboardItems(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetLeaderboardItems();
}
bool __UIGetter_bIsLoading(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetbIsLoading();
}
bool __UIGetter_bIsEmpty(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetbIsEmpty();
}
int __UIGetter_TotalCount(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetTotalCount();
}
TEUIModelRef<FVM_TitleAndDesc> __UIGetter_LeaderboardHoverTitleAndDesc(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetLeaderboardHoverTitleAndDesc();
}
TEUIModelRef<FVM_CommissionLeaderboardPlayer> __UIGetter_SelectedPlayer(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetSelectedPlayer();
}
TEUIModelRef<FVM_CommissionMyRank> __UIGetter_MyRank(const FVM_CommissionLeaderboard &inout Model)
{
    return Model.GetMyRank();
}
TEUIModelRef<FVM_CommissionLeaderboard> __UIGetter_Self(const FVM_CommissionLeaderboard &inout Model)
{
    return TEUIModelRef<FVM_CommissionLeaderboard>(Model);
}
int __IndexOf_CommissionDropdown()
{
    return 0;
}
int __IndexOf_LeaderboardItems()
{
    return 1;
}
int __IndexOf_bIsLoading()
{
    return 2;
}
int __IndexOf_bIsEmpty()
{
    return 3;
}
int __IndexOf_TotalCount()
{
    return 4;
}
int __IndexOf_CommissionConfig()
{
    return 5;
}
int __IndexOf_AllCommissionConfigs()
{
    return 6;
}
int __IndexOf_LeaderboardHoverTitleAndDesc()
{
    return 7;
}
int __IndexOf_SelectedPlayer()
{
    return 8;
}
int __IndexOf_bDefaultSelectionApplied()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_CommissionLeaderboard
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
