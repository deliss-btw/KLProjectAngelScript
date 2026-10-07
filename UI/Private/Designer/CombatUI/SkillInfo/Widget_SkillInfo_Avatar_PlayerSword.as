
namespace UWidget_SkillInfo_Avatar_PlayerSword
{
    const int ViewID = 0;

}
class UWidget_SkillInfo_Avatar_PlayerSword : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillInfo_Avatar_PlayerSword> SkillInfo;
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
    UCanvasPanel SpuerSwitchPanel;
    UPROPERTY()
    UCanvasPanel SpuerSwitchPanel_Pad;
    UPROPERTY()
    UProgressBar Progress_1;
    UPROPERTY()
    UProgressBar Progress_2;
    UPROPERTY()
    UProgressBar Progress_3;
    UPROPERTY()
    UProgressBar Progress_4;
    UPROPERTY()
    UProgressBar Progress_5;
    UPROPERTY()
    UProgressBar Progress_1_Pad;
    UPROPERTY()
    UProgressBar Progress_2_Pad;
    UPROPERTY()
    UProgressBar Progress_3_Pad;
    UPROPERTY()
    UProgressBar Progress_4_Pad;
    UPROPERTY()
    UProgressBar Progress_5_Pad;
    UPROPERTY()
    UProgressBar LineMark1;
    UPROPERTY()
    UProgressBar LineMark2;
    UPROPERTY()
    UProgressBar LineMark3;
    UPROPERTY()
    UProgressBar LineMark4;
    UPROPERTY()
    UProgressBar LineMark5;
    UPROPERTY()
    float32 LineMarkProgressRatio_1 = 0.0f;
    UPROPERTY()
    float32 LineMarkProgressRatio_2 = 0.0f;
    UPROPERTY()
    float32 LineMarkProgressRatio_3 = 0.0f;
    UPROPERTY()
    float32 LineMarkProgressRatio_4 = 0.0f;
    UPROPERTY()
    float32 LineMarkProgressRatio_5 = 0.0f;
    UPROPERTY()
    float32 ProgressRatio_1 = 0.0f;
    UPROPERTY()
    float32 ProgressRatio_2 = 0.0f;
    UPROPERTY()
    float32 ProgressRatio_3 = 0.0f;
    UPROPERTY()
    float32 ProgressRatio_4 = 0.0f;
    UPROPERTY()
    float32 ProgressRatio_5 = 0.0f;
    UPROPERTY()
    bool MarkUltraOn = false;
    UPROPERTY()
    UWidgetAnimation AnimA;
    UPROPERTY()
    UWidgetAnimation AnimB;
    UPROPERTY()
    UWidgetAnimation AnimC;
    UPROPERTY()
    UWidgetAnimation AnimD;
    UPROPERTY()
    UWidgetAnimation AnimE;
    UPROPERTY()
    UWidgetAnimation ShowCompositionAnim;
    UPROPERTY()
    FLinearColor ProgressFullColor = FLinearColor(0.6f, 0.0f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor ProgressNoFullColor = FLinearColor(1.0f, 0.6f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor LineMarkNotFull = FLinearColor(1.0f, 0.6f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor LineMarkFull = FLinearColor(1.0f, 0.6f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor LineMarkUltraOn = FLinearColor(1.0f, 0.6f, 0.0f, 1.0f);
    FEUIModelWeakRef __SkillInfo;


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
    void OnCustomSkillEnergyRatioChanged(const float32 CustomSkillEnergyRatio)
    {
        this.ProgressRatio_1 = (CustomSkillEnergyRatio * 5.0f);
        this.ProgressRatio_2 = ((CustomSkillEnergyRatio * 5.0f) - 1.0f);
        float32 local_1_2 = CustomSkillEnergyRatio * 5.0f;
        this.ProgressRatio_3 = (local_1_2 - 2.0f);
        float32 local_2 = CustomSkillEnergyRatio * 5.0f;
        this.ProgressRatio_4 = (local_2 - 3.0f);
        float32 local_3 = CustomSkillEnergyRatio * 5.0f;
        this.ProgressRatio_5 = (local_3 - 4.0f);
        if (this.ProgressRatio_1 >= 1.0f)
        {
            this.Progress_1.SetFillColorAndOpacity(this.ProgressFullColor);
            this.Progress_1_Pad.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_1.SetFillColorAndOpacity(this.ProgressNoFullColor);
            this.Progress_1_Pad.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (this.ProgressRatio_2 >= 1.0f)
        {
            this.Progress_2.SetFillColorAndOpacity(this.ProgressFullColor);
            this.Progress_2_Pad.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_2.SetFillColorAndOpacity(this.ProgressNoFullColor);
            this.Progress_2_Pad.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (this.ProgressRatio_3 >= 1.0f)
        {
            this.Progress_3.SetFillColorAndOpacity(this.ProgressFullColor);
            this.Progress_3_Pad.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_3.SetFillColorAndOpacity(this.ProgressNoFullColor);
            this.Progress_3_Pad.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (this.ProgressRatio_4 >= 1.0f)
        {
            this.Progress_4.SetFillColorAndOpacity(this.ProgressFullColor);
            this.Progress_4_Pad.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_4.SetFillColorAndOpacity(this.ProgressNoFullColor);
            this.Progress_4_Pad.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (this.ProgressRatio_5 >= 1.0f)
        {
            this.Progress_5.SetFillColorAndOpacity(this.ProgressFullColor);
            this.Progress_5_Pad.SetFillColorAndOpacity(this.ProgressFullColor);
            return;
        }
        this.Progress_5.SetFillColorAndOpacity(this.ProgressNoFullColor);
        this.Progress_5_Pad.SetFillColorAndOpacity(this.ProgressNoFullColor);
        return;
    }
    UFUNCTION()
    void OnbMarkAChanged(const bool bMarkA)
    {
        this.PlayAnimation(this.AnimA, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnbMarkBChanged(const bool bMarkB)
    {
        this.PlayAnimation(this.AnimB, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnbMarkCChanged(const bool bMarkC)
    {
        this.PlayAnimation(this.AnimC, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnbMarkDChanged(const bool bMarkD)
    {
        this.PlayAnimation(this.AnimD, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnbMarkEChanged(const bool bMarkE)
    {
        this.PlayAnimation(this.AnimE, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void OnSpuerSwitchChanged(const int SpuerSwitch)
    {
        if (SpuerSwitch != 0)
        {
            this.SpuerSwitchPanel.SetVisibility(ESlateVisibility(0));
            this.SpuerSwitchPanel_Pad.SetVisibility(ESlateVisibility(0));
            return;
        }
        this.SpuerSwitchPanel.SetVisibility(ESlateVisibility(2));
        this.SpuerSwitchPanel_Pad.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void OnLineMarkProgressRatioChanged(const float32 LineMarkProgressRatio)
    {
        this.LineMarkProgressRatio_1 = (LineMarkProgressRatio * 5.0f);
        this.LineMarkProgressRatio_2 = ((LineMarkProgressRatio * 5.0f) - 1.0f);
        float32 local_1_2 = LineMarkProgressRatio * 5.0f;
        this.LineMarkProgressRatio_3 = (local_1_2 - 2.0f);
        float32 local_2 = LineMarkProgressRatio * 5.0f;
        this.LineMarkProgressRatio_4 = (local_2 - 3.0f);
        float32 local_3 = LineMarkProgressRatio * 5.0f;
        this.LineMarkProgressRatio_5 = (local_3 - 4.0f);
        if (this.MarkUltraOn == false)
        {
            if (this.LineMarkProgressRatio_1 >= 1.0f)
            {
                this.LineMark1.SetFillColorAndOpacity(this.LineMarkFull);
            }
            else
            {
                this.LineMark1.SetFillColorAndOpacity(this.LineMarkNotFull);
            }
            if (this.LineMarkProgressRatio_2 >= 1.0f)
            {
                this.LineMark2.SetFillColorAndOpacity(this.LineMarkFull);
            }
            else
            {
                this.LineMark2.SetFillColorAndOpacity(this.LineMarkNotFull);
            }
            if (this.LineMarkProgressRatio_3 >= 1.0f)
            {
                this.LineMark3.SetFillColorAndOpacity(this.LineMarkFull);
            }
            else
            {
                this.LineMark3.SetFillColorAndOpacity(this.LineMarkNotFull);
            }
            if (this.LineMarkProgressRatio_4 >= 1.0f)
            {
                this.LineMark4.SetFillColorAndOpacity(this.LineMarkFull);
            }
            else
            {
                this.LineMark4.SetFillColorAndOpacity(this.LineMarkNotFull);
            }
            if (this.LineMarkProgressRatio_5 >= 1.0f)
            {
                this.LineMark5.SetFillColorAndOpacity(this.LineMarkFull);
                return;
            }
            this.LineMark5.SetFillColorAndOpacity(this.LineMarkNotFull);
        }
        return;
    }
    UFUNCTION()
    void OnUltraModelChanged(const bool UltraOn)
    {
        if (UltraOn)
        {
            this.LineMark1.SetFillColorAndOpacity(this.LineMarkUltraOn);
            this.LineMark2.SetFillColorAndOpacity(this.LineMarkUltraOn);
            this.LineMark3.SetFillColorAndOpacity(this.LineMarkUltraOn);
            this.LineMark4.SetFillColorAndOpacity(this.LineMarkUltraOn);
            this.LineMark5.SetFillColorAndOpacity(this.LineMarkUltraOn);
            this.MarkUltraOn = true;
            return;
        }
        this.MarkUltraOn = false;
        return;
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
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SpecialAttackButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SimpleSkillButton() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SimpleSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_ExtraSkillButton() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_ExtraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_UltraSkillButton() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_UltraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    float32 SkillInfo_CustomSkillEnergyRatio() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        return local_2 ? local_2.GetCustomSkillEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    float32 SkillInfo_LineMarkProgressRatio() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        return local_2 ? local_2.GetLineMarkProgressRatio() : 0.0f;
    }
    UFUNCTION()
    bool SkillInfo_bMarkA() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbMarkA();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool SkillInfo_bMarkB() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbMarkB();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool SkillInfo_bMarkC() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbMarkC();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool SkillInfo_bMarkD() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbMarkD();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool SkillInfo_bMarkE() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbMarkE();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    int SkillInfo_SpuerSwitch() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
        return local_2 ? local_2.GetSpuerSwitch() : 0;
    }
    UFUNCTION()
    bool SkillInfo_UltraOn() const
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_2;
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_SkillInfo_Avatar_PlayerSword& local_6;
        TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerSword> local_2 = this.SkillInfo.AsRef();
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
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_CustomSkillEnergyRatio());
                }
                if (local_6)
                {
                    this.OnCustomSkillEnergyRatioChanged(local_6.GetCustomSkillEnergyRatio());
                }
                break;
            }
            case 1:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_bMarkA());
                }
                if (local_6)
                {
                    this.OnbMarkAChanged(local_6.GetbMarkA());
                }
                break;
            }
            case 2:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_bMarkB());
                }
                if (local_6)
                {
                    this.OnbMarkBChanged(local_6.GetbMarkB());
                }
                break;
            }
            case 3:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_bMarkC());
                }
                if (local_6)
                {
                    this.OnbMarkCChanged(local_6.GetbMarkC());
                }
                break;
            }
            case 4:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_bMarkD());
                }
                if (local_6)
                {
                    this.OnbMarkDChanged(local_6.GetbMarkD());
                }
                break;
            }
            case 5:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_bMarkE());
                }
                if (local_6)
                {
                    this.OnbMarkEChanged(local_6.GetbMarkE());
                }
                break;
            }
            case 6:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_SpuerSwitch());
                }
                if (local_6)
                {
                    this.OnSpuerSwitchChanged(local_6.GetSpuerSwitch());
                }
                break;
            }
            case 7:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_LineMarkProgressRatio());
                }
                if (local_6)
                {
                    this.OnLineMarkProgressRatioChanged(local_6.GetLineMarkProgressRatio());
                }
                break;
            }
            case 8:
            {
                this.SkillInfo.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_PlayerSword::__IndexOf_UltraOn());
                }
                if (local_6)
                {
                    this.OnUltraModelChanged(local_6.GetUltraOn());
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
                XError(ELog(17), "Remaining observed model change: OnCustomSkillEnergyRatioChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnbMarkAChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnbMarkBChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnbMarkCChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: OnbMarkDChanged");
            }
            if (It.IsDirty(5))
            {
                XError(ELog(17), "Remaining observed model change: OnbMarkEChanged");
            }
            if (It.IsDirty(6))
            {
                XError(ELog(17), "Remaining observed model change: OnSpuerSwitchChanged");
            }
            if (It.IsDirty(7))
            {
                XError(ELog(17), "Remaining observed model change: OnLineMarkProgressRatioChanged");
            }
            if (It.IsDirty(8))
            {
                XError(ELog(17), "Remaining observed model change: OnUltraModelChanged");
            }
            return;
        }
        this.__SkillInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfo.Initialize(this, FName("VMS_SkillInfo_Avatar_PlayerSword"), EEUIWidgetRefModelCreationType(0), false);
        this.LinkSkillInfo.Initialize(this, FName("VMS_LinkSkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SkillInfo_Avatar_PlayerSword
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCustomSkillEnergyRatioChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnbMarkAChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnbMarkBChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnbMarkCChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnbMarkDChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnbMarkEChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSpuerSwitchChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnLineMarkProgressRatioChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnUltraModelChanged"));
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
