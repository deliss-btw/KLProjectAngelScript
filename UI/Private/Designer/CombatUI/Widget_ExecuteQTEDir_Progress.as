
namespace UWidget_ExecuteQTEDir_Progress
{
    const int ViewID = 0;

}
class UWidget_ExecuteQTEDir_Progress : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Execute_QTEDir> VM_Execute_QTEDir;
    UPROPERTY()
    FGetEUIModelRef VM_Execute_QTEDirDelegate;

    UWidget_ExecuteQTEDir_Progress()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    float32 VM_Execute_QTEDir_QTE_Progress() const
    {
        FVM_Execute_QTEDir& local_2;
        return local_2 ? local_2.GetQTE_Progress() : 0.0f;
    }
    UFUNCTION()
    FText VM_Execute_QTEDir_HintText() const
    {
        FVM_Execute_QTEDir& local_2;
        FText local_12 = local_2 ? local_2.GetHintText() : FText();
        return local_12;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VM_Execute_QTEDir.Initialize(this, FName("VM_Execute_QTEDir"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_Execute_QTEDirDelegate.IsBound())
        {
            this.VM_Execute_QTEDir.SetRef(this.VM_Execute_QTEDirDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ExecuteQTEDir_Progress
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
