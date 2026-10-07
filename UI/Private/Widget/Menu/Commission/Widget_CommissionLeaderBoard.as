
namespace UWidget_CommissionLeaderBoard
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionLeaderBoard : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionLeaderboard> CommissionLeaderboard;
    UPROPERTY()
    FGetEUIModelRef CommissionLeaderboardDelegate;

    UWidget_CommissionLeaderBoard()
    {
        return;
    }
    UFUNCTION()
    void CommissionLeaderboard_OnCommissionDropdownSelected(const int SelectedIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SelectedIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionLeaderboard.Initialize(this, FName("VM_CommissionLeaderboard"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionLeaderboardDelegate.IsBound())
        {
            this.CommissionLeaderboard.SetRef(this.CommissionLeaderboardDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionLeaderBoard
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
