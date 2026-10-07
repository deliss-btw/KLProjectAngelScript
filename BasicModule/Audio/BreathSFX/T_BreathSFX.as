

struct FT_BreathSFX : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SFXStateConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SFXStateConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_SFXStateConfig = true;
    UPROPERTY()
    FC_SFXStateConfig Config_FC_SFXStateConfig;


}

