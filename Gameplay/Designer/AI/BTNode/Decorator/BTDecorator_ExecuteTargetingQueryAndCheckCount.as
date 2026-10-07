

class UBTDecorator_ExecuteTargetingQueryAndCheckCount : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityToCheck = FAISmart_EntityId(n"SelfEntity", EAISmartValue(0));
    UPROPERTY()
    TDataObjectPtr<FAITargetingQueryConfig> TargetingQueryConfig;
    UPROPERTY()
    EArithmeticKeyOperation ComparisonType = EArithmeticKeyOperation(4);
    UPROPERTY()
    int CompareValue = 0;

    default SetNodeName("ж‰§иЎЊTargetingQueryе№¶жЈЂжџҐз›®ж ‡ж•°й‡Џ");


    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_4 = "?";
        switch (int(this.ComparisonType))
        {
        case 0:
        {
            local_4 = "==";
            break;
        }
        case 1:
        {
            local_4 = "!=";
            break;
        }
        case 2:
        {
            local_4 = "<";
            break;
        }
        case 3:
        {
            local_4 = "<=";
            break;
        }
        case 4:
        {
            local_4 = ">";
            break;
        }
        case 5:
        {
            local_4 = ">=";
            break;
        }
        }
        return FString().Append("Count ").Append(local_4).Append(" ").Append(this.CompareValue);
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
}

