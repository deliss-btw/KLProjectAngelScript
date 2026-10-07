

struct FT_LevelEntry : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LevelEntryConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LevelEntryConfig, NAME_None);
    UPROPERTY()
    FC_LevelEntryConfig Config_FC_LevelEntryConfig;

    FT_LevelEntry()
    {
        return;
    }
}

