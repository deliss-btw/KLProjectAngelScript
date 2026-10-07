

struct FT_HTN : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HTNInstance_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HTNInstance, NAME_None);
    UPROPERTY()
    FC_HTNInstance Config_FC_HTNInstance;

    FT_HTN()
    {
        return;
    }
}

