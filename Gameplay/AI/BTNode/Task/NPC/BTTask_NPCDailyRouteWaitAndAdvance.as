

struct FNPCDailyRouteWaitInstanceData
{
    UPROPERTY()
    float32 ElapsedTime = 0.0f;
    UPROPERTY()
    float32 WaitTime = 0.0f;


}

class UBTTask_NPCDailyRouteWaitAndAdvance : UBTTask_ECSScriptBase
{
    default SetNodeName("NPC Daily Route Wait And Advance");

    UBTTask_NPCDailyRouteWaitAndAdvance()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FNPCDailyRouteWaitInstanceData;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(this.GetBaseStaticDescription()).Append("\nV1: wait for the prepared node stay time, then commit route progress.");
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_NPCDailyRouteRuntime local_38;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(Context.PawnEntity, local_38)))
        {
            if (Context.PawnEntity.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            return EBTNodeResult(1);
        }
        FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
        FNPCDailyRouteWaitInstanceData local_44;
        local_44.WaitTime = FMath::Max(0.0f, local_38.SelectedStayTime);
        local_44.ElapsedTime = 0.0f;
        if (local_44.WaitTime <= 0.0f)
        {
            ::FNPCDailyRouteUtils::AdvancePreparedTarget(Context.PawnEntity);
            return EBTNodeResult(0);
        }
        return EBTNodeResult(3);
    }
    UFUNCTION()
    void TickTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FC_NPCDailyRouteRuntime local_38;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(local_38, Context.PawnEntity)))
        {
            if (Context.PawnEntity.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            this.FinishLatentTask(Context, EBTNodeResult(1));
            return;
        }
        FNPCDailyRouteWaitInstanceData local_44;
        local_44.ElapsedTime += DeltaSeconds;
        if (local_44.ElapsedTime >= local_44.WaitTime)
        {
            ::FNPCDailyRouteUtils::AdvancePreparedTarget(Context.PawnEntity);
            this.FinishLatentTask(Context, EBTNodeResult(0));
        }
        return;
    }
    UFUNCTION()
    void OnTaskFinished_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const EBTNodeResult TaskResult) const
    {
        if (Context.PawnEntity.IsValid())
        {
            FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
        }
        return;
    }
    FNPCDailyRouteWaitInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FNPCDailyRouteWaitInstanceData __r;
        return __r;
    }
}

