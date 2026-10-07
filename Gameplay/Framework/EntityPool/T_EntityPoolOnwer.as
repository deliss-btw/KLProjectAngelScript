

struct FT_EntityPoolOwner : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EntityPoolOwner_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EntityPoolOwner, NAME_None);
    UPROPERTY()
    bool bHas_FC_EntityPoolOwner = true;


}

