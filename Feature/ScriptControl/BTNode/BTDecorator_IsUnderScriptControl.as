

class UBTDecorator_IsUnderScriptControl : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bCombat = false;

    default SetNodeName("Is Under ScriptControl");


    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            return false;
        }
        else
        {
            if (this.bCombat)
            {
                Has local_10;
                if (!(local_10.opCall()))
                {
                    return false;
                }
                else
                {
                    Get local_14;
                    return local_14.opCall().bEnabled;
                }
            }
            else
            {
                Has local_18;
                if (!(local_18.opCall()))
                {
                    return false;
                }
                else
                {
                    Get local_22;
                    return local_22.opCall().bEnabled;
                }
            }
        }
    }
}

