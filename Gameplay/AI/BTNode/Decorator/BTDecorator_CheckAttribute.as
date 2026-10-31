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
        Get local_4;
        const FC_GameAttribute& local_6 = local_4.opCall();
        if (local_6)
        {
            float32 local_12;
            float32 local_11 = local_6.GetAttributeValue(this.Attribute, ECS::GetContextTime());
            local_12 = this.Threshold;
            if (int(this.ThresholdMode) == 1)
            {
                float32 local_8 = local_6.GetAttributeValue(this.ReferenceAttribute, ECS::GetContextTime());
                if (local_8 <= 0.0f)
                {
                    return false;
                }
                local_12 = local_8 * this.Threshold;
            }
            return this.CompareValues(local_11, local_12);
        }
        return false;
    }
    bool CompareValues(const float32 Left, const float32 Right) const
    {
        // body not fully recovered — stub [opcode-uncovered]
        bool __r; return __r;
    }
}

