

struct FT_Turret : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TurretConfig_Defination;
    UPROPERTY()
    FC_TurretConfig Config_FC_TurretConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TurretAttachmentConfig_Defination;
    UPROPERTY()
    FC_TurretAttachmentConfig Config_FC_TurretAttachmentConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DefaultAttachComponentMeshSpaceTransform_Defination;
    UPROPERTY()
    FC_DefaultAttachComponentMeshSpaceTransform Config_FC_DefaultAttachComponentMeshSpaceTransform;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ScalerResourceConfig_Defination;
    UPROPERTY()
    bool bHas_FC_ScalerResourceConfig;
    UPROPERTY()
    FC_ScalerResourceConfig Config_FC_ScalerResourceConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InputTransferAcceptConfig_Defination;
    UPROPERTY()
    bool bHas_FC_InputTransferAcceptConfig;
    UPROPERTY()
    FC_InputTransferAcceptConfig Config_FC_InputTransferAcceptConfig;

    default CustomName = FName("з‚®еЏ°й…ЌзЅ® (FT_Turret)");

    FT_Turret()
    {
        this.FC_TurretConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TurretConfig, NAME_None);
        this.FC_TurretAttachmentConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TurretAttachmentConfig, NAME_None);
        this.FC_DefaultAttachComponentMeshSpaceTransform_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DefaultAttachComponentMeshSpaceTransform, NAME_None);
        this.FC_ScalerResourceConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ScalerResourceConfig, NAME_None);
        this.bHas_FC_ScalerResourceConfig = false;
        this.FC_InputTransferAcceptConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InputTransferAcceptConfig, NAME_None);
        this.bHas_FC_InputTransferAcceptConfig = false;
        this.__InitDefaults();
        return;
    }
}

