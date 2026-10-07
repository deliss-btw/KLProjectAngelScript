
namespace UWidget_AvatarButton
{
    const int ViewID = 0;

}
class UWidget_AvatarButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarButton> AvatarButton;
    UPROPERTY()
    UImage AvatarButton_Icon;
    UPROPERTY()
    UImage Image_SwitchEnergyEnough;
    UPROPERTY()
    TMap<EDamageType, UMaterialInstance> SwitchAvatarEnoughImageMap;
    FEUIModelWeakRef __AvatarButton;
    UPROPERTY()
    FGetEUIModelRef AvatarButtonDelegate;

    UWidget_AvatarButton()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void HandleSwitchAvatarInCDChanged(const bool bSwitchAvatarInCD)
    {
        if (bSwitchAvatarInCD)
        {
            this.AvatarButton_Icon.SetColorAndOpacity(FLinearColor(1.0f, 1.0f, 1.0f, 0.5f));
            return;
        }
        this.AvatarButton_Icon.SetColorAndOpacity(FLinearColor(1.0f, 1.0f, 1.0f, 1.0f));
        return;
    }
    UFUNCTION()
    void HandleEnergyRatioChanged(const int EnergyLevel)
    {
        if (EnergyLevel >= 1)
        {
            this.Image_SwitchEnergyEnough.SetVisibility(ESlateVisibility(0));
            return;
        }
        this.Image_SwitchEnergyEnough.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void HandleAvatarDamageTypeChanged(const EDamageType AvatarDamageType)
    {
        EDamageType local_2;
        if (this.SwitchAvatarEnoughImageMap.Find(AvatarDamageType, local_2))
        {
            this.Image_SwitchEnergyEnough.SetBrushFromMaterial(local_2);
        }
        return;
    }
    UFUNCTION()
    UTexture2D AvatarButton_AvatarIcon() const
    {
        FVM_AvatarButton& local_2;
        UTexture2D local_8;
        if (local_2)
        {
            local_8 = local_2.GetAvatarIcon();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    FText AvatarButton_TextCDRemained() const
    {
        FVM_AvatarButton& local_2;
        FText local_16 = local_2 ? local_2.CDRemainedAsText() : FText();
        return local_16;
    }
    UFUNCTION()
    bool AvatarButton_BoolCDRemained() const
    {
        FVM_AvatarButton& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.CDRemainedAsBool();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    ESlateVisibility AvatarButton_SlateVisibilityCDRemained() const
    {
        FVM_AvatarButton& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.CDRemainedAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    float32 AvatarButton_CDRemainedRadio() const
    {
        FVM_AvatarButton& local_2;
        return local_2 ? local_2.GetCDRemainedRadio() : 0.0f;
    }
    UFUNCTION()
    bool AvatarButton_bSwitchAvatarInCD() const
    {
        FVM_AvatarButton& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbSwitchAvatarInCD();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_AvatarButton& local_6;
        TEUIModelRef<FVM_AvatarButton> local_2 = this.AvatarButton.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.AvatarButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarButton::__IndexOf_bSwitchAvatarInCD());
                }
                if (local_6)
                {
                    this.HandleSwitchAvatarInCDChanged(local_6.GetbSwitchAvatarInCD());
                }
                break;
            }
            case 1:
            {
                this.AvatarButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarButton::__IndexOf_EnergyLevel());
                }
                if (local_6)
                {
                    this.HandleEnergyRatioChanged(local_6.GetEnergyLevel());
                }
                break;
            }
            case 2:
            {
                this.AvatarButton.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_AvatarButton::__IndexOf_AvatarDamageType());
                }
                if (local_6)
                {
                    this.HandleAvatarDamageTypeChanged(local_6.GetAvatarDamageType());
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
                XError(ELog(17), "Remaining observed model change: HandleSwitchAvatarInCDChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleEnergyRatioChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: HandleAvatarDamageTypeChanged");
            }
            return;
        }
        this.__AvatarButton = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarButton.Initialize(this, FName("VM_AvatarButton"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarButtonDelegate.IsBound())
        {
            this.AvatarButton.SetRef(this.AvatarButtonDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarButton
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleSwitchAvatarInCDChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleEnergyRatioChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleAvatarDamageTypeChanged"));
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
