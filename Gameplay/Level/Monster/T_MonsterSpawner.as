

struct FT_RandomMonsterSpawner : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_RandomMonsterSpawner_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_RandomMonsterSpawner, NAME_None);
    UPROPERTY()
    FC_RandomMonsterSpawner Config_FC_RandomMonsterSpawner;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_RandomMonsterSpawnerRuntimeInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_RandomMonsterSpawnerRuntimeInfo, NAME_None);

    FT_RandomMonsterSpawner()
    {
        return;
    }
}

