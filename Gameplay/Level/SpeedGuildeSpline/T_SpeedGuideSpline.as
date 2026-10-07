

struct FT_SpeedGuideSplineFXParam : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SpeedSplineFXParamConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SpeedSplineFXParamConfig, NAME_None);
    UPROPERTY()
    FC_SpeedSplineFXParamConfig Config_FC_SpeedSplineFXParamConfig;

    FT_SpeedGuideSplineFXParam()
    {
        return;
    }
}

