
namespace UWidget_AvatarUnlockCondition
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarUnlockCondition : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarAllUnlockConditions> AvatarAllUnlockConditions;
    UPROPERTY()
    FGetEUIModelRef AvatarAllUnlockConditionsDelegate;

    UWidget_AvatarUnlockCondition()
    {
        return;
    }
    UFUNCTION()
    void OnClose()
    {
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarAllUnlockConditions.Initialize(this, FName("VM_AvatarAllUnlockConditions"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarAllUnlockConditionsDelegate.IsBound())
        {
            this.AvatarAllUnlockConditions.SetRef(this.AvatarAllUnlockConditionsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarUnlockCondition
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
