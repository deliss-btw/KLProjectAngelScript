
namespace UWidget_CommonComponentDropDown
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonComponentDropDown : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonComponentDropDown> ComponentDropDown;
    UPROPERTY()
    FGetEUIModelRef ComponentDropDownDelegate;

    UWidget_CommonComponentDropDown()
    {
        return;
    }
    UFUNCTION()
    void ComponentDropDown_OnInnerDropdownSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ComponentDropDown.Initialize(this, FName("VM_CommonComponentDropDown"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ComponentDropDownDelegate.IsBound())
        {
            this.ComponentDropDown.SetRef(this.ComponentDropDownDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonComponentDropDown
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
