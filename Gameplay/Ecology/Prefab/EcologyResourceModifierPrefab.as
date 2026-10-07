

struct FT_EcologyModifierConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcologyResourceModifierConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcologyResourceModifierConfig, NAME_None);
    UPROPERTY()
    FC_EcologyResourceModifierConfig Config_FC_EcologyResourceModifierConfig;

    FT_EcologyModifierConfig()
    {
        return;
    }
}

struct FEcologyModifierUnitConfig : FEcologyUnitConfig
{
    FEcologyUnitConfig _base_FEcologyUnitConfig;
    UPROPERTY()
    FEcologyResourceModifierConfig Modifier;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> Scope;

    FEcologyModifierUnitConfig()
    {
        super();
        return;
    }
}

class AEcologyModifierPrefab : AEcologyUnitECSPrefab
{
    UPROPERTY()
    FT_EcologyModifierConfig Config;

    AEcologyModifierPrefab()
    {
        super();
        return;
    }
    UFUNCTION()
    void SerializeLevelUnit_Implementation(FLevelConfigSerializeContext &inout Context)
    {
        if (Context.IsSave())
        {
            FEcologyModifierUnitConfig local_92;
            local_92.SetupByActor(this);
            local_92.Scope = this.Config.Config_FC_EcologyResourceModifierConfig.Scope;
            local_92.Type = EEcologyUnitType(2);
        }
        return;
    }
}

