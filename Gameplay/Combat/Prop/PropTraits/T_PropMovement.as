

struct FT_Prop_Movement : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SimpleProjectileMovementConfig_Defination;
    UPROPERTY()
    bool bHas_FC_SimpleProjectileMovementConfig;
    UPROPERTY()
    FC_SimpleProjectileMovementConfig Config_FC_SimpleProjectileMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ThrowMovementConfig_Defination;
    UPROPERTY()
    bool bHas_FC_ThrowMovementConfig;
    UPROPERTY()
    FC_ThrowMovementConfig Config_FC_ThrowMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LinearMovementConfig_Defination;
    UPROPERTY()
    bool bHas_FC_LinearMovementConfig;
    UPROPERTY()
    FC_LinearMovementConfig Config_FC_LinearMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_GroundMovementConfig_Defination;
    UPROPERTY()
    bool bHas_FC_GroundMovementConfig;
    UPROPERTY()
    FC_GroundMovementConfig Config_FC_GroundMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TrackMovementConfig_Defination;
    UPROPERTY()
    bool bHas_FC_TrackMovementConfig;
    UPROPERTY()
    FC_TrackMovementConfig Config_FC_TrackMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CurveMovementConfig_Defination;
    UPROPERTY()
    bool bHas_FC_CurveMovementConfig;
    UPROPERTY()
    FC_CurveMovementConfig Config_FC_CurveMovementConfig;

    default CustomName = FName("з§»еЉЁ (FT_Prop_Movement)");

    FT_Prop_Movement()
    {
        this.FC_SimpleProjectileMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SimpleProjectileMovementConfig, NAME_None);
        this.bHas_FC_SimpleProjectileMovementConfig = false;
        this.FC_ThrowMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ThrowMovementConfig, NAME_None);
        this.bHas_FC_ThrowMovementConfig = false;
        this.FC_LinearMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LinearMovementConfig, NAME_None);
        this.bHas_FC_LinearMovementConfig = false;
        this.FC_GroundMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_GroundMovementConfig, NAME_None);
        this.bHas_FC_GroundMovementConfig = false;
        this.FC_TrackMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TrackMovementConfig, NAME_None);
        this.bHas_FC_TrackMovementConfig = false;
        this.FC_CurveMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CurveMovementConfig, NAME_None);
        this.bHas_FC_CurveMovementConfig = false;
        this.__InitDefaults();
        return;
    }
}

