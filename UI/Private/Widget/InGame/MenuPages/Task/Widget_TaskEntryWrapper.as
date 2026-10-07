
namespace UWidget_TaskEntryWrapper
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TaskEntryWrapper : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TaskEntryWrapper> TaskEntryWrapper;
    UPROPERTY()
    FGetEUIModelRef TaskEntryWrapperDelegate;

    UWidget_TaskEntryWrapper()
    {
        return;
    }
    UFUNCTION()
    FEUIModelRef TaskEntryWrapper_TaskEntry() const
    {
        FVM_TaskEntryWrapper& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetTaskEntry() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    TSoftClassPtr<UUserWidget> TaskEntryWrapper_TaskEntryWidgetClass() const
    {
        FVM_TaskEntryWrapper& local_2;
        TSoftClassPtr<UUserWidget> local_34;
        if (local_2)
        {
            local_34 = local_2.GetTaskEntryWidgetClass();
        }
        else
        {
            local_34 = TSoftClassPtr<UUserWidget>();
        }
        return local_34;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TaskEntryWrapper.Initialize(this, FName("VM_TaskEntryWrapper"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TaskEntryWrapperDelegate.IsBound())
        {
            this.TaskEntryWrapper.SetRef(this.TaskEntryWrapperDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TaskEntryWrapper
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
