

struct FT_EcoCollectableSpawnerRuntime : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcoCollectableSpawnerRuntime_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcoCollectableSpawnerRuntime, NAME_None);

    FT_EcoCollectableSpawnerRuntime()
    {
        return;
    }
}

