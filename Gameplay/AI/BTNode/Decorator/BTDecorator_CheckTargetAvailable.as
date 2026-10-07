

// NOTE: class defaults are not authored in this module: UBTDecorator_CheckTargetAvailable (default scalar field UBTDecorator.FlowAbortMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FBTDecorator_CheckTargetAvailableMemory
{
    UPROPERTY()
    FECSEntityId WatchedTargetId;
    UPROPERTY()
    bool bLastResult;
    UPROPERTY()
    bool bHasLastResult;
    UPROPERTY()
    float32 TimeUntilNextCheck;


}

class UBTDecorator_CheckTargetAvailable : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId TargetEntityKey = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    float32 TickInterval = 0.5f;


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FBTDecorator_CheckTargetAvailableMemory;
    }
    UFUNCTION()
    FAIDecoratorAbortSignal GetAbortSignal_Implementation() const
    {
        return FAIDecoratorAbortSignal(EAIDecoratorAbortSignal(2), 0);
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_8 = this.ResolveTarget(Context);
        if (!(local_8.IsValid()))
        {
            return false;
        }
        return ::FAIKnowledgeUtils::IsTargetAvailable(local_8);
    }
    UFUNCTION()
    void OnBecomeRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_26 = 0;
        FBTDecorator_CheckTargetAvailableMemory local_2;
        local_2.bLastResult = ::FAIKnowledgeUtils::IsTargetAvailable(this.ResolveTarget(Context));
        local_2.bHasLastResult = true;
        local_2.TimeUntilNextCheck = this.TickInterval;
        FECSEntity local_10 = this.ResolveTarget(Context);
        if (local_10.IsValid())
        {
            local_2.WatchedTargetId = local_10.GetId();
            FECSWorldPtr local_20 = ECS::GetECSWorld();
            local_26.Register(local_10.GetId(), Context.PawnEntity.GetId());
        }
        else
        {
            local_2.WatchedTargetId = ENTITY_ID_NULL;
        }
        return;
    }
    UFUNCTION()
    void OnCeaseRelevant_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_2 = 0;
        int local_16 = 0;
        if ((!((local_2.WatchedTargetId == ENTITY_ID_NULL))))
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            local_16.Unregister(local_2.WatchedTargetId, Context.PawnEntity.GetId());
            local_2.WatchedTargetId = ENTITY_ID_NULL;
        }
        return;
    }
    UFUNCTION()
    void TickNode_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        int local_30 = 0;
        FBTDecorator_CheckTargetAvailableMemory local_2;
        local_2.TimeUntilNextCheck -= DeltaSeconds;
        if (local_2.TimeUntilNextCheck > 0.0f)
        {
            return;
        }
        local_2.TimeUntilNextCheck = this.TickInterval;
        FECSEntity local_18 = this.ResolveTarget(Context);
        FECSEntityId local_21;
        if (local_18.IsValid())
        {
            local_21 = local_18.GetId();
        }
        else
        {
            local_21 = ENTITY_ID_NULL;
        }
        if (!((local_21 == local_2.WatchedTargetId)))
        {
            FECSWorldPtr local_24 = ECS::GetECSWorld();
            if (!((local_2.WatchedTargetId == ENTITY_ID_NULL)))
            {
                local_30.Unregister(local_2.WatchedTargetId, Context.PawnEntity.GetId());
            }
            if (!((local_21 == ENTITY_ID_NULL)))
            {
                local_30.Register(local_21, Context.PawnEntity.GetId());
            }
            local_2.WatchedTargetId = local_21;
        }
        bool local_9 = local_18.IsValid() && ::FAIKnowledgeUtils::IsTargetAvailable(local_18);
        if (!(local_2.bHasLastResult) || (!(local_9) != !(local_2.bLastResult)))
        {
            local_2.bLastResult = local_9;
            local_2.bHasLastResult = true;
            Context.RequestExecution(this);
        }
        return;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(this.GetBaseStaticDescription()).Append(": Target=").Append(this.TargetEntityKey);
    }
    FECSEntity ResolveTarget(const FAIBehaviorTreeContext &inout Context) const
    {
        return FECSEntity(this.TargetEntityKey.GetValue(Context.opImplConv()));
    }
}

