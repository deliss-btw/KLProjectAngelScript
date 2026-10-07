
namespace UWidget_TutorialHandbookEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialHandbookEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialHandbookEntry> EntryVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    FGetEUIModelRef EntryVMDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UWidget_TutorialHandbookEntry()
    {
        return;
    }
    UFUNCTION()
    void OnEntryClicked()
    {
        this.EntryVM.opArrow().OnClicked();
        return;
    }
    UFUNCTION()
    void OnEntryHovered()
    {
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        FMsg_TutorialHandbookEntryHovered local_2;
        TEUIModelWeakRef<FVM_TutorialHandbookEntry> local_8;
        local_2.HoveredEntry = local_8;
        local_2.bHovered = true;
        return;
    }
    UFUNCTION()
    void OnEntryUnhovered()
    {
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        FMsg_TutorialHandbookEntryHovered local_2;
        local_2.bHovered = false;
        return;
    }
    UFUNCTION()
    void EntryVM_OnClicked() const
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
        this.EntryVM.Initialize(this, FName("VM_TutorialHandbookEntry"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntryVMDelegate.IsBound())
        {
            this.EntryVM.SetRef(this.EntryVMDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialHandbookEntry
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
