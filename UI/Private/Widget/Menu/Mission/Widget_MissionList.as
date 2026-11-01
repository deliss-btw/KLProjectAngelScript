namespace UWidget_MissionList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionList : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionList> MissionList;
    UPROPERTY()
    UEUICommonTreeView w_list_SecondTab;
    UPROPERTY()
    FEUIActionBinding ExpandChapter;
    UPROPERTY()
    FEUIActionBinding CollapseChapter;
    UPROPERTY()
    FEUIActionBinding ViewLocation;
    FEUIModelWeakRef __MissionList;
    UPROPERTY()
    FGetEUIModelRef MissionListDelegate;

    UWidget_MissionList()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.SetAllCollapsed(true);
        return;
    }
    UFUNCTION()
    void OnHighlightedChapterExpandedChanged()
    {
        this.RefreshChapterButtons();
        return;
    }
    UFUNCTION()
    void OnMissionEntryIndexSelectionChanged(const int Index)
    {
        if (!(this.MissionList.IsValid()))
        {
            return;
        }
        this.MissionList.Get().OnMissionEntryIndexSelectionChanged(Index);
        this.RefreshMissionButtons();
        return;
    }
    UFUNCTION()
    void OnListItemHoverChanged()
    {
        this.RefreshMissionButtons();
        this.RefreshChapterButtons();
        return;
    }
    void ScrollToTop()
    {
        if ((!((this.w_list_SecondTab != nullptr))))
        {
            return;
        }
        this.w_list_SecondTab.ScrollToTop();
        return;
    }
    void SetAllCollapsed(const bool bCollapsed)
    {
        this.ExpandChapter.SetCollapsed(bCollapsed);
        this.CollapseChapter.SetCollapsed(bCollapsed);
        this.ViewLocation.SetCollapsed(bCollapsed);
        return;
    }
    void RefreshMissionButtons()
    {
        if ((int(this.GetCurrentInputType())) == 1)
        {
            bool local_4 = this.MissionList.Get().IsChapterEntryHighlighted() || !(this.IsPartOfFocusPath(this));
            this.ViewLocation.SetCollapsed(local_4);
            this.MissionList.Get().SetbShowTrackingButton(!(local_4));
            return;
        }
        bool local_5 = !(this.MissionList.Get().GetSelectedMissionEntry().IsValid()) || !(this.MissionList.Get().GetSelectedMissionEntry().Get().IsMissionEntry());
        this.ViewLocation.SetCollapsed(local_5);
        this.MissionList.Get().SetbShowTrackingButton(!(local_5));
        return;
    }
    void RefreshChapterButtons()
    {
        if (!(this.MissionList.IsValid()) || !(this.MissionList.Get().IsChapterEntryHighlighted()) || (int(this.GetCurrentInputType()) != 1))
        {
            this.ExpandChapter.SetCollapsed(true);
            this.CollapseChapter.SetCollapsed(true);
            return;
        }
        this.ExpandChapter.SetCollapsed(this.MissionList.Get().GetbIsHighlightedChapterExpanded());
        this.CollapseChapter.SetCollapsed(!(this.MissionList.Get().GetbIsHighlightedChapterExpanded()));
        return;
    }
    UFUNCTION()
    void MissionList_OnChapterButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MissionList_OnEntryItemClicked(const FEUIModelContainer &inout Item) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Item);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MissionList_OnMissionEntryIndexSelectionChanged(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MissionList_OnViewLocationButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_MissionList> local_2 = this.MissionList.AsRef();
        FVM_MissionList& local_6 = local_2.Get();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.MissionList.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MissionList::__IndexOf_bIsHighlightedChapterExpanded());
                    }
                    if (local_6)
                    {
                        this.OnHighlightedChapterExpandedChanged();
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnHighlightedChapterExpandedChanged");
            }
            return;
        }
        this.__MissionList = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MissionList.Initialize(this, FName("VM_MissionList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MissionListDelegate.IsBound())
        {
            this.MissionList.SetRef(this.MissionListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MissionList
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_MissionList;
    Result.ObservedModelChangesSubscriberCount = 1;
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHighlightedChapterExpandedChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
