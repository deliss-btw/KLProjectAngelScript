

class UBTDecorator_CheckArealEffectNumByStrikeKey : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FName StrikeKey;
    UPROPERTY()
    float32 Radius = 500.0f;
    UPROPERTY()
    int TargetNum = 1;
    UPROPERTY()
    EArithmeticKeyOperation ComparisonType = EArithmeticKeyOperation(5);

    default SetNodeName("Check ArealEffect Num By StrikeKey");


    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        if (!(Context.PawnEntity.IsValid()))
        {
            return false;
        }
        if (this.Radius <= 0.0f)
        {
            return false;
        }
        Has local_8;
        if (!(local_8.opCall()))
        {
            return false;
        }
        Get local_18;
        FVector local_14 = local_18.opCall().GetPosition();
        int local_19 = 0;
        FECSRuntimeQuery local_64 = FECSRuntimeQueryHelper::MakeRuntimeQuery(Context.PawnEntity, EECSQueryRegsitryType(1), false);
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        FECSRuntimeQueryIterator local_134 = local_64.Iterator();
        for (; local_134.CanProceed;)
        {
            const FECSEntity& local_158 = local_134.Proceed();
            if (!(local_158.IsValid()))
            {
                continue;
            }
            Get local_162;
            const FC_CombatArealEffectHitTestConfig& local_164 = local_162.opCall();
            if (local_164)
            {
                if (!((local_164.ConfigData.StrikeKey == this.StrikeKey)))
                {
                    continue;
                }
                if (((FVector(local_18.opCall().GetPosition()) - local_14).Size()) <= this.Radius)
                {
                    ++local_19;
                }
            }
        }
        bool local_183 = false;
        switch (int(this.ComparisonType))
        {
        case 0:
        {
            local_183 = (local_19 == this.TargetNum);
            break;
        }
        case 1:
        {
            local_183 = (local_19 != this.TargetNum);
            break;
        }
        case 2:
        {
            local_183 = (local_19 < this.TargetNum);
            break;
        }
        case 3:
        {
            local_183 = (local_19 <= this.TargetNum);
            break;
        }
        case 4:
        {
            local_183 = (local_19 > this.TargetNum);
            break;
        }
        case 5:
        {
            local_183 = (local_19 >= this.TargetNum);
            break;
        }
        }
        return local_183;
    }
}

