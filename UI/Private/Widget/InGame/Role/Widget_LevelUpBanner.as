
namespace UWidget_LevelUpBanner
{
    const int ViewID = 0;

}
class UWidget_LevelUpBanner : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_LevelUpBanner> LevelUpBanner;
    UPROPERTY()
    UWidgetAnimation Anim_VX_Icon;
    UPROPERTY()
    UWidgetAnimation Anim_In_LevelUp;
    UPROPERTY()
    UWidgetAnimation Anim_Out_NoLevelUp;
    UPROPERTY()
    bool bIsTicked = false;
    UPROPERTY()
    bool bHasEnd = false;
    UPROPERTY()
    FConfigVM_LevelUpBanner LevelUpBannerConfig;
    UPROPERTY()
    FGetEUIModelRef LevelUpBannerDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.LevelUpBanner.IsValid())
        {
            this.LevelUpBanner.opArrow().SetLevelUpBannerWidget(TWeakObjectPtr<UWidget_LevelUpBanner>(this));
        }
        this.PlayAnimation(this.Anim_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        this.SetRenderOpacity(0.0f);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        int local_4 = 0;
        if (!(this.bIsTicked))
        {
            this.SetRenderOpacity(1.0f);
            this.bIsTicked = true;
        }
        if (this.LevelUpBanner.IsValid())
        {
            FFPTime local_10 = (this.LevelUpBanner.opArrow().GetCurrentTime() + FFPTime(InDeltaTime));
            local_4.SetCurrentTime(local_10);
            if (!(this.bHasEnd) && (FFPTime(this.LevelUpBanner.opArrow().GetCurrentTime()).opCmp(this.LevelUpBanner.opArrow().GetTimeForAnimOut()) >= 0))
            {
                this.StopAllAnimations();
                if (this.Anim_Out_NoLevelUp != nullptr && !(this.LevelUpBanner.opArrow().GetbLevelChanged()))
                {
                    this.PlayAnimation(this.Anim_Out_NoLevelUp, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
                }
                else
                {
                    this.PlayAnimation(this.Anim_Out, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
                }
                this.bHasEnd = true;
            }
        }
        return;
    }
    UFUNCTION()
    void PlayAnim_In_LevelUp()
    {
        this.StopAnimation(this.Anim_In);
        this.PlayAnimation(this.Anim_In_LevelUp, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void PlayAnim_VX_Icon()
    {
        this.PlayAnimation(this.Anim_VX_Icon, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LevelUpBanner.Initialize(this, FName("VM_LevelUpBanner"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.LevelUpBannerDelegate.IsBound())
        {
            this.LevelUpBanner.SetRef(this.LevelUpBannerDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_LevelUpBanner
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
