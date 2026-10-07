

struct FT_PortalConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PortalConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PortalConfig, NAME_None);
    UPROPERTY()
    FC_PortalConfig Config_FC_PortalConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LevelObjectStatUnlockConditionConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LevelObjectStatUnlockConditionConfig, NAME_None);
    UPROPERTY()
    FC_LevelObjectStatUnlockConditionConfig Config_FC_LevelObjectStatUnlockConditionConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AccountExclusivePropTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AccountExclusivePropTag, NAME_None);

    FT_PortalConfig()
    {
        return;
    }
}

