
namespace UWidget_TutorialHud
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialHud : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialHud> HudVM;
    UPROPERTY()
    FGetEUIModelRef HudVMDelegate;

    UWidget_TutorialHud()
    {
        return;
    }
    UFUNCTION()
    void HudVM_OnClose() const
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
        this.HudVM.Initialize(this, FName("VM_TutorialHud"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.HudVMDelegate.IsBound())
        {
            this.HudVM.SetRef(this.HudVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialHud
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
