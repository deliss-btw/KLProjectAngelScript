
namespace UWidget_SelectServer
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SelectServer : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_LoginServer> LoginServerVM;
    FEUIModelWeakRef __LoginServerVM;
    UPROPERTY()
    FGetEUIModelRef LoginServerVMDelegate;

    UWidget_SelectServer()
    {
        return;
    }
    UFUNCTION()
    void OnNeedCloseChanged(const bool bNeedClose)
    {
        if (bNeedClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void OnClickClose()
    {
        this.ClosePage(false);
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_LoginServer& local_6;
        TEUIModelRef<FVM_LoginServer> local_2 = this.LoginServerVM.AsRef();
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
                    this.LoginServerVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_LoginServer::__IndexOf_bNeedClose());
                    }
                    if (local_6)
                    {
                        this.OnNeedCloseChanged(local_6.GetbNeedClose());
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
                XError(ELog(17), "Remaining observed model change: OnNeedCloseChanged");
            }
            return;
        }
        this.__LoginServerVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LoginServerVM.Initialize(this, FName("VM_LoginServer"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.LoginServerVMDelegate.IsBound())
        {
            this.LoginServerVM.SetRef(this.LoginServerVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SelectServer
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnNeedCloseChanged"));
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
