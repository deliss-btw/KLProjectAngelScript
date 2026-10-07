

struct FT_Mark : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Mark_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Mark, NAME_None);

    FT_Mark()
    {
        return;
    }
}

