
namespace UWidget_CommissionPanelEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionPanelEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionEntry> CommissionEntry;
    UPROPERTY()
    FConfigVM_CommissionEntry CommissionEntryConfig;
    UPROPERTY()
    FGetEUIModelRef CommissionEntryDelegate;

    UWidget_CommissionPanelEntry()
    {
        return;
    }
    UFUNCTION()
    void CommissionEntry_GotoCommissionPanel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionEntry.Initialize(this, FName("VM_CommissionEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionEntryDelegate.IsBound())
        {
            this.CommissionEntry.SetRef(this.CommissionEntryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionPanelEntry
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
