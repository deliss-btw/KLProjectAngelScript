namespace BlueprintFunctions_ScriptControl
{
UFUNCTION()
void EnableScriptControl(const FECSEntityId &inout EntityId)
{
    ScriptControlUtils::EnableScriptControl(EntityId, EScriptControlSourceType(0));
    return;
}
UFUNCTION()
void DisableScriptControlAndClearQueue(const FECSEntityId &inout EntityId)
{
    ScriptControlUtils::DisableAndClearAll(EntityId, EScriptControlSourceType(0));
    return;
}
UFUNCTION()
int PushSCtrlState(const FECSEntityId &inout EntityId, const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params)
{
    return ScriptControlUtils::PushScriptControlState(EntityId, EScriptControlSourceType(0), EScriptControlBehaviorName(BehaviorName), Params);
}
UFUNCTION()
int PushSCtrlAction(const FECSEntityId &inout EntityId, const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params, const bool bInsertFront = false)
{
    return ScriptControlUtils::PushScriptControlAction(EntityId, EScriptControlSourceType(0), EScriptControlBehaviorName(BehaviorName), Params, bInsertFront);
}
UFUNCTION()
int PushSCtrlEcologyMoveState(const FECSEntityId &inout EntityId, const FScriptControlEcologyMoveParams &inout EcologyMoveParams)
{
    return ScriptControlUtils::PushScriptControlState(EntityId, EScriptControlSourceType(0), EScriptControlBehaviorName(1), ScriptControlParamPacker::PackEcologyMove(EcologyMoveParams));
}
UFUNCTION()
int PushSCtrlEcologyMoveAction(const FECSEntityId &inout EntityId, const FScriptControlEcologyMoveParams &inout EcologyMoveParams, const bool bInsertFront = false)
{
    return ScriptControlUtils::PushScriptControlAction(EntityId, EScriptControlSourceType(0), EScriptControlBehaviorName(1), ScriptControlParamPacker::PackEcologyMove(EcologyMoveParams), bInsertFront);
}
UFUNCTION()
int PushSCtrlESMSkillAction(const FECSEntityId &inout EntityId, const FScriptControlESMSkillParams &inout SkillParams, const bool bInsertFront = false, const bool bAutoAddHostility = true)
{
    return CombatScriptControlUtils::PushCombatScriptControlAction(EntityId, EScriptControlSourceType(0), EScriptControlBehaviorName(2), ScriptControlParamPacker::PackESMSkill(SkillParams), bInsertFront, bAutoAddHostility);
}
UFUNCTION()
int PushSCtrlESMEcologyBehaviorState(const FECSEntityId &inout EntityId, const FScriptControlESMEcologyBehaviorParams &inout EcologyParams)
{
    return ScriptControlUtils::PushScriptControlState(EntityId, EScriptControlSourceType(0), EScriptControlBehaviorName(3), ScriptControlParamPacker::PackESMEcologyBehavior(EcologyParams));
}
UFUNCTION()
int PushSCtrlESMEcologyBehaviorAction(const FECSEntityId &inout EntityId, const FScriptControlESMEcologyBehaviorParams &inout EcologyParams, const bool bInsertFront = false)
{
    return ScriptControlUtils::PushScriptControlAction(EntityId, EScriptControlSourceType(0), EScriptControlBehaviorName(3), ScriptControlParamPacker::PackESMEcologyBehavior(EcologyParams), bInsertFront);
}
UFUNCTION()
int PushSCtrlTriggerESMState(const FECSEntityId &inout EntityId, const FScriptControlTriggerESMParams &inout ESMParams)
{
    XError(ELog(30), "[ScriptControl] PushSCtrlTriggerESMState is deprecated: TriggerESMSkill is combat-only");
    return -1;
}
UFUNCTION()
void FinishCurrentSCtrlState(const FECSEntityId &inout EntityId)
{
    ScriptControlUtils::FinishCurrentScriptControlState(EntityId, EScriptControlSourceType(0));
    return;
}
UFUNCTION()
void StopAndClearSCtrlStateQueue(const FECSEntityId &inout EntityId)
{
    ScriptControlUtils::StopAndClearScriptControlStateQueue(EntityId, EScriptControlSourceType(0));
    return;
}
UFUNCTION()
void RestartSCtrlStateQueue(const FECSEntityId &inout EntityId)
{
    ScriptControlUtils::RestartScriptControlStateQueue(EntityId, EScriptControlSourceType(0));
    return;
}
UFUNCTION()
void StopAndClearSCtrlActionQueue(const FECSEntityId &inout EntityId)
{
    ScriptControlUtils::StopAndClearScriptControlActionQueue(EntityId, EScriptControlSourceType(0));
    return;
}
UFUNCTION()
void StopAndClearCombatSCtrlActionQueue(const FECSEntityId &inout EntityId)
{
    CombatScriptControlUtils::StopAndClearCombatActionQueue(EntityId, EScriptControlSourceType(0));
    return;
}
}
