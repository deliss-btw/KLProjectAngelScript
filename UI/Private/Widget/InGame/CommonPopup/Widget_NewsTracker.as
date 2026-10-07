
namespace UWidget_NewsTracker
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_NewsTracker : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonNewsTicker> NewsTicker;
    UPROPERTY()
    UEUITextBlock w_txt_content;
    UPROPERTY()
    float32 ScrollSpeed = 200.0f;
    float CurrentX;
    float ContainerWidth;
    float TextWidth;
    int RemainingPasses;
    bool bScrollInitialized = false;
    UPROPERTY()
    FGetEUIModelRef NewsTickerDelegate;


    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.NewsTicker.IsValid()) || GetbTickerEnd())
        {
            return;
        }
        if (!(this.bScrollInitialized))
        {
            this.ContainerWidth = MyGeometry.GetLocalSize().X;
            this.TextWidth = this.w_txt_content.GetDesiredSize().X;
            this.CurrentX = this.ContainerWidth;
            this.RemainingPasses = GetRepeatCount();
            this.bScrollInitialized = true;
        }
        this.CurrentX -= (this.ScrollSpeed * InDeltaTime);
        this.w_txt_content.SetRenderTranslation(FVector2D(this.CurrentX, 0.0));
        if (this.CurrentX < -this.TextWidth)
        {
            --this.RemainingPasses;
            if (this.RemainingPasses <= 0)
            {
                bool local_1 = true;
                local_1.SetbTickerEnd();
                return;
            }
            this.CurrentX = this.ContainerWidth;
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.NewsTicker.Initialize(this, FName("VM_CommonNewsTicker"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.NewsTickerDelegate.IsBound())
        {
            this.NewsTicker.SetRef(this.NewsTickerDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_NewsTracker
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
