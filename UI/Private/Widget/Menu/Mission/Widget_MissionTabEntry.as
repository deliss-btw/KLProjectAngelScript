
namespace UWidget_MissionTabEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MissionTabEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionTabEntry> EntryInfo;
    UPROPERTY()
    FGetEUIModelRef EntryInfoDelegate;

    UWidget_MissionTabEntry()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EntryInfo.Initialize(this, FName("VM_MissionTabEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntryInfoDelegate.IsBound())
        {
            this.EntryInfo.SetRef(this.EntryInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MissionTabEntry
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
