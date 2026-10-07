
enum ECheckDistanceCompareType
{
    LessThan,
    GreaterThan,
    GreaterThanOrEqual,
}


struct FBTDecorator_CheckDistanceToTargetLocationMemory
{
    UPROPERTY()
    bool bLastResult;
    UPROPERTY()
    bool bHasLastResult;
    UPROPERTY()
    float32 TimeUntilNextCheck;


}

class UBTDecorator_CheckDistanceToTargetLocation : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntityID;
    UPROPERTY()
    bool bCompareWithEntity;
    UPROPERTY()
    FBlackboardKeySelector TargetLocation;
    UPROPERTY()
    FAISmart_EntityId CompareToEntityID;
    UPROPERTY()
    FAISmart_Vector CompareToEntityOffset;
    UPROPERTY()
    FAISmart_Bool CompareBy2D;
    UPROPERTY()
    bool bLocationUseTargetCollisionBottom;
    UPROPERTY()
    ECheckDistanceCompareType CheckDistanceCompareType;
    UPROPERTY()
    bool bUseBlackboardCompareValue;
    UPROPERTY()
    float32 DistanceCompareValue;
    UPROPERTY()
    FBlackboardKeySelector DistanceCompareValueBB;
    UPROPERTY()
    bool CheckDistanceIncludeAgentRadius;
    UPROPERTY()
    float32 TickInterval;

    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);
    default SetNodeName("Check Distance To Target Location");

    UBTDecorator_CheckDistanceToTargetLocation()
    {
        this.TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
        this.bCompareWithEntity = false;
        this.CompareToEntityID = FAISmart_EntityId(n"CompareToEntityID", EAISmartValue(0));
        this.bLocationUseTargetCollisionBottom = true;
        this.bUseBlackboardCompareValue = false;
        this.CheckDistanceIncludeAgentRadius = true;
        this.TickInterval = 0.1f;
        this.TargetLocation.SelectedKeyName = n"TargetLocation";
        this.TargetLocation.AddVectorFilter(this, n"TargetLocation");
        this.DistanceCompareValueBB.AddFloatFilter(this, n"DistanceCompareValueBB");
        return;
    }
    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FBTDecorator_CheckDistanceToTargetLocationMemory;
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDecorator_CheckDistanceToTargetLocationMemory local_2;
        local_2.bLastResult = this.EvaluateCondition(Context);
        local_2.bHasLastResult = true;
        local_2.TimeUntilNextCheck = this.TickInterval;
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FBTDecorator_CheckDistanceToTargetLocationMemory local_2;
        local_2.TimeUntilNextCheck -= DeltaSeconds;
        if (local_2.TimeUntilNextCheck > 0.0f)
        {
            return;
        }
        local_2.TimeUntilNextCheck = this.TickInterval;
        bool local_9 = this.EvaluateCondition(Context);
        if (!(local_2.bHasLastResult) || (!(local_9) != !(local_2.bLastResult)))
        {
            local_2.bLastResult = local_9;
            local_2.bHasLastResult = true;
            Context.RequestExecution(this);
        }
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return this.EvaluateCondition(Context);
    }
    bool EvaluateCondition(const FAIBehaviorTreeContext &inout Context) const
    {
        int local_38 = 0;
        float32 local_57;
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntity local_16 = FECSEntity(this.TargetEntityID.GetValue(Context.opImplConv()));
        if ((local_16 == ENTITY_NULL))
        {
            return false;
        }
        FECSEntity local_22;
        if (this.bCompareWithEntity)
        {
            local_22 = FECSEntity(this.CompareToEntityID.GetValue(Context.opImplConv()));
            if ((local_22 == ENTITY_NULL))
            {
                return false;
            }
        }
        float32 local_24 = FECSAIUtils::GetEntityAgentRadius(local_16);
        float32 local_25 = 0.0f;
        if (this.bCompareWithEntity)
        {
            local_25 = FECSAIUtils::GetEntityAgentRadius(local_22);
        }
        FVector local_32;
        if (this.bCompareWithEntity)
        {
            local_32 = local_38.GetPosition();
            local_32 += local_38.GetRotation().RotateVector(this.CompareToEntityOffset.GetValue(Context.opImplConv()));
        }
        else
        {
            local_32 = local_2.GetValueAsVector(this.TargetLocation.SelectedKeyName);
        }
        GetDefaulted local_36;
        FVector local_50(local_36.opCall().GetPosition());
        bool local_17 = this.bLocationUseTargetCollisionBottom;
        if (local_17)
        {
            local_50 -= FVector(0.0, 0.0, (local_16.GetCollisionHeight() * 0.5f));
            local_17 = this.bCompareWithEntity;
            if (local_17)
            {
                local_57 = local_22.GetCollisionHeight();
                local_57 = local_57 * 0.5f;
                local_32 -= FVector(0.0, 0.0, local_57);
            }
        }
        float32 local_65 = 0.0f;
        FAISmartValueContext local_10 = Context.opImplConv();
        if (local_17)
        {
            local_65 = float32(local_50.Dist2D(local_32));
        }
        else
        {
            local_65 = float32(local_50.Distance(local_32));
        }
        local_57 = this.DistanceCompareValue;
        float32 local_66 = local_57;
        if (this.bUseBlackboardCompareValue)
        {
            local_66 = local_2.GetValueAsFloat(this.DistanceCompareValueBB.SelectedKeyName);
        }
        if (this.CheckDistanceIncludeAgentRadius)
        {
            local_57 = local_24 + local_25;
        }
        else
        {
            local_57 = 0.0f;
        }
        float32 local_23_2 = local_66 + local_57;
        bool local_68 = false;
        switch (int(this.CheckDistanceCompareType))
        {
        case 0:
        {
            local_68 = (local_65 < local_23_2);
            break;
        }
        case 1:
        {
            local_68 = (local_65 > local_23_2);
            break;
        }
        case 2:
        {
            local_68 = (local_65 >= local_23_2);
            break;
        }
        default:
        {
            break;
        }
        }
        return local_68;
    }
}

