

class UBTTask_GetSelfCapsuleRadiusWithOffset : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OutputRadius;
    UPROPERTY()
    float32 ExtendOffset;

    default SetNodeName("Get Self Capsule Radius With Offset");

    UBTTask_GetSelfCapsuleRadiusWithOffset()
    {
        this.ExtendOffset = 0.0f;
        this.OutputRadius.AddFloatFilter(this, n"OutputRadius");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_12 = 0;
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            return EBTNodeResult(1);
        }
        if (!(local_12))
        {
            return EBTNodeResult(1);
        }
        Context.GetBlackboardComponent().SetValueAsFloat(this.OutputRadius.SelectedKeyName, (local_12.GetScaledRadius() + this.ExtendOffset));
        return EBTNodeResult(0);
    }
}

