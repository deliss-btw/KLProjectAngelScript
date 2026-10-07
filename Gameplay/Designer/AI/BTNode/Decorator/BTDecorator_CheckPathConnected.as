

struct FBTDecorator_CheckPathConnectedMemory
{
    UPROPERTY()
    float32 TimeUntilNextCheck;
    UPROPERTY()
    bool bLastResult;
    UPROPERTY()
    bool bHasLastResult;


}

class UBTDecorator_CheckPathConnected : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bUseSelfAsStart = true;
    UPROPERTY()
    FAISmart_Vector StartLocation;
    UPROPERTY()
    FAISmart_Vector EndLocation;
    UPROPERTY()
    bool bUseTargetEntityLocation = false;
    UPROPERTY()
    FAISmart_EntityId TargetEntity;
    UPROPERTY()
    FAISmart_EntityId NavAgentEntity = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));
    UPROPERTY()
    bool bEnableRecheck = false;
    UPROPERTY()
    float32 RecheckInterval = 0.5f;
    UPROPERTY()
    float32 CacheTTLSeconds = 1.0f;
    UPROPERTY()
    float32 QuantizeCellSize = 100.0f;

    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);
    default SetNodeName("жЈЂжџҐдё¤з‚№иїћйЂљжЂ§");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FBTDecorator_CheckPathConnectedMemory;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_10;
        if (this.bUseSelfAsStart)
        {
            local_10 = "Self";
        }
        else
        {
            local_10 = "StartLocation";
        }
        FString local_4;
        if (this.bUseTargetEntityLocation)
        {
            local_4 = "TargetEntity";
        }
        else
        {
            local_4 = "EndLocation";
        }
        FString local_22;
        if (this.bEnableRecheck)
        {
            local_22 = FString::Format("Recheck:{0}s", this.RecheckInterval);
        }
        else
        {
            local_22 = "Recheck:off";
        }
        return FString::Format("{0} -> {1}  ({2} TTL:{3}s)", local_10, local_4, local_22, this.CacheTTLSeconds);
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDecorator_CheckPathConnectedMemory local_2;
        local_2.TimeUntilNextCheck = 0.0f;
        local_2.bLastResult = true;
        local_2.bHasLastResult = false;
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDecorator_CheckPathConnectedMemory local_2;
        local_2.bLastResult = true;
        local_2.bHasLastResult = false;
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        if (!(this.bEnableRecheck))
        {
            return;
        }
        FBTDecorator_CheckPathConnectedMemory local_4;
        local_4.TimeUntilNextCheck -= DeltaSeconds;
        if (local_4.TimeUntilNextCheck > 0.0f)
        {
            return;
        }
        local_4.TimeUntilNextCheck = this.RecheckInterval;
        bool local_1 = this.EvaluatePathConnected(Context);
        if (!(local_4.bHasLastResult) || (!(local_1) != !(local_4.bLastResult)))
        {
            local_4.bLastResult = local_1;
            local_4.bHasLastResult = true;
            Context.RequestExecution(this);
        }
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FBTDecorator_CheckPathConnectedMemory local_4;
        if (!(this.bEnableRecheck))
        {
            return this.EvaluatePathConnected(Context);
        }
        if (!(local_4.bHasLastResult))
        {
            return true;
        }
        return local_4.bLastResult;
    }
    bool EvaluatePathConnected(const FAIBehaviorTreeContext &inout Context) const
    {
        int local_30 = 0;
        FECSEntity local_12 = FECSEntity(this.NavAgentEntity.GetValue(Context.opImplConv()));
        if (!(local_12.IsValid()))
        {
            return false;
        }
        FVector local_20;
        if (this.bUseSelfAsStart)
        {
            if (!(FECSEntity(Context.PawnEntity).IsValid()))
            {
                return false;
            }
            if (!(local_30))
            {
                return false;
            }
            local_20 = local_30.GetPosition();
        }
        else
        {
            local_20 = this.StartLocation.GetValue(Context.opImplConv());
        }
        FVector local_42;
        if (this.bUseTargetEntityLocation)
        {
            if (!(FECSEntity(this.TargetEntity.GetValue(Context.opImplConv())).IsValid()))
            {
                return false;
            }
            if (!(local_30))
            {
                return false;
            }
            local_42 = local_30.GetPosition();
        }
        else
        {
            local_42 = this.EndLocation.GetValue(Context.opImplConv());
        }
        return ::FAIPathConnectionCacheUtils_AS::IsPathConnectedCached(local_12, local_12, local_20, local_42, this.CacheTTLSeconds, this.QuantizeCellSize);
    }
}

