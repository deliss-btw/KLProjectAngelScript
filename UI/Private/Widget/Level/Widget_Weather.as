
namespace UWidget_WeatherTips
{
    const int ViewID = 0;
}
namespace UWidget_Weather
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_WeatherTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Weather> Weather;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Lifetime> Lifetime;
    UPROPERTY()
    FGetEUIModelRef WeatherDelegate;
    UPROPERTY()
    FGetEUIModelRef LifetimeDelegate;

    UWidget_WeatherTips()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.Lifetime && this.Lifetime.opArrow().IsExpired())
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Weather.Initialize(this, FName("VM_Weather"), EEUIWidgetRefModelCreationType(0), false);
        this.Lifetime.Initialize(this, FName("VM_Lifetime"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.WeatherDelegate.IsBound())
        {
            this.Weather.SetRef(this.WeatherDelegate.Execute());
        }
        if (this.LifetimeDelegate.IsBound())
        {
            this.Lifetime.SetRef(this.LifetimeDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_Weather : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Weather> Weather;
    UPROPERTY()
    FGetEUIModelRef WeatherDelegate;

    UWidget_Weather()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Weather.Initialize(this, FName("VM_Weather"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.WeatherDelegate.IsBound())
        {
            this.Weather.SetRef(this.WeatherDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_WeatherTips
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
namespace UWidget_Weather
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
