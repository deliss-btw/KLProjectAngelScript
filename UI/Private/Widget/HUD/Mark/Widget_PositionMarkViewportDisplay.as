
namespace UWidget_PositionMarkViewportDisplay
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PositionMarkViewportDisplay : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkSpotIcon> MarkSpotIcon;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MarkInfo> MarkInfo;
    FEUIModelWeakRef __MarkSpotIcon;
    UPROPERTY()
    FGetEUIModelRef MarkSpotIconDelegate;
    UPROPERTY()
    FGetEUIModelRef MarkInfoDelegate;

    UWidget_PositionMarkViewportDisplay()
    {
        return;
    }
    UFUNCTION()
    void OnMarkInfoChanged(const TEUIModelRef<FVM_MarkInfo> &inout InMarkInfo)
    {
        this.MarkInfo = InMarkInfo.opImplConv();
        return;
    }
    void UpdatePosition()
    {
        const UMarkSettings local_2;
        GetGameplaySettings<UMarkSettings> local_4;
        local_2 = local_4;
        FVector2D local_10;
        if (::PresentationSpotUtils::ConvertSpotPositionToRenderTranslation(this.MarkInfo.opArrow().GetSpot(), local_10, FVector(0.0, 0.0, local_2.PositionMark2DIconZOffset)))
        {
            this.SetRenderTranslation(local_10);
            this.SetRenderOpacity(1.0f);
            return;
        }
        this.SetRenderOpacity(0.0f);
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MarkSpotIcon& local_6;
        TEUIModelRef<FVM_MarkSpotIcon> local_2 = this.MarkSpotIcon.AsRef();
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
                    this.MarkSpotIcon.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MarkSpotIcon::__IndexOf_MarkInfo());
                    }
                    if (local_6)
                    {
                        this.OnMarkInfoChanged(local_6.GetMarkInfo());
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
                XError(ELog(17), "Remaining observed model change: OnMarkInfoChanged");
            }
            return;
        }
        this.__MarkSpotIcon = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MarkSpotIcon.Initialize(this, FName("VM_MarkSpotIcon"), EEUIWidgetRefModelCreationType(0), false);
        this.MarkInfo.Initialize(this, FName("VM_MarkInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MarkSpotIconDelegate.IsBound())
        {
            this.MarkSpotIcon.SetRef(this.MarkSpotIconDelegate.Execute());
        }
        if (this.MarkInfoDelegate.IsBound())
        {
            this.MarkInfo.SetRef(this.MarkInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PositionMarkViewportDisplay
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnMarkInfoChanged"));
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
