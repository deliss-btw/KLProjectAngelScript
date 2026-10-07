

class UBTDecorator_CheckPlayerTargetNum : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityToCheck = FAISmart_EntityId(n"SelfEntity", EAISmartValue(0));
    UPROPERTY()
    int TargetNum = 1;
    UPROPERTY()
    EArithmeticKeyOperation ComparisonType = EArithmeticKeyOperation(4);

    default SetNodeName("Check Player Target Num");


    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_4 = "";
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
        return FString(FString().Append(": PlayerTargetNum ").Append(local_4).Append(" ").Append(this.TargetNum));
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_12 = FECSEntity(this.EntityToCheck.GetValue(Context.opImplConv()));
        if (!(local_12.IsValid()))
        {
            return false;
        }
        int local_15 = ::FAITargetingUtils::GetPlayerTargetCount(local_12);
        bool local_16 = false;
        switch (int(this.ComparisonType))
        {
        case 0:
        {
            local_16 = (local_15 == this.TargetNum);
            break;
        }
        case 1:
        {
            local_16 = (local_15 != this.TargetNum);
            break;
        }
        case 2:
        {
            local_16 = (local_15 < this.TargetNum);
            break;
        }
        case 3:
        {
            local_16 = (local_15 <= this.TargetNum);
            break;
        }
        case 4:
        {
            local_16 = (local_15 > this.TargetNum);
            break;
        }
        case 5:
        {
            local_16 = (local_15 >= this.TargetNum);
            break;
        }
        }
        return local_16;
    }
}

