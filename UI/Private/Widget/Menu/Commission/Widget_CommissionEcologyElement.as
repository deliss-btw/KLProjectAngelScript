
namespace UWidget_CommissionEcologyElement
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionEcologyElement : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionEcologyElement> CommissionEcologyElement;
    UPROPERTY()
    FGetEUIModelRef CommissionEcologyElementDelegate;

    UWidget_CommissionEcologyElement()
    {
        return;
    }
    UFUNCTION()
    void CommissionEcologyElement_SelectEcologyElement() const
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
        this.CommissionEcologyElement.Initialize(this, FName("VM_CommissionEcologyElement"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionEcologyElementDelegate.IsBound())
        {
            this.CommissionEcologyElement.SetRef(this.CommissionEcologyElementDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionEcologyElement
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
