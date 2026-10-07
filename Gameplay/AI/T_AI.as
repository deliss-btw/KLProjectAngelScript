

struct FT_AI : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ControlledByAI_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ControlledByAI, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AICombatKnowledge_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AICombatKnowledge, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIInputTriggerSimulator_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIInputTriggerSimulator, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterAIConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterAIConfig, NAME_None);
    UPROPERTY()
    FC_CharacterAIConfig Config_FC_CharacterAIConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIKnowledge_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIKnowledge, NAME_None);
    UPROPERTY()
    bool bHas_FC_AIKnowledge = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AITargetingV2_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AITargetingV2, NAME_None);
    UPROPERTY()
    bool bHas_FC_AITargetingV2 = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIBehaviorConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIBehaviorConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_AIBehaviorConfig = true;
    UPROPERTY()
    FC_AIBehaviorConfig Config_FC_AIBehaviorConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AINavAgent_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AINavAgent, NAME_None);
    UPROPERTY()
    bool bHas_FC_AINavAgent = true;
    UPROPERTY()
    FC_AINavAgent Config_FC_AINavAgent;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AirNavigable_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AirNavigable, NAME_None);
    UPROPERTY()
    bool bHas_FC_AirNavigable = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AISimpleMovementOptimizeTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AISimpleMovementOptimizeTag, NAME_None);
    UPROPERTY()
    bool bHas_FC_AISimpleMovementOptimizeTag = true;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIAvoidanceConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIAvoidanceConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_AIAvoidanceConfig = true;
    UPROPERTY()
    FC_AIAvoidanceConfig Config_FC_AIAvoidanceConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AISpecialCombatTokenReceiver_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AISpecialCombatTokenReceiver, NAME_None);
    UPROPERTY()
    bool bHas_FC_AISpecialCombatTokenReceiver = false;
    UPROPERTY()
    FC_AISpecialCombatTokenReceiver Config_FC_AISpecialCombatTokenReceiver;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIAvoidancePathfindingObstacleAgentTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIAvoidancePathfindingObstacleAgentTag, NAME_None);
    UPROPERTY()
    bool bHas_FC_AIAvoidancePathfindingObstacleAgentTag = false;
    UPROPERTY()
    FC_AIAvoidancePathfindingObstacleAgentTag Config_FC_AIAvoidancePathfindingObstacleAgentTag;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcologyHTNPlanerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcologyHTNPlanerConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_EcologyHTNPlanerConfig = false;
    UPROPERTY()
    FC_EcologyHTNPlanerConfig Config_FC_EcologyHTNPlanerConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIStandTurnConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIStandTurnConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_AIStandTurnConfig = false;
    UPROPERTY()
    FC_AIStandTurnConfig Config_FC_AIStandTurnConfig;


}

struct FT_AIThreat : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIThreatConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIThreatConfig, NAME_None);
    UPROPERTY()
    FC_AIThreatConfig Config_FC_AIThreatConfig;

    FT_AIThreat()
    {
        return;
    }
}

struct FT_AITargetable : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AITargetableTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AITargetableTag, NAME_None);

    FT_AITargetable()
    {
        return;
    }
}

