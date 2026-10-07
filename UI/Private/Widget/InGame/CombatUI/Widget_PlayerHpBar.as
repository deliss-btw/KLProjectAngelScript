
namespace UWidget_PlayerHpBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PlayerHpBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerHpBar> PlayerHpBar;
    UPROPERTY()
    UWidgetAnimation Anim_DamagePreview;
    UPROPERTY()
    bool bDisableHpReduceAnimOnFirstShown;
    UPROPERTY()
    float32 HpAnimationPlayInterval = 0.88f;
    float NextPlayHpAnimationTime = 0.0;
    FEUIModelWeakRef __PlayerHpBar;
    UPROPERTY()
    FGetEUIModelRef PlayerHpBarDelegate;


    UFUNCTION()
    void HandleHpRatioReduceCounterChanged(const int HpRatioReduceCounter)
    {
        if ((this.bDisableHpReduceAnimOnFirstShown && (HpRatioReduceCounter == 0)))
        {
            return;
        }
        if (this.GetWorld().GetTimeSeconds() >= this.NextPlayHpAnimationTime)
        {
            this.NextPlayHpAnimationTime = (this.GetWorld().GetTimeSeconds() + this.HpAnimationPlayInterval);
            this.PlayAnimation(this.Anim_DamagePreview, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, true);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_PlayerHpBar& local_6;
        TEUIModelRef<FVM_PlayerHpBar> local_2 = this.PlayerHpBar.AsRef();
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
                    this.PlayerHpBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PlayerHpBar::__IndexOf_HpRatioReduceCounter());
                    }
                    if (local_6)
                    {
                        this.HandleHpRatioReduceCounterChanged(local_6.GetHpRatioReduceCounter());
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
                XError(ELog(17), "Remaining observed model change: HandleHpRatioReduceCounterChanged");
            }
            return;
        }
        this.__PlayerHpBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerHpBar.Initialize(this, FName("VM_PlayerHpBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerHpBarDelegate.IsBound())
        {
            this.PlayerHpBar.SetRef(this.PlayerHpBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerHpBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleHpRatioReduceCounterChanged"));
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
