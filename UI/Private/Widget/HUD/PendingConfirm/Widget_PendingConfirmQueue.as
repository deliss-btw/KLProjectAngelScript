
namespace UWidget_PendingConfirmQueue
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PendingConfirmQueue : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PendingConfirmQueue> QueueVM;

    UWidget_PendingConfirmQueue()
    {
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        if (this.QueueVM.IsValid())
        {
            Collapse();
        }
        return;
    }
    UFUNCTION()
    void OnToggleExpand()
    {
        if (this.QueueVM.IsValid())
        {
            ToggleExpanded();
        }
        return;
    }
    UFUNCTION()
    void QueueVM_ShowFullList() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void QueueVM_HideFullList() const
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
        this.QueueVM.Initialize(this, FName("VMS_PendingConfirmQueue"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_PendingConfirmQueue
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
