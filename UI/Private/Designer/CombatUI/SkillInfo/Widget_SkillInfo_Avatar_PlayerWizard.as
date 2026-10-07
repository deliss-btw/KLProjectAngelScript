
namespace UWidget_SkillInfo_Avatar_PlayerWizard
{
    const int ViewID = 0;

}
class UWidget_SkillInfo_Avatar_PlayerWizard : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillInfo_Avatar_PlayerWizard> SkillInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LinkSkillInfo> LinkSkillInfo;
    UPROPERTY()
    UCanvasPanel KeyboardInputPanel;
    UPROPERTY()
    UCanvasPanel GamepadInputPanel;
    UPROPERTY()
    UProgressBar MP_Progress;
    UPROPERTY()
    URadialSlider CastProgressBar;
    UPROPERTY()
    UImage Image_Mark1;
    UPROPERTY()
    UImage Image_Mark2;
    UPROPERTY()
    UImage Image_Mark3;
    UPROPERTY()
    UImage Image_Mark1_1;
    UPROPERTY()
    UImage Image_Mark2_1;
    UPROPERTY()
    UImage Image_Mark3_1;
    UPROPERTY()
    FString MPInfo;
    UPROPERTY()
    UTextBlock Num;
    UPROPERTY()
    FLinearColor Color_Full;
    UPROPERTY()
    FLinearColor Color_NotFull;
    UPROPERTY()
    FLinearColor Color_Free;
    UPROPERTY()
    FLinearColor Color_NotFree;
    UPROPERTY()
    FLinearColor Color_Mark_Empty;
    UPROPERTY()
    FLinearColor Color_Mark_Full;
    UPROPERTY()
    FLinearColor ChargeLevel0;
    UPROPERTY()
    FLinearColor ChargeLevel1;
    UPROPERTY()
    FLinearColor ChargeLevel2;
    FEUIModelWeakRef __SkillInfo;

    UWidget_SkillInfo_Avatar_PlayerWizard()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        else
        {
            int local_7 = int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()));
            if (local_7 <= 1)
            {
                if (local_7 != 0)
                {
                    if (local_7 != 1)
                    {
                        return;
                    }
                    else
                    {
                        this.KeyboardInputPanel.SetVisibility(ESlateVisibility(2));
                        this.GamepadInputPanel.SetVisibility(ESlateVisibility(0));
                        return;
                    }
                }
                else
                {
                    this.KeyboardInputPanel.SetVisibility(ESlateVisibility(0));
                    this.GamepadInputPanel.SetVisibility(ESlateVisibility(2));
                    return;
                }
            }
        }
    }
    UFUNCTION()
    void OnCustomSkillEnergyChanged(const float32 CustomSkillEnergy, const float32 CustomSkillEnergyMax)
    {
        int local_1 = uint(CustomSkillEnergy);
        FString local_6 = ((FString("") + local_1) + " / ");
        int local_1_2 = uint(CustomSkillEnergyMax);
        this.MPInfo = (local_6 + local_1_2);
        return;
    }
    UFUNCTION()
    void OnMagicUseCountChanged(const int MagicUseCount)
    {
        if (MagicUseCount >= 1)
        {
            this.Image_Mark1.SetColorAndOpacity(this.Color_Mark_Full);
            this.Image_Mark1_1.SetColorAndOpacity(this.Color_Mark_Full);
        }
        else
        {
            this.Image_Mark1.SetColorAndOpacity(this.Color_Mark_Empty);
            this.Image_Mark1_1.SetColorAndOpacity(this.Color_Mark_Empty);
        }
        if (MagicUseCount >= 2)
        {
            this.Image_Mark2.SetColorAndOpacity(this.Color_Mark_Full);
            this.Image_Mark2_1.SetColorAndOpacity(this.Color_Mark_Full);
        }
        else
        {
            this.Image_Mark2.SetColorAndOpacity(this.Color_Mark_Empty);
            this.Image_Mark2_1.SetColorAndOpacity(this.Color_Mark_Empty);
        }
        if (MagicUseCount >= 3)
        {
            this.Image_Mark3.SetColorAndOpacity(this.Color_Mark_Full);
            this.Image_Mark3_1.SetColorAndOpacity(this.Color_Mark_Full);
        }
        else
        {
            this.Image_Mark3.SetColorAndOpacity(this.Color_Mark_Empty);
            this.Image_Mark3_1.SetColorAndOpacity(this.Color_Mark_Empty);
        }
        if (MagicUseCount >= 3)
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void OnCastProgressChanged(const float32 CastProgress)
    {
        if (CastProgress != 0.0f)
        {
            return;
        }
        this.CastProgressBar.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void OnChargeLevelChanged(const int ChargeLevel)
    {
        if (ChargeLevel == 0)
        {
            this.CastProgressBar.SetSliderProgressColor(this.ChargeLevel0);
            return;
        }
        if (ChargeLevel == 1)
        {
            this.CastProgressBar.SetSliderProgressColor(this.ChargeLevel1);
            return;
        }
        if (ChargeLevel == 2)
        {
            this.CastProgressBar.SetSliderProgressColor(this.ChargeLevel2);
        }
        return;
    }
    UFUNCTION()
    void OnSuperSwitchChanged(const int SuperSwitch)
    {
        if (SuperSwitch > 0)
        {
            this.Num.SetColorAndOpacity(FSlateColor(FLinearColor(0.0f, 0.5f, 1.0f, 1.0f)));
            return;
        }
        this.Num.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 1.0f, 1.0f, 1.0f)));
        return;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SimpleSkillButton() const
    {
        FVMS_SkillInfo_Avatar_PlayerWizard& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SimpleSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_ExtraSkill1Button() const
    {
        FVMS_SkillInfo_Avatar_PlayerWizard& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_ExtraSkill1Button() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_ExtraSkill2Button() const
    {
        FVMS_SkillInfo_Avatar_PlayerWizard& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_ExtraSkill2Button() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_UltraSkillButton() const
    {
        FVMS_SkillInfo_Avatar_PlayerWizard& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_UltraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    float32 SkillInfo_CustomSkillEnergyRatio() const
    {
        FVMS_SkillInfo_Avatar_PlayerWizard& local_2;
        return local_2 ? local_2.GetCustomSkillEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    float32 SkillInfo_CastProgress() const
    {
        FVMS_SkillInfo_Avatar_PlayerWizard& local_2;
        return local_2 ? local_2.GetCastProgress() : 0.0f;
    }
    UFUNCTION()
    FEUIModelRef LinkSkillInfo_VM_LinkSkillButton() const
    {
        FVMS_LinkSkillInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_LinkSkillButton() : FEUIModelRef();
        return local_8;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_SkillInfo_Avatar_PlayerWizard& local_6;
        TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard> local_2 = this.SkillInfo.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerWizard::__IndexOf_CustomSkillEnergy());
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerWizard::__IndexOf_CustomSkillEnergyMax());
                }
                if (local_6)
                {
                    this.OnCustomSkillEnergyChanged(local_6.GetCustomSkillEnergy(), local_6.GetCustomSkillEnergyMax());
                }
                break;
            }
            case 1:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerWizard::__IndexOf_MagicUseCount());
                }
                if (local_6)
                {
                    this.OnMagicUseCountChanged(local_6.GetMagicUseCount());
                }
                break;
            }
            case 2:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerWizard::__IndexOf_CastProgress());
                }
                if (local_6)
                {
                    this.OnCastProgressChanged(local_6.GetCastProgress());
                }
                break;
            }
            case 3:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerWizard::__IndexOf_ChargeLevel());
                }
                if (local_6)
                {
                    this.OnChargeLevelChanged(local_6.GetChargeLevel());
                }
                break;
            }
            case 4:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerWizard::__IndexOf_SuperSwitch());
                }
                if (local_6)
                {
                    this.OnSuperSwitchChanged(local_6.GetSuperSwitch());
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
                XError(ELog(17), "Remaining observed model change: OnCustomSkillEnergyChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnMagicUseCountChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnCastProgressChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnChargeLevelChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: OnSuperSwitchChanged");
            }
            return;
        }
        this.__SkillInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfo.Initialize(this, FName("VMS_SkillInfo_Avatar_PlayerWizard"), EEUIWidgetRefModelCreationType(0), false);
        this.LinkSkillInfo.Initialize(this, FName("VMS_LinkSkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SkillInfo_Avatar_PlayerWizard
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCustomSkillEnergyChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnMagicUseCountChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCastProgressChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChargeLevelChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSuperSwitchChanged"));
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
