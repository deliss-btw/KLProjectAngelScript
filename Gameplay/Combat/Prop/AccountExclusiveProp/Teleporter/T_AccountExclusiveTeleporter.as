

struct FT_AccountExclusiveTeleporter : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AccountExclusiveTeleporterConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AccountExclusiveTeleporterConfig, NAME_None);
    UPROPERTY()
    FC_AccountExclusiveTeleporterConfig Config_FC_AccountExclusiveTeleporterConfig;

    FT_AccountExclusiveTeleporter()
    {
        return;
    }
}

