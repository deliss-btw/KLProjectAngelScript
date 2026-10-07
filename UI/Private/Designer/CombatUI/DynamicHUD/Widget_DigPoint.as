
namespace UWidget_DigPoint
{
    const int ViewID = 0;

}
class UWidget_DigPoint : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_DigPoint> DigPoint;

    UWidget_DigPoint()
    {
        return;
    }
    UFUNCTION()
    ESlateVisibility DigPoint_SlateVisibilityPanelVisible() const
    {
        FVMS_DigPoint& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.PanelVisibleAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DigPoint.Initialize(this, FName("VMS_DigPoint"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_DigPoint
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
