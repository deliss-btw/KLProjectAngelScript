
namespace UWidget_Crossbow_Carriage
{
    const int ViewID = 0;

}
class UWidget_Crossbow_Carriage : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LinkSkillEnergyCrossbow> LinkSillEnergy;
    UPROPERTY()
    UProgressBar EnergyType;
    UPROPERTY()
    UImage CrossHair_Mute;
    UPROPERTY()
    bool bCrosshairMuted = false;
    FEUIModelWeakRef __LinkSillEnergy;


    UFUNCTION()
    void OnSmoothedEnergyChanged(const float32 InSmoothedRatio)
    {
        this.EnergyType.SetPercent(InSmoothedRatio);
        return;
    }
    UFUNCTION()
    void OnEnergyChanged(const float32 InEnergyRatio)
    {
        bool local_3 = (InEnergyRatio >= 1.0f);
        if (!(this.bCrosshairMuted) == !(local_3))
        {
            return;
        }
        this.bCrosshairMuted = local_3;
        if (local_3)
        {
            this.CrossHair_Mute.SetVisibility(ESlateVisibility(0));
            this.EnergyType.SetFillColorAndOpacity(FLinearColor::Red);
            return;
        }
        this.CrossHair_Mute.SetVisibility(ESlateVisibility(2));
        this.EnergyType.SetFillColorAndOpacity(FLinearColor::White);
        return;
    }
    UFUNCTION()
    float32 LinkSillEnergy_EnergyRatio() const
    {
        FVMS_LinkSkillEnergyCrossbow& local_2;
        return local_2 ? local_2.GetEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    float32 LinkSillEnergy_SmoothedEnergyRatio() const
    {
        FVMS_LinkSkillEnergyCrossbow& local_2;
        return local_2 ? local_2.GetSmoothedEnergyRatio() : 0.0f;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_LinkSkillEnergyCrossbow& local_6;
        TEUIModelRef<FVMS_LinkSkillEnergyCrossbow> local_2 = this.LinkSillEnergy.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.LinkSillEnergy.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_LinkSkillEnergyCrossbow::__IndexOf_SmoothedEnergyRatio());
                    }
                    if (local_6)
                    {
                        this.OnSmoothedEnergyChanged(local_6.GetSmoothedEnergyRatio());
                    }
                    this.LinkSillEnergy.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_LinkSkillEnergyCrossbow::__IndexOf_EnergyRatio());
                    }
                    if (local_6)
                    {
                        this.OnEnergyChanged(local_6.GetEnergyRatio());
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
                XError(ELog(17), "Remaining observed model change: OnSmoothedEnergyChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnEnergyChanged");
            }
            return;
        }
        this.__LinkSillEnergy = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LinkSillEnergy.Initialize(this, FName("VMS_LinkSkillEnergyCrossbow"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_Crossbow_Carriage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSmoothedEnergyChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnEnergyChanged"));
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
