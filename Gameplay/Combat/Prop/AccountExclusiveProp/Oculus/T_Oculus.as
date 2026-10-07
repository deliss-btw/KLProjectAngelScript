

struct FT_OculusConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_OculusConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_OculusConfig, NAME_None);
    UPROPERTY()
    FC_OculusConfig Config_FC_OculusConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AccountExclusivePropTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AccountExclusivePropTag, NAME_None);

    FT_OculusConfig()
    {
        return;
    }
}

