
namespace UWidget_QualitySelector
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_QualitySelector : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_QualitySelector> Quality;
    UPROPERTY()
    FEUIInputAction IncreaseAction;
    UPROPERTY()
    FEUIInputAction DecreaseAction;
    UPROPERTY()
    FEUIActionBindingHandle IncreaseActionHandle;
    UPROPERTY()
    FEUIActionBindingHandle DecreaseActionHandle;
    UPROPERTY()
    FEUIActionBinding IncreaseClickActionBinding;
    UPROPERTY()
    FEUIActionBinding DecreaseClickActionBinding;
    UPROPERTY()
    UEditableTextBox w_editBox_num;
    UPROPERTY()
    UEUIButtonBase IncreaseButton;
    UPROPERTY()
    UEUIButtonBase DecreaseButton;
    UPROPERTY()
    FGetEUIModelRef QualityDelegate;

    UWidget_QualitySelector()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.IncreaseClickActionBinding.UnRegister();
        this.DecreaseClickActionBinding.UnRegister();
        if (this.IncreaseClickActionBinding.HasAction())
        {
            this.IncreaseClickActionBinding.Register(this, n"ConsumeIncreaseClickInput");
        }
        if (this.DecreaseClickActionBinding.HasAction())
        {
            this.DecreaseClickActionBinding.Register(this, n"ConsumeDecreaseClickInput");
        }
        if (this.IncreaseButton != nullptr)
        {
            this.IncreaseButton.SetInputAction(this.IncreaseAction, false);
        }
        else
        {
            this.IncreaseActionHandle = CommonUI::RegisterUIActionBinding(this, this.IncreaseAction, false, this, n"Quality_IncreaseNumValue");
        }
        if (this.DecreaseButton != nullptr)
        {
            this.DecreaseButton.SetInputAction(this.DecreaseAction, false);
            return;
        }
        this.DecreaseActionHandle = CommonUI::RegisterUIActionBinding(this, this.DecreaseAction, false, this, n"Quality_DecreaseNumValue");
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.IncreaseActionHandle.Reset();
        this.DecreaseActionHandle.Reset();
        this.IncreaseClickActionBinding.UnRegister();
        this.DecreaseClickActionBinding.UnRegister();
        return;
    }
    UFUNCTION()
    void ConsumeIncreaseClickInput()
    {
        return;
    }
    UFUNCTION()
    void ConsumeDecreaseClickInput()
    {
        return;
    }
    UFUNCTION()
    void OnInputText(const FText &inout Text)
    {
        FString local_8 = Text.ToString();
        if (local_8.IsNumeric())
        {
            int local_11 = String::Conv_StringToInt(local_8);
            SetCurrentNumValue();
        }
        if (this.w_editBox_num != nullptr)
        {
            FNumberFormattingOptions local_20;
            local_20.SetMaximumFractionalDigits(0);
            this.w_editBox_num.SetText(FText::AsNumber(GetCurrentNum(), local_20));
        }
        return;
    }
    UFUNCTION()
    void Quality_SetCurrentNumValue(const int InNum) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(InNum);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_IncreaseNumValue() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_DecreaseNumValue() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_BeginLongPressIncrease() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_BeginLongPressDecrease() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_EndLongPress() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_EndLongPressIncrease() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_EndLongPressDecrease() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Quality_SetCurrentNumRatio(const float32 Ratio) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Ratio);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Quality.Initialize(this, FName("VM_QualitySelector"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.QualityDelegate.IsBound())
        {
            this.Quality.SetRef(this.QualityDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_QualitySelector
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
