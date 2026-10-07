
namespace UWidget_CommissionLeaderBoardItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionLeaderBoardItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionLeaderboardItem> CommissionLeaderboardItem;
    UPROPERTY()
    FGetEUIModelRef CommissionLeaderboardItemDelegate;

    UWidget_CommissionLeaderBoardItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionLeaderboardItem.Initialize(this, FName("VM_CommissionLeaderboardItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionLeaderboardItemDelegate.IsBound())
        {
            this.CommissionLeaderboardItem.SetRef(this.CommissionLeaderboardItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionLeaderBoardItem
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
