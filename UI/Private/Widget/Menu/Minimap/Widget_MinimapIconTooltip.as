
namespace UWidget_MinimapIconTooltip
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MinimapIconTooltip : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MinimapIconTooltip> MinimapIconTooltip;
    UPROPERTY()
    FGetEUIModelRef MinimapIconTooltipDelegate;

    UWidget_MinimapIconTooltip()
    {
        return;
    }
    UFUNCTION()
    void MinimapIconTooltip_GuideToTarget() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapIconTooltip_TeleportToTarget() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MinimapIconTooltip_MarkTarget() const
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
        this.MinimapIconTooltip.Initialize(this, FName("VM_MinimapIconTooltip"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MinimapIconTooltipDelegate.IsBound())
        {
            this.MinimapIconTooltip.SetRef(this.MinimapIconTooltipDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MinimapIconTooltip
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
