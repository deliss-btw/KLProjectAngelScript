

struct FT_CharacterCombat : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterWeapon_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterWeapon, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_WeaponDrawSheatheInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_WeaponDrawSheatheInfo, NAME_None);
    UPROPERTY()
    bool bHas_FC_WeaponDrawSheatheInfo = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InitWeaponConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InitWeaponConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_InitWeaponConfig = false;
    UPROPERTY()
    FC_InitWeaponConfig Config_FC_InitWeaponConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DeathConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DeathConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_DeathConfig = true;
    UPROPERTY()
    FC_DeathConfig Config_FC_DeathConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitReaction_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitReaction, NAME_None);
    UPROPERTY()
    bool bHas_FC_HitReaction = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitStunDetach_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitStunDetach, NAME_None);
    UPROPERTY()
    bool bHas_FC_HitStunDetach = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitReactionConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitReactionConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_HitReactionConfig = true;
    UPROPERTY()
    FC_HitReactionConfig Config_FC_HitReactionConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BeHitRecoverAttributeConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BeHitRecoverAttributeConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_BeHitRecoverAttributeConfig = false;
    UPROPERTY()
    FC_BeHitRecoverAttributeConfig Config_FC_BeHitRecoverAttributeConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ExecuteInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ExecuteInfo, NAME_None);
    UPROPERTY()
    bool bHas_FC_ExecuteInfo = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ExecutedInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ExecutedInfo, NAME_None);
    UPROPERTY()
    bool bHas_FC_ExecutedInfo = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ExecutedConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ExecutedConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_ExecutedConfig = false;
    UPROPERTY()
    FC_ExecutedConfig Config_FC_ExecutedConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ExecutionPresentationInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ExecutionPresentationInfo, NAME_None);
    UPROPERTY()
    bool bHas_FC_ExecutionPresentationInfo = false;
    UPROPERTY()
    FC_ExecutionPresentationInfo Config_FC_ExecutionPresentationInfo;


}

struct FT_CombatPresentation : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_WeakDamageTypeInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_WeakDamageTypeInfo, NAME_None);

    FT_CombatPresentation()
    {
        return;
    }
}

