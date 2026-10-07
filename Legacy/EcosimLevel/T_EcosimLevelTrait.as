

struct FT_EcosimLevelSpawner : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimLevelSpawnerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimLevelSpawnerConfig, NAME_None);
    UPROPERTY()
    FC_EcosimLevelSpawnerConfig Config_FC_EcosimLevelSpawnerConfig;

    FT_EcosimLevelSpawner()
    {
        return;
    }
}

struct FT_EcosimLevelSpawnPoint : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimLevelSpawnPointConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimLevelSpawnPointConfig, NAME_None);
    UPROPERTY()
    FC_EcosimLevelSpawnPointConfig Config_FC_EcosimLevelSpawnPointConfig;

    FT_EcosimLevelSpawnPoint()
    {
        return;
    }
}

struct FT_EcosimLevelPoint : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimLevelPointConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimLevelPointConfig, NAME_None);
    UPROPERTY()
    FC_EcosimLevelPointConfig Config_FC_EcosimLevelPointConfig;

    FT_EcosimLevelPoint()
    {
        return;
    }
}

