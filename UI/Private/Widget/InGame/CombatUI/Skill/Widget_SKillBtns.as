
namespace UWidget_SkillBtns
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SkillBtns : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillBtns> SkillBts;
    UPROPERTY()
    bool bGamepadSkillBtnsPanel = false;
    UPROPERTY()
    FEUIInputAction RightShoulderInputAction;
    UPROPERTY()
    UWidgetAnimation Anim_Out_In;
    UPROPERTY()
    UWidgetAnimation Anim_RB_Pressed;
    UPROPERTY()
    UWidgetAnimation Anim_RB_Released;
    FEUIActionBinding RightShoulderPressBinding;
    FEUIActionBinding RightShoulderReleaseBinding;
    FEUIModelWeakRef __SkillBts;


    UFUNCTION()
    void Construct_Implementation()
    {
        if (this.bGamepadSkillBtnsPanel)
        {
            this.RightShoulderPressBinding.UnRegister();
            this.RightShoulderPressBinding.SetInputAction(this.RightShoulderInputAction.EnhancedAction);
            this.RightShoulderPressBinding.SetInputEvent(EInputEvent(0));
            this.RightShoulderPressBinding.Register(this, n"OnTriggerRightShoulderPress");
            this.RightShoulderPressBinding.SetConsumesInput(false);
            this.RightShoulderReleaseBinding.UnRegister();
            this.RightShoulderReleaseBinding.SetInputAction(this.RightShoulderInputAction.EnhancedAction);
            this.RightShoulderReleaseBinding.SetInputEvent(EInputEvent(1));
            this.RightShoulderReleaseBinding.Register(this, n"OnTriggerRightShoulderRelease");
            this.RightShoulderReleaseBinding.SetConsumesInput(false);
        }
        return;
    }
    UFUNCTION()
    void OnTriggerRightShoulderPress()
    {
        1.SetbGamepadRightShoulderInputPress();
        FECSEntity local_6 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_6.IsValid())
        {
            FCE_CombatHUD local_12;
            FFPTime local_18 = FFPTime(-1);
            local_12.CombatHUDReason = ECombatHUDReason(18);
            local_12.bEnabled = (1 != 0);
        }
        return;
    }
    UFUNCTION()
    void OnTriggerRightShoulderRelease()
    {
        0.SetbGamepadRightShoulderInputPress();
        FECSEntity local_6 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_6.IsValid())
        {
            FCE_CombatHUD local_12;
            FFPTime local_18 = FFPTime(-1);
            local_12.CombatHUDReason = ECombatHUDReason(18);
            local_12.bEnabled = (0 != 0);
        }
        return;
    }
    UFUNCTION()
    void OnGamepadRightShoulderPressChanged(const bool bGamepadRightShoulderPress)
    {
        if ((this.Anim_RB_Pressed == nullptr || ((this.Anim_RB_Released == nullptr))))
        {
            return;
        }
        if (bGamepadRightShoulderPress)
        {
            this.StopAnimation(this.Anim_RB_Released);
            this.PlayAnimation(this.Anim_RB_Pressed, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        this.StopAnimation(this.Anim_RB_Pressed);
        this.PlayAnimation(this.Anim_RB_Released, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        return;
    }
    UFUNCTION()
    void OnPlayerPawnEntityChanged(const FECSEntity &inout CurPawnEntity)
    {
        if (this.Anim_Out_In != nullptr)
        {
            this.PlayAnimation(this.Anim_Out_In, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    ESlateVisibility SkillBts_SkillBtnsPanelVisibility() const
    {
        FVMS_SkillBtns& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.SkillBtnsPanelVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_SkillBtns& local_6;
        TEUIModelRef<FVMS_SkillBtns> local_2 = this.SkillBts.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.SkillBts.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_SkillBtns::__IndexOf_bGamepadRightShoulderPress());
                    }
                    if (local_6)
                    {
                        this.OnGamepadRightShoulderPressChanged(local_6.GetbGamepadRightShoulderPress());
                    }
                    this.SkillBts.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_SkillBtns::__IndexOf_CurPawnEntity());
                    }
                    if (local_6)
                    {
                        this.OnPlayerPawnEntityChanged(local_6.GetCurPawnEntity());
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
                XError(ELog(17), "Remaining observed model change: OnGamepadRightShoulderPressChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnPlayerPawnEntityChanged");
            }
            return;
        }
        this.__SkillBts = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillBts.Initialize(this, FName("VMS_SkillBtns"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SkillBtns
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnGamepadRightShoulderPressChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPlayerPawnEntityChanged"));
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
