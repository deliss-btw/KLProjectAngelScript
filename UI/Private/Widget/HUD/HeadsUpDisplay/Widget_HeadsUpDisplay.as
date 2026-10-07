
namespace UWidget_HeadsUpDisplay
{
    const int ViewID = 0;
}
namespace UWidget_HeadsUpDisplayProxy
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_HeadsUpDisplay : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_HeadsUpDisplay> HeadsUpDisplay;
    UPROPERTY()
    FGetEUIModelRef HeadsUpDisplayDelegate;

    UWidget_HeadsUpDisplay()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.HeadsUpDisplay.Initialize(this, FName("VM_HeadsUpDisplay"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HeadsUpDisplayDelegate.IsBound())
        {
            this.HeadsUpDisplay.SetRef(this.HeadsUpDisplayDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_HeadsUpDisplayProxy : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_HeadsUpDisplay> HeadsUpDisplay;
    UPROPERTY()
    FGetEUIModelRef HeadsUpDisplayDelegate;

    UWidget_HeadsUpDisplayProxy()
    {
        return;
    }
    void UpdateDisplay()
    {
        if (this.HeadsUpDisplay)
        {
            FVector2D local_6;
            if (::PresentationSpotUtils::ConvertSpotPositionToRenderTranslation(this.HeadsUpDisplay.opArrow().GetSpot(), local_6, FVector::ZeroVector))
            {
                this.SetRenderTranslation(local_6);
                this.SetRenderOpacity(1.0f);
                return;
            }
        }
        this.SetRenderOpacity(0.0f);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.HeadsUpDisplay.Initialize(this, FName("VM_HeadsUpDisplay"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HeadsUpDisplayDelegate.IsBound())
        {
            this.HeadsUpDisplay.SetRef(this.HeadsUpDisplayDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_HeadsUpDisplay
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
namespace UWidget_HeadsUpDisplayProxy
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
