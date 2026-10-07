
namespace UWidget_DialogueOptionList
{
    const int ViewID = 0;

}
class UWidget_DialogueOptionList : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DialogueOptionList> OperationList;
    UPROPERTY()
    FGetEUIModelRef OperationListDelegate;

    UWidget_DialogueOptionList()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.OperationList.Initialize(this, FName("VM_DialogueOptionList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.OperationListDelegate.IsBound())
        {
            this.OperationList.SetRef(this.OperationListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DialogueOptionList
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
