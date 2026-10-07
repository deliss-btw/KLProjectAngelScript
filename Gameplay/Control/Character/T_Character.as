

struct FT_Character : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_RandomSeed_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_RandomSeed, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterPoseState_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterPoseState, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterAnimData_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterAnimData, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterMovement_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterMovement, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterMovementNew_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterMovementNew, NAME_None);
    UPROPERTY()
    bool bHas_FC_CharacterMovementNew = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterMovementControl_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterMovementControl, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterMovementParam_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterMovementParam, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterMovementOutput_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterMovementOutput, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterMovementSpeedModifier_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterMovementSpeedModifier, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterMovementConfig, NAME_None);
    UPROPERTY()
    FC_CharacterMovementConfig Config_FC_CharacterMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EntityMass_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EntityMass, NAME_None);
    UPROPERTY()
    FC_EntityMass Config_FC_EntityMass;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MountMoveAgentData_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MountMoveAgentData, NAME_None);
    UPROPERTY()
    FC_MountMoveAgentData Config_FC_MountMoveAgentData;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_GenerateRemoteGhost_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_GenerateRemoteGhost, NAME_None);
    UPROPERTY()
    FC_GenerateRemoteGhost Config_FC_GenerateRemoteGhost;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LockableTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LockableTag, NAME_None);
    UPROPERTY()
    bool bHas_FC_LockableTag = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LockableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LockableConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_LockableConfig = true;
    UPROPERTY()
    FC_LockableConfig Config_FC_LockableConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MultiLockableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MultiLockableConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_MultiLockableConfig = false;
    UPROPERTY()
    FC_MultiLockableConfig Config_FC_MultiLockableConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LockerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LockerConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_LockerConfig = true;
    UPROPERTY()
    FC_LockerConfig Config_FC_LockerConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BodyPartsConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BodyPartsConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_BodyPartsConfig = false;
    UPROPERTY()
    FC_BodyPartsConfig Config_FC_BodyPartsConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InitAbilityConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InitAbilityConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_InitAbilityConfig = false;
    UPROPERTY()
    FC_InitAbilityConfig Config_FC_InitAbilityConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterEnvCheckingConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterEnvCheckingConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CharacterEnvCheckingConfig = false;
    UPROPERTY()
    FC_CharacterEnvCheckingConfig Config_FC_CharacterEnvCheckingConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterEnvEffect_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterEnvEffect, NAME_None);
    UPROPERTY()
    bool bHas_FC_CharacterEnvEffect = false;
    UPROPERTY()
    FC_CharacterEnvEffect Config_FC_CharacterEnvEffect;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ImpactFXConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ImpactFXConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ImpactFXConfig = false;
    UPROPERTY()
    FC_ImpactFXConfig Config_FC_ImpactFXConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AimPoseConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AimPoseConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_AimPoseConfig = false;
    UPROPERTY()
    FC_AimPoseConfig Config_FC_AimPoseConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AnimParamDynamicAdditiveConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AnimParamDynamicAdditiveConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_AnimParamDynamicAdditiveConfig = false;
    UPROPERTY()
    FC_AnimParamDynamicAdditiveConfig Config_FC_AnimParamDynamicAdditiveConfig;
    UPROPERTY()
    bool bSupportVaulting = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterVaulting_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterVaulting, FName("bSupportVaulting"));
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterVaultingConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterVaultingConfig, FName("bSupportVaulting"));
    UPROPERTY()
    FC_CharacterVaultingConfig Config_FC_CharacterVaultingConfig;


}

