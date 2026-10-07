
namespace UWidget_Breakthrough
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_Breakthrough : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BreakthroughLevelInfo> BreakthroughLevelInfo;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_left;
    UPROPERTY()
    UEUICommonListView w_list_reward;
    UPROPERTY()
    UWidget_CommonHoverProvider UI_Common_HoverProvider;
    UPROPERTY()
    FEUIActionBinding StartLimitBreakAction;
    UPROPERTY()
    FEUIActionBinding LevelClaimRewardAction;
    UPROPERTY()
    FEUIActionBinding ViewLimitBreakAction;
    UPROPERTY()
    FEUIActionBinding JumpLimitBreakAction;
    UPROPERTY()
    FEUIActionBinding ViewDetailsBinding;
    UPROPERTY()
    FEUIActionBinding BackOrCloseBinding;
    bool bDetailFocused = false;
    FEUIModelWeakRef __BreakthroughLevelInfo;
    UPROPERTY()
    FGetEUIModelRef BreakthroughLevelInfoDelegate;


    UFUNCTION()
    void OnInitialized_Implementation()
    {
        UEUIInputSubsystem::Get(this.GetOwningLocalPlayer()).OnInputMethodChanged.AddUFunction(this, n"OnInputMethodChanged");
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.bDetailFocused = false;
        this.RefreshActionBindingVisibility();
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.OnClickIntent.AddUFunction(this, n"OnHoverProviderClicked");
        }
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.OnClickIntent.Unbind(this, n"OnHoverProviderClicked");
        }
        return;
    }
    UFUNCTION()
    void OnInputMethodChanged(const EEUIInputType NewInputType)
    {
        if ((int(NewInputType) != 1 && this.bDetailFocused))
        {
            this.OnBackToList();
        }
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnViewDetailsPressed()
    {
        bool local_5 = (this.w_entry_left != nullptr) && (this.w_entry_left.GetNumEntries() > 0);
        bool local_8 = (this.w_list_reward != nullptr) && (this.w_list_reward.GetNumItems() > 0);
        if (!(local_5) && !(local_8))
        {
            return;
        }
        this.bDetailFocused = true;
        if (local_5)
        {
            this.RuleSetUserFocus(this.w_entry_left);
        }
        else
        {
            this.RuleSetUserFocus(this.w_list_reward);
        }
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnBackOrClosePressed()
    {
        if ((int(this.GetCurrentInputType())) == 1 && this.bDetailFocused)
        {
            this.OnBackToList();
            return;
        }
        this.ClosePage(false);
        return;
    }
    void OnBackToList()
    {
        this.bDetailFocused = false;
        Widget::SetFocusToGameViewport();
        this.RefreshActionBindingVisibility();
        return;
    }
    void RefreshActionBindingVisibility()
    {
        bool local_5 = (int(this.GetCurrentInputType()) == 1);
        bool local_1 = (this.w_entry_left != nullptr) && (this.w_entry_left.GetNumEntries() > 0);
        bool local_9 = (this.w_list_reward != nullptr) && (this.w_list_reward.GetNumItems() > 0);
        bool local_13 = !(local_5) || this.bDetailFocused || (!(local_1) && !(local_9));
        this.ViewDetailsBinding.SetCollapsed(local_13);
        return;
    }
    UFUNCTION()
    void OnBreakthroughStatusChanged(const int Status)
    {
        this.StartLimitBreakAction.SetCollapsed((Status != 2));
        this.LevelClaimRewardAction.SetCollapsed((Status != 3));
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnReadyBreakthroughChanged(const bool bReadyBreakthrough)
    {
        this.ViewLimitBreakAction.SetCollapsed(bReadyBreakthrough);
        bool local_1 = !(bReadyBreakthrough);
        this.JumpLimitBreakAction.SetCollapsed(local_1);
        this.RefreshActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnHoverProviderClicked()
    {
        if ((!((this.UI_Common_HoverProvider != nullptr)) || !(this.BreakthroughLevelInfo)))
        {
            return;
        }
        this.UI_Common_HoverProvider.ConsumeClickIntent();
        this.BreakthroughLevelInfo.opArrow().GotoBreakthrough();
        return;
    }
    UFUNCTION()
    void BreakthroughLevelInfo_RequestLevelBreakthrough() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BreakthroughLevelInfo_GotoBreakthrough() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BreakthroughLevelInfo_StartBreakthroughCommission() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_BreakthroughLevelInfo& local_6;
        TEUIModelRef<FVM_BreakthroughLevelInfo> local_2 = this.BreakthroughLevelInfo.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.BreakthroughLevelInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_BreakthroughLevelInfo::__IndexOf_BreakthroughStatus());
                    }
                    if (local_6)
                    {
                        this.OnBreakthroughStatusChanged(local_6.GetBreakthroughStatus());
                    }
                    this.BreakthroughLevelInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_BreakthroughLevelInfo::__IndexOf_bReadyBreakthrough());
                    }
                    if (local_6)
                    {
                        this.OnReadyBreakthroughChanged(local_6.GetbReadyBreakthrough());
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
                XError(ELog(17), "Remaining observed model change: OnBreakthroughStatusChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnReadyBreakthroughChanged");
            }
            return;
        }
        this.__BreakthroughLevelInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BreakthroughLevelInfo.Initialize(this, FName("VM_BreakthroughLevelInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BreakthroughLevelInfoDelegate.IsBound())
        {
            this.BreakthroughLevelInfo.SetRef(this.BreakthroughLevelInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Breakthrough
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnBreakthroughStatusChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnReadyBreakthroughChanged"));
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
