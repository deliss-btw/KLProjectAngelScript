
namespace UWidget_ChallengeDungeonInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ChallengeDungeonInfo : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChallengeDungeonInfo> Info;
    UPROPERTY()
    FGetEUIModelRef InfoDelegate;

    UWidget_ChallengeDungeonInfo()
    {
        return;
    }
    UFUNCTION()
    void Info_StartDungeon() const
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
        this.Info.Initialize(this, FName("VM_ChallengeDungeonInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InfoDelegate.IsBound())
        {
            this.Info.SetRef(this.InfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChallengeDungeonInfo
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
