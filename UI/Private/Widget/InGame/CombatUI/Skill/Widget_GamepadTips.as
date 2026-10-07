
namespace UWidget_GamepadTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_GamepadTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GamepadTips> GamepadTips;
    UPROPERTY()
    UWidgetAnimation Anim_LB_Pressed;
    UPROPERTY()
    UWidgetAnimation Anim_LB_Released;
    FEUIModelWeakRef __GamepadTips;
    UPROPERTY()
    FGetEUIModelRef GamepadTipsDelegate;

    UWidget_GamepadTips()
    {
        return;
    }
    UFUNCTION()
    void OnGamepadLeftShoulderPressChanged(const bool bGamepadLeftShoulderPress, const bool bHasGuidingTarget)
    {
        if ((this.Anim_LB_Pressed == nullptr || ((this.Anim_LB_Released == nullptr))))
        {
            return;
        }
        if (bGamepadLeftShoulderPress || bHasGuidingTarget)
        {
            this.StopAnimation(this.Anim_LB_Released);
            this.PlayAnimation(this.Anim_LB_Pressed, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        this.StopAnimation(this.Anim_LB_Pressed);
        this.PlayAnimation(this.Anim_LB_Released, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        return;
    }
    UFUNCTION()
    void OnTriggerLeftShoulderPress()
    {
        1.SetbGamepadLeftShoulderPress();
        return;
    }
    UFUNCTION()
    void OnTriggerLeftShoulderRelease()
    {
        0.SetbGamepadLeftShoulderPress();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_GamepadTips& local_6;
        TEUIModelRef<FVM_GamepadTips> local_2 = this.GamepadTips.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.GamepadTips.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_GamepadTips::__IndexOf_bGamepadLeftShoulderPress());
                        local_6.TrackPropertyRead(::FVM_GamepadTips::__IndexOf_bHasGuidingTarget());
                    }
                    if (local_6)
                    {
                        this.OnGamepadLeftShoulderPressChanged(local_6.GetbGamepadLeftShoulderPress(), local_6.GetbHasGuidingTarget());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnGamepadLeftShoulderPressChanged");
            }
            return;
        }
        this.__GamepadTips = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.GamepadTips.Initialize(this, FName("VM_GamepadTips"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.GamepadTipsDelegate.IsBound())
        {
            this.GamepadTips.SetRef(this.GamepadTipsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_GamepadTips
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnGamepadLeftShoulderPressChanged"));
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
