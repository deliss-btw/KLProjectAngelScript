
namespace UWidget_MissionDecoractor
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionDecoractor : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionDecoractor> Decoractor;
    UPROPERTY()
    UWidgetAnimation Anim_Tip;
    UPROPERTY()
    UWidgetAnimation Anim_Tip_Out;
    UPROPERTY()
    bool bHasPlayedAnim = false;
    FEUIModelWeakRef __Decoractor;
    UPROPERTY()
    FGetEUIModelRef DecoractorDelegate;


    UFUNCTION()
    void OnMissionTrackingChanged(const bool bIsTracking)
    {
        if (bIsTracking && (int(this.Decoractor.opArrow().GetSpotUsage()) == 0))
        {
            this.PlayAnimation(this.Anim_Tip, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            this.bHasPlayedAnim = true;
            return;
        }
        if (this.IsAnimationPlaying(this.Anim_Tip))
        {
            this.StopAnimation(this.Anim_Tip);
        }
        if (this.bHasPlayedAnim)
        {
            this.PlayAnimation(this.Anim_Tip_Out, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            this.bHasPlayedAnim = false;
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MissionDecoractor& local_6;
        TEUIModelRef<FVM_MissionDecoractor> local_2 = this.Decoractor.AsRef();
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
                    this.Decoractor.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MissionDecoractor::__IndexOf_bIsTracking());
                    }
                    if (local_6)
                    {
                        this.OnMissionTrackingChanged(local_6.GetbIsTracking());
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
                XError(ELog(17), "Remaining observed model change: OnMissionTrackingChanged");
            }
            return;
        }
        this.__Decoractor = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Decoractor.Initialize(this, FName("VM_MissionDecoractor"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DecoractorDelegate.IsBound())
        {
            this.Decoractor.SetRef(this.DecoractorDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MissionDecoractor
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnMissionTrackingChanged"));
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
