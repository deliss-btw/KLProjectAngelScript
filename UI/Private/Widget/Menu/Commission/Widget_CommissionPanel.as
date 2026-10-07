
namespace UWidget_CommissionPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionPanel> CommissionPanel;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionInfo> SelectedCommission;
    UPROPERTY()
    FEUIInputActionDataRow StartMatchIARow;
    UPROPERTY()
    FEUIInputActionDataRow CancelMatchIARow;
    UPROPERTY()
    FEUIActionBinding SwitchMatchStatusActionBinding;
    UPROPERTY()
    FEUIActionBinding BeginStraightActionBinding;
    UPROPERTY()
    FEUIActionBinding StartCommissionActionBinding;
    UPROPERTY()
    FEUIActionBinding RecruitActionBinding;
    UPROPERTY()
    FEUIActionBinding EscapeActionBinding;
    FText RecruitActionDisplayName;
    FEUIModelWeakRef __CommissionPanel;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef CommissionPanelDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectedCommissionDelegate;

    UWidget_CommissionPanel()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.CommissionPanel))
        {
            this.CommissionPanel.SetRef(TEUIModelRef<FVM_CommissionPanel>(::FVM_CommissionPanel::Create(this, ECommissionType(1), 0)));
        }
        this.SelectedCommission.SetRef(this.CommissionPanel.opArrow().GetSelectedCommission());
        this.RecruitActionDisplayName = this.RecruitActionBinding.GetConfigDisplayName();
        this.RefreshRecruitActionButton(GetRecruitCountdownSeconds());
        this.RefreshActionBindings();
        return;
    }
    UFUNCTION()
    void OnSelectedCommissionChanged(const TEUIModelRef<FVM_CommissionInfo> &inout InSelectedCommission)
    {
        this.SelectedCommission.SetRef(InSelectedCommission);
        this.RefreshActionBindings();
        return;
    }
    UFUNCTION()
    void OnSelectedCommissionCanMatchChanged(const bool bCanMatch)
    {
        this.RefreshActionBindings();
        return;
    }
    UFUNCTION()
    void OnSelectedCommissionMatchingChanged(const bool bMatching)
    {
        this.RefreshActionBindings();
        return;
    }
    UFUNCTION()
    void OnGlobalMatchingChanged(const bool bMatching)
    {
        this.RefreshActionBindings();
        return;
    }
    void RefreshActionBindings()
    {
        bool local_3;
        bool local_4;
        bool local_5;
        bool local_6;
        bool local_2 = this.SelectedCommission.IsValid();
        local_3 = GetbSelectedCommissionCanMatch();
        local_4 = GetbRecruitSendDisabled();
        local_5 = GetbSelectedCommissionMatching();
        local_6 = GetbGlobalMatching();
        this.EscapeActionBinding.SetCollapsed(false);
        if (local_3)
        {
            this.StartCommissionActionBinding.SetCollapsed(true);
            this.BeginStraightActionBinding.SetCollapsed(!(local_2));
            this.SwitchMatchStatusActionBinding.SetCollapsed(!(local_2));
        }
        else
        {
            this.StartCommissionActionBinding.SetCollapsed(!(local_2));
            this.BeginStraightActionBinding.SetCollapsed(true);
            this.SwitchMatchStatusActionBinding.SetCollapsed(true);
        }
        bool local_7 = !(local_2) || local_4 || (local_6 && !(local_5));
        this.RecruitActionBinding.SetCollapsed(local_7);
        if (local_5)
        {
        }
        else
        {
        }
        this.SwitchMatchStatusActionBinding.SetInputAction();
        return;
    }
    UFUNCTION()
    void OnRecruitCountdownSecondsChanged(const int RemainingSeconds)
    {
        this.RefreshRecruitActionButton(RemainingSeconds);
        return;
    }
    UFUNCTION()
    void OnRecruitSendDisabledChanged(const bool bRecruitSendDisabled)
    {
        this.RefreshActionBindings();
        return;
    }
    void RefreshRecruitActionButton(const int RemainingSeconds)
    {
        if (RemainingSeconds > 0)
        {
            this.RecruitActionBinding.SetOverrideDisplayText(FText::Format(NSLOCTEXT("CommissionPanel", "RecruitCountdown", "{0}({1}s)"), this.RecruitActionDisplayName, RemainingSeconds));
            this.RecruitActionBinding.SetDisabled(true);
            return;
        }
        this.RecruitActionBinding.SetOverrideDisplayText(this.RecruitActionDisplayName);
        this.RecruitActionBinding.SetDisabled(false);
        return;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommissionPanel_SetSelectedCommissionType(const int Index) const
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
    void CommissionPanel_SetSelectedCommissionItem(const FEUIModelContainer &inout Item) const
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
    void CommissionPanel_OnRecruitSendAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommissionPanel_OnSwitchMatchStatus() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    FEUIModelRef SelectedCommission_CommissionRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SelectedCommission_CommissionFirstTimeRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionFirstTimeRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void SelectedCommission_StartCommission() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommissionPanel& local_6;
        TEUIModelRef<FVM_CommissionPanel> local_2 = this.CommissionPanel.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.CommissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionPanel::__IndexOf_SelectedCommission());
                }
                if (local_6)
                {
                    this.OnSelectedCommissionChanged(local_6.GetSelectedCommission());
                }
                break;
            }
            case 1:
            {
                this.CommissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionPanel::__IndexOf_bSelectedCommissionCanMatch());
                }
                if (local_6)
                {
                    this.OnSelectedCommissionCanMatchChanged(local_6.GetbSelectedCommissionCanMatch());
                }
                break;
            }
            case 2:
            {
                this.CommissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionPanel::__IndexOf_bSelectedCommissionMatching());
                }
                if (local_6)
                {
                    this.OnSelectedCommissionMatchingChanged(local_6.GetbSelectedCommissionMatching());
                }
                break;
            }
            case 3:
            {
                this.CommissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionPanel::__IndexOf_bGlobalMatching());
                }
                if (local_6)
                {
                    this.OnGlobalMatchingChanged(local_6.GetbGlobalMatching());
                }
                break;
            }
            case 4:
            {
                this.CommissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionPanel::__IndexOf_RecruitCountdownSeconds());
                }
                if (local_6)
                {
                    this.OnRecruitCountdownSecondsChanged(local_6.GetRecruitCountdownSeconds());
                }
                break;
            }
            case 5:
            {
                this.CommissionPanel.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommissionPanel::__IndexOf_bRecruitSendDisabled());
                }
                if (local_6)
                {
                    this.OnRecruitSendDisabledChanged(local_6.GetbRecruitSendDisabled());
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
                XError(ELog(17), "Remaining observed model change: OnSelectedCommissionChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedCommissionCanMatchChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnSelectedCommissionMatchingChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnGlobalMatchingChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: OnRecruitCountdownSecondsChanged");
            }
            if (It.IsDirty(5))
            {
                XError(ELog(17), "Remaining observed model change: OnRecruitSendDisabledChanged");
            }
            return;
        }
        this.__CommissionPanel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.CommissionPanel.Initialize(this, FName("VM_CommissionPanel"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectedCommission.Initialize(this, FName("VM_CommissionInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.CommissionPanelDelegate.IsBound())
        {
            this.CommissionPanel.SetRef(this.CommissionPanelDelegate.Execute());
        }
        if (this.SelectedCommissionDelegate.IsBound())
        {
            this.SelectedCommission.SetRef(this.SelectedCommissionDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedCommissionChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedCommissionCanMatchChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedCommissionMatchingChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnGlobalMatchingChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnRecruitCountdownSecondsChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnRecruitSendDisabledChanged"));
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
