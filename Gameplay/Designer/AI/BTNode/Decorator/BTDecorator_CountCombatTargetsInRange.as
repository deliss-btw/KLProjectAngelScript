
enum ECountCompareType
{
    GreaterThan,
    GreaterThanOrEqual,
    LessThan,
    LessThanOrEqual,
    Equal,
    Always,
}


class UBTDecorator_CountCombatTargetsInRange : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    float32 SearchDistance2D = 5000.0f;
    UPROPERTY()
    ECountCompareType CompareType = ECountCompareType(5);
    UPROPERTY()
    int CompareValue = 0;

    default SetNodeName("з»џи®ЎиЊѓе›ґе†…ж€ж–—з›®ж ‡ж•°й‡Џ");


    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_12 = (FString("Range: ") + this.SearchDistance2D);
        FString local_8 = (local_12 + " cm");
        switch (int(this.CompareType))
        {
        case 0:
        {
            FString local_4 = (FString(", Count > ") + this.CompareValue);
            local_8 += local_4;
            break;
        }
        case 1:
        {
            FString local_4_2 = (FString(", Count >= ") + this.CompareValue);
            local_8 += local_4_2;
            break;
        }
        case 2:
        {
            FString local_4_3 = (FString(", Count < ") + this.CompareValue);
            local_8 += local_4_3;
            break;
        }
        case 3:
        {
            FString local_4_4 = (FString(", Count <= ") + this.CompareValue);
            local_8 += local_4_4;
            break;
        }
        case 4:
        {
            FString local_4_5 = (FString(", Count == ") + this.CompareValue);
            local_8 += local_4_5;
            break;
        }
        case 5:
        {
            local_8 += ", Always True";
            break;
        }
        }
        return local_8;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_1 = 0;
        Get local_6;
        const FC_AITargetingV2& local_8 = local_6.opCall();
        if (local_8)
        {
            for (auto& local_28 : local_8.AllTargets)
            {
                FECSEntity local_32 = FECSEntity(local_28.GetEntity());
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                Has local_40;
                bool local_9 = local_40.opCall();
                if (local_9)
                {
                    continue;
                }
                if (::FASCommonUtils::CalculateEntityDistance2D(Context.PawnEntity, local_32, true) <= this.SearchDistance2D)
                {
                    ++local_1;
                }
            }
        }
        switch (int(this.CompareType))
        {
        case 0:
        {
            return (local_1 > this.CompareValue);
        }
        case 1:
        {
            return (local_1 >= this.CompareValue);
        }
        case 2:
        {
            return (local_1 < this.CompareValue);
        }
        case 3:
        {
            return (local_1 <= this.CompareValue);
        }
        case 4:
        {
            return (local_1 == this.CompareValue);
        }
        case 5:
        {
            return true;
        }
        default:
        {
        }
        }
        return false;
    }
}

