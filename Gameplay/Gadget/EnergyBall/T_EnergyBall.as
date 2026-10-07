

struct FT_EnergyBallTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EnergyBall_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EnergyBall, NAME_None);
    UPROPERTY()
    FC_EnergyBall Config_FC_EnergyBall;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LifeTime_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LifeTime, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementInfo, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_FixedDurationMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_FixedDurationMovementConfig, NAME_None);
    UPROPERTY()
    FC_FixedDurationMovementConfig Config_FC_FixedDurationMovementConfig;

    FT_EnergyBallTrait()
    {
        return;
    }
}

