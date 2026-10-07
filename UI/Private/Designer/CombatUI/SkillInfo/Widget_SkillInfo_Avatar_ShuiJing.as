
namespace UWidget_SkillInfo_Avatar_ShuiJing
{
    const int ViewID = 0;

}
class UWidget_SkillInfo_Avatar_ShuiJing : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillInfo_Avatar_ShuiJing> SkillInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LinkSkillInfo> LinkSkillInfo;
    UPROPERTY()
    UCanvasPanel KeyboardInputPanel;
    UPROPERTY()
    UCanvasPanel GamepadInputPanel;
    UPROPERTY()
    UCanvasPanel CommonSkillPanel;
    UPROPERTY()
    UCanvasPanel ExtraSkillPanel;
    UPROPERTY()
    UImage CustomSkillEnergy_Background;
    UPROPERTY()
    UImage CustomSkillEnergy_Background_Pad;
    UPROPERTY()
    UProgressBar ProgressBar_CustomSkillEnergyDisplay;
    FEUIModelWeakRef __SkillInfo;

    UWidget_SkillInfo_Avatar_ShuiJing()
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
    void OnChargeStateChanged(const int ChargeState)
    {
        if (ChargeState == 2)
        {
            this.CustomSkillEnergy_Background.SetColorAndOpacity(FLinearColor(0.95f, 0.05f, 0.05f, 1.0f));
            this.CustomSkillEnergy_Background_Pad.SetColorAndOpacity(FLinearColor(0.95f, 0.05f, 0.05f, 1.0f));
            return;
        }
        if (ChargeState == 1)
        {
            this.CustomSkillEnergy_Background.SetColorAndOpacity(FLinearColor(0.99f, 0.5f, 0.2f, 1.0f));
            this.CustomSkillEnergy_Background_Pad.SetColorAndOpacity(FLinearColor(0.99f, 0.5f, 0.2f, 1.0f));
            return;
        }
        this.CustomSkillEnergy_Background.SetColorAndOpacity(FLinearColor(1.0f, 1.0f, 1.0f, 0.0f));
        this.CustomSkillEnergy_Background_Pad.SetColorAndOpacity(FLinearColor(1.0f, 1.0f, 1.0f, 0.0f));
        return;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SpecialAttackButton() const
    {
        FVMS_SkillInfo_Avatar_ShuiJing& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SpecialAttackButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SimpleSkillButton() const
    {
        FVMS_SkillInfo_Avatar_ShuiJing& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SimpleSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_ExtraSkillButton() const
    {
        FVMS_SkillInfo_Avatar_ShuiJing& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_ExtraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_UltraSkillButton() const
    {
        FVMS_SkillInfo_Avatar_ShuiJing& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_UltraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    float32 SkillInfo_CustomSkillEnergyRatio() const
    {
        FVMS_SkillInfo_Avatar_ShuiJing& local_2;
        return local_2 ? local_2.GetCustomSkillEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    ESlateVisibility SkillInfo_SlateVisibilityShowArrow() const
    {
        FVMS_SkillInfo_Avatar_ShuiJing& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.ShowArrowAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
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
        FVMS_SkillInfo_Avatar_ShuiJing& local_6;
        TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing> local_2 = this.SkillInfo.AsRef();
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
                    this.SkillInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_ShuiJing::__IndexOf_ChargeState());
                    }
                    if (local_6)
                    {
                        this.OnChargeStateChanged(local_6.GetChargeState());
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
                XError(ELog(17), "Remaining observed model change: OnChargeStateChanged");
            }
            return;
        }
        this.__SkillInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfo.Initialize(this, FName("VMS_SkillInfo_Avatar_ShuiJing"), EEUIWidgetRefModelCreationType(0), false);
        this.LinkSkillInfo.Initialize(this, FName("VMS_LinkSkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SkillInfo_Avatar_ShuiJing
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChargeStateChanged"));
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
