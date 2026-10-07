

struct FT_Mount : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MountSeatsConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MountSeatsConfig, NAME_None);
    UPROPERTY()
    FC_MountSeatsConfig Config_FC_MountSeatsConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MountDashConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MountDashConfig, NAME_None);
    UPROPERTY()
    FC_MountDashConfig Config_FC_MountDashConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InputTransferAcceptConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InputTransferAcceptConfig, NAME_None);
    UPROPERTY()
    FC_InputTransferAcceptConfig Config_FC_InputTransferAcceptConfig;

    FT_Mount()
    {
        return;
    }
}

