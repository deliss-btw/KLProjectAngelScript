

struct FT_TeleportSlotConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TeleportSlotConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TeleportSlotConfig, NAME_None);
    UPROPERTY()
    FC_TeleportSlotConfig Config_FC_TeleportSlotConfig;

    FT_TeleportSlotConfig()
    {
        return;
    }
}

