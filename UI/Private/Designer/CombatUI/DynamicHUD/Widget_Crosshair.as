
namespace UWidget_Crosshair
{
    const int ViewID = 0;

}
class UWidget_Crosshair : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_Crosshair> Crosshair;
    UPROPERTY()
    UCanvasPanel CanvasPanel;
    UPROPERTY()
    UCanvasPanel Panel_ChargeCross;
    UPROPERTY()
    UImage Circle_Inner;
    UPROPERTY()
    UImage Line_1;
    UPROPERTY()
    UImage Line_2;
    UPROPERTY()
    UImage Line_3;
    UPROPERTY()
    UImage Line_4;
    UPROPERTY()
    UWidgetAnimation DelayShow;
    UPROPERTY()
    UWidgetAnimation StartCharge_Line;
    UPROPERTY()
    UWidgetAnimation StartCharge_Scale;
    UPROPERTY()
    UCurveLinearColor ColorCurve;
    UPROPERTY()
    float32 ChargeRatio;
    FEUIModelWeakRef __Crosshair;

    UWidget_Crosshair()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.CanvasPanel.SetRenderOpacity(0.0f);
        return;
    }
    UFUNCTION()
    void ShowCrosshair(const bool IsPlayerAiming)
    {
        if (IsPlayerAiming == true)
        {
            this.PlayAnimation(this.DelayShow, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        this.CanvasPanel.SetRenderOpacity(0.0f);
        return;
    }
    UFUNCTION()
    void Scale(const float32 ChargeEnergy)
    {
        FVMS_Crosshair& local_2;
        if (local_2.GetChargeEnergyMax() <= 0.0f)
        {
            return;
        }
        this.ChargeRatio = (ChargeEnergy / local_2.GetChargeEnergyMax());
        this.Circle_Inner.SetColorAndOpacity(this.ColorCurve.GetLinearColorValue(this.ChargeRatio));
        this.Line_1.SetColorAndOpacity(this.ColorCurve.GetLinearColorValue(this.ChargeRatio));
        this.Line_2.SetColorAndOpacity(this.ColorCurve.GetLinearColorValue(this.ChargeRatio));
        this.Line_3.SetColorAndOpacity(this.ColorCurve.GetLinearColorValue(this.ChargeRatio));
        this.Line_4.SetColorAndOpacity(this.ColorCurve.GetLinearColorValue(this.ChargeRatio));
        float32 local_4 = (1.0f - this.ChargeRatio) * 40.0f;
        float32 local_10 = local_4 + 20.0f;
        UPanelSlot local_14 = this.Panel_ChargeCross.Slot;
        UCanvasPanelSlot local_18 = (Cast<UCanvasPanelSlot>(local_14));
        local_18.SetSize(FVector2D(local_10, local_10));
        return;
    }
    UFUNCTION()
    void ChangeChargeState(const bool IsCharging)
    {
        if (IsCharging)
        {
            this.PlayAnimationForward(this.StartCharge_Line, 1.0f, false);
            this.PlayAnimationForward(this.StartCharge_Scale, 1.0f, false);
            return;
        }
        this.PlayAnimationReverse(this.StartCharge_Line, 1.5f, false);
        this.PlayAnimationReverse(this.StartCharge_Scale, 1.5f, false);
        return;
    }
    UFUNCTION()
    ESlateVisibility Crosshair_SlateVisibilitybShowRemoveMarkHint() const
    {
        FVMS_Crosshair& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.bShowRemoveMarkHintAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    ESlateVisibility Crosshair_SlateVisibilitybShowAddMarkHint() const
    {
        FVMS_Crosshair& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.bShowAddMarkHintAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_Crosshair& local_6;
        TEUIModelRef<FVMS_Crosshair> local_2 = this.Crosshair.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.Crosshair.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_Crosshair::__IndexOf_IsPlayerAiming());
                }
                if (local_6)
                {
                    this.ShowCrosshair(local_6.GetIsPlayerAiming());
                }
                break;
            }
            case 1:
            {
                this.Crosshair.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_Crosshair::__IndexOf_ChargeEnergy());
                }
                if (local_6)
                {
                    this.Scale(local_6.GetChargeEnergy());
                }
                break;
            }
            case 2:
            {
                this.Crosshair.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVMS_Crosshair::__IndexOf_IsCharging());
                }
                if (local_6)
                {
                    this.ChangeChargeState(local_6.GetIsCharging());
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
                XError(ELog(17), "Remaining observed model change: ShowCrosshair");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: Scale");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: ChangeChargeState");
            }
            return;
        }
        this.__Crosshair = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Crosshair.Initialize(this, FName("VMS_Crosshair"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_Crosshair
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("ShowCrosshair"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("Scale"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("ChangeChargeState"));
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
