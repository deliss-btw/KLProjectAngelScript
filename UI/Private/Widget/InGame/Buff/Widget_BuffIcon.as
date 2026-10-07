
namespace UWidget_BuffIcon
{
    const int ViewID = 0;

}
class UWidget_BuffIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffIcon> BuffIcon;
    UPROPERTY()
    UWidgetAnimation Anim_flicker;
    FEUIModelWeakRef __BuffIcon;
    UPROPERTY()
    FGetEUIModelRef BuffIconDelegate;

    UWidget_BuffIcon()
    {
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        if (this.BuffIcon.IsValid())
        {
            HideHover();
        }
        return;
    }
    UFUNCTION()
    void OnStateChanged(const bool bNearEnd)
    {
        if (bNearEnd)
        {
            this.PlayAnimation(this.Anim_flicker, 0.0f, 0, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
            return;
        }
        this.StopAnimation(this.Anim_flicker);
        return;
    }
    UFUNCTION()
    ESlateVisibility BuffIcon_SlateVisibilityStackVisible() const
    {
        FVM_BuffIcon& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.StackVisibleAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    void BuffIcon_ShowHover(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BuffIcon_HideHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_BuffIcon& local_6;
        TEUIModelRef<FVM_BuffIcon> local_2 = this.BuffIcon.AsRef();
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
                    this.BuffIcon.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_BuffIcon::__IndexOf_bNearEnd());
                    }
                    if (local_6)
                    {
                        this.OnStateChanged(local_6.GetbNearEnd());
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
                XError(ELog(17), "Remaining observed model change: OnStateChanged");
            }
            return;
        }
        this.__BuffIcon = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BuffIcon.Initialize(this, FName("VM_BuffIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BuffIconDelegate.IsBound())
        {
            this.BuffIcon.SetRef(this.BuffIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BuffIcon
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnStateChanged"));
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
