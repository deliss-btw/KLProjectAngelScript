

struct FT_Prop_Ability : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EASAbility_Defination;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InitAbilityConfig_Defination;
    UPROPERTY()
    bool bHas_FC_InitAbilityConfig;
    UPROPERTY()
    FC_InitAbilityConfig Config_FC_InitAbilityConfig;

    default CustomName = FName("PropAbility (FT_Prop_Ability)");

    FT_Prop_Ability()
    {
        this.FC_EASAbility_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EASAbility, NAME_None);
        this.FC_InitAbilityConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InitAbilityConfig, NAME_None);
        this.bHas_FC_InitAbilityConfig = false;
        this.__InitDefaults();
        return;
    }
}

