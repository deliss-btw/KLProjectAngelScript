
namespace UWidget_DungeonInteract
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DungeonInteract : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DungeonEnterInteract> DungeonInteract;
    UPROPERTY()
    UUserWidget RootPanel;
    UPROPERTY()
    FGetEUIModelRef DungeonInteractDelegate;

    UWidget_DungeonInteract()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        bool local_23 = false;
        if (this.RootPanel != nullptr)
        {
            float32 local_24;
            FECSEntity local_8 = FECSEntity(UECSFunctionLibraryExtension::GetLocalPlayerPawnEntity(__GetWorldContext()));
            if (!(ECS::GetECSWorld().IsValid()))
            {
                return;
            }
            if ((local_8 == ENTITY_NULL))
            {
                return;
            }
            APlayerController local_20 = this.GetOwningPlayer();
            FVector local_30;
            FText local_34;
            local_23 = ::FInteractUtils::GetCurrentInteractProgressInfoForUI(local_8, local_30, local_24, local_34);
            this.SetInteractTargetWidgetPosition(local_20, this.RootPanel, local_30);
        }
        return;
    }
    void SetInteractTargetWidgetPosition(const APlayerController PlayerController, const UUserWidget Widget, const FVector &inout Position3D)
    {
        FVector2D local_4;
        PlayerController.ProjectWorldLocationToScreen(Position3D, local_4, true);
        local_4 /= (WidgetLayout::GetViewportScale(__GetWorldContext()) * 1.0f);
        UPanelSlot local_18 = Widget.Slot;
        Cast<UCanvasPanelSlot>(local_18).SetPosition(local_4);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DungeonInteract.Initialize(this, FName("VM_DungeonEnterInteract"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DungeonInteractDelegate.IsBound())
        {
            this.DungeonInteract.SetRef(this.DungeonInteractDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DungeonInteract
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
