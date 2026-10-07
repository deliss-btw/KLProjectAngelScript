

struct FT_Prop_Presentation : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LevelSpotConfig_Defination;
    UPROPERTY()
    FC_LevelSpotConfig Config_FC_LevelSpotConfig;

    default CustomName = FName("UIиЎЁзЋ° (FT_Prop_Presentation)");

    FT_Prop_Presentation()
    {
        this.FC_LevelSpotConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LevelSpotConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

