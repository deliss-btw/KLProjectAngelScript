

struct FT_MiniHPBarConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MiniHPBarConfig_Defination;
    UPROPERTY()
    FC_MiniHPBarConfig Config_FC_MiniHPBarConfig;

    default CustomName = FName("иЎЂжќЎ (FT_MiniHPBarConfig)");

    FT_MiniHPBarConfig()
    {
        this.FC_MiniHPBarConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MiniHPBarConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

