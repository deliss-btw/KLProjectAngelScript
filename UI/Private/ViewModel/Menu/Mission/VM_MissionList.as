
namespace FVM_MissionList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnChapterButtonClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnEntryItemClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnMissionEntryIndexSelectionChanged = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnViewLocationButtonClicked = FEUIModelCallbackSignature();

}
struct FVM_MissionList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MissionListEntry>> m_MissionEntries;
    UPROPERTY()
    TEUIModelRef<FVM_MissionListEntry> m_SelectedMissionEntry;
    UPROPERTY()
    TEUIModelRef<FVM_MissionListEntry> m_HighlightedEntry;
    UPROPERTY()
    TEUIModelRef<FVM_MissionDetailInfo> m_SelectedMissionInfo;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MissionListEntry>> m_AllMissionEntries;
    UPROPERTY()
    EMissionTabType m_CurrentTabType;
    UPROPERTY()
    FText m_RecommendLevelWarningFormat;
    UPROPERTY()
    bool m_bHasAnyVisibleEntry;
    UPROPERTY()
    bool m_bShowTrackingButton;
    UPROPERTY()
    bool m_bIsHighlightedChapterExpanded;

    FVM_MissionList()
    {
        this.m_CurrentTabType = EMissionTabType(0);
        this.m_bHasAnyVisibleEntry = false;
        this.m_bShowTrackingButton = false;
        this.m_bIsHighlightedChapterExpanded = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MissionList(const FVM_MissionList &inout Other)
    {
        this.m_CurrentTabType = EMissionTabType(0);
        this.m_bHasAnyVisibleEntry = false;
        this.m_bShowTrackingButton = false;
        this.m_bIsHighlightedChapterExpanded = true;
        this.m_MissionEntries = Other.m_MissionEntries;
        this.m_SelectedMissionEntry = Other.m_SelectedMissionEntry;
        this.m_HighlightedEntry = Other.m_HighlightedEntry;
        this.m_SelectedMissionInfo = Other.m_SelectedMissionInfo;
        this.m_AllMissionEntries = Other.m_AllMissionEntries;
        this.m_CurrentTabType = Other.m_CurrentTabType;
        this.m_RecommendLevelWarningFormat = Other.m_RecommendLevelWarningFormat;
        this.m_bHasAnyVisibleEntry = Other.m_bHasAnyVisibleEntry;
        this.m_bShowTrackingButton = Other.m_bShowTrackingButton;
        this.m_bIsHighlightedChapterExpanded = Other.m_bIsHighlightedChapterExpanded;
        return;
    }
    FVM_MissionList opAssign(const FVM_MissionList &inout Other)
    {
        FVM_MissionList __r;
        this.m_MissionEntries = Other.m_MissionEntries;
        this.m_SelectedMissionEntry = Other.m_SelectedMissionEntry;
        this.m_HighlightedEntry = Other.m_HighlightedEntry;
        this.m_SelectedMissionInfo = Other.m_SelectedMissionInfo;
        this.m_AllMissionEntries = Other.m_AllMissionEntries;
        this.m_CurrentTabType = Other.m_CurrentTabType;
        this.m_RecommendLevelWarningFormat = Other.m_RecommendLevelWarningFormat;
        this.m_bHasAnyVisibleEntry = Other.m_bHasAnyVisibleEntry;
        this.m_bShowTrackingButton = Other.m_bShowTrackingButton;
        this.m_bIsHighlightedChapterExpanded = Other.m_bIsHighlightedChapterExpanded;
        return __r;
    }
    bool IsMissionListEmpty() const
    {
        if (this.GetbHasAnyVisibleEntry())
        {
            return false;
        }
        for (auto& local_16 : this.GetMissionEntries())
        {
            if (local_16.opArrow().IsMissionEntry())
            {
                return false;
            }
        }
        return true;
    }
    bool HasSelectedMission() const
    {
        return this.GetSelectedMissionEntry().IsValid();
    }
    void OnChapterButtonClicked()
    {
        if (!(this.GetHighlightedEntry().IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_MissionListEntry> local_2 = this.GetHighlightedEntry();
        this.OnEntryItemClicked(FEUIModelContainer());
        return;
    }
    void OnEntryItemClicked(const FEUIModelContainer &inout Item)
    {
        int local_6 = 0;
        GetModel local_4 = FEUIModelContainer::GetModel(Item);
        if (!(local_6))
        {
            return;
        }
        if ((!((this.GetHighlightedEntry() == FEUIModelRef(local_6)))))
        {
            this.SetHighlightedEntry(TEUIModelRef<FVM_MissionListEntry>(local_6));
        }
        if (local_6.IsChapterEntry())
        {
            this.ToggleChapterExpantion(TEUIModelRef<FVM_MissionListEntry>(local_6));
            return;
        }
        if (local_6.IsMissionEntry())
        {
            if ((!((this.GetSelectedMissionEntry() == FEUIModelRef(local_6)))))
            {
                this.SetSelectedMissionEntry(TEUIModelRef<FVM_MissionListEntry>(local_6));
            }
        }
        return;
    }
    void OnMissionEntryIndexSelectionChanged(const int Index)
    {
        if (Index < 0 || (Index >= this.GetMissionEntries().Num()))
        {
            XWarning(ELog(16), FString().Append("Invalid mission entry index: ").Append(Index));
            return;
        }
        this.SetHighlightedEntry(this.GetMissionEntries()[Index]);
        if (this.GetHighlightedEntry().opArrow().IsChapterEntry())
        {
            return;
        }
        if ((!((this.GetHighlightedEntry() == this.GetSelectedMissionEntry().opImplConv()))))
        {
            this.SetSelectedMissionEntry(this.GetHighlightedEntry());
        }
        return;
    }
    void OnViewLocationButtonClicked()
    {
        if (!(this.GetSelectedMissionEntry().IsValid()))
        {
            return;
        }
        FGuideContext local_144;
        TEUIModelRef<FVM_MissionListEntry> local_2 = this.GetSelectedMissionEntry();
        TDataObjectPtr<FMissionConfig> local_168 = GetMissionConfig();
        if (::MissionUtils::TryFindMissionFirstGuidingInfo(this.GetContext().GetLocalPlayer(), local_168, local_144))
        {
            if (::GuideUtils::ShouldShowGuideOnTargetLevelMinimap(local_144, ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr)))
            {
                ::GuideUtils::OpenMinimap(local_144.GetPrimaryTargetPosition());
            }
            else
            {
                FMissionTargetSpotInfo local_282;
                if (::FMS_MissionTargetSpotManager::Get(this.GetContext().Manager).GetMissionTargetSpots().Find(local_144.GetGuideUniqueId(), local_282) && local_282.RegionMapSpot.IsValid())
                {
                    ::GuideUtilsPrivate::OpenRegionMap(local_282.RegionMapSpot, local_144.GetLevelInfo());
                }
                else
                {
                    ::GuideUtils::OpenRegionMap(local_144.GetLevelInfo());
                }
            }
            return;
        }
        FFPTime local_290 = FFPTime(-1);
        FECSEntity local_196 = this.GetContext().GetLocalPlayer();
        FCE_MissionRequestToggleTrack local_294;
        local_294.MissionConfig = local_168;
        local_294.bIsTracking = true;
        local_294.bOpenMapAndSelect = true;
        return;
    }
    void OnMissionEntriesChanged()
    {
        this.RefreshAllDistanceInfo();
        return;
    }
    void RefreshAllDistanceInfo()
    {
        for (auto& local_16 : this.GetMissionEntries())
        {
            this.UpdateEntrySubTitle(local_16);
        }
        return;
    }
    void OnSelectedMissionEntryChanged()
    {
        bool local_3 = this.GetSelectedMissionEntry().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_MissionListEntry> local_2 = this.GetSelectedMissionEntry();
            local_3 = IsMissionEntry();
        }
        if (local_3)
        {
            TEUIModelRef<FVM_MissionListEntry> local_2_2 = this.GetSelectedMissionEntry();
            ConsumeMissionRedDot();
        }
        this.UpdateSelectedMissionInfo();
        return;
    }
    bool IsMissionEntryHighlighted() const
    {
        bool local_3 = this.GetHighlightedEntry().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_MissionListEntry> local_2 = this.GetHighlightedEntry();
            local_3 = IsMissionEntry();
        }
        return local_3;
    }
    bool IsChapterEntryHighlighted() const
    {
        return this.GetHighlightedEntry().IsValid() && this.GetHighlightedEntry().opArrow().IsChapterEntry();
    }
    bool IsHighlightedChapterExpanded() const
    {
        bool local_3 = this.GetHighlightedEntry().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_MissionListEntry> local_2 = this.GetHighlightedEntry();
            local_3 = IsChapterEntry();
        }
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_MissionListEntry> local_2_2 = this.GetHighlightedEntry();
            local_3 = GetbShowChapterMission();
        }
        return local_3;
    }
    void UpdateMissionList(const EMissionTabType TabType, const bool bReselectMissionEntry = true)
    {
        bool local_3;
        this.SetCurrentTabType(EMissionTabType(TabType));
        if (int(TabType) == 0)
        {
            return;
        }
        this.GetModify_MissionEntries().Empty(0);
        this.SetbHasAnyVisibleEntry(false);
        bool local_4 = false;
        TEUIModelRef<FVM_MissionListEntry> local_6;
        for (auto& local_20 : this.GetAllMissionEntries())
        {
            local_3 = this.NeedShowMissionForTab(GetMissionType());
            if (local_3)
            {
                if (local_20.opArrow().IsMissionEntry() && local_20.opArrow().GetChapterConfig().IsSet())
                {
                    local_3 = this.IsChapterMissionVisible(local_20.opArrow().GetChapterConfig());
                }
            }
            if (!(local_3))
            {
                continue;
            }
            if ((local_20 == this.GetSelectedMissionEntry().opImplConv()))
            {
                local_4 = true;
            }
            this.SetbHasAnyVisibleEntry(true);
            this.GetModify_MissionEntries().Add(local_20);
            if (local_20.opArrow().IsMissionEntry())
            {
                if (!(local_6.IsValid()))
                {
                    local_6 = local_20;
                    continue;
                }
                if (!(GetbIsTracking()) && GetbIsTracking())
                {
                    local_6 = local_20;
                }
            }
        }
        if (!(local_4) && bReselectMissionEntry)
        {
            this.SetSelectedMissionEntry(local_6);
        }
        return;
    }
    void ToggleChapterExpantion(const TEUIModelRef<FVM_MissionListEntry> &inout ChapterEntry)
    {
        if (!(ChapterEntry) || !(ChapterEntry.opArrow().IsChapterEntry()))
        {
            return;
        }
        bool local_2 = !(GetbShowChapterMission());
        local_2.SetbShowChapterMission();
        this.SetbIsHighlightedChapterExpanded(GetbShowChapterMission());
        this.UpdateMissionList(this.GetCurrentTabType(), false);
        return;
    }
    void AddMissionEntry(const FText &inout Category, const FSoftBrush &inout HeaderBrush, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TSoftClassPtr<UEUIUserWidget> &inout EntryWidgetClass, const TSoftClassPtr<UEUIUserWidget> &inout ChapterEntryWidgetClass)
    {
        int local_52 = 0;
        int local_88 = 0;
        TDataObjectPtr<FChapterConfig> local_24 = MissionConfig.opArrow().GetBelongChapter();
        TEUIModelWeakRef<FVM_MissionList> local_50 = TEUIModelWeakRef<FVM_MissionList>(this);
        local_52.SetbIsTracking(::MissionUtils::IsMissionTracking(this.GetContext().GetLocalPlayer(), MissionConfig));
        local_52.SetCategory(Category);
        local_52.SetHeaderBrush(HeaderBrush);
        local_52.SetMissionType(MissionConfig.opArrow().MissionType);
        if (local_24.IsSet() && !(this.FindChapterEntry(local_24).IsValid()))
        {
            TDataObjectPtr<FMissionConfig> local_86;
            local_86 = TDataObjectPtr<FMissionConfig>();
            TEUIModelWeakRef<FVM_MissionList> local_50_2 = TEUIModelWeakRef<FVM_MissionList>(this);
            local_88.SetCategory(Category);
            local_88.SetHeaderBrush(HeaderBrush);
            local_88.SetMissionType(MissionConfig.opArrow().MissionType);
            local_88.SetbShowChapterMission(true);
            local_88.SetTrackingIcon(local_52.GetTrackingIcon());
            this.GetModify_AllMissionEntries().Add(TEUIModelRef<FVM_MissionListEntry>(local_88));
        }
        this.GetModify_AllMissionEntries().Add(TEUIModelRef<FVM_MissionListEntry>(local_52));
        return;
    }
    void SelectMission(const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
    {
        TEUIModelRef<FVM_MissionListEntry> local_2 = this.FindMissionEntry(MissionConfig);
        if (local_2.IsValid())
        {
            this.SetSelectedMissionEntry(local_2);
        }
        return;
    }
    bool NeedShowMissionForTab(const EMissionType MissionType, const EMissionTabType TabType)
    {
        switch (int(TabType))
        {
        case 1:
        {
            return true;
        }
        case 2:
        {
            return (int(MissionType) == 0);
        }
        case 3:
        {
            return (int(MissionType) == 1);
        }
        default:
        {
        }
        }
        return false;
    }
    void UpdateEntrySubTitle(const TEUIModelRef<FVM_MissionListEntry> &inout MissionEntry)
    {
        int local_163 = 0;
        FMissionObjectiveInfo local_218;
        float local_274;
        if (!(MissionEntry.IsValid()) || MissionEntry.opArrow().IsChapterEntry())
        {
            return;
        }
        TDataObjectPtr<FMissionConfig> local_26 = MissionEntry.opArrow().GetMissionConfig();
        FMissionDetail local_162;
        if (!(::MissionUtils::TryFindMissionDetail(this.GetContext().GetLocalPlayer(), local_163, local_162, false)) || local_162.GetActiveObjectiveStatusMap().IsEmpty())
        {
            ApplyGuideDefaultText();
            return;
        }
        bool local_169 = false;
        TDataObjectPtr<FLevelInfoConfig> local_194;
        for (auto& local_212 : local_162.GetActiveObjectiveStatusMap())
        {
            local_212;
            TDataObjectPtr<FObjectiveConfig> local_242 = ::ObjectiveUtils::FindObjectiveConfig(local_218.GetObjectiveId());
            if (!(local_242))
            {
                XError(ELog(16), FString().Append("Failed to find objective config for: ").Append(local_218.GetObjectiveId()));
                continue;
            }
            TDataObjectPtr<FLevelInfoConfig> local_298;
            EObjectiveGuideDisplayState local_299 = ::ObjectiveUtils::GetObjectiveGuideDisplayInfo(local_242, this.GetContext().GetLocalPlayer(), local_274, local_298);
            if (int(local_299) == 1)
            {
                (FMath::RoundToInt(local_274 * 0.01)).ApplyGuideDistance();
                return;
            }
            if (int(local_299) == 2 && !(local_169))
            {
                local_169 = true;
                local_194 = local_298;
            }
        }
        if (local_169 && local_194.IsSet())
        {
        }
        else
        {
            ApplyGuideDefaultText();
        }
        return;
    }
    void ResetSelectedMissionInfo()
    {
        if (this.GetSelectedMissionInfo())
        {
            TDataObjectPtr<FMissionConfig> local_28;
            local_28 = TDataObjectPtr<FMissionConfig>();
            TEUIModelRef<FVM_MissionDetailInfo> local_2 = this.GetSelectedMissionInfo();
        }
        return;
    }
    void UpdateSelectedMissionInfo()
    {
        int local_167 = 0;
        if (!(this.GetSelectedMissionInfo()))
        {
            this.SetSelectedMissionInfo(TEUIModelRef<FVM_MissionDetailInfo>(::FVM_MissionDetailInfo::Create(this.GetContext().Manager)));
        }
        if (!(this.GetSelectedMissionEntry()))
        {
            this.ResetSelectedMissionInfo();
            return;
        }
        TDataObjectPtr<FMissionConfig> local_30 = this.GetSelectedMissionEntry().opArrow().GetMissionConfig();
        FMissionDetail local_166;
        if (!(::MissionUtils::TryFindMissionDetail(this.GetContext().GetLocalPlayer(), local_167, local_166, false)))
        {
            XError(ELog(16), FString().Append("Failed to find mission detail for mission config: ").Append(local_30.GetDataName()));
            return;
        }
        if (!(local_166.GetActivePhaseConfig().IsSet()))
        {
            XError(ELog(16), FString().Append("UpdateSelectedMissionInfo Failed: No active phase config for mission: ").Append(local_30.GetDataName()));
            return;
        }
        this.GetSelectedMissionInfo().opArrow().AssignMissionConfig(local_30, this.GetRecommendLevelWarningFormat());
        return;
    }
    TEUIModelRef<FVM_MissionListEntry> FindMissionEntry(const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
    {
        for (auto& local_16 : this.GetMissionEntries())
        {
            TDataObjectPtr<FMissionConfig> local_40;
            local_40 = local_16.opArrow().GetMissionConfig();
            if ((local_40 == MissionConfig.opImplConv()))
            {
                return local_16;
            }
        }
        return TEUIModelRef<FVM_MissionListEntry>();
    }
    TEUIModelRef<FVM_MissionListEntry> FindChapterEntry(const TDataObjectPtr<FChapterConfig> &inout ChapterConfig)
    {
        if (ChapterConfig.IsSet())
        {
            for (auto& local_16 : this.GetAllMissionEntries())
            {
                if (!(local_16.opArrow().IsChapterEntry()))
                {
                    continue;
                }
                if ((!((GetChapterConfig().GetDataName() == ChapterConfig.GetDataName()))))
                {
                    continue;
                }
                return local_16;
            }
        }
        return TEUIModelRef<FVM_MissionListEntry>();
    }
    bool IsChapterMissionVisible(const TDataObjectPtr<FChapterConfig> &inout ChapterConfig)
    {
        TEUIModelRef<FVM_MissionListEntry> local_2 = this.FindChapterEntry(ChapterConfig);
        if (!(local_2.IsValid()))
        {
            return false;
        }
        return GetbShowChapterMission();
    }
    void SortMissionEntriesAndResetShowCategory()
    {
        EMissionType local_9;
        int local_4 = 0;
        int local_3 = local_4;
        int local_5 = 0;
        for (; local_5 < this.GetAllMissionEntries().Num(); ++local_5)
        {
            local_9 = GetMissionType();
            if ((local_5 == 0 || (int(local_9) != local_3)))
            {
                local_3 = local_9;
                bool local_11 = true;
                local_11.SetbShowCategory();
                continue;
            }
            false.SetbShowCategory();
        }
        return;
    }
    const TArray<TEUIModelRef<FVM_MissionListEntry>> GetMissionEntries() const property
    {
        const TArray<TEUIModelRef<FVM_MissionListEntry>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MissionListEntry>> GetModify_MissionEntries() property
    {
        TArray<TEUIModelRef<FVM_MissionListEntry>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMissionEntries(const TArray<TEUIModelRef<FVM_MissionListEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MissionEntries = __Value;
        return;
    }
    TEUIModelRef<FVM_MissionListEntry> GetSelectedMissionEntry() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedMissionEntry;
    }
    void SetSelectedMissionEntry(const TEUIModelRef<FVM_MissionListEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MissionListEntry> local_2;
        local_2 = this.m_SelectedMissionEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedMissionEntry = __Value;
        return;
    }
    TEUIModelRef<FVM_MissionListEntry> GetHighlightedEntry() const property
    {
        this.TrackPropertyRead(2);
        return this.m_HighlightedEntry;
    }
    void SetHighlightedEntry(const TEUIModelRef<FVM_MissionListEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MissionListEntry> local_2;
        local_2 = this.m_HighlightedEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_HighlightedEntry = __Value;
        return;
    }
    TEUIModelRef<FVM_MissionDetailInfo> GetSelectedMissionInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SelectedMissionInfo;
    }
    void SetSelectedMissionInfo(const TEUIModelRef<FVM_MissionDetailInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_MissionDetailInfo> local_2;
        local_2 = this.m_SelectedMissionInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedMissionInfo = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_MissionListEntry>> GetAllMissionEntries() const property
    {
        const TArray<TEUIModelRef<FVM_MissionListEntry>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MissionListEntry>> GetModify_AllMissionEntries() property
    {
        TArray<TEUIModelRef<FVM_MissionListEntry>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAllMissionEntries(const TArray<TEUIModelRef<FVM_MissionListEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AllMissionEntries = __Value;
        return;
    }
    EMissionTabType GetCurrentTabType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurrentTabType;
    }
    void SetCurrentTabType(const EMissionTabType __Value) property
    {
        if (int(this.m_CurrentTabType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurrentTabType = __Value;
        return;
    }
    const FText GetRecommendLevelWarningFormat() const property
    {
        const FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_RecommendLevelWarningFormat() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRecommendLevelWarningFormat(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RecommendLevelWarningFormat = __Value;
        return;
    }
    bool GetbHasAnyVisibleEntry() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bHasAnyVisibleEntry;
    }
    void SetbHasAnyVisibleEntry(const bool __Value) property
    {
        if (!(this.m_bHasAnyVisibleEntry) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bHasAnyVisibleEntry = __Value;
        return;
    }
    bool GetbShowTrackingButton() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bShowTrackingButton;
    }
    void SetbShowTrackingButton(const bool __Value) property
    {
        if (!(this.m_bShowTrackingButton) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bShowTrackingButton = __Value;
        return;
    }
    bool GetbIsHighlightedChapterExpanded() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bIsHighlightedChapterExpanded;
    }
    void SetbIsHighlightedChapterExpanded(const bool __Value) property
    {
        if (!(this.m_bIsHighlightedChapterExpanded) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bIsHighlightedChapterExpanded = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_Menu_Mission_VM_MissionList_449
{
    __Lambda_UI_Private_ViewModel_Menu_Mission_VM_MissionList_449()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_MissionListEntry> &inout A, const TEUIModelRef<FVM_MissionListEntry> &inout B)
    {
        int local_4;
        int local_82 = 0;
        EMissionType local_1;
        local_1 = GetMissionType();
        EMissionType local_3;
        local_3 = GetMissionType();
        int local_5 = int(local_3);
        if (int(local_1) == local_5)
        {
            int local_79;
            TDataObjectPtr<FChapterConfig> local_78 = GetChapterConfig();
            local_4 = GetChapterConfig().IsSet() ? local_5 : 2147483647;
            local_79 = local_78.IsSet() ? local_5 : 2147483647;
            if (local_4 == local_79)
            {
                int local_83;
                int local_81 = GetMissionConfig().IsSet() ? local_82 : 0;
                local_83 = GetMissionConfig().IsSet() ? local_82 : 0;
                return (local_81 < local_83);
            }
            else
            {
                return (local_4 < local_79);
            }
        }
        else
        {
            int local_80 = int(local_1);
            int local_5_2 = int(local_3);
            return (local_80 < local_5_2);
        }
    }
}

struct __GeneratedProperties_FVM_MissionList
{
    UPROPERTY()
    bool IsMissionListEmpty;
    UPROPERTY()
    bool HasSelectedMission;
    UPROPERTY()
    TEUIModelRef<FVM_MissionList> Self;


}

namespace FVM_MissionList
{
FVM_MissionList& Create(const UObject ContextObject)
{
    return FVM_MissionList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MissionList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MissionList __r;
    TEUIModelRef<FVM_MissionList> local_6 = TEUIModelRef<FVM_MissionList>(EUIInternal::MakeModelWithManager(Manager, FVM_MissionList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MissionEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_MissionListEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMissionEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MissionListEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HighlightedEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MissionListEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMissionInfo";
    local_14.TypeName = "TEUIModelRef<FVM_MissionDetailInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMissionListEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasSelectedMission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionList;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnMissionEntriesChanged";
    local_24.DirtyFlags.Set(FVM_MissionList::__IndexOf_MissionEntries());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnSelectedMissionEntryChanged";
    local_24.DirtyFlags.Set(FVM_MissionList::__IndexOf_SelectedMissionEntry());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionList;
}
void __OnMissionEntriesChanged(FVM_MissionList &inout Model)
{
    Model.OnMissionEntriesChanged();
    return;
}
void __OnSelectedMissionEntryChanged(FVM_MissionList &inout Model)
{
    Model.OnSelectedMissionEntryChanged();
    return;
}
TArray<TEUIModelRef<FVM_MissionListEntry>> __UIGetter_MissionEntries(const FVM_MissionList &inout Model)
{
    return Model.GetMissionEntries();
}
TEUIModelRef<FVM_MissionListEntry> __UIGetter_SelectedMissionEntry(const FVM_MissionList &inout Model)
{
    return Model.GetSelectedMissionEntry();
}
TEUIModelRef<FVM_MissionListEntry> __UIGetter_HighlightedEntry(const FVM_MissionList &inout Model)
{
    return Model.GetHighlightedEntry();
}
TEUIModelRef<FVM_MissionDetailInfo> __UIGetter_SelectedMissionInfo(const FVM_MissionList &inout Model)
{
    return Model.GetSelectedMissionInfo();
}
bool __UIGetter_IsMissionListEmpty(const FVM_MissionList &inout Model)
{
    return Model.IsMissionListEmpty();
}
bool __UIGetter_HasSelectedMission(const FVM_MissionList &inout Model)
{
    return Model.HasSelectedMission();
}
TEUIModelRef<FVM_MissionList> __UIGetter_Self(const FVM_MissionList &inout Model)
{
    return TEUIModelRef<FVM_MissionList>(Model);
}
int __IndexOf_MissionEntries()
{
    return 0;
}
int __IndexOf_SelectedMissionEntry()
{
    return 1;
}
int __IndexOf_HighlightedEntry()
{
    return 2;
}
int __IndexOf_SelectedMissionInfo()
{
    return 3;
}
int __IndexOf_AllMissionEntries()
{
    return 4;
}
int __IndexOf_CurrentTabType()
{
    return 5;
}
int __IndexOf_RecommendLevelWarningFormat()
{
    return 6;
}
int __IndexOf_bHasAnyVisibleEntry()
{
    return 7;
}
int __IndexOf_bShowTrackingButton()
{
    return 8;
}
int __IndexOf_bIsHighlightedChapterExpanded()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_MissionList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
