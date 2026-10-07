
namespace UWidget_SocialSelectTarget
{
    const int ViewID = 0;

}
class UWidget_SocialSelectTarget : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SocialSelectTarget> SelectTargetUI;
    UPROPERTY()
    UImage Image_SelectTargetPoint;

    UWidget_SocialSelectTarget()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        int local_12 = 0;
        if ((FECSEntity(GetTargetPawn()) == ENTITY_NULL))
        {
            return;
        }
        FVector local_42 = local_12.GetPosition();
        Get local_22;
        FVector local_48 = (local_42 + FVector(0.0, 0.0, (local_22.opCall().GetScaledHalfHeight() + 28.0f)));
        FVector2D local_52;
        this.GetOwningPlayer().ProjectWorldLocationToScreen(local_48, local_52, false);
        const FGeometry& local_60 = this.GetParent().GetTickSpaceGeometry();
        FVector2D local_64;
        UPanelSlot local_66 = this.Image_SelectTargetPoint.Slot;
        UCanvasPanelSlot local_70 = (Cast<UCanvasPanelSlot>(local_66));
        Slate::ScreenToWidgetLocal(__GetWorldContext(), local_60, local_52, local_64, false);
        local_70.SetPosition(local_64);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SelectTargetUI.Initialize(this, FName("VMS_SocialSelectTarget"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SocialSelectTarget
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
