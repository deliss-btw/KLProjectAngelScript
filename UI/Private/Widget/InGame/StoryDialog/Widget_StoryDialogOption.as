
namespace UWidget_StoryDialogOption
{
    const int ViewID = 0;

}
class UWidget_StoryDialogOption : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_StoryDialogOption> Option;
    UPROPERTY()
    FGetEUIModelRef OptionDelegate;

    UWidget_StoryDialogOption()
    {
        return;
    }
    UFUNCTION()
    FText Option_OptionContent() const
    {
        FVM_StoryDialogOption& local_2;
        FText local_12 = local_2 ? local_2.GetOptionContent() : FText();
        return local_12;
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
    void CodeGenInitProperty()
    {
        this.Option.Initialize(this, FName("VM_StoryDialogOption"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UWidget_StoryDialogOption
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
