namespace UWidget_Comp_Matching
{
    const int ViewID = 0;

}
class UWidget_Comp_Matching : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Comp_Matching> Comp_Matching;

    UWidget_Comp_Matching()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Comp_Matching.Initialize(this, FName("VM_Comp_Matching"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_Comp_Matching
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_Comp_Matching;
    Result.ObservedModelChangesSubscriberCount = 0;
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
