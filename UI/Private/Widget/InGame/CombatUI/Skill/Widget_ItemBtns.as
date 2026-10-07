
namespace UWidget_ItemBtns
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemBtns : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ItemBtns> ItemBts;

    UWidget_ItemBtns()
    {
        return;
    }
    UFUNCTION()
    void OnTriggerRightShoulderPress()
    {
        1.SetbGamepadLeftShoulderPress();
        return;
    }
    UFUNCTION()
    void OnTriggerRightShoulderRelease()
    {
        0.SetbGamepadLeftShoulderPress();
        return;
    }
    UFUNCTION()
    void OnPadChordStarted()
    {
        TestRequireFocus();
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_4.IsValid())
        {
            FCE_CombatHUD local_12;
            FFPTime local_18 = FFPTime(-1);
            local_12.CombatHUDReason = ECombatHUDReason(17);
            local_12.bEnabled = true;
        }
        return;
    }
    UFUNCTION()
    void OnPadChordCompleted()
    {
        TestReleaseFocus();
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_4.IsValid())
        {
            FCE_CombatHUD local_12;
            FFPTime local_18 = FFPTime(-1);
            local_12.CombatHUDReason = ECombatHUDReason(17);
            local_12.bEnabled = false;
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemBts.Initialize(this, FName("VMS_ItemBtns"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_ItemBtns
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
