
namespace UWidget_CommonBanner
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonBanner : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonBanner> Banner;
    UPROPERTY()
    bool bHasEnd = false;
    UPROPERTY()
    FGetEUIModelRef BannerDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        this.FlushAnimations();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        int local_4 = 0;
        if (this.Banner.IsValid())
        {
            local_4.SetTimeForAnimOut((GetTimeForAnimOut() - InDeltaTime));
            if (!(this.bHasEnd) && (GetTimeForAnimOut() < 0.0f))
            {
                this.bHasEnd = true;
                this.PlayAnimation(this.Anim_Out, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Banner.Initialize(this, FName("VM_CommonBanner"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BannerDelegate.IsBound())
        {
            this.Banner.SetRef(this.BannerDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonBanner
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
