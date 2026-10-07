
namespace UWidget_PlayerHitStunDetachBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PlayerHitStunDetachBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerHitStunDetachBar> PlayerHitStunDetachBar;
    UPROPERTY()
    UWidgetAnimation Anim_DamagePreview;
    UPROPERTY()
    float32 MaxMaintainAnimPlayInterval = 0.88f;
    float NextPlayMaxMaintainAnimTime = 0.0;
    FEUIModelWeakRef __PlayerHitStunDetachBar;
    UPROPERTY()
    FGetEUIModelRef PlayerHitStunDetachBarDelegate;


    UFUNCTION()
    void HandleMaxMaintainTriggerCounterChanged(const int MaxMaintainTriggerCounter)
    {
        if (MaxMaintainTriggerCounter == 0)
        {
            return;
        }
        if (this.GetWorld().GetTimeSeconds() >= this.NextPlayMaxMaintainAnimTime)
        {
            this.NextPlayMaxMaintainAnimTime = (this.GetWorld().GetTimeSeconds() + this.MaxMaintainAnimPlayInterval);
            this.PlayAnimation(this.Anim_DamagePreview, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, true);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_PlayerHitStunDetachBar& local_6;
        TEUIModelRef<FVM_PlayerHitStunDetachBar> local_2 = this.PlayerHitStunDetachBar.AsRef();
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
                    this.PlayerHitStunDetachBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PlayerHitStunDetachBar::__IndexOf_MaxMaintainTriggerCounter());
                    }
                    if (local_6)
                    {
                        this.HandleMaxMaintainTriggerCounterChanged(local_6.GetMaxMaintainTriggerCounter());
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
                XError(ELog(17), "Remaining observed model change: HandleMaxMaintainTriggerCounterChanged");
            }
            return;
        }
        this.__PlayerHitStunDetachBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerHitStunDetachBar.Initialize(this, FName("VM_PlayerHitStunDetachBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerHitStunDetachBarDelegate.IsBound())
        {
            this.PlayerHitStunDetachBar.SetRef(this.PlayerHitStunDetachBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerHitStunDetachBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleMaxMaintainTriggerCounterChanged"));
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
