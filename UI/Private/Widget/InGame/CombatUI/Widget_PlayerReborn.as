
namespace UWidget_PlayerReborn
{
    const int ViewID = 0;

}
class UWidget_PlayerReborn : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerReborn> VM_NearDeath;
    UPROPERTY()
    FGetEUIModelRef VM_NearDeathDelegate;

    UWidget_PlayerReborn()
    {
        return;
    }
    UFUNCTION()
    void VM_NearDeath_RebornInSitu() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void VM_NearDeath_RebornInNearRevive() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void VM_NearDeath_RebornInNearTeleport() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void VM_NearDeath_RebornInOtherRevive() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void VM_NearDeath_OnNeedHelp() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void VM_NearDeath_OnBackToCity() const
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
        this.VM_NearDeath.Initialize(this, FName("VM_PlayerReborn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.VM_NearDeathDelegate.IsBound())
        {
            this.VM_NearDeath.SetRef(this.VM_NearDeathDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerReborn
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
