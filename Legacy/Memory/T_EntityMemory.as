

struct FT_EntityMemory : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EntityMemoryInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EntityMemoryInfo, NAME_None);

    FT_EntityMemory()
    {
        return;
    }
}

