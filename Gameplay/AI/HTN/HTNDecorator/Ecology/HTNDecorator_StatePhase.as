
enum EEcologyPlanerPhase
{
    Action,
    TransitionIn,
    TransitionOut,
    StateLoop,
}


class UHTNDecorator_CheckPlanerStateMachinePhase : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector StateMachinePhaseKey;
    UPROPERTY()
    EEcologyPlanerPhase TargetPhase;

    UHTNDecorator_CheckPlanerStateMachinePhase()
    {
        this.StateMachinePhaseKey.AddIntFilter(this, n"StateMachinePhaseKey");
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_3 = int(this.TargetPhase);
        return (HTNNode::GetWorldStateValueAsInt(Context, this.StateMachinePhaseKey) == local_3);
    }
}

class UHTNTask_SetPlanerStateMachinePhase : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector StateMachinePhaseKey;
    UPROPERTY()
    EEcologyPlanerPhase TargetPhase;

    UHTNTask_SetPlanerStateMachinePhase()
    {
        this.StateMachinePhaseKey.AddIntFilter(this, n"StateMachinePhaseKey");
        return;
    }
    UFUNCTION()
    void CreatePlanSteps_Implementation(const FHTNContext &inout Context) const
    {
        HTNNode::SetWorldStateValueAsInt(Context, this.StateMachinePhaseKey, int(this.TargetPhase));
        this.SubmitPlanStep(1, "");
        return;
    }
}

