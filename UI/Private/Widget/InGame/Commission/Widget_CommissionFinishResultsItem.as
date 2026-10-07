
namespace UWidget_CommissionFinishResultsItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionFinishResultsItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionFinishResurltItem> ResurltItem;
    UPROPERTY()
    FGetEUIModelRef ResurltItemDelegate;

    UWidget_CommissionFinishResultsItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ResurltItem.Initialize(this, FName("VM_CommissionFinishResurltItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ResurltItemDelegate.IsBound())
        {
            this.ResurltItem.SetRef(this.ResurltItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionFinishResultsItem
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
