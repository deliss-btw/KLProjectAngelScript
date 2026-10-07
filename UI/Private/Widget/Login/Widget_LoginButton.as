
namespace UWidget_LoginButton
{
    const int ViewID = 0;

}
class UWidget_LoginButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_LoginButton> LoginButtonVM;
    UPROPERTY()
    UEUIButton ClickBtn;
    UPROPERTY()
    UWidgetSwitcher BtnStateSwitcher;
    FOnButtonClickedEvent OnClickDelegate;
    UPROPERTY()
    bool bIsHover = false;
    UPROPERTY()
    FGetEUIModelRef LoginButtonVMDelegate;


    UFUNCTION()
    void OnHover()
    {
        if (!(this.bIsHover))
        {
            this.bIsHover = true;
            this.BtnStateSwitcher.SetActiveWidgetIndex(1);
        }
        return;
    }
    UFUNCTION()
    void OnUnhover()
    {
        if (this.bIsHover)
        {
            this.bIsHover = false;
            this.BtnStateSwitcher.SetActiveWidgetIndex(0);
        }
        return;
    }
    UFUNCTION()
    void OnClick()
    {
        if (this.OnClickDelegate.IsBound())
        {
            this.OnClickDelegate.Broadcast();
        }
        return;
    }
    UFUNCTION()
    void LoginButtonVM_OnButtonClick() const
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
        this.LoginButtonVM.Initialize(this, FName("VM_LoginButton"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.LoginButtonVMDelegate.IsBound())
        {
            this.LoginButtonVM.SetRef(this.LoginButtonVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_LoginButton
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
