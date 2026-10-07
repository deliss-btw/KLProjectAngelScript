
namespace UWidget_BlackScreen
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BlackScreen : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_CommonLoading> LoadingPage;
    FEUIModelWeakRef __LoadingPage;

    UWidget_BlackScreen()
    {
        return;
    }
    UFUNCTION()
    void OnPendingClose(const bool bPendingClose)
    {
        if (bPendingClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    float32 LoadingPage_RenderOpacity() const
    {
        FVMS_CommonLoading& local_2;
        return local_2 ? local_2.GetRenderOpacity() : 0.0f;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_CommonLoading& local_6;
        TEUIModelRef<FVMS_CommonLoading> local_2 = this.LoadingPage.AsRef();
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
                    this.LoadingPage.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_CommonLoading::__IndexOf_bPendingClose());
                    }
                    if (local_6)
                    {
                        this.OnPendingClose(local_6.GetbPendingClose());
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
                XError(ELog(17), "Remaining observed model change: OnPendingClose");
            }
            return;
        }
        this.__LoadingPage = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LoadingPage.Initialize(this, FName("VMS_CommonLoading"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_BlackScreen
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPendingClose"));
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
