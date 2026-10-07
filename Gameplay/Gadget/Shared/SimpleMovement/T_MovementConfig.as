

struct FT_MovementConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SimpleProjectileMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SimpleProjectileMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_SimpleProjectileMovementConfig = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ThrowMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ThrowMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ThrowMovementConfig = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LinearMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LinearMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_LinearMovementConfig = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_GroundMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_GroundMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_GroundMovementConfig = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TrackMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TrackMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_TrackMovementConfig = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CurveMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CurveMovementConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CurveMovementConfig = false;


}

