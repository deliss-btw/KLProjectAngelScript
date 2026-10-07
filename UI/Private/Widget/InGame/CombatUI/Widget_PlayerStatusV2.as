
namespace UWidget_PlayerStatusV2
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PlayerStatusV2 : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PlayerStatusV2> PlayerStatus;
    UPROPERTY()
    USizeBox w_size_hp;
    UPROPERTY()
    USizeBox w_size_mp;
    UPROPERTY()
    float32 DefaultHpBarWidth;
    UPROPERTY()
    float32 DefaultStaminaBarWidth;
    UPROPERTY()
    UWidgetAnimation Anim_Comp_AvatorL;
    UPROPERTY()
    UWidgetAnimation Anim_Comp_AvatorR;
    UPROPERTY()
    UWidgetAnimation Anim_Stamina_Enter;
    UPROPERTY()
    UWidgetAnimation Anim_Stamina_Full;
    UPROPERTY()
    UEUIButton w_btn_touch_trigger;
    UPROPERTY()
    UWidgetAnimation Anim_LB_Pressed;
    UPROPERTY()
    UWidgetAnimation Anim_LB_Released;
    UPROPERTY()
    UWidgetAnimation Anim_KeyBoard;
    bool bLBRevealed = false;
    bool bLBRevealInitialized = false;
    bool bKeyboardModeApplied = false;
    FEUIModelWeakRef __PlayerStatus;


    UFUNCTION()
    void OnInitialized_Implementation()
    {
        UEUIInputSubsystem::Get(this.GetOwningLocalPlayer()).OnInputMethodChanged.AddUFunction(this, n"OnSwitchAvatarInputMethodChanged");
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.DefaultHpBarWidth = this.w_size_hp.GetWidthOverride();
        this.DefaultStaminaBarWidth = this.w_size_mp.GetWidthOverride();
        if (this.w_btn_touch_trigger != nullptr)
        {
            this.w_btn_touch_trigger.OnPressed.AddUFunction(this, n"OnSwitchAvatarPressed");
            this.w_btn_touch_trigger.OnReleased.AddUFunction(this, n"OnSwitchAvatarReleased");
        }
        this.bLBRevealInitialized = false;
        this.bLBRevealed = false;
        this.bKeyboardModeApplied = false;
        this.ApplyLBReveal(false);
        return;
    }
    UFUNCTION()
    void OnSwitchAvatarPressed()
    {
        UInputAction local_2;
        if (local_2 != nullptr)
        {
            CommonUI::InjectInputForAction(this.GetOwningLocalPlayer(), local_2, true);
        }
        return;
    }
    UFUNCTION()
    void OnSwitchAvatarReleased()
    {
        UInputAction local_2;
        if (local_2 != nullptr)
        {
            CommonUI::InjectInputForAction(this.GetOwningLocalPlayer(), local_2, false);
        }
        return;
    }
    UFUNCTION()
    void HandlePlayerHpBarScaleChanged(const float32 PlayerHpBarScale)
    {
        this.w_size_hp.SetWidthOverride((this.DefaultHpBarWidth * PlayerHpBarScale));
        return;
    }
    UFUNCTION()
    void HandlePlayerStaminaBarScaleChanged(const float32 PlayerStaminaBarScale)
    {
        this.w_size_mp.SetWidthOverride((this.DefaultStaminaBarWidth * PlayerStaminaBarScale));
        return;
    }
    UFUNCTION()
    void HandlePlayerPawnIndexChanged(const int PlayerPawnIndex)
    {
        if (PlayerPawnIndex == 1)
        {
            this.PlayAnimationForward(this.Anim_Comp_AvatorR, 1.0f, false);
            return;
        }
        this.PlayAnimationForward(this.Anim_Comp_AvatorL, 1.0f, false);
        return;
    }
    UFUNCTION()
    void HandlePlayerStaminaRecoverStateChanged(const int PlayerStaminaRecoverState)
    {
        if (PlayerStaminaRecoverState != 0)
        {
            this.PlayAnimationForward(this.Anim_Stamina_Enter, 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void HandlePlayerStaminaFullCounterChanged(const int PlayerStaminaFullCounter)
    {
        this.PlayAnimationForward(this.Anim_Stamina_Full, 1.0f, true);
        return;
    }
    void ApplyLBReveal(const bool bGamepadLeftShoulderPress)
    {
        if (this.Anim_LB_Pressed == nullptr || (this.Anim_LB_Released == nullptr))
        {
            return;
        }
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 0))
        {
            if (this.bKeyboardModeApplied)
            {
                return;
            }
            this.bKeyboardModeApplied = true;
            this.StopAnimation(this.Anim_LB_Pressed);
            this.StopAnimation(this.Anim_LB_Released);
            if (this.Anim_KeyBoard != nullptr)
            {
                this.PlayAnimation(this.Anim_KeyBoard, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
            this.bLBRevealInitialized = true;
            this.bLBRevealed = true;
            return;
        }
        bool local_5 = this.bKeyboardModeApplied;
        if (local_5)
        {
            this.bKeyboardModeApplied = false;
            if (this.Anim_KeyBoard != nullptr)
            {
                this.StopAnimation(this.Anim_KeyBoard);
            }
        }
        bool local_19 = bGamepadLeftShoulderPress;
        if (!(this.bLBRevealInitialized))
        {
            local_5 = false;
        }
        else
        {
            bool local_3;
            local_3 = !(local_19);
            local_3 = (local_3 == !(this.bLBRevealed));
            local_5 = local_3;
        }
        if (local_5)
        {
            return;
        }
        bool local_20 = !(this.bLBRevealInitialized);
        this.bLBRevealInitialized = true;
        this.bLBRevealed = local_19;
        if (local_19)
        {
            this.StopAnimation(this.Anim_LB_Released);
            this.PlayAnimation(this.Anim_LB_Pressed, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        if (!(local_20))
        {
            this.StopAnimation(this.Anim_LB_Pressed);
            this.PlayAnimation(this.Anim_LB_Released, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void OnGamepadLeftShoulderPressChanged(const bool bGamepadLeftShoulderPress)
    {
        this.ApplyLBReveal(bGamepadLeftShoulderPress);
        return;
    }
    UFUNCTION()
    void OnSwitchAvatarInputMethodChanged(const EEUIInputType NewInputType)
    {
        bool local_4;
        if (this.PlayerStatus.IsValid())
        {
            local_4 = GetbGamepadLeftShoulderPress();
        }
        else
        {
            local_4 = false;
        }
        this.ApplyLBReveal(local_4);
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
        FVMS_PlayerStatusV2& local_6;
        TEUIModelRef<FVMS_PlayerStatusV2> local_2 = this.PlayerStatus.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.PlayerStatus.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_PlayerStatusV2::__IndexOf_PlayerHpBarScale());
                }
                if (local_6)
                {
                    this.HandlePlayerHpBarScaleChanged(local_6.GetPlayerHpBarScale());
                }
                break;
            }
            case 1:
            {
                this.PlayerStatus.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_PlayerStatusV2::__IndexOf_PlayerStaminaBarScale());
                }
                if (local_6)
                {
                    this.HandlePlayerStaminaBarScaleChanged(local_6.GetPlayerStaminaBarScale());
                }
                break;
            }
            case 2:
            {
                this.PlayerStatus.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_PlayerStatusV2::__IndexOf_PlayerPawnIndex());
                }
                if (local_6)
                {
                    this.HandlePlayerPawnIndexChanged(local_6.GetPlayerPawnIndex());
                }
                break;
            }
            case 3:
            {
                this.PlayerStatus.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_PlayerStatusV2::__IndexOf_PlayerStaminaRecoverState());
                }
                if (local_6)
                {
                    this.HandlePlayerStaminaRecoverStateChanged(local_6.GetPlayerStaminaRecoverState());
                }
                break;
            }
            case 4:
            {
                this.PlayerStatus.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_PlayerStatusV2::__IndexOf_PlayerStaminaFullCounter());
                }
                if (local_6)
                {
                    this.HandlePlayerStaminaFullCounterChanged(local_6.GetPlayerStaminaFullCounter());
                }
                break;
            }
            case 5:
            {
                this.PlayerStatus.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_PlayerStatusV2::__IndexOf_bGamepadLeftShoulderPress());
                }
                if (local_6)
                {
                    this.OnGamepadLeftShoulderPressChanged(local_6.GetbGamepadLeftShoulderPress());
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
                XError(ELog(17), "Remaining observed model change: HandlePlayerHpBarScaleChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandlePlayerStaminaBarScaleChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: HandlePlayerPawnIndexChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: HandlePlayerStaminaRecoverStateChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: HandlePlayerStaminaFullCounterChanged");
            }
            if (It.IsDirty(5))
            {
                XError(ELog(17), "Remaining observed model change: OnGamepadLeftShoulderPressChanged");
            }
            return;
        }
        this.__PlayerStatus = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerStatus.Initialize(this, FName("VMS_PlayerStatusV2"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_PlayerStatusV2
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePlayerHpBarScaleChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePlayerStaminaBarScaleChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePlayerPawnIndexChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePlayerStaminaRecoverStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandlePlayerStaminaFullCounterChanged"));
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
