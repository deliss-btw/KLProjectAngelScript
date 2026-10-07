
namespace UWidget_GramherExclusiveSkill
{
    const int ViewID = 0;
}
namespace UWidget_SwordExclusiveSkill
{
    const int ViewID = 0;
}
namespace UWidget_WizardExclusiveSkill
{
    const int ViewID = 0;
}
namespace UWidget_ShuijingExclusiveSkill
{
    const int ViewID = 0;
}
namespace UWidget_QiongExclusiveSkill
{
    const int ViewID = 0;
}
namespace UWidget_FakeCharacterProgress
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_GramherExclusiveSkill : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GramherExclusiveSkill> ExclusiveSkill;
    UPROPERTY()
    FGetEUIModelRef ExclusiveSkillDelegate;

    UWidget_GramherExclusiveSkill()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ExclusiveSkill.Initialize(this, FName("VM_GramherExclusiveSkill"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ExclusiveSkillDelegate.IsBound())
        {
            this.ExclusiveSkill.SetRef(this.ExclusiveSkillDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SwordExclusiveSkill : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SwordExclusiveSkill> ExclusiveSkill;
    UPROPERTY()
    UCanvasPanel SpuerSwitchPanel;
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
    UPROPERTY()
    FLinearColor F2_Color_0 = FLinearColor(1.0f, 0.65f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor F2_Color_1_2 = FLinearColor(1.0f, 0.65f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor F2_Color_3_4 = FLinearColor(0.48f, 0.0f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor F2_Color_5 = FLinearColor(1.0f, 0.0f, 0.0f, 1.0f);
    FEUIModelWeakRef __ExclusiveSkill;
    UPROPERTY()
    FGetEUIModelRef ExclusiveSkillDelegate;

    UWidget_SwordExclusiveSkill()
    {
        return;
    }
    UFUNCTION()
    void OnCustomSkillEnergyRatioChanged(const float32 CustomSkillEnergyRatio, const int iFoundationIndex)
    {
        if (GetiFoundationIndex() == 2)
        {
            int local_4;
            local_4 = GetFullGridCount();
            FLinearColor local_8;
            if (local_4 == 0)
            {
                local_8 = this.F2_Color_0;
            }
            else
            {
                if (local_4 <= 1)
                {
                    local_8 = this.F2_Color_1_2;
                }
                else
                {
                    local_8 = local_4 <= 3 ? this.F2_Color_3_4 : this.F2_Color_5;
                }
            }
            this.Progress_1.SetFillColorAndOpacity(local_8);
            this.Progress_2.SetFillColorAndOpacity(local_8);
            this.Progress_3.SetFillColorAndOpacity(local_8);
            this.Progress_4.SetFillColorAndOpacity(local_8);
            this.Progress_5.SetFillColorAndOpacity(local_8);
            return;
        }
        if (GetProgressRatio_1() >= 1.0f)
        {
            this.Progress_1.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_1.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (GetProgressRatio_2() >= 1.0f)
        {
            this.Progress_2.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_2.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (GetProgressRatio_3() >= 1.0f)
        {
            this.Progress_3.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_3.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (GetProgressRatio_4() >= 1.0f)
        {
            this.Progress_4.SetFillColorAndOpacity(this.ProgressFullColor);
        }
        else
        {
            this.Progress_4.SetFillColorAndOpacity(this.ProgressNoFullColor);
        }
        if (GetProgressRatio_5() >= 1.0f)
        {
            this.Progress_5.SetFillColorAndOpacity(this.ProgressFullColor);
            return;
        }
        this.Progress_5.SetFillColorAndOpacity(this.ProgressNoFullColor);
        return;
    }
    UFUNCTION()
    void OnbMarkAChanged(const bool bMarkA)
    {
        if (GetiFoundationIndex() == 2)
        {
            return;
        }
        if (this.IsInMainPhase())
        {
            this.PlayAnimation(this.AnimA, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void OnbMarkBChanged(const bool bMarkB)
    {
        if (GetiFoundationIndex() == 2)
        {
            return;
        }
        if (this.IsInMainPhase())
        {
            this.PlayAnimation(this.AnimB, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void OnbMarkCChanged(const bool bMarkC)
    {
        if (GetiFoundationIndex() == 2)
        {
            return;
        }
        if (this.IsInMainPhase())
        {
            this.PlayAnimation(this.AnimC, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void OnbMarkDChanged(const bool bMarkD)
    {
        if (GetiFoundationIndex() == 2)
        {
            return;
        }
        if (this.IsInMainPhase())
        {
            this.PlayAnimation(this.AnimD, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void OnbMarkEChanged(const bool bMarkE)
    {
        if (GetiFoundationIndex() == 2)
        {
            return;
        }
        if (this.IsInMainPhase())
        {
            this.PlayAnimation(this.AnimE, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        return;
    }
    UFUNCTION()
    void OnSpuerSwitchChanged(const int SpuerSwitch)
    {
        if (SpuerSwitch != 0)
        {
            this.SpuerSwitchPanel.SetVisibility(ESlateVisibility(0));
            return;
        }
        this.SpuerSwitchPanel.SetVisibility(ESlateVisibility(2));
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SwordExclusiveSkill& local_6;
        TEUIModelRef<FVM_SwordExclusiveSkill> local_2 = this.ExclusiveSkill.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_CustomSkillEnergyRatio());
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_iFoundationIndex());
                }
                if (local_6)
                {
                    this.OnCustomSkillEnergyRatioChanged(local_6.GetCustomSkillEnergyRatio(), local_6.GetiFoundationIndex());
                }
                break;
            }
            case 1:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_bMarkA());
                }
                if (local_6)
                {
                    this.OnbMarkAChanged(local_6.GetbMarkA());
                }
                break;
            }
            case 2:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_bMarkB());
                }
                if (local_6)
                {
                    this.OnbMarkBChanged(local_6.GetbMarkB());
                }
                break;
            }
            case 3:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_bMarkC());
                }
                if (local_6)
                {
                    this.OnbMarkCChanged(local_6.GetbMarkC());
                }
                break;
            }
            case 4:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_bMarkD());
                }
                if (local_6)
                {
                    this.OnbMarkDChanged(local_6.GetbMarkD());
                }
                break;
            }
            case 5:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_bMarkE());
                }
                if (local_6)
                {
                    this.OnbMarkEChanged(local_6.GetbMarkE());
                }
                break;
            }
            case 6:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SwordExclusiveSkill::__IndexOf_SpuerSwitch());
                }
                if (local_6)
                {
                    this.OnSpuerSwitchChanged(local_6.GetSpuerSwitch());
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
            return;
        }
        this.__ExclusiveSkill = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ExclusiveSkill.Initialize(this, FName("VM_SwordExclusiveSkill"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ExclusiveSkillDelegate.IsBound())
        {
            this.ExclusiveSkill.SetRef(this.ExclusiveSkillDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_WizardExclusiveSkill : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WizardExclusiveSkill> ExclusiveSkill;
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
    FString MPInfo;
    UPROPERTY()
    UEUITextBlock Num;
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
    FEUIModelWeakRef __ExclusiveSkill;
    UPROPERTY()
    FGetEUIModelRef ExclusiveSkillDelegate;

    UWidget_WizardExclusiveSkill()
    {
        return;
    }
    UFUNCTION()
    void OnMagicUseCountChanged(const int MagicUseCount)
    {
        if (MagicUseCount >= 1)
        {
            this.Image_Mark1.SetColorAndOpacity(this.Color_Mark_Full);
        }
        else
        {
            this.Image_Mark1.SetColorAndOpacity(this.Color_Mark_Empty);
        }
        if (MagicUseCount >= 2)
        {
            this.Image_Mark2.SetColorAndOpacity(this.Color_Mark_Full);
        }
        else
        {
            this.Image_Mark2.SetColorAndOpacity(this.Color_Mark_Empty);
        }
        if (MagicUseCount >= 3)
        {
            this.Image_Mark3.SetColorAndOpacity(this.Color_Mark_Full);
            return;
        }
        this.Image_Mark3.SetColorAndOpacity(this.Color_Mark_Empty);
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_WizardExclusiveSkill& local_6;
        TEUIModelRef<FVM_WizardExclusiveSkill> local_2 = this.ExclusiveSkill.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WizardExclusiveSkill::__IndexOf_MagicUseCount());
                }
                if (local_6)
                {
                    this.OnMagicUseCountChanged(local_6.GetMagicUseCount());
                }
                break;
            }
            case 1:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WizardExclusiveSkill::__IndexOf_CastProgress());
                }
                if (local_6)
                {
                    this.OnCastProgressChanged(local_6.GetCastProgress());
                }
                break;
            }
            case 2:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WizardExclusiveSkill::__IndexOf_ChargeLevel());
                }
                if (local_6)
                {
                    this.OnChargeLevelChanged(local_6.GetChargeLevel());
                }
                break;
            }
            case 3:
            {
                this.ExclusiveSkill.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WizardExclusiveSkill::__IndexOf_SuperSwitch());
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
                XError(ELog(17), "Remaining observed model change: OnMagicUseCountChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnCastProgressChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnChargeLevelChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnSuperSwitchChanged");
            }
            return;
        }
        this.__ExclusiveSkill = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ExclusiveSkill.Initialize(this, FName("VM_WizardExclusiveSkill"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ExclusiveSkillDelegate.IsBound())
        {
            this.ExclusiveSkill.SetRef(this.ExclusiveSkillDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_ShuijingExclusiveSkill : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ShuijingExclusiveSkill> ExclusiveSkill;
    UPROPERTY()
    UImage CustomSkillEnergy_Background_Pad;
    FEUIModelWeakRef __ExclusiveSkill;
    UPROPERTY()
    FGetEUIModelRef ExclusiveSkillDelegate;

    UWidget_ShuijingExclusiveSkill()
    {
        return;
    }
    UFUNCTION()
    void OnChargeStateChanged(const int ChargeState)
    {
        if (ChargeState == 2)
        {
            this.CustomSkillEnergy_Background_Pad.SetColorAndOpacity(FLinearColor(0.95f, 0.05f, 0.05f, 1.0f));
            return;
        }
        if (ChargeState == 1)
        {
            this.CustomSkillEnergy_Background_Pad.SetColorAndOpacity(FLinearColor(0.99f, 0.5f, 0.2f, 1.0f));
            return;
        }
        this.CustomSkillEnergy_Background_Pad.SetColorAndOpacity(FLinearColor(1.0f, 1.0f, 1.0f, 0.0f));
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ShuijingExclusiveSkill& local_6;
        TEUIModelRef<FVM_ShuijingExclusiveSkill> local_2 = this.ExclusiveSkill.AsRef();
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
                    this.ExclusiveSkill.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ShuijingExclusiveSkill::__IndexOf_ChargeState());
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
        this.__ExclusiveSkill = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ExclusiveSkill.Initialize(this, FName("VM_ShuijingExclusiveSkill"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ExclusiveSkillDelegate.IsBound())
        {
            this.ExclusiveSkill.SetRef(this.ExclusiveSkillDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_QiongExclusiveSkill : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_QiongExclusiveSkill> ExclusiveSkill;
    UPROPERTY()
    UProgressBar Right1;
    UPROPERTY()
    UProgressBar Right2;
    UPROPERTY()
    UProgressBar Right3;
    UPROPERTY()
    UProgressBar Right4;
    UPROPERTY()
    UProgressBar Left1;
    UPROPERTY()
    UProgressBar Left2;
    UPROPERTY()
    FGetEUIModelRef ExclusiveSkillDelegate;

    UWidget_QiongExclusiveSkill()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        int local_5;
        int local_6;
        bool local_4 = (GetCustomSkillEnergyMax_2() > 100.0f);
        if (local_4)
        {
            local_5 = 0;
        }
        else
        {
            local_5 = 1;
        }
        this.Right3.SetVisibility(ESlateVisibility(local_5));
        if (local_4)
        {
            local_6 = 0;
        }
        else
        {
            local_6 = 1;
        }
        this.Right4.SetVisibility(ESlateVisibility(local_6));
        this.Right1.SetPercent(GetRight1Ratio());
        this.Right2.SetPercent(GetRight2Ratio());
        this.Right3.SetPercent(GetRight3Ratio());
        this.Right4.SetPercent(GetRight4Ratio());
        this.Left1.SetPercent(GetLeft1Ratio());
        this.Left2.SetPercent(GetLeft2Ratio());
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ExclusiveSkill.Initialize(this, FName("VM_QiongExclusiveSkill"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ExclusiveSkillDelegate.IsBound())
        {
            this.ExclusiveSkill.SetRef(this.ExclusiveSkillDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_FakeCharacterProgress : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_FakeCharacterProgress> FakeCharacterProgressVM;
    UPROPERTY()
    FGetEUIModelRef FakeCharacterProgressVMDelegate;

    UWidget_FakeCharacterProgress()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.FakeCharacterProgressVM.Initialize(this, FName("VM_FakeCharacterProgress"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.FakeCharacterProgressVMDelegate.IsBound())
        {
            this.FakeCharacterProgressVM.SetRef(this.FakeCharacterProgressVMDelegate.Execute());
        }
        return;
    }
}

class UWidget_SuiXi_Resource_ProgressMat : UUserWidget
{
    UPROPERTY()
    UMaterialInstance MatInstance;
    UPROPERTY()
    UImage ProgressImg;
    UPROPERTY()
    UMaterialInstanceDynamic MatInstanceDynamic;
    UPROPERTY()
    FMaterialParameterInfo ProgressParameter;
    UPROPERTY()
    float32 CurProgress;

    UWidget_SuiXi_Resource_ProgressMat()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.MatInstanceDynamic = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.MatInstance, NAME_None, EMIDCreationFlags(0));
        this.ProgressParameter = this.MatInstanceDynamic.GetParameterInfo(EMaterialParameterAssociation(2), n"Progress ValueV", nullptr);
        this.ProgressImg.SetBrushFromMaterial(this.MatInstanceDynamic);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.MatInstanceDynamic.SetScalarParameterValueByInfo(this.ProgressParameter, this.CurProgress);
        return;
    }
}

namespace UWidget_GramherExclusiveSkill
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
namespace UWidget_SwordExclusiveSkill
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
namespace UWidget_WizardExclusiveSkill
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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
namespace UWidget_ShuijingExclusiveSkill
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
namespace UWidget_QiongExclusiveSkill
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
namespace UWidget_FakeCharacterProgress
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
