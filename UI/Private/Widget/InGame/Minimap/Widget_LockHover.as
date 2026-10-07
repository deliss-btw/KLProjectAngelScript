
namespace UWidget_LockHover
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_LockHover : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_LockHover> lockhover;
    UPROPERTY()
    FGetEUIModelRef lockhoverDelegate;

    UWidget_LockHover()
    {
        return;
    }
    UFUNCTION()
    FText lockhover_TipText() const
    {
        FVM_LockHover& local_2;
        FText local_12 = local_2 ? local_2.GetTipText() : FText();
        return local_12;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.lockhover.Initialize(this, FName("VM_LockHover"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.lockhoverDelegate.IsBound())
        {
            this.lockhover.SetRef(this.lockhoverDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_LockHover
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
