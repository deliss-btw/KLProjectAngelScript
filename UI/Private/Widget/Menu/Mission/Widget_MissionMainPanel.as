
namespace UWidget_MissionMainPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionMainPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionMainPanel> MissionPanel;
    UPROPERTY()
    FEUIInputActionDataRow TrackingRow;
    UPROPERTY()
    FEUIInputActionDataRow CancelTrackingRow;
    UPROPERTY()
    UWidget_MissionList UI_Mission_MissionList;
    UPROPERTY()
    UWidget_CommissionDetail UI_Mission_CommissionDetail;
    UPROPERTY()
    FEUIActionBinding ToggleTracking;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FConfigVM_MissionMainPanel MissionPanelConfig;
    FEUIModelWeakRef __MissionPanel;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;
    UPROPERTY()
    FGetEUIModelRef MissionPanelDelegate;

    UWidget_MissionMainPanel()
    {
        return;
    }
    UFUNCTION()
    bool IsCommissionTabSelected() const
    {
        bool local_3;
        if (this.MissionPanel)
        {
            local_3 = IsCommissionTabSelected();
        }
        else
        {
            local_3 = false;
        }
        return local_3;
    }
    UFUNCTION()
    bool IsChapterEntryHighlighted() const
    {
        bool local_3;
        if (this.MissionPanel)
        {
            local_3 = GetbIsChapterEntryHighlighted();
        }
        else
        {
            local_3 = false;
        }
        return local_3;
    }
    UFUNCTION()
    bool IsSelectedTabEquals(const EMissionTabType TabType) const
    {
        bool local_3;
        if (this.MissionPanel)
        {
            local_3 = IsTabTypeSelected();
        }
        else
        {
            local_3 = false;
        }
        return local_3;
    }
    UFUNCTION()
    bool HasSelectedMission() const
    {
        TEUIModelRef<FVM_MissionList> local_4;
        bool local_1 = !(this.MissionPanel.IsValid());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_4.GetMissionList();
            local_1 = !(local_4.IsValid());
        }
        if (local_1)
        {
            return false;
        }
        local_4.GetMissionList();
        return HasSelectedMission();
    }
    UFUNCTION()
    void SetSelectedTabIndex(const int Index)
    {
        if (!(this.MissionPanel.IsValid()))
        {
            return;
        }
        SetSelectedTabIndex();
        bool local_1 = IsCommissionTabSelected();
        if (this.UI_Mission_CommissionDetail != nullptr)
        {
            this.UI_Mission_CommissionDetail.ViewLocation.SetCollapsed(!(local_1));
        }
        if (this.UI_Mission_MissionList != nullptr)
        {
            if ((int(this.GetCurrentInputType())) == 1 || local_1)
            {
                TEUIModelRef<FVM_MissionList> local_12;
                this.UI_Mission_MissionList.SetAllCollapsed(true);
                local_12.GetMissionList();
                if (local_12)
                {
                    bool local_2 = false;
                    local_12.GetMissionList();
                    local_2.SetbShowTrackingButton();
                }
            }
            this.UI_Mission_MissionList.ScrollToTop();
        }
        return;
    }
    UFUNCTION()
    void OnChapterEntryHighlightedChanged()
    {
        this.ToggleTracking.SetCollapsed(GetbIsChapterEntryHighlighted());
        return;
    }
    UFUNCTION()
    void OnSelectedMissionTrackedChanged()
    {
        if (GetbIsSelectedMissionTracked())
        {
        }
        else
        {
        }
        this.ToggleTracking.SetInputAction();
        return;
    }
    UFUNCTION()
    void OnShowTrackingButtonChanged()
    {
        this.ToggleTracking.SetCollapsed(!(GetbShowTrackingButton()));
        return;
    }
    UFUNCTION()
    void MissionPanel_SetSelectedTabIndex(const int Index) const
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
    void MissionPanel_OnTrackButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MissionMainPanel& local_6;
        TEUIModelRef<FVM_MissionMainPanel> local_2 = this.MissionPanel.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.MissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MissionMainPanel::__IndexOf_bIsChapterEntryHighlighted());
                }
                if (local_6)
                {
                    this.OnChapterEntryHighlightedChanged();
                }
                break;
            }
            case 1:
            {
                this.MissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MissionMainPanel::__IndexOf_bIsSelectedMissionTracked());
                }
                if (local_6)
                {
                    this.OnSelectedMissionTrackedChanged();
                }
                break;
            }
            case 2:
            {
                this.MissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_MissionMainPanel::__IndexOf_bShowTrackingButton());
                }
                if (local_6)
                {
                    this.OnShowTrackingButtonChanged();
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
                XError(ELog(17), "Remaining observed model change: OnChapterEntryHighlightedChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedMissionTrackedChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnShowTrackingButtonChanged");
            }
            return;
        }
        this.__MissionPanel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.MissionPanel.Initialize(this, FName("VM_MissionMainPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        if (this.MissionPanelDelegate.IsBound())
        {
            this.MissionPanel.SetRef(this.MissionPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MissionMainPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChapterEntryHighlightedChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedMissionTrackedChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnShowTrackingButtonChanged"));
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
