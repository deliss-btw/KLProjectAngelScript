
namespace UWidget_CommonConsume
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonConsume : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonConsume> CommonConsume;
    UPROPERTY()
    FGetEUIModelRef CommonConsumeDelegate;

    UWidget_CommonConsume()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonConsume.Initialize(this, FName("VM_CommonConsume"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonConsumeDelegate.IsBound())
        {
            this.CommonConsume.SetRef(this.CommonConsumeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonConsume
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
