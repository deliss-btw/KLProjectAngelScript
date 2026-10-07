

struct FT_InteractTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    bool bEnableInteractSource;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InteractSourceConfig_Defination;
    UPROPERTY()
    FC_InteractSourceConfig Config_FC_InteractSourceConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AutoInteractSourceConfig_Defination;
    UPROPERTY()
    FC_AutoInteractSourceConfig Config_FC_AutoInteractSourceConfig;
    UPROPERTY()
    bool bEnableInteractionTarget;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InteractionTargetConfig_Defination;
    UPROPERTY()
    FC_InteractionTargetConfig Config_FC_InteractionTargetConfig;

    default CustomName = FName("дє¤дє’ (FT_InteractTrait)");

    FT_InteractTrait()
    {
        this.bEnableInteractSource = false;
        this.FC_InteractSourceConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InteractSourceConfig, FName("bEnableInteractSource"));
        this.FC_AutoInteractSourceConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AutoInteractSourceConfig, FName("bEnableInteractSource"));
        this.bEnableInteractionTarget = false;
        this.FC_InteractionTargetConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InteractionTargetConfig, FName("bEnableInteractionTarget"));
        this.__InitDefaults();
        return;
    }
}

