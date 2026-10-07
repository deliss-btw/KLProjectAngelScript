
namespace UWidget_CustomSkillEnergy_ProgressBar_Item
{
    const int ViewID = 0;

}
class UWidget_CustomSkillEnergy_ProgressBar_Item : UEUIUserWidget
{
    UPROPERTY()
    UProgressBar ProgressBar_EnergyItem;
    UPROPERTY()
    UImage Image_EnergyHint;
    UPROPERTY()
    UWidgetAnimation Ani_EnergyHint;
    UPROPERTY()
    FLinearColor ProgressFullColor = FLinearColor(0.46f, 0.0f, 0.6f, 1.0f);
    UPROPERTY()
    FLinearColor ProgressNoFullColor = FLinearColor(0.69f, 0.24f, 1.0f, 1.0f);
    UPROPERTY()
    float32 ProgressRatio = 0.0f;
    UPROPERTY()
    bool bIsEnergyFull = false;


    UFUNCTION()
    void SetProgressRatio(const float32 NewProgressRatio)
    {
        this.ProgressRatio = NewProgressRatio;
        if (this.ProgressRatio >= 1.0f)
        {
            this.ProgressBar_EnergyItem.SetFillColorAndOpacity(this.ProgressFullColor);
            if (!(this.bIsEnergyFull))
            {
                this.bIsEnergyFull = true;
                this.PlayAnimation(this.Ani_EnergyHint, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
            return;
        }
        this.ProgressBar_EnergyItem.SetFillColorAndOpacity(this.ProgressNoFullColor);
        if (this.bIsEnergyFull)
        {
            this.bIsEnergyFull = false;
            this.PlayAnimation(this.Ani_EnergyHint, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
}

namespace UWidget_CustomSkillEnergy_ProgressBar_Item
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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
