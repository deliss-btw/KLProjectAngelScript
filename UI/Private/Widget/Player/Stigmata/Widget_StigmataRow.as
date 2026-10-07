
namespace UWidget_StigmataRow
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_StigmataRow : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_StigmataRow> StigmataRow;
    UPROPERTY()
    FGetEUIModelRef StigmataRowDelegate;

    UWidget_StigmataRow()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.StigmataRow.Initialize(this, FName("VM_StigmataRow"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.StigmataRowDelegate.IsBound())
        {
            this.StigmataRow.SetRef(this.StigmataRowDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_StigmataRow
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
