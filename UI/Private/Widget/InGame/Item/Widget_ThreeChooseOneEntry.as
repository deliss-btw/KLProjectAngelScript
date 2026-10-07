
namespace UWidget_ThreeChooseOneEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ThreeChooseOneEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ThreeChooseOneEntry> VM_Entry;
    UPROPERTY()
    FGetEUIModelRef VM_EntryDelegate;

    UWidget_ThreeChooseOneEntry()
    {
        return;
    }
    UFUNCTION()
    void OnMouseEnter_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        this.VM_Entry.opArrow().SetbIsHovered(true);
        return;
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        this.VM_Entry.opArrow().SetbIsHovered(false);
        return;
    }
    UFUNCTION()
    void VM_Entry_OnClickEntry() const
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
        this.VM_Entry.Initialize(this, FName("VM_ThreeChooseOneEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_EntryDelegate.IsBound())
        {
            this.VM_Entry.SetRef(this.VM_EntryDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ThreeChooseOneEntry
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
