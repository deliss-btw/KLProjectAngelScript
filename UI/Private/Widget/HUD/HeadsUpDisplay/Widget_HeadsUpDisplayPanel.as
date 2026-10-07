
namespace UWidget_HeadsUpDisplayPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_HeadsUpDisplayPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_HeadsUpDisplayList> HeadsUpDisplayList;
    UPROPERTY()
    UEUIDynamicEntryBox DynamicEntryBox;
    UPROPERTY()
    FGetEUIModelRef HeadsUpDisplayListDelegate;

    UWidget_HeadsUpDisplayPanel()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UWidget_HeadsUpDisplayProxy local_20;
        for (auto local_16 : this.DynamicEntryBox.GetAllEntries())
        {
            local_20 = Cast<UWidget_HeadsUpDisplayProxy>(local_16);
            if (local_20 != nullptr)
            {
                local_20.UpdateDisplay();
            }
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.HeadsUpDisplayList.Initialize(this, FName("VM_HeadsUpDisplayList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HeadsUpDisplayListDelegate.IsBound())
        {
            this.HeadsUpDisplayList.SetRef(this.HeadsUpDisplayListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_HeadsUpDisplayPanel
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
