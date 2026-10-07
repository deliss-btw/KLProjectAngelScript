

struct FT_CombatArealEffect : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectBuffConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectBuffConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatArealEffectBuffConfig = false;
    UPROPERTY()
    FC_CombatArealEffectBuffConfig Config_FC_CombatArealEffectBuffConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectAbilityEffectTriggerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectAbilityEffectTriggerConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatArealEffectAbilityEffectTriggerConfig = false;
    UPROPERTY()
    FC_CombatArealEffectAbilityEffectTriggerConfig Config_FC_CombatArealEffectAbilityEffectTriggerConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectHitTestConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectHitTestConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatArealEffectHitTestConfig = false;
    UPROPERTY()
    FC_CombatArealEffectHitTestConfig Config_FC_CombatArealEffectHitTestConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectFXConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectFXConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatArealEffectFXConfig = false;
    UPROPERTY()
    FC_CombatArealEffectFXConfig Config_FC_CombatArealEffectFXConfig;


}

struct FT_CombatArealEffectSpawner : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectSpawnerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectSpawnerConfig, NAME_None);
    UPROPERTY()
    FC_CombatArealEffectSpawnerConfig Config_FC_CombatArealEffectSpawnerConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CombatArealEffectFXConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CombatArealEffectFXConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_CombatArealEffectFXConfig = false;
    UPROPERTY()
    FC_CombatArealEffectFXConfig Config_FC_CombatArealEffectFXConfig;


}

