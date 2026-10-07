
namespace FVM_MissionMainPanel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetSelectedTabIndex = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnTrackButtonClicked = FEUIModelCallbackSignature();

}
struct FMissionTabInfo
{
    UPROPERTY()
    FText TabTittle;
    UPROPERTY()
    FSoftBrush TabIcon;
    UPROPERTY()
    FSoftBrush HeaderBrush;

    FMissionTabInfo()
    {
        return;
    }
}

struct FVM_MissionMainPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TMap<EMissionTabType, FMissionTabInfo> m_MissionTabConfigMap;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_SingleMissionEntryWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_ChapterMissionEntryWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_ChapterEntryWidgetClass;
    UPROPERTY()
    FText m_RecommendLevelWarningFormat;
    UPROPERTY()
    TArray<FEUIModelContainer> m_TabListItems;
    UPROPERTY()
    FEUIModelContainer m_SelectedTabItem;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SelectableItem>> m_TabSelectableItems;
    UPROPERTY()
    TArray<EMissionTabType> m_TabTypes;
    UPROPERTY()
    int m_CurrentTabIndex;
    UPROPERTY()
    TEUIModelRef<FVM_MissionList> m_MissionList;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionDetail> m_CommissionDetail;
    UPROPERTY()
    bool m_bShowTrackingButton;
    UPROPERTY()
    bool m_bIsSelectedMissionTracked;
    UPROPERTY()
    bool m_bIsChapterEntryHighlighted;
    UPROPERTY()
    bool m_bIsHighlightedChapterExpanded;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> m_DefaultSelectMission;

    FVM_MissionMainPanel()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MissionMainPanel(const FVM_MissionMainPanel &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MissionMainPanel& opAssign(const FVM_MissionMainPanel &inout Other)
    {
        this.m_MissionTabConfigMap = Other.m_MissionTabConfigMap;
        this.m_SingleMissionEntryWidgetClass = Other.m_SingleMissionEntryWidgetClass;
        this.m_ChapterMissionEntryWidgetClass = Other.m_ChapterMissionEntryWidgetClass;
        this.m_ChapterEntryWidgetClass = Other.m_ChapterEntryWidgetClass;
        this.m_RecommendLevelWarningFormat = Other.m_RecommendLevelWarningFormat;
        this.m_TabListItems = Other.m_TabListItems;
        this.m_SelectedTabItem = Other.m_SelectedTabItem;
        this.m_TabSelectableItems = Other.m_TabSelectableItems;
        this.m_TabTypes = Other.m_TabTypes;
        this.m_CurrentTabIndex = int(Other.m_CurrentTabIndex);
        this.m_MissionList = Other.m_MissionList;
        this.m_CommissionDetail = Other.m_CommissionDetail;
        this.m_bShowTrackingButton = Other.m_bShowTrackingButton;
        this.m_bIsSelectedMissionTracked = Other.m_bIsSelectedMissionTracked;
        this.m_bIsChapterEntryHighlighted = Other.m_bIsChapterEntryHighlighted;
        this.m_bIsHighlightedChapterExpanded = Other.m_bIsHighlightedChapterExpanded;
        return Other.m_DefaultSelectMission;
    }
    void LoadConfig(const FConfigVM_MissionMainPanel &inout InConfig)
    {
        this.SetSingleMissionEntryWidgetClass(InConfig.SingleMissionEntryWidgetClass);
        this.SetChapterMissionEntryWidgetClass(InConfig.ChapterMissionEntryWidgetClass);
        this.SetChapterEntryWidgetClass(InConfig.ChapterEntryWidgetClass);
        this.SetRecommendLevelWarningFormat(InConfig.RecommendLevelWarningFormat);
        this.SetMissionTabConfigMap(InConfig.MissionTabConfigMap);
        return;
    }
    void PostLoad()
    {
        this.InitTabEntries();
        this.InitMissionList();
        this.InitDefaultSelection();
        return;
    }
    bool IsCommissionTabSelected() const
    {
        return this.GetTabTypes().IsValidIndex(this.GetCurrentTabIndex()) && (int(this.GetTabTypes()[this.GetCurrentTabIndex()]) == 0);
    }
    bool IsTabTypeSelected(const EMissionTabType TabType) const
    {
        return this.GetTabTypes().IsValidIndex(this.GetCurrentTabIndex()) && (int(this.GetTabTypes()[this.GetCurrentTabIndex()]) == int(TabType));
    }
    bool ShowMissionButtons() const
    {
        if (!(this.GetTabTypes().IsValidIndex(this.GetCurrentTabIndex())))
        {
            return false;
        }
        if (int(this.GetTabTypes()[this.GetCurrentTabIndex()]) == 0)
        {
            return false;
        }
        TEUIModelRef<FVM_MissionList> local_6 = this.GetMissionList();
        return HasSelectedMission();
    }
    void OnHighlightedEntryChanged()
    {
        TEUIModelRef<FVM_MissionList> local_2 = this.GetMissionList();
        TEUIModelRef<FVM_MissionListEntry> local_6;
        local_6.GetHighlightedEntry();
        TEUIModelRef<FVM_MissionListEntry> local_4;
        this.SetbIsChapterEntryHighlighted(local_4.IsValid() && local_4.opArrow().IsChapterEntry());
        this.SetbIsHighlightedChapterExpanded(this.GetbIsChapterEntryHighlighted() && local_4.opArrow().GetbShowChapterMission());
        return;
    }
    void OnSelectedMissionEntryChanged()
    {
        bool local_9;
        TEUIModelRef<FVM_MissionList> local_2 = this.GetMissionList();
        TEUIModelRef<FVM_MissionListEntry> local_6;
        local_6.GetSelectedMissionEntry();
        TEUIModelRef<FVM_MissionListEntry> local_4;
        if (local_4.IsValid())
        {
            local_9 = GetbIsTracking();
        }
        else
        {
            local_9 = false;
        }
        this.SetbIsSelectedMissionTracked(local_9);
        return;
    }
    void OnShowTrackingButtonChanged()
    {
        if (this.GetMissionList())
        {
            TEUIModelRef<FVM_MissionList> local_2 = this.GetMissionList();
            this.SetbShowTrackingButton(GetbShowTrackingButton());
        }
        return;
    }
    void OnTrackingMissionChanged(const FC_TrackingMission &inout TrackingMission)
    {
        TEUIModelRef<FVM_MissionListEntry> local_26;
        TEUIModelRef<FVM_MissionList> local_2 = this.GetMissionList();
        for (auto& local_18 : GetMissionEntries())
        {
            if (::MissionUtils::IsMissionTracking(this.GetContext().GetLocalPlayer(), GetMissionConfig()))
            {
                true.SetbIsTracking();
            }
            else
            {
                if (GetbIsTracking())
                {
                    false.SetbIsTracking();
                }
            }
            TEUIModelRef<FVM_MissionList> local_24 = this.GetMissionList();
            local_26.GetSelectedMissionEntry();
            if ((local_18 == local_26.opImplConv()))
            {
                this.SetbIsSelectedMissionTracked(GetbIsTracking());
            }
        }
        TEUIModelRef<FVM_MissionList> local_24_2 = this.GetMissionList();
        RefreshAllDistanceInfo();
        return;
    }
    void SetSelectedTabIndex(const int Index)
    {
        if (!(this.GetTabListItems().IsValidIndex(Index)))
        {
            XWarning(ELog(16), FString().Append("Invalid tab entry index: ").Append(Index));
            return;
        }
        if (Index == this.GetCurrentTabIndex())
        {
            return;
        }
        this.SetCurrentTabIndex(Index);
        this.RefreshSelectedTabItem();
        this.RefreshTabSelection();
        TEUIModelRef<FVM_MissionList> local_10 = this.GetMissionList();
        this.GetTabTypes()[Index].UpdateMissionList(true);
        return;
    }
    void RefreshSelectedTabItem()
    {
        FEUIModelContainer local_30;
        if (this.GetTabListItems().IsValidIndex(this.GetCurrentTabIndex()))
        {
            local_30 = this.GetTabListItems()[this.GetCurrentTabIndex()];
        }
        else
        {
            local_30 = FEUIModelContainer();
        }
        this.SetSelectedTabItem(local_30);
        return;
    }
    void RefreshTabSelection()
    {
        int local_1 = 0;
        for (; local_1 < this.GetTabSelectableItems().Num(); ++local_1)
        {
            if (this.GetTabSelectableItems()[local_1].IsValid())
            {
                (local_1 == this.GetCurrentTabIndex()).SetbIsSelected();
            }
        }
        return;
    }
    void OnTrackButtonClicked()
    {
        TEUIModelRef<FVM_MissionList> local_2 = this.GetMissionList();
        TEUIModelRef<FVM_MissionListEntry> local_6;
        local_6.GetSelectedMissionEntry();
        TEUIModelRef<FVM_MissionListEntry> local_4;
        if (!(local_4.IsValid()))
        {
            return;
        }
        FFPTime local_18 = FFPTime(-1);
        FECSEntity local_12 = this.GetContext().GetLocalPlayer();
        FCE_MissionRequestToggleTrack local_22;
        local_22.MissionConfig = GetMissionConfig();
        local_22.bIsTracking = !(GetbIsTracking());
        return;
    }
    void AddTabEntry(const EMissionTabType TabType)
    {
        FMissionTabInfo local_92;
        if (!(this.GetMissionTabConfigMap().Find(TabType, local_92)))
        {
            XError(ELog(16), FString().Append("MissionTabConfig not found for TabType: ").Append(TabType));
        }
        FVM_SelectableItem& local_104 = ::FVM_SelectableItem::Create(this.GetContext().Manager);
        local_104.SetbIsSelected((this.GetTabListItems().Num() == this.GetCurrentTabIndex()));
        FVM_CommonTabItem& local_106 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
        local_106.SetTitleText(local_92.TabTittle);
        FEUIModelContainer local_120;
        FEUIModelRef local_122 = FEUIModelRef(local_104);
        local_120.AddModel(local_122, false);
        if (!(local_92.TabIcon.GetResourceObject().IsNull()))
        {
            local_120.AddModel(local_122, false);
        }
        local_120.AddModel(FEUIModelRef(local_106), false);
        this.AddTabRedDot(local_120, EMissionTabType(TabType));
        this.GetModify_TabTypes().Add(TabType);
        this.GetModify_TabSelectableItems().Add(TEUIModelRef<FVM_SelectableItem>(local_104));
        this.GetModify_TabListItems().Add(local_120);
        return;
    }
    void AddTabRedDot(FEUIModelContainer &inout TabContainer, const EMissionTabType TabType)
    {
        if (int(TabType) == 2)
        {
            FEUIModelRef local_12;
            FRedDotNodeData local_8 = FRedDotNodeData(GameplayTags::RedDotSystem_Mission_NewMainMissionTab, 0);
            TabContainer.AddModel(local_12, false);
            return;
        }
        if (int(TabType) == 3)
        {
            FEUIModelRef local_12;
            FRedDotNodeData local_8_2 = FRedDotNodeData(GameplayTags::RedDotSystem_Mission_NewSideMissionTab, 0);
            TabContainer.AddModel(local_12, false);
        }
        return;
    }
    void InitTabEntries()
    {
        TDataObjectPtr<FCommissionConfig> local_24 = ::CommissionUtils::GetCurrentCommissionConfig();
        if (local_24)
        {
            if (local_24.IsSet())
            {
                this.AddTabEntry(EMissionTabType(0));
                this.InitCommissionDetailTab(local_24);
            }
        }
        this.AddTabEntry(EMissionTabType(1));
        this.AddTabEntry(EMissionTabType(2));
        this.AddTabEntry(EMissionTabType(3));
        return;
    }
    int GetTabIndex(const EMissionTabType TabType)
    {
        int local_1 = 0;
        for (; local_1 < this.GetTabTypes().Num(); ++local_1)
        {
            if (int(this.GetTabTypes()[local_1]) == int(TabType))
            {
                return local_1;
            }
        }
        return -1;
    }
    void InitDefaultSelection()
    {
        int local_2 = 0;
        if (this.GetDefaultSelectMission().IsSet())
        {
            int local_6 = this.GetTabIndex(::MissionUtils::MissionTypeToTabType(EMissionType(local_2)));
            if (local_6 != -1)
            {
                this.SetSelectedTabIndex(local_6);
                TEUIModelRef<FVM_MissionList> local_8 = this.GetMissionList();
                this.GetDefaultSelectMission().SelectMission();
                return;
            }
        }
        if (this.GetTabListItems().Num() > 0)
        {
            this.SetSelectedTabIndex(0);
        }
        return;
    }
    bool IsHidedByMissionPresentationRule(const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TDataObjectPtr<FMissionPhaseConfig> &inout ActivePhaseConfig)
    {
        int local_97;
        EMissionHideType local_98;
        TDataObjectPtr<FMissionPhaseConfig> local_24 = GetFirstPhase();
        if (::MissionUtils::GetMissionPresentationRuleConfig(MissionConfig).IsSet())
        {
            EMissionHideType local_99;
            local_98 = local_99;
        }
        else
        {
            local_98 = EMissionHideType(0);
        }
        int local_101 = int(local_98);
        if (local_101 <= 2)
        {
            if (local_101 != 1)
            {
                if (local_101 != 2)
                {
                }
            }
            else
            {
                if (!(ActivePhaseConfig.IsSet()))
                {
                    local_97 = 0;
                }
                else
                {
                    local_97 = (0 == 0);
                }
                return (local_97 != 0);
            }
        }
        return false;
    }
    void InitMissionList()
    {
        this.SetMissionList(TEUIModelRef<FVM_MissionList>(::FVM_MissionList::Create(this.GetContext().Manager)));
        this.GetMissionList().opArrow().SetRecommendLevelWarningFormat(this.GetRecommendLevelWarningFormat());
        this.GetMissionList().opArrow().SetSelectedMissionInfo(TEUIModelRef<FVM_MissionDetailInfo>(::FVM_MissionDetailInfo::Create(this.GetContext().Manager)));
        TArray<FMissionDetail> local_16 = ::MissionUtils::GetAllMissionDetails(this.GetContext().GetLocalPlayer());
        for (auto& local_32 : local_16)
        {
            TDataObjectPtr<FMissionConfig> local_56 = local_32.GetMissionConfig();
            int local_82 = int(::MissionUtils::MissionTypeToTabType(local_56.opArrow().MissionType));
            if (!(this.GetMissionTabConfigMap().Contains(EMissionTabType(local_82))))
            {
                XWarning(ELog(16), FString().Append("MissionTabConfigMap not found for MissionTabType: ").Append(local_82));
                continue;
            }
            if (this.IsHidedByMissionPresentationRule(local_56, local_32.GetActivePhaseConfig()))
            {
                continue;
            }
            FText local_94 = FText(this.GetMissionTabConfigMap()[EMissionTabType(local_82)].TabTittle);
            FSoftBrush local_140 = FSoftBrush(this.GetMissionTabConfigMap()[EMissionTabType(local_82)].HeaderBrush);
            TSoftClassPtr<UEUIUserWidget> local_170;
            if (local_56.opArrow().GetBelongChapter().IsSet())
            {
                local_170 = this.GetChapterMissionEntryWidgetClass();
            }
            else
            {
                local_170 = this.GetSingleMissionEntryWidgetClass();
            }
            TSoftClassPtr<UEUIUserWidget> local_180 = this.GetChapterEntryWidgetClass();
            TEUIModelRef<FVM_MissionList> local_2 = this.GetMissionList();
        }
        TEUIModelRef<FVM_MissionList> local_2_2 = this.GetMissionList();
        SortMissionEntriesAndResetShowCategory();
        return;
    }
    void InitCommissionDetailTab(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
    {
        this.SetCommissionDetail(TEUIModelRef<FVM_CommissionDetail>(::FVM_CommissionDetail::Create(this.GetContext().Manager, CommissionConfig)));
        return;
    }
    const TMap<EMissionTabType, FMissionTabInfo> GetMissionTabConfigMap() const property
    {
        const TMap<EMissionTabType, FMissionTabInfo> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<EMissionTabType, FMissionTabInfo> GetModify_MissionTabConfigMap() property
    {
        TMap<EMissionTabType, FMissionTabInfo> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMissionTabConfigMap(const TMap<EMissionTabType, FMissionTabInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MissionTabConfigMap = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetSingleMissionEntryWidgetClass() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SingleMissionEntryWidgetClass;
    }
    void SetSingleMissionEntryWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_SingleMissionEntryWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SingleMissionEntryWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetChapterMissionEntryWidgetClass() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ChapterMissionEntryWidgetClass;
    }
    void SetChapterMissionEntryWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_ChapterMissionEntryWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChapterMissionEntryWidgetClass = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetChapterEntryWidgetClass() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ChapterEntryWidgetClass;
    }
    void SetChapterEntryWidgetClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_ChapterEntryWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ChapterEntryWidgetClass = __Value;
        return;
    }
    const FText GetRecommendLevelWarningFormat() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_RecommendLevelWarningFormat() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetRecommendLevelWarningFormat(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RecommendLevelWarningFormat = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetTabListItems() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_TabListItems() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTabListItems(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TabListItems = __Value;
        return;
    }
    const FEUIModelContainer GetSelectedTabItem() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedTabItem() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetSelectedTabItem(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectedTabItem = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SelectableItem>> GetTabSelectableItems() const property
    {
        const TArray<TEUIModelRef<FVM_SelectableItem>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SelectableItem>> GetModify_TabSelectableItems() property
    {
        TArray<TEUIModelRef<FVM_SelectableItem>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetTabSelectableItems(const TArray<TEUIModelRef<FVM_SelectableItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_TabSelectableItems = __Value;
        return;
    }
    const TArray<EMissionTabType> GetTabTypes() const property
    {
        const TArray<EMissionTabType> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<EMissionTabType> GetModify_TabTypes() property
    {
        TArray<EMissionTabType> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetTabTypes(const TArray<EMissionTabType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_TabTypes = __Value;
        return;
    }
    int GetCurrentTabIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_CurrentTabIndex;
    }
    void SetCurrentTabIndex(const int __Value) property
    {
        if (this.m_CurrentTabIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CurrentTabIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_MissionList> GetMissionList() const property
    {
        this.TrackPropertyRead(10);
        return this.m_MissionList;
    }
    void SetMissionList(const TEUIModelRef<FVM_MissionList> &inout __Value) property
    {
        TEUIModelRef<FVM_MissionList> local_2;
        local_2 = this.m_MissionList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_MissionList = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionDetail> GetCommissionDetail() const property
    {
        this.TrackPropertyRead(11);
        return this.m_CommissionDetail;
    }
    void SetCommissionDetail(const TEUIModelRef<FVM_CommissionDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionDetail> local_2;
        local_2 = this.m_CommissionDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CommissionDetail = __Value;
        return;
    }
    bool GetbShowTrackingButton() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bShowTrackingButton;
    }
    void SetbShowTrackingButton(const bool __Value) property
    {
        if (!(this.m_bShowTrackingButton) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bShowTrackingButton = __Value;
        return;
    }
    bool GetbIsSelectedMissionTracked() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bIsSelectedMissionTracked;
    }
    void SetbIsSelectedMissionTracked(const bool __Value) property
    {
        if (!(this.m_bIsSelectedMissionTracked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bIsSelectedMissionTracked = __Value;
        return;
    }
    bool GetbIsChapterEntryHighlighted() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bIsChapterEntryHighlighted;
    }
    void SetbIsChapterEntryHighlighted(const bool __Value) property
    {
        if (!(this.m_bIsChapterEntryHighlighted) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bIsChapterEntryHighlighted = __Value;
        return;
    }
    bool GetbIsHighlightedChapterExpanded() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bIsHighlightedChapterExpanded;
    }
    void SetbIsHighlightedChapterExpanded(const bool __Value) property
    {
        if (!(this.m_bIsHighlightedChapterExpanded) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bIsHighlightedChapterExpanded = __Value;
        return;
    }
    const TDataObjectPtr<FMissionConfig> GetDefaultSelectMission() const property
    {
        const TDataObjectPtr<FMissionConfig> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TDataObjectPtr<FMissionConfig> GetModify_DefaultSelectMission() property
    {
        TDataObjectPtr<FMissionConfig> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetDefaultSelectMission(const TDataObjectPtr<FMissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_DefaultSelectMission = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionMainPanel
{
    UPROPERTY()
    bool IsCommissionTabSelected;
    UPROPERTY()
    bool ShowMissionButtons;
    UPROPERTY()
    TEUIModelRef<FVM_MissionMainPanel> Self;


}

namespace FVM_MissionMainPanel
{
FVM_MissionMainPanel& Create(const UObject ContextObject)
{
    return FVM_MissionMainPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MissionMainPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MissionMainPanel __r;
    TEUIModelRef<FVM_MissionMainPanel> local_6 = TEUIModelRef<FVM_MissionMainPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_MissionMainPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionMainPanel;
}
void __OnHighlightedEntryChanged(FVM_MissionMainPanel &inout Model)
{
    Model.OnHighlightedEntryChanged();
    return;
}
void __OnSelectedMissionEntryChanged(FVM_MissionMainPanel &inout Model)
{
    Model.OnSelectedMissionEntryChanged();
    return;
}
void __OnShowTrackingButtonChanged(FVM_MissionMainPanel &inout Model)
{
    Model.OnShowTrackingButtonChanged();
    return;
}
void __OnTrackingMissionChanged(FVM_MissionMainPanel &inout Model, const FECSEntity &inout Entity, const FC_TrackingMission &inout Component)
{
    Model.OnTrackingMissionChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEUIModelContainer> __UIGetter_TabListItems(const FVM_MissionMainPanel &inout Model)
{
    return Model.GetTabListItems();
}
FEUIModelContainer __UIGetter_SelectedTabItem(const FVM_MissionMainPanel &inout Model)
{
    return Model.GetSelectedTabItem();
}
TEUIModelRef<FVM_MissionList> __UIGetter_MissionList(const FVM_MissionMainPanel &inout Model)
{
    return Model.GetMissionList();
}
TEUIModelRef<FVM_CommissionDetail> __UIGetter_CommissionDetail(const FVM_MissionMainPanel &inout Model)
{
    return Model.GetCommissionDetail();
}
bool __UIGetter_bIsSelectedMissionTracked(const FVM_MissionMainPanel &inout Model)
{
    return Model.GetbIsSelectedMissionTracked();
}
bool __UIGetter_bIsChapterEntryHighlighted(const FVM_MissionMainPanel &inout Model)
{
    return Model.GetbIsChapterEntryHighlighted();
}
bool __UIGetter_bIsHighlightedChapterExpanded(const FVM_MissionMainPanel &inout Model)
{
    return Model.GetbIsHighlightedChapterExpanded();
}
bool __UIGetter_IsCommissionTabSelected(const FVM_MissionMainPanel &inout Model)
{
    return Model.IsCommissionTabSelected();
}
bool __UIGetter_ShowMissionButtons(const FVM_MissionMainPanel &inout Model)
{
    return Model.ShowMissionButtons();
}
TEUIModelRef<FVM_MissionMainPanel> __UIGetter_Self(const FVM_MissionMainPanel &inout Model)
{
    return TEUIModelRef<FVM_MissionMainPanel>(Model);
}
int __IndexOf_MissionTabConfigMap()
{
    return 0;
}
int __IndexOf_SingleMissionEntryWidgetClass()
{
    return 1;
}
int __IndexOf_ChapterMissionEntryWidgetClass()
{
    return 2;
}
int __IndexOf_ChapterEntryWidgetClass()
{
    return 3;
}
int __IndexOf_RecommendLevelWarningFormat()
{
    return 4;
}
int __IndexOf_TabListItems()
{
    return 5;
}
int __IndexOf_SelectedTabItem()
{
    return 6;
}
int __IndexOf_TabSelectableItems()
{
    return 7;
}
int __IndexOf_TabTypes()
{
    return 8;
}
int __IndexOf_CurrentTabIndex()
{
    return 9;
}
int __IndexOf_MissionList()
{
    return 10;
}
int __IndexOf_CommissionDetail()
{
    return 11;
}
int __IndexOf_bShowTrackingButton()
{
    return 12;
}
int __IndexOf_bIsSelectedMissionTracked()
{
    return 13;
}
int __IndexOf_bIsChapterEntryHighlighted()
{
    return 14;
}
int __IndexOf_bIsHighlightedChapterExpanded()
{
    return 15;
}
int __IndexOf_DefaultSelectMission()
{
    return 16;
}
}
namespace __GeneratedProperties_FVM_MissionMainPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
