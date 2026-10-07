

struct FT_Cook : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CookConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CookConfig, NAME_None);
    UPROPERTY()
    FC_CookConfig Config_FC_CookConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CookProp_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CookProp, NAME_None);

    FT_Cook()
    {
        return;
    }
}

