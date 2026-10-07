
namespace UWidget_SkillInfo_Mon_Controlable
{
    const int ViewID = 0;

}
class UWidget_SkillInfo_Mon_Controlable : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillInfo_Mon_Controlable> SkillInfo;
    UPROPERTY()
    UCanvasPanel KeyboardInputPanel;
    UPROPERTY()
    UCanvasPanel GamepadInputPanel;
    UPROPERTY()
    UCanvasPanel CanvasPanel;

    UWidget_SkillInfo_Mon_Controlable()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_8.MatchGameplayTag(GameplayTags::CombatState_ControlMonster_PVX))
        {
            this.CanvasPanel.SetVisibility(ESlateVisibility(2));
        }
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
    FEUIModelRef SkillInfo_VM_SkillQButton() const
    {
        FVMS_SkillInfo_Mon_Controlable& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SkillQButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SkillEButton() const
    {
        FVMS_SkillInfo_Mon_Controlable& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SkillEButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_UltraSkillButton() const
    {
        FVMS_SkillInfo_Mon_Controlable& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_UltraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    float32 SkillInfo_ControlEnergyRatio() const
    {
        FVMS_SkillInfo_Mon_Controlable& local_2;
        return local_2 ? local_2.GetControlEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfo.Initialize(this, FName("VMS_SkillInfo_Mon_Controlable"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SkillInfo_Mon_Controlable
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
