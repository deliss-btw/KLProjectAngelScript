
namespace UWidget_DungeonInteractPosSegment
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DungeonInteractPosSegment : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SegmentBarItem> DungeonInteract;
    UPROPERTY()
    FGetEUIModelRef DungeonInteractDelegate;

    UWidget_DungeonInteractPosSegment()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DungeonInteract.Initialize(this, FName("VM_SegmentBarItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DungeonInteractDelegate.IsBound())
        {
            this.DungeonInteract.SetRef(this.DungeonInteractDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DungeonInteractPosSegment
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
