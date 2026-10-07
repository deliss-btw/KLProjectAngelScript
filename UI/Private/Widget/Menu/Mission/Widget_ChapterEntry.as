
namespace UWidget_ChapterEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ChapterEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MissionListEntry> Entry;
    UPROPERTY()
    FGetEUIModelRef EntryDelegate;

    UWidget_ChapterEntry()
    {
        return;
    }
    UFUNCTION()
    void Entry_OnEntryItemClicked() const
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
        this.Entry.Initialize(this, FName("VM_MissionListEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EntryDelegate.IsBound())
        {
            this.Entry.SetRef(this.EntryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChapterEntry
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
