

class UESMAction_EcosimAIV2ActionExpression : UESMBPBaseInstantAction
{
    UPROPERTY()
    EEcosimAIV2ActionExpressionMeaning ActionExpressionMeaning;

    UESMAction_EcosimAIV2ActionExpression()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (Context.GetECSRuntime().IsServer)
        {
            FFPTime local_8 = FFPTime(-1);
            FCE_EcosimAIV2ActionExpression local_12;
            local_12.ActionExpressionMeaning = this.ActionExpressionMeaning;
        }
        return;
    }
}

