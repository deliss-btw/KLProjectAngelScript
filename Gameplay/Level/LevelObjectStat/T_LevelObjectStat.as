

struct FT_LevelObjectStat : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LevelObjectStatConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LevelObjectStatConfig, NAME_None);
    UPROPERTY()
    FC_LevelObjectStatConfig Config_FC_LevelObjectStatConfig;

    FT_LevelObjectStat()
    {
        return;
    }
}

