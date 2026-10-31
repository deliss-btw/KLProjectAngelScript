namespace UWidget_CommonActionEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonActionEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonActionEntry> ActionEntry;
    UPROPERTY()
    UWidget_CommonHoverProvider UI_Common_HoverProvider;
    UPROPERTY()
    UWidgetSwitcher w_switcher_state;
    UPROPERTY()
    FEUIActionBinding ActionBinding;
    FEUIModelWeakRef __ActionEntry;
    UPROPERTY()
    FGetEUIModelRef ActionEntryDelegate;

    UWidget_CommonActionEntry()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshActionBinding();
        this.ApplyConfiguredSharedHoverAnchor();
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.ActionBinding.SetCollapsed(true);
        this.ActionBinding.UnRegister();
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.SetHoverForWidgetOverride(nullptr);
        }
        return;
    }
    UFUNCTION()
    void OnActionEntryBindingDataChanged()
    {
        this.RefreshActionBinding();
        return;
    }
    UFUNCTION()
    void TriggerInputAction()
    {
        this.ApplyConfiguredSharedHoverAnchor();
        if (!(this.ActionEntry.IsValid()))
        {
            return;
        }
        if (this.ActionEntry.Get().HasClickAction())
        {
            this.ExecuteClickAction();
            return;
        }
        if (this.ActionEntry.Get().HasHoverContent())
        {
            this.OpenHoverByClick();
        }
        return;
    }
    UFUNCTION()
    void TriggerClickAction()
    {
        this.ApplyConfiguredSharedHoverAnchor();
        this.ExecuteClickAction();
        return;
    }
    UFUNCTION()
    void ApplySharedHoverAnchor(const UWidget InHoverAnchor)
    {
        if (this.ActionEntry.IsValid())
        {
            this.ActionEntry.Get().SetSharedHoverAnchor(InHoverAnchor);
        }
        if (this.UI_Common_HoverProvider != nullptr)
        {
            this.UI_Common_HoverProvider.SetHoverForWidgetOverride(InHoverAnchor);
        }
        return;
    }
    void RefreshActionBinding()
    {
        this.ActionBinding.SetCollapsed(true);
        this.ActionBinding.UnRegister();
        if (!(this.ActionEntry.IsValid()) || !(this.ActionEntry.Get().IsActionableOrHoverable()))
        {
            return;
        }
        FEUIInputAction local_14 = this.ActionEntry.Get().UIGetDisplayedInputAction();
        if (local_14.IsNull())
        {
            return;
        }
        this.ActionBinding.SetInputAction(local_14);
        this.ActionBinding.SetCollapsed(false);
        this.ActionBinding.Register(this, n"TriggerInputAction");
        return;
    }
    void ExecuteClickAction()
    {
        if (!(this.ActionEntry.IsValid()) || !(this.ActionEntry.Get().HasClickAction()))
        {
            return;
        }
        FEUIModelRef local_4;
        local_4;
        FEUIWidgetModelCallbackBuilder local_22;
        local_22.EnqueueCallback();
        return;
    }
    void OpenHoverByClick()
    {
        if (this.UI_Common_HoverProvider == nullptr || !(this.ActionEntry.IsValid()))
        {
            return;
        }
        this.UI_Common_HoverProvider.HoverWidgetClass = this.ActionEntry.Get().GetHoverWidgetClass();
        this.UI_Common_HoverProvider.SetHoverModels(this.ActionEntry.Get().GetHoverModels());
        this.UI_Common_HoverProvider.SetHoverForWidgetOverride(this.ActionEntry.Get().ResolveSharedHoverAnchorWidget());
        if (!(this.UI_Common_HoverProvider.HoverProvider.IsValid()))
        {
            return;
        }
        if (!(this.UI_Common_HoverProvider.HoverProvider.Get().GetbResponsibleForClick()))
        {
            return;
        }
        this.UI_Common_HoverProvider.HoverProvider.Get().SetHoverWidgetClass(this.UI_Common_HoverProvider.HoverWidgetClass);
        FEUIModelRef local_18;
        local_18;
        FEUIWidgetModelCallbackBuilder local_36;
        local_36.EnqueueCallback();
        return;
    }
    void ApplyConfiguredSharedHoverAnchor()
    {
        if (!(this.ActionEntry.IsValid()))
        {
            return;
        }
        this.ApplySharedHoverAnchor(this.ActionEntry.Get().ResolveSharedHoverAnchorWidget());
        return;
    }
    UFUNCTION()
    void ActionEntry_ExecuteClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_CommonActionEntry> local_2 = this.ActionEntry.AsRef();
        FVM_CommonActionEntry& local_6 = local_2.Get();
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
                    this.ActionEntry.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonActionEntry::__IndexOf_InputAction());
                        local_6.TrackPropertyRead(::FVM_CommonActionEntry::__IndexOf_HoverWidgetClass());
                    }
                    if (local_6)
                    {
                        this.OnActionEntryBindingDataChanged();
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
                XError(ELog(17), "Remaining observed model change: OnActionEntryBindingDataChanged");
            }
            return;
        }
        this.__ActionEntry = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ActionEntry.Initialize(this, FName("VM_CommonActionEntry"), EEUIWidgetRefModelCreationType(1), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ActionEntryDelegate.IsBound())
        {
            this.ActionEntry.SetRef(this.ActionEntryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonActionEntry
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_CommonActionEntry;
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnActionEntryBindingDataChanged"));
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
