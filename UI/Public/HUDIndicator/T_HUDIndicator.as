

struct FT_HUDIndicator : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_IndicatorConfig_Defination;
    UPROPERTY()
    FC_IndicatorConfig Config_FC_IndicatorConfig;

    default CustomName = FName("HUDжЊ‡з¤є (FT_HUDIndicator)");

    FT_HUDIndicator()
    {
        this.FC_IndicatorConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_IndicatorConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

