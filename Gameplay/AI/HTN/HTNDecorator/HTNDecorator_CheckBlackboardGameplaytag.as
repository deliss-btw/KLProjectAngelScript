

class UHTNDecorator_CheckBlackboardGameplaytag : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_GameplayTag TagA;
    UPROPERTY()
    FGameplayTag TagB;
    UPROPERTY()
    bool bCheckIsEqual = true;

    default SetNodeName("CheckBlackboardGameplaytag");


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FGameplayTag local_6 = this.TagA.GetValue(Context.opImplConv());
        if (local_6.MatchesTag(this.TagB))
        {
            if (this.bCheckIsEqual)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            if (this.bCheckIsEqual)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}

