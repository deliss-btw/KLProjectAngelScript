

struct FT_SplinePoint : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SplineMoveConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SplineMoveConfig, NAME_None);
    UPROPERTY()
    FC_SplineMoveConfig Config_FC_SplineMoveConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SplineInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SplineInfo, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SuperHookFlyItemConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SuperHookFlyItemConfig, NAME_None);
    UPROPERTY()
    FC_SuperHookFlyItemConfig Config_FC_SuperHookFlyItemConfig;

    FT_SplinePoint()
    {
        return;
    }
}

