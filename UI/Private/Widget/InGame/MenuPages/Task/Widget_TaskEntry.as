
namespace UWidget_TaskEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TaskEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Task> Task;
    UPROPERTY()
    FGetEUIModelRef TaskDelegate;

    UWidget_TaskEntry()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Task.Initialize(this, FName("VM_Task"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TaskDelegate.IsBound())
        {
            this.Task.SetRef(this.TaskDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TaskEntry
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
