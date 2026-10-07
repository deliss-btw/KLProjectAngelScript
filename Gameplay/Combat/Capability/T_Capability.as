

struct FT_Capability : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Capability_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Capability, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CapabilityParams_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CapabilityParams, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CapabilityModifiers_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CapabilityModifiers, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CapabilityInitConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CapabilityInitConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CapabilityInitConfig = false;
    UPROPERTY()
    FC_CapabilityInitConfig Config_FC_CapabilityInitConfig;


}

