
namespace UWidget_DynamicButton
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DynamicButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InputAction> Action;
    UPROPERTY()
    FGetEUIModelRef ActionDelegate;

    UWidget_DynamicButton()
    {
        return;
    }
    UFUNCTION()
    void ExecuteAction()
    {
        this.Action_ExecuteAction();
        return;
    }
    UFUNCTION()
    void Action_ExecuteAction() const
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
        this.Action.Initialize(this, FName("VM_InputAction"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ActionDelegate.IsBound())
        {
            this.Action.SetRef(this.ActionDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DynamicButton
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
