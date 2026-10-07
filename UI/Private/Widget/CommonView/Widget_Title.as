
namespace UWidget_Title
{
    const int ViewID = 0;

}
class UWidget_Title : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Title> Key;
    UPROPERTY()
    FGetEUIModelRef KeyDelegate;

    UWidget_Title()
    {
        return;
    }
    UFUNCTION()
    FText Key_TitleText() const
    {
        FVM_Title& local_2;
        FText local_12 = local_2 ? local_2.GetTitleText() : FText();
        return local_12;
    }
    UFUNCTION()
    void Key_OnSelected() const
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
        this.Key.Initialize(this, FName("VM_Title"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.KeyDelegate.IsBound())
        {
            this.Key.SetRef(this.KeyDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Title
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
