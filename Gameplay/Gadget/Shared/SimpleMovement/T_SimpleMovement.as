

struct FT_SimpleMovement : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementInfo, NAME_None);

    FT_SimpleMovement()
    {
        return;
    }
}

