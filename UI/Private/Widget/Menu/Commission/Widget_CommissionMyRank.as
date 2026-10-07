
namespace UWidget_CommissionMyRank
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionMyRank : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionMyRank> CommissionMyRank;
    UPROPERTY()
    FGetEUIModelRef CommissionMyRankDelegate;

    UWidget_CommissionMyRank()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionMyRank.Initialize(this, FName("VM_CommissionMyRank"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionMyRankDelegate.IsBound())
        {
            this.CommissionMyRank.SetRef(this.CommissionMyRankDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionMyRank
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
