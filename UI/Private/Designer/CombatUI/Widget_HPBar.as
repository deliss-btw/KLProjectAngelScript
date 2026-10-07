
namespace UWidget_HPBar
{
    const int ViewID = 0;

}
class UWidget_HPBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_HPBar> HPBar;
    UPROPERTY()
    UProgressBar ProgressBar_HP;
    UPROPERTY()
    UWidgetAnimation Ani_LowHPHint;
    UPROPERTY()
    UTextBlock Text_HPBarNum;
    UPROPERTY()
    TArray<FLinearColor> HPColorConfig;
    FEUIModelWeakRef __HPBar;
    UPROPERTY()
    FGetEUIModelRef HPBarDelegate;

    UWidget_HPBar()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnHPLowChanged(const bool bIsHPLow, const float32 CurrentHPRatio)
    {
        if (bIsHPLow)
        {
            float32 local_2 = (0.4f - CurrentHPRatio) * 3.0f;
            this.PlayAnimation(this.Ani_LowHPHint, 0.0f, 0, EUMGSequencePlayMode(0), (local_2 + 1.0f), false);
            return;
        }
        this.StopAnimation(this.Ani_LowHPHint);
        return;
    }
    UFUNCTION()
    void HandleCurrentHPBarSegmentIndexChanged(const int CurrentHPBarSegmentIndex)
    {
        if (CurrentHPBarSegmentIndex == 0)
        {
            return;
        }
        if (CurrentHPBarSegmentIndex == 1)
        {
            this.Text_HPBarNum.SetVisibility(ESlateVisibility(2));
        }
        else
        {
            this.Text_HPBarNum.SetVisibility(ESlateVisibility(0));
            this.Text_HPBarNum.SetText(FText::FromString((FString("Г— ") + CurrentHPBarSegmentIndex)));
        }
        FProgressBarStyle local_156 = this.ProgressBar_HP.GetWidgetStyle();
        local_156.BackgroundImage.TintColor.SpecifiedColor = this.HPColorConfig[CurrentHPBarSegmentIndex - 1];
        return;
    }
    UFUNCTION()
    float32 HPBar_CurrentHPRatio() const
    {
        FVM_HPBar& local_2;
        return local_2 ? local_2.GetCurrentHPRatio() : 0.0f;
    }
    UFUNCTION()
    FText HPBar_HPInfo() const
    {
        FVM_HPBar& local_2;
        FText local_12 = local_2 ? local_2.GetHPInfo() : FText();
        return local_12;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_HPBar& local_6;
        TEUIModelRef<FVM_HPBar> local_2 = this.HPBar.AsRef();
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
                    this.HPBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_HPBar::__IndexOf_bIsHPLow());
                        local_6.TrackPropertyRead(::FVM_HPBar::__IndexOf_CurrentHPRatio());
                    }
                    if (local_6)
                    {
                        this.OnHPLowChanged(local_6.GetbIsHPLow(), int(local_6.GetCurrentHPRatio()));
                    }
                    this.HPBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_HPBar::__IndexOf_CurrentHPBarSegmentIndex());
                    }
                    if (local_6)
                    {
                        this.HandleCurrentHPBarSegmentIndexChanged(local_6.GetCurrentHPBarSegmentIndex());
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
                XError(ELog(17), "Remaining observed model change: OnHPLowChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleCurrentHPBarSegmentIndexChanged");
            }
            return;
        }
        this.__HPBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.HPBar.Initialize(this, FName("VM_HPBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HPBarDelegate.IsBound())
        {
            this.HPBar.SetRef(this.HPBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_HPBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHPLowChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCurrentHPBarSegmentIndexChanged"));
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
