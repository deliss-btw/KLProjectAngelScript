
namespace UWidget_ChatMainTab
{
    const int ViewID = 0;

}
class UWidget_ChatMainTab : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatMainTab> ChatMainTab;
    UPROPERTY()
    bool bSelected;
    FEUIModelWeakRef __ChatMainTab;
    UPROPERTY()
    FGetEUIModelRef ChatMainTabDelegate;

    UWidget_ChatMainTab()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnVMSelected(const bool bIsSelected)
    {
        UWidgetAnimation local_2 = this.Anim_Selected;
        if (local_2 != nullptr)
        {
            if (!(this.bSelected) != !(bIsSelected))
            {
                this.bSelected = bIsSelected;
                if (bIsSelected)
                {
                    this.PlayAnimation(this.Anim_Selected, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
                    return;
                }
                this.PlayAnimation(this.Anim_Selected, 0.0f, 1, EUMGSequencePlayMode(1), 1.0f, false);
            }
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ChatMainTab& local_6;
        TEUIModelRef<FVM_ChatMainTab> local_2 = this.ChatMainTab.AsRef();
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
                    this.ChatMainTab.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ChatMainTab::__IndexOf_bIsSelected());
                    }
                    if (local_6)
                    {
                        this.OnVMSelected(local_6.GetbIsSelected());
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
                XError(ELog(17), "Remaining observed model change: OnVMSelected");
            }
            return;
        }
        this.__ChatMainTab = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatMainTab.Initialize(this, FName("VM_ChatMainTab"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ChatMainTabDelegate.IsBound())
        {
            this.ChatMainTab.SetRef(this.ChatMainTabDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatMainTab
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnVMSelected"));
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
