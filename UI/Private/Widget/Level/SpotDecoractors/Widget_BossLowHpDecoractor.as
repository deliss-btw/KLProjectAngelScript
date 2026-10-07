
namespace UWidget_BossLowHpDecoractor
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BossLowHpDecoractor : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BossLowHpDecoractor> Decoractor;
    UPROPERTY()
    UWidgetAnimation Anim_BossLowHp;
    UPROPERTY()
    bool bAnimPlayed = false;
    UPROPERTY()
    FGetEUIModelRef DecoractorDelegate;


    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.Decoractor)
        {
            if (!(this.bAnimPlayed))
            {
                this.bAnimPlayed = true;
                this.PlayAnimation(this.Anim_BossLowHp, 0.0f, 0, EUMGSequencePlayMode(0), 1.0f, true);
            }
            return;
        }
        if (this.bAnimPlayed)
        {
            this.bAnimPlayed = false;
            this.StopAnimation(this.Anim_BossLowHp);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Decoractor.Initialize(this, FName("VM_BossLowHpDecoractor"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_BossLowHpDecoractor
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
