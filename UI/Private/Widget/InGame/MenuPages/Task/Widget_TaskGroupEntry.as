
namespace UWidget_TaskGroupEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TaskGroupEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TaskGroup> TaskGroup;
    UPROPERTY()
    FGetEUIModelRef TaskGroupDelegate;

    UWidget_TaskGroupEntry()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> TaskGroup_TaskList() const
    {
        FVM_TaskGroup& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetTaskList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TaskGroup.Initialize(this, FName("VM_TaskGroup"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TaskGroupDelegate.IsBound())
        {
            this.TaskGroup.SetRef(this.TaskGroupDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TaskGroupEntry
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
