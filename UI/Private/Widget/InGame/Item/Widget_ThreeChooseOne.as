
namespace UWidget_ThreeChooseOne
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ThreeChooseOne : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ThreeChooseOne> VM_ThreeChooseOne;
    UPROPERTY()
    FConfigVM_ThreeChooseOne VM_ThreeChooseOneConfig;
    FEUIModelWeakRef __VM_ThreeChooseOne;
    UPROPERTY()
    FGetEUIModelRef VM_ThreeChooseOneDelegate;

    UWidget_ThreeChooseOne()
    {
        return;
    }
    UFUNCTION()
    void OnHandleClose(const bool bShouldClose)
    {
        if (bShouldClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void VM_ThreeChooseOne_OnBackgroundClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ThreeChooseOne& local_6;
        TEUIModelRef<FVM_ThreeChooseOne> local_2 = this.VM_ThreeChooseOne.AsRef();
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
                    this.VM_ThreeChooseOne.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ThreeChooseOne::__IndexOf_bShouldClose());
                    }
                    if (local_6)
                    {
                        this.OnHandleClose(local_6.GetbShouldClose());
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
                XError(ELog(17), "Remaining observed model change: OnHandleClose");
            }
            return;
        }
        this.__VM_ThreeChooseOne = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VM_ThreeChooseOne.Initialize(this, FName("VM_ThreeChooseOne"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_ThreeChooseOneDelegate.IsBound())
        {
            this.VM_ThreeChooseOne.SetRef(this.VM_ThreeChooseOneDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ThreeChooseOne
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHandleClose"));
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
