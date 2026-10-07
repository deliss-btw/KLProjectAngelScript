

struct FT_AccountExclusiveProp : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AccountExclusivePropConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AccountExclusivePropConfig, NAME_None);
    UPROPERTY()
    FC_AccountExclusivePropConfig Config_FC_AccountExclusivePropConfig;

    FT_AccountExclusiveProp()
    {
        return;
    }
}

