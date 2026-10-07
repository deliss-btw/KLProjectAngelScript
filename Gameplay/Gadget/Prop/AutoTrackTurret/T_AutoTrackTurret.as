

struct FT_AutoTrackTurret : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AutoTrackTurretConfig_Defination;
    UPROPERTY()
    FC_AutoTrackTurretConfig Config_FC_AutoTrackTurretConfig;

    default CustomName = FName("и‡ЄеЉЁиїЅиёЄз‚®еЏ°й…ЌзЅ® (FT_AutoTrackTurret)");

    FT_AutoTrackTurret()
    {
        this.FC_AutoTrackTurretConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AutoTrackTurretConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

