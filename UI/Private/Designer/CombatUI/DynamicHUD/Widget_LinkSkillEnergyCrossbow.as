
namespace UWidget_LinkSkillEnergyCrossbow
{
    const int ViewID = 0;

}
class UWidget_LinkSkillEnergyCrossbow : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LinkSkillEnergyCrossbow> LinkSkillEnergyCrossbow;
    UPROPERTY()
    UProgressBar EnergyType;
    UPROPERTY()
    UImage CrossHair_Mute;
    FEUIModelWeakRef __LinkSkillEnergyCrossbow;

    UWidget_LinkSkillEnergyCrossbow()
    {
        return;
    }
    UFUNCTION()
    void OnSmoothedEnergyChanged(const float32 InSmoothedRatio)
    {
        this.EnergyType.SetPercent(InSmoothedRatio);
        if (InSmoothedRatio <= 0.05f)
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
    float32 LinkSkillEnergyCrossbow_EnergyRatio() const
    {
        FVMS_LinkSkillEnergyCrossbow& local_2;
        return local_2 ? local_2.GetEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    float32 LinkSkillEnergyCrossbow_SmoothedEnergyRatio() const
    {
        FVMS_LinkSkillEnergyCrossbow& local_2;
        return local_2 ? local_2.GetSmoothedEnergyRatio() : 0.0f;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_LinkSkillEnergyCrossbow& local_6;
        TEUIModelRef<FVMS_LinkSkillEnergyCrossbow> local_2 = this.LinkSkillEnergyCrossbow.AsRef();
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
                    this.LinkSkillEnergyCrossbow.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_LinkSkillEnergyCrossbow::__IndexOf_SmoothedEnergyRatio());
                    }
                    if (local_6)
                    {
                        this.OnSmoothedEnergyChanged(local_6.GetSmoothedEnergyRatio());
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
            return;
        }
        this.__LinkSkillEnergyCrossbow = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LinkSkillEnergyCrossbow.Initialize(this, FName("VMS_LinkSkillEnergyCrossbow"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_LinkSkillEnergyCrossbow
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSmoothedEnergyChanged"));
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
