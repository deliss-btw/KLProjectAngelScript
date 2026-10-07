
namespace UWidget_ItemOperationEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemOperationEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemOperationItem> OperationItem;
    UPROPERTY()
    FGetEUIModelRef OperationItemDelegate;

    UWidget_ItemOperationEntry()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.OperationItem.opArrow().SetMyWidget(TWeakObjectPtr<UWidget>(this));
        return;
    }
    UFUNCTION()
    void OperationItem_ExpandOperation() const
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
        this.OperationItem.Initialize(this, FName("VM_ItemOperationItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.OperationItemDelegate.IsBound())
        {
            this.OperationItem.SetRef(this.OperationItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemOperationEntry
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
