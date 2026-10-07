
namespace UWidget_SkillButton
{
    const int ViewID = 0;

}
class UWidget_SkillButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SkillButton> SkillButton;
    UPROPERTY()
    int SkillIndex;
    UPROPERTY()
    const USkillConfig SkillConfig;
    UPROPERTY()
    bool ShowKey;
    UPROPERTY()
    bool IsComposite;
    UPROPERTY()
    FEUIInputActionDataRow InputActionRow;
    UPROPERTY()
    UInputAction InputAction;
    UPROPERTY()
    UTexture2D InputHintBGSquare;
    UPROPERTY()
    UTexture2D InputHintBGWide;
    UPROPERTY()
    UImage SkillButton_Background;
    UPROPERTY()
    UImage SkillButton_Background_SpecialAttack;
    UPROPERTY()
    UImage SkillButton_Background_SpecialAttack_Frame;
    UPROPERTY()
    UImage SkillButton_Icon;
    UPROPERTY()
    UImage SkillButton_CannotUseHint;
    UPROPERTY()
    UImage SkillButton_ActiveHint;
    UPROPERTY()
    UImage InputHint_Background;
    UPROPERTY()
    UProgressBar ProgressBar_SkillCD;
    UPROPERTY()
    UTextBlock Text_UsableTime;
    UPROPERTY()
    UTextBlock Text_EnergyCost;
    UPROPERTY()
    UEUIInputActionWidget IAWidget_InputHint;
    UPROPERTY()
    UCanvasPanel CDCountdownPanel;
    UPROPERTY()
    UWidgetAnimation Ani_SkillCDOverHint;
    UPROPERTY()
    UImage SkillButton_DivineBurst;
    UPROPERTY()
    UImage SkillButton_DivineChaos;
    UPROPERTY()
    FLinearColor Color_SkillIcon_Default = FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    FLinearColor Color_SkillIcon_Free = FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    FLinearColor Color_SpecialAttackIcon_Default = FLinearColor(0.0f, 0.0f, 0.0f, 1.0f);
    UPROPERTY()
    FLinearColor Color_SkillIcon_CoolDown = FLinearColor(1.0f, 1.0f, 1.0f, 0.2f);
    UPROPERTY()
    FLinearColor Color_SpecialAttackBackground_Default = FLinearColor(1.0f, 1.0f, 1.0f, 0.3f);
    FEUIModelWeakRef __SkillButton;
    UPROPERTY()
    FGetEUIModelRef SkillButtonDelegate;

    UWidget_SkillButton()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (!(this.ShowKey))
        {
            this.IAWidget_InputHint.SetVisibility(ESlateVisibility(2));
            this.InputHint_Background.SetVisibility(ESlateVisibility(2));
            return;
        }
        if (this.InputAction != nullptr)
        {
            this.IAWidget_InputHint.SetInputEnhancedAction(this.InputAction);
            return;
        }
        this.IAWidget_InputHint.SetInputTableRowAction(this.InputActionRow);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        if (this.ShowKey)
        {
            if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1 && this.IsComposite)
            {
                this.InputHint_Background.SetBrushFromTexture(this.InputHintBGWide, false);
                this.InputHint_Background.SetRenderScale(FVector2D(2.0, 1.0));
                return;
            }
            this.InputHint_Background.SetBrushFromTexture(this.InputHintBGSquare, false);
            this.InputHint_Background.SetRenderScale(FVector2D(1.0, 1.0));
        }
        return;
    }
    UFUNCTION()
    void HandleSkillConfigChanged(const USkillConfig NewSkillConfig, const ESkillButtonType SkillButtonType)
    {
        UObject local_50;
        if (NewSkillConfig != nullptr)
        {
            if (int(SkillButtonType) != 3)
            {
                local_50 = this.SkillConfig.DefaultSkillStateConfig.PresentationConfig.DefaultIcon.LoadBrush().ResourceObject;
                this.SkillButton_Icon.SetBrushFromTexture(Cast<UTexture2D>(local_50), false);
                this.SkillButton_Icon.SetVisibility(ESlateVisibility(3));
            }
            if (int(SkillButtonType) == 4)
            {
                this.SkillButton_Background.SetVisibility(ESlateVisibility(2));
                this.SkillButton_Background_SpecialAttack.SetVisibility(ESlateVisibility(0));
                this.SkillButton_Background_SpecialAttack_Frame.SetVisibility(ESlateVisibility(0));
            }
            else
            {
                this.SkillButton_Background.SetVisibility(ESlateVisibility(0));
                this.SkillButton_Background_SpecialAttack.SetVisibility(ESlateVisibility(2));
                this.SkillButton_Background_SpecialAttack_Frame.SetVisibility(ESlateVisibility(2));
            }
            return;
        }
        this.SkillButton_Icon.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void HandleConsumableItemConfigChanged(const TDataObjectPtr<FCombatItemConfig> &inout ConsumableItem, const ESkillButtonType SkillButtonType)
    {
        if (int(SkillButtonType) == 3)
        {
            if (ConsumableItem)
            {
                FSlateBrush local_48;
                this.SkillButton_Icon.SetBrush(local_48);
                this.SkillButton_Icon.SetVisibility(ESlateVisibility(3));
                return;
            }
            this.SkillButton_Icon.SetVisibility(ESlateVisibility(2));
        }
        return;
    }
    UFUNCTION()
    void HandleSkillProgressTypeChanged(const ESkillProgressType SkillProgressType)
    {
        if (int(SkillProgressType) == 3)
        {
            this.Text_UsableTime.SetVisibility(ESlateVisibility(0));
        }
        else
        {
            this.Text_UsableTime.SetVisibility(ESlateVisibility(2));
        }
        if (int(SkillProgressType) == 1)
        {
            this.Text_EnergyCost.SetVisibility(ESlateVisibility(0));
            return;
        }
        this.Text_EnergyCost.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void HandleSkillUsableChanged(const bool bSkillUsable)
    {
        if (bSkillUsable)
        {
            this.SkillButton_CannotUseHint.SetVisibility(ESlateVisibility(2));
            return;
        }
        this.SkillButton_CannotUseHint.SetVisibility(ESlateVisibility(0));
        return;
    }
    UFUNCTION()
    void HandleDivineChaos(const bool bDivineChaos)
    {
        if (bDivineChaos)
        {
            this.SkillButton_DivineChaos.SetVisibility(ESlateVisibility(0));
            return;
        }
        this.SkillButton_DivineChaos.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void HandleDivineBurst(const bool bDivineBurst)
    {
        if (bDivineBurst)
        {
            this.SkillButton_DivineBurst.SetVisibility(ESlateVisibility(0));
            return;
        }
        this.SkillButton_DivineBurst.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void HandleSkillButtonStateChanged(const ESkillActiveState SkillState, const int SkillStage, const ESkillButtonState SkillButtonState, const ESkillButtonType SkillButtonType)
    {
        UObject local_62;
        if (int(SkillState) == 1)
        {
            if ((this.SkillConfig != nullptr && (int(SkillButtonType) != 3)))
            {
                ESkillActiveState local_10;
                int local_11 = 1;
                if (this.SkillConfig.DefaultSkillStateConfig.PresentationConfig.StateIcons.Find(local_10, local_11))
                {
                    this.SkillButton_Icon.SetBrushFromTexture(false, local_10);
                }
            }
            if (SkillStage == 1)
            {
                this.ProgressBar_SkillCD.SetVisibility(ESlateVisibility(0));
                this.SkillButton_ActiveHint.SetVisibility(ESlateVisibility(0));
            }
        }
        else
        {
            if ((this.SkillConfig != nullptr && (int(SkillButtonType) != 3)))
            {
                local_62 = this.SkillConfig.DefaultSkillStateConfig.PresentationConfig.DefaultIcon.LoadBrush().ResourceObject;
                this.SkillButton_Icon.SetBrushFromTexture(Cast<UTexture2D>(local_62), false);
            }
            this.SkillButton_ActiveHint.SetVisibility(ESlateVisibility(2));
        }
        if (int(SkillButtonState) == 0)
        {
            this.SkillButton_Icon.SetColorAndOpacity(this.Color_SkillIcon_Default);
            this.ProgressBar_SkillCD.SetVisibility(ESlateVisibility(2));
            if (int(SkillButtonType) == 5)
            {
                this.CDCountdownPanel.SetVisibility(ESlateVisibility(2));
            }
            else
            {
            }
            this.PlayAnimation(this.Ani_SkillCDOverHint, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        else
        {
            if (int(SkillButtonState) == 2)
            {
                if (int(SkillButtonType) == 5)
                {
                    this.CDCountdownPanel.SetVisibility(ESlateVisibility(0));
                }
                this.ProgressBar_SkillCD.SetVisibility(ESlateVisibility(0));
                this.SkillButton_Icon.SetColorAndOpacity(this.Color_SkillIcon_CoolDown);
                return;
            }
            else
            {
                if (int(SkillButtonState) == 3)
                {
                    this.ProgressBar_SkillCD.SetVisibility(ESlateVisibility(2));
                    this.SkillButton_Icon.SetColorAndOpacity(this.Color_SkillIcon_Free);
                    if ((int(SkillButtonType) == 4 || (int(SkillButtonType) == 2)))
                    {
                        this.SkillButton_ActiveHint.SetVisibility(ESlateVisibility(2));
                        return;
                    }
                }
            }
        }
    }
    UFUNCTION()
    float32 SkillButton_SkillCDRatio() const
    {
        FVM_SkillButton& local_2;
        return local_2 ? local_2.GetSkillCDRatio() : 0.0f;
    }
    UFUNCTION()
    int SkillButton_SkillCDRemainTimer() const
    {
        FVM_SkillButton& local_2;
        return local_2 ? local_2.GetSkillCDRemainTimer() : 0;
    }
    UFUNCTION()
    int SkillButton_UsableTime() const
    {
        FVM_SkillButton& local_2;
        return local_2 ? local_2.GetUsableTime() : 0;
    }
    UFUNCTION()
    int SkillButton_EnergyCost() const
    {
        FVM_SkillButton& local_2;
        return local_2 ? local_2.GetEnergyCost() : 0;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SkillButton& local_6;
        TEUIModelRef<FVM_SkillButton> local_2 = this.SkillButton.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.SkillButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillConfig());
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillButtonType());
                }
                if (local_6)
                {
                    int local_61 = int(local_6.GetSkillButtonType());
                    this.HandleSkillConfigChanged(local_6.GetSkillConfig());
                }
                break;
            }
            case 1:
            {
                this.SkillButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_ConsumableItem());
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillButtonType());
                }
                if (local_6)
                {
                    int local_61_2 = int(local_6.GetSkillButtonType());
                    this.HandleConsumableItemConfigChanged(local_6.GetConsumableItem());
                }
                break;
            }
            case 2:
            {
                this.SkillButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillProgressType());
                }
                if (local_6)
                {
                    this.HandleSkillProgressTypeChanged(local_6.GetSkillProgressType());
                }
                break;
            }
            case 3:
            {
                this.SkillButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_bSkillUsable());
                }
                if (local_6)
                {
                    this.HandleSkillUsableChanged(local_6.GetbSkillUsable());
                }
                break;
            }
            case 4:
            {
                this.SkillButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_bDivineChaos());
                }
                if (local_6)
                {
                    this.HandleDivineChaos(local_6.GetbDivineChaos());
                }
                break;
            }
            case 5:
            {
                this.SkillButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_bDivineBurst());
                }
                if (local_6)
                {
                    this.HandleDivineBurst(local_6.GetbDivineBurst());
                }
                break;
            }
            case 6:
            {
                this.SkillButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillState());
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillStage());
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillButtonState());
                    local_6.TrackPropertyRead(::FVM_SkillButton::__IndexOf_SkillButtonType());
                }
                if (local_6)
                {
                    int local_61_3 = int(local_6.GetSkillButtonType());
                    int local_66 = int(local_6.GetSkillButtonState());
                    this.HandleSkillButtonStateChanged(local_6.GetSkillState(), local_6.GetSkillStage());
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
                XError(ELog(17), "Remaining observed model change: HandleSkillConfigChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleConsumableItemConfigChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: HandleSkillProgressTypeChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: HandleSkillUsableChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: HandleDivineChaos");
            }
            if (It.IsDirty(5))
            {
                XError(ELog(17), "Remaining observed model change: HandleDivineBurst");
            }
            if (It.IsDirty(6))
            {
                XError(ELog(17), "Remaining observed model change: HandleSkillButtonStateChanged");
            }
            return;
        }
        this.__SkillButton = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillButton.Initialize(this, FName("VM_SkillButton"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillButtonDelegate.IsBound())
        {
            this.SkillButton.SetRef(this.SkillButtonDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SkillButton
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleSkillConfigChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleConsumableItemConfigChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleSkillProgressTypeChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleSkillUsableChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleDivineChaos"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleDivineBurst"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleSkillButtonStateChanged"));
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
