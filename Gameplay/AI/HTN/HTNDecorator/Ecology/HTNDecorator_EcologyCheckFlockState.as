

class UHTNDecorator_EcologyCheckFlockState : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    EFlockBehaviorState FlockBehaviorState;
    UPROPERTY()
    bool ByNot;

    default SetNodeName("EcologyCheckFlockState");

    UHTNDecorator_EcologyCheckFlockState()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FC_EcologyFlockBehaviorComponent local_6;
        int local_14;
        if (int(local_6.MainState) == int(this.FlockBehaviorState))
        {
            bool local_13;
            bool local_11 = !(this.ByNot);
            bool local_12 = !(true);
            return local_11 != local_12 && true;
        }
        else
        {
            bool local_13;
            bool local_12_2 = !(this.ByNot);
            local_13 = !(true);
            if (local_12_2 == local_13)
            {
                local_13 = true;
                local_14 = local_13;
            }
            else
            {
                bool local_11_2 = false;
                local_14 = local_11_2;
            }
            return (local_14 != 0);
        }
    }
}

class UHTNDecorator_EcologyCheckFlockMainStates : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    TSet<EFlockBehaviorState> TargetInState;

    default SetNodeName("EcologyCheckFlockMainState");

    UHTNDecorator_EcologyCheckFlockMainStates()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FC_EcologyFlockBehaviorComponent local_6;
        return this.TargetInState.Contains(local_6.MainState);
    }
}

class UHTNDecorator_EcologyCheckResourceValid : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool Inverse;

    default SetNodeName("EcologyCheckResourceValid");

    UHTNDecorator_EcologyCheckResourceValid()
    {
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        bool local_15;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        Get local_8;
        const FC_EcologyFlockComponent& local_10 = local_8.opCall();
        if (local_10)
        {
            bool local_11 = ::FEcologyResourceUtils::CheckResourceValid(FECSEntityId(local_10.ActivityTarget.MainTargetResource));
            if (this.Inverse)
            {
                local_15 = !(local_11);
            }
            else
            {
                local_15 = local_11;
            }
            return local_15;
        }
        return false;
    }
}

