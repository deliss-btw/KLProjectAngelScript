

struct FT_SwitchPlayerAvatarConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SwitchPlayerAvatarConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SwitchPlayerAvatarConfig, NAME_None);
    UPROPERTY()
    FC_SwitchPlayerAvatarConfig Config_FC_SwitchPlayerAvatarConfig;

    FT_SwitchPlayerAvatarConfig()
    {
        return;
    }
}

struct FT_SwitchPlayerInfo : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SwitchPlayerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SwitchPlayerConfig, NAME_None);
    UPROPERTY()
    FC_SwitchPlayerConfig Config_FC_SwitchPlayerConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SwitchPlayerInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SwitchPlayerInfo, NAME_None);
    UPROPERTY()
    FC_SwitchPlayerInfo Config_FC_SwitchPlayerInfo;

    FT_SwitchPlayerInfo()
    {
        return;
    }
}

