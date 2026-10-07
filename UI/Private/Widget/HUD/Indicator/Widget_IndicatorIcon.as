
namespace UWidget_IndicatorIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_IndicatorIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Indicator> Indicator;
    UPROPERTY()
    UWidget IndicatorIcon;
    UPROPERTY()
    UWidget IndicatorArrow;
    UPROPERTY()
    UWidget UpperOnlyWidget;
    UPROPERTY()
    UWidget LowerOnlyWidget;
    UPROPERTY()
    UIndicatorSettings Settings;
    UPROPERTY()
    FGetEUIModelRef IndicatorDelegate;

    UWidget_IndicatorIcon()
    {
        return;
    }
    UFUNCTION()
    void OnInitialized_Implementation()
    {
        GetGameplaySettings<UIndicatorSettings> local_2;
        this.Settings = local_2;
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        int local_25;
        int local_26;
        if (!(this.Indicator) || this.IsFadingOut())
        {
            return;
        }
        float32 local_11 = ::IndicatorUtils::ProjectSpotToIndicatorAngle(this.Indicator.opArrow().GetIndicatorLocation(), this.GetOwningPlayer());
        this.IndicatorArrow.SetRenderTransformAngle(local_11);
        UPanelSlot local_14 = this.IndicatorIcon.Slot;
        UCanvasPanelSlot local_18 = (Cast<UCanvasPanelSlot>(local_14));
        if (local_18 != nullptr)
        {
            float32 local_12 = local_11 - 90.0f;
            float32 local_19 = FMath::DegreesToRadians(local_12);
            FVector2f local_22;
            FMath::SinCos(local_22.Y, local_22.X, local_19);
            local_12 = local_22.X;
            local_12 = local_12 * this.Settings.EllipseMajorAxisRatio;
            float32 local_20 = local_22.Y * this.Settings.EllipseMinorAxisRatio;
            if (this.UpperOnlyWidget != nullptr)
            {
                local_20 = local_22.Y;
                if (local_20 < 0.0f)
                {
                    local_26 = 4;
                    local_25 = local_26;
                }
                else
                {
                    local_26 = 1;
                    local_25 = local_26;
                }
                this.UpperOnlyWidget.SetVisibility(ESlateVisibility(local_25));
            }
            if (this.LowerOnlyWidget != nullptr)
            {
                local_12 = local_22.Y;
                if (local_12 >= 0.0f)
                {
                    local_26 = 4;
                    local_25 = local_26;
                }
                else
                {
                    local_26 = 1;
                    local_25 = local_26;
                }
                this.LowerOnlyWidget.SetVisibility(ESlateVisibility(local_25));
            }
            FVector2f local_32 = (local_22 + FVector2f::UnitVector);
            FVector2f local_34 = (local_32 / 2.0f);
            local_12 = local_34.Y;
            local_20 = local_34.X;
            local_18.SetAnchors(FAnchors(local_20, local_12));
            local_18.SetPosition(FVector2D::ZeroVector);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Indicator.Initialize(this, FName("VM_Indicator"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.IndicatorDelegate.IsBound())
        {
            this.Indicator.SetRef(this.IndicatorDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_IndicatorIcon
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
