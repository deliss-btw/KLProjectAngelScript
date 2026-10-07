

struct FT_Teleporter : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TeleporterConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TeleporterConfig, NAME_None);
    UPROPERTY()
    FC_TeleporterConfig Config_FC_TeleporterConfig;

    FT_Teleporter()
    {
        return;
    }
}

