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

    default SetNodeName("执行TargetingQuery并检查目标数量");


    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_4 = "?";
        switch (this.ComparisonType)
        {
        case EArithmeticKeyOperation(0):
        {
            local_4 = "==";
            break;
        }
        case EArithmeticKeyOperation(1):
        {
            local_4 = "!=";
            break;
        }
        case EArithmeticKeyOperation(2):
        {
            local_4 = "<";
            break;
        }
        case EArithmeticKeyOperation(3):
        {
            local_4 = "<=";
            break;
        }
        case EArithmeticKeyOperation(4):
        {
            local_4 = ">";
            break;
        }
        case EArithmeticKeyOperation(5):
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
        bool local_63 = false;
        FECSEntity local_12 = FECSEntity(this.EntityToCheck.GetValue(Context.opImplConv()));
        if ((!(local_12.IsValid()) || (this.TargetingQueryConfig == nullptr)))
        {
            return false;
        }
        FAIBehaviorTreeContext local_80 = FAITargetingQueryConfig::CreateBehaviorTreeContextForEntity(local_12);
        FAITargetingQueryResult local_104 = ::FAITargetingUtils::Query(local_12, this.TargetingQueryConfig, FAISmartValueContext(local_80));
        int local_106 = local_104.GetEntries().Num();
        switch (this.ComparisonType)
        {
        case EArithmeticKeyOperation(0):
        {
            return (local_106 == this.CompareValue);
        }
        case EArithmeticKeyOperation(1):
        {
            return (local_106 != this.CompareValue);
        }
        case EArithmeticKeyOperation(2):
        {
            return (local_106 < this.CompareValue);
        }
        case EArithmeticKeyOperation(3):
        {
            return (local_106 <= this.CompareValue);
        }
        case EArithmeticKeyOperation(4):
        {
            return (local_106 > this.CompareValue);
        }
        case EArithmeticKeyOperation(5):
        {
            return (local_106 >= this.CompareValue);
        }
        }
        return local_63;
    }
}

