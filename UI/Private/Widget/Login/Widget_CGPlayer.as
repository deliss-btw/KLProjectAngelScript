
namespace UWidget_CGPlayer
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CGPlayer : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CGPlayer> CGPlayerVM;
    UPROPERTY()
    FEUIActionBinding NextButtonActionBinding;
    FEUIModelWeakRef __CGPlayerVM;
    UPROPERTY()
    FGetEUIModelRef CGPlayerVMDelegate;

    UWidget_CGPlayer()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.NextButtonActionBinding.SetCollapsed(true);
        this.NextButtonActionBinding.GetConfigDisplayName().SetActionName();
        return;
    }
    UFUNCTION()
    void OnNextButtonStateChanged(const bool bCanClickNext)
    {
        bool local_1 = !(bCanClickNext);
        this.NextButtonActionBinding.SetCollapsed(local_1);
        return;
    }
    UFUNCTION()
    void OnCanCloseChanged(const bool bCanClose)
    {
        if (bCanClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void SetupByCGConfig(const TDataObjectPtr<FCGConfig> &inout CGConfig)
    {
        if (!(this.CGPlayerVM.IsValid()))
        {
            return;
        }
        CGConfig.SetupByCGConfig();
        return;
    }
    UFUNCTION()
    void CGPlayerVM_GoNextPageOrFinish() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CGPlayer& local_6;
        TEUIModelRef<FVM_CGPlayer> local_2 = this.CGPlayerVM.AsRef();
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
                    this.CGPlayerVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CGPlayer::__IndexOf_bCanClickNext());
                    }
                    if (local_6)
                    {
                        this.OnNextButtonStateChanged(local_6.GetbCanClickNext());
                    }
                    this.CGPlayerVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CGPlayer::__IndexOf_bCanClose());
                    }
                    if (local_6)
                    {
                        this.OnCanCloseChanged(local_6.GetbCanClose());
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
                XError(ELog(17), "Remaining observed model change: OnNextButtonStateChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnCanCloseChanged");
            }
            return;
        }
        this.__CGPlayerVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CGPlayerVM.Initialize(this, FName("VM_CGPlayer"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CGPlayerVMDelegate.IsBound())
        {
            this.CGPlayerVM.SetRef(this.CGPlayerVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CGPlayer
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnNextButtonStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCanCloseChanged"));
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
