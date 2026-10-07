
namespace UWidget_LinkSkillCrossbow
{
    const int ViewID = 0;

}
class UWidget_LinkSkillCrossbow : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_LinkSkillEnergy> LinkSkillEnergy;
    UPROPERTY()
    FGetEUIModelRef LinkSkillEnergyDelegate;

    UWidget_LinkSkillCrossbow()
    {
        return;
    }
    UFUNCTION()
    float32 LinkSkillEnergy_EnergyRatio() const
    {
        FVM_LinkSkillEnergy& local_2;
        return local_2 ? local_2.GetEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    float32 LinkSkillEnergy_HeatRatio() const
    {
        FVM_LinkSkillEnergy& local_2;
        return local_2 ? local_2.GetHeatRatio() : 0.0f;
    }
    UFUNCTION()
    bool LinkSkillEnergy_bManipulatedPropIsOverHeat() const
    {
        FVM_LinkSkillEnergy& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbManipulatedPropIsOverHeat();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    EProjectileFireResourceType LinkSkillEnergy_ProjectileFireResourceType() const
    {
        FVM_LinkSkillEnergy& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.GetProjectileFireResourceType());
        }
        else
        {
            local_5 = 0;
        }
        return EProjectileFireResourceType(local_5);
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LinkSkillEnergy.Initialize(this, FName("VM_LinkSkillEnergy"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.LinkSkillEnergyDelegate.IsBound())
        {
            this.LinkSkillEnergy.SetRef(this.LinkSkillEnergyDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_LinkSkillCrossbow
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
