

struct FT_Prop_Existence : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Prop_Defination;
    UPROPERTY()
    bool bHas_FC_Prop;
    UPROPERTY()
    FC_Prop Config_FC_Prop;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_NumLimited_Defination;
    UPROPERTY()
    bool bHas_FC_NumLimited;
    UPROPERTY()
    FC_NumLimited Config_FC_NumLimited;

    default CustomName = FName("з”џе‘Ѕе‘Ёжњџ (FT_Prop_Existence)");

    FT_Prop_Existence()
    {
        this.FC_Prop_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Prop, NAME_None);
        this.bHas_FC_Prop = false;
        this.FC_NumLimited_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_NumLimited, NAME_None);
        this.bHas_FC_NumLimited = false;
        this.__InitDefaults();
        return;
    }
}

