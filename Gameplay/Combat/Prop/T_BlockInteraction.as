

struct FT_BlockInteractionConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BlockInteractionConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BlockInteractionConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_BlockInteractionConfig = true;
    UPROPERTY()
    FC_BlockInteractionConfig Config_FC_BlockInteractionConfig;


}

