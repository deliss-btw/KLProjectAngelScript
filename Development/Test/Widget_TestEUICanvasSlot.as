
namespace UWidget_TestEUICanvasSlot
{
    const int ViewID = 0;

}
class UWidget_TestEUICanvasSlot : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TestEUICanvasSlot> TestSlot;
    UPROPERTY()
    FGetEUIModelRef TestSlotDelegate;

    UWidget_TestEUICanvasSlot()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.TestSlot.IsValid()))
        {
            return;
        }
        UPanelSlot local_4 = this.Slot;
        UCanvasPanelSlot local_8 = (Cast<UCanvasPanelSlot>(local_4));
        if (local_8 != nullptr)
        {
            FVM_TestEUICanvasSlot& local_10;
            local_8.SetPosition(FVector2D((FMath::IntegerDivisionTrunc(local_10.GetIndex(), 4) * 100), ((local_10.GetIndex() % 4) * 100)));
            local_8.SetAutoSize(true);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TestSlot.Initialize(this, FName("VM_TestEUICanvasSlot"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TestSlotDelegate.IsBound())
        {
            this.TestSlot.SetRef(this.TestSlotDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TestEUICanvasSlot
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
