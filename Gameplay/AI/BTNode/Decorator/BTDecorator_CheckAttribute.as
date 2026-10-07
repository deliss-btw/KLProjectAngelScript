
enum EAttributeThresholdMode
{
    Absolute,
    PercentOfAttribute,
}


class UBTDecorator_CheckAttribute : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    EArithmeticKeyOperation ComparisonType = EArithmeticKeyOperation(5);
    UPROPERTY()
    float32 Threshold = 0.0f;
    UPROPERTY()
    EAttributeThresholdMode ThresholdMode = EAttributeThresholdMode(0);
    UPROPERTY()
    FGameAttributeRef ReferenceAttribute;

    default SetNodeName("Check Attribute");


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
        if (int(this.ThresholdMode) == 1)
        {
            int local_7 = uint((this.Threshold * 100.0f));
            return FString().Append(": ").Append(this.Attribute.ToString()).Append(" ").Append(local_4).Append(" ").Append(local_7).Append("% of ").Append(this.ReferenceAttribute.ToString());
        }
        return FString().Append(": ").Append(this.Attribute.ToString()).Append(" ").Append(local_4).Append(" ").Append(this.Threshold);
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    bool CompareValues(const float32 Left, const float32 Right) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
}

