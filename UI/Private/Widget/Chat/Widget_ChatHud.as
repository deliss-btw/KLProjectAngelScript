
namespace UWidget_ChatHud
{
    const int ViewID = 0;

}
class UWidget_ChatHud : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatHudPanel> ChatHudPanel;
    UPROPERTY()
    UScrollBox w_scroll_content;
    FEUIModelWeakRef __ChatHudPanel;
    UPROPERTY()
    FGetEUIModelRef ChatHudPanelDelegate;

    UWidget_ChatHud()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.ChatHudPanel.IsValid()))
        {
            FEUIModelRef local_4;
            this.ChatHudPanel = local_4;
        }
        if (this.w_scroll_content != nullptr)
        {
            this.w_scroll_content.ScrollToEnd();
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.ChatHudPanel.IsValid())
        {
            TickExpireHudLines();
        }
        return;
    }
    UFUNCTION()
    void HandleHunLinesChanged()
    {
        if (this.w_scroll_content != nullptr)
        {
            this.w_scroll_content.ScrollToEnd();
        }
        return;
    }
    UFUNCTION()
    void ChatHudPanel_OnHudChatEnterClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ChatHudPanel& local_6;
        TEUIModelRef<FVM_ChatHudPanel> local_2 = this.ChatHudPanel.AsRef();
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
                    this.ChatHudPanel.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ChatHudPanel::__IndexOf_HudLines());
                    }
                    if (local_6)
                    {
                        this.HandleHunLinesChanged();
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
                XError(ELog(17), "Remaining observed model change: HandleHunLinesChanged");
            }
            return;
        }
        this.__ChatHudPanel = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatHudPanel.Initialize(this, FName("VM_ChatHudPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ChatHudPanelDelegate.IsBound())
        {
            this.ChatHudPanel.SetRef(this.ChatHudPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatHud
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleHunLinesChanged"));
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
