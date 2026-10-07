
namespace UWidget_StaminaBar
{
    const int ViewID = 0;

}
class UWidget_StaminaBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_StaminaBar> StaminaBar;
    UPROPERTY()
    UProgressBar ProgressBar_Stamina;
    UPROPERTY()
    UWidgetAnimation Ani_LowStaminaHint;
    FEUIModelWeakRef __StaminaBar;
    UPROPERTY()
    FGetEUIModelRef StaminaBarDelegate;

    UWidget_StaminaBar()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnStaminaLowChanged(const bool bIsStaminaLow)
    {
        if (bIsStaminaLow)
        {
            this.PlayAnimation(this.Ani_LowStaminaHint, 0.0f, 0, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
            return;
        }
        this.StopAnimation(this.Ani_LowStaminaHint);
        return;
    }
    UFUNCTION()
    float32 StaminaBar_CurrentStaminaRatio() const
    {
        FVM_StaminaBar& local_2;
        return local_2 ? local_2.GetCurrentStaminaRatio() : 0.0f;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_StaminaBar& local_6;
        TEUIModelRef<FVM_StaminaBar> local_2 = this.StaminaBar.AsRef();
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
                    this.StaminaBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_StaminaBar::__IndexOf_bIsStaminaLow());
                    }
                    if (local_6)
                    {
                        this.OnStaminaLowChanged(local_6.GetbIsStaminaLow());
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
                XError(ELog(17), "Remaining observed model change: OnStaminaLowChanged");
            }
            return;
        }
        this.__StaminaBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.StaminaBar.Initialize(this, FName("VM_StaminaBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.StaminaBarDelegate.IsBound())
        {
            this.StaminaBar.SetRef(this.StaminaBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_StaminaBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnStaminaLowChanged"));
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
