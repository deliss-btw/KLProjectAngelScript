
namespace UWidget_SystemControlEntrance
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SystemControlEntrance : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SystemControlEntrance> SystemControlEntrance;
    UPROPERTY()
    FConfigVM_SystemControlEntrance SystemControlEntranceConfig;
    UPROPERTY()
    FGetEUIModelRef SystemControlEntranceDelegate;

    UWidget_SystemControlEntrance()
    {
        return;
    }
    UFUNCTION()
    void SystemControlEntrance_OpenPage() const
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
        this.SystemControlEntrance.Initialize(this, FName("VM_SystemControlEntrance"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SystemControlEntranceDelegate.IsBound())
        {
            this.SystemControlEntrance.SetRef(this.SystemControlEntranceDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SystemControlEntrance
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
