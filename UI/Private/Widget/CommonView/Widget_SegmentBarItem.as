
namespace UWidget_SegmentBarItem
{
    const int ViewID = 0;

}
class UWidget_SegmentBarItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SegmentBarItem> Key;
    UPROPERTY()
    FGetEUIModelRef KeyDelegate;

    UWidget_SegmentBarItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Key.Initialize(this, FName("VM_SegmentBarItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.KeyDelegate.IsBound())
        {
            this.Key.SetRef(this.KeyDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SegmentBarItem
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
