
namespace UWidget_DialogueOptionItem
{
    const int ViewID = 0;

}
class UWidget_DialogueOptionItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DialogueOptionItem> Option;
    UPROPERTY()
    UImage w_img_bg;
    UPROPERTY()
    FGetEUIModelRef OptionDelegate;

    UWidget_DialogueOptionItem()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.Option.IsValid())
        {
            if (this.Option.opArrow().GetOptionInfo().GetOptionStyle().IsSet())
            {
                this.w_img_bg.SetBrushTintColor(FSlateColor());
                return;
            }
            this.w_img_bg.SetBrushTintColor(FSlateColor(FLinearColor::Black));
        }
        return;
    }
    UFUNCTION()
    void Option_SelectOption() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Option_OnSelected() const
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
        this.Option.Initialize(this, FName("VM_DialogueOptionItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.OptionDelegate.IsBound())
        {
            this.Option.SetRef(this.OptionDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DialogueOptionItem
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
