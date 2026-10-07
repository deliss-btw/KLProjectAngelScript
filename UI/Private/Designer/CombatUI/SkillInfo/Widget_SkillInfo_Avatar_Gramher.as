
namespace UWidget_SkillInfo_Avatar_Gramher
{
    const int ViewID = 0;

}
class UWidget_SkillInfo_Avatar_Gramher : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillInfo_Avatar_Common> SkillInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LinkSkillInfo> LinkSkillInfo;
    UPROPERTY()
    UCanvasPanel KeyboardInputPanel;
    UPROPERTY()
    UCanvasPanel GamepadInputPanel;
    UPROPERTY()
    UWidgetAnimation ShowCompositionAnim;

    UWidget_SkillInfo_Avatar_Gramher()
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
    void ShowComposition(const bool show)
    {
        if (show)
        {
            this.PlayAnimationForward(this.ShowCompositionAnim, 1.0f, false);
            return;
        }
        this.PlayAnimationReverse(this.ShowCompositionAnim, 1.0f, false);
        return;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SpecialAttackButton() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SpecialAttackButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SimpleSkillButton() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SimpleSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_UltraSkillButton() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_UltraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    float32 SkillInfo_CustomSkillEnergyRatio() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        return local_2 ? local_2.GetCustomSkillEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    bool SkillInfo_UltraOn() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetUltraOn();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FEUIModelRef LinkSkillInfo_VM_LinkSkillButton() const
    {
        FVMS_LinkSkillInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_LinkSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfo.Initialize(this, FName("VMS_SkillInfo_Avatar_Common"), EEUIWidgetRefModelCreationType(0), false);
        this.LinkSkillInfo.Initialize(this, FName("VMS_LinkSkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SkillInfo_Avatar_Gramher
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
