
namespace UWidget_NavigationBarIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_NavigationBarIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_NavigationBarIcon> NavigationBarIcon;
    UPROPERTY()
    UCanvasPanel IconCanvas;
    UPROPERTY()
    UWidget Icon;
    UPROPERTY()
    UWidget FirstCenteredVisibleArea;
    UPROPERTY()
    UWidget_NavigationBar OwningNavigationBar;
    UPROPERTY()
    FGetEUIModelRef NavigationBarIconDelegate;

    UWidget_NavigationBarIcon()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.OwningNavigationBar = (Cast<UWidget_NavigationBar>(this.GetOuter().GetOuter()));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UPanelSlot local_30;
        APlayerCameraManager local_4 = this.GetOwningPlayerCameraManager();
        if (local_4 != nullptr)
        {
            ::PresentationSpotUtils::GetSpotLocation(this.NavigationBarIcon.opArrow().GetSpot());
            float32 local_21 = local_4.GetFOVAngle();
            local_4.GetCameraLocation();
            FRotator local_28 = local_4.GetCameraRotation();
            local_30 = this.Icon.Slot;
            this.SetIsAtCenter(::UWidget_NavigationBar::UpdateNavigationCanvasSlotAndReturnIfAtCenter(this.IconCanvas, Cast<UCanvasPanelSlot>(local_30)));
        }
        if (this.OwningNavigationBar.IsFirstCenteredNavigationBarIcon(this))
        {
            this.FirstCenteredVisibleArea.SetVisibility(ESlateVisibility(4));
            return;
        }
        this.FirstCenteredVisibleArea.SetVisibility(ESlateVisibility(1));
        return;
    }
    void SetIsAtCenter(const bool bIsAtCenter)
    {
        this.OwningNavigationBar.SetNavigationBarIconIsCentered(this, bIsAtCenter);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.NavigationBarIcon.Initialize(this, FName("VM_NavigationBarIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.NavigationBarIconDelegate.IsBound())
        {
            this.NavigationBarIcon.SetRef(this.NavigationBarIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_NavigationBarIcon
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
