
namespace UWidget_PositionMarkPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PositionMarkPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PositionMarkList> PositionMarkList;
    UPROPERTY()
    UEUIDynamicEntryBox PositionMarkEntryBox;
    UPROPERTY()
    FGetEUIModelRef PositionMarkListDelegate;

    UWidget_PositionMarkPanel()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UWidget_PositionMarkViewportDisplay local_20;
        for (auto local_16 : this.PositionMarkEntryBox.GetAllEntries())
        {
            local_20 = Cast<UWidget_PositionMarkViewportDisplay>(local_16);
            if (local_20 != nullptr)
            {
                local_20.UpdatePosition();
            }
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PositionMarkList.Initialize(this, FName("VM_PositionMarkList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PositionMarkListDelegate.IsBound())
        {
            this.PositionMarkList.SetRef(this.PositionMarkListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PositionMarkPanel
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
