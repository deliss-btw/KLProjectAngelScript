

struct FT_ArealStrikeEnvSurfaceFXConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ArealStrikeEnvSurfaceFXConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ArealStrikeEnvSurfaceFXConfig, NAME_None);
    UPROPERTY()
    FC_ArealStrikeEnvSurfaceFXConfig Config_FC_ArealStrikeEnvSurfaceFXConfig;

    FT_ArealStrikeEnvSurfaceFXConfig()
    {
        return;
    }
}

