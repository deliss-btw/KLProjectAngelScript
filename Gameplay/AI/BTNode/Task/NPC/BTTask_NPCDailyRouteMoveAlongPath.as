

struct FNPCDailyRouteMoveInstanceData
{
    UPROPERTY()
    int PathPointIndex = 0;
    UPROPERTY()
    float32 BlockedElapsedTime = 0.0f;
    UPROPERTY()
    FVector LastLocation = FVector::ZeroVector;


}

class UBTTask_NPCDailyRouteMoveAlongPath : UBTTask_ECSScriptBase
{
    UPROPERTY()
    float32 DefaultAcceptRadius = 100.0f;
    UPROPERTY()
    float32 BlockedTimeout = 1.5f;
    UPROPERTY()
    float32 BlockedMoveDistanceThreshold = 5.0f;

    default SetNodeName("NPC Daily Route Move Along Path");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FNPCDailyRouteMoveInstanceData;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(this.GetBaseStaticDescription()).Append("\nV1: move through prepared route path points. If blocked, stop in place and keep the task running.");
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_NPCDailyRouteRuntime local_38;
        Has local_46;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(Context.PawnEntity, local_38)) || (local_38.ActivePathPoints.Num() == 0) || !(local_46.opCall()))
        {
            if (Context.PawnEntity.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            return EBTNodeResult(1);
        }
        FNPCDailyRouteMoveInstanceData local_50;
        local_50.PathPointIndex = FMath::Clamp(int(local_38.ActivePathPointIndex), 0, (local_38.ActivePathPoints.Num() - 1));
        local_50.BlockedElapsedTime = 0.0f;
        Get local_62;
        local_50.LastLocation = local_62.opCall().GetPosition();
        return EBTNodeResult(3);
    }
    UFUNCTION()
    void TickTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        FNPCDailyRouteMoveInstanceData local_54;
        int local_62 = 0;
        float32 local_73;
        float32 local_75;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FC_NPCDailyRouteRuntime local_42;
        Has local_48;
        if (!(::FNPCDailyRouteUtils::TryGetPreparedTarget(local_4, local_42)) || !(local_48.opCall()))
        {
            if (local_4.IsValid())
            {
                FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            }
            this.FinishLatentTask(Context, EBTNodeResult(1));
            return;
        }
        if (!(local_42.ActivePathPoints.IsValidIndex(int(local_54.PathPointIndex))))
        {
            FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            this.FinishLatentTask(Context, EBTNodeResult(0));
            return;
        }
        FVector local_72(local_42.ActivePathPoints[int(local_54.PathPointIndex)]);
        if ((int(local_54.PathPointIndex) + 1) >= local_42.ActivePathPoints.Num())
        {
            local_75 = local_42.TargetAcceptRadius;
        }
        else
        {
            local_75 = this.DefaultAcceptRadius;
        }
        float32 local_77 = FMath::Max(1.0f, local_75);
        if (local_62.GetPosition().Distance(local_72) <= local_77)
        {
            ++local_54.PathPointIndex;
            local_75 = 0.0f;
            local_54.BlockedElapsedTime = 0.0f;
            Modify local_86;
            FC_NPCDailyRouteRuntime& local_88 = local_86.opCall();
            if (local_88)
            {
                local_88.ActivePathPointIndex = int(local_54.PathPointIndex);
            }
            if (!(local_42.ActivePathPoints.IsValidIndex(int(local_54.PathPointIndex))))
            {
                FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
                this.FinishLatentTask(Context, EBTNodeResult(0));
            }
            return;
        }
        if (float32(local_62.GetPosition().Distance(local_54.LastLocation)) <= this.BlockedMoveDistanceThreshold)
        {
            local_73 = local_54.BlockedElapsedTime + DeltaSeconds;
        }
        else
        {
            local_73 = 0.0f;
        }
        local_54.BlockedElapsedTime = local_73;
        local_54.LastLocation = local_62.GetPosition();
        if ((this.BlockedTimeout > 0.0f && (local_54.BlockedElapsedTime >= this.BlockedTimeout)))
        {
            FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ZeroVector, EAIMoveSimulateType(0), false);
            return;
        }
        FAIInputUtils::SimulateViewInput(local_4, FAIInputUtils::GetAimInput(local_62.GetPosition(), local_72, local_62.GetRotation().GetUpVector()));
        FAIInputUtils::SimulateMoveInputLocal(local_4, FVector::ForwardVector, EAIMoveSimulateType(0), false);
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
    FNPCDailyRouteMoveInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FNPCDailyRouteMoveInstanceData __r;
        return __r;
    }
}

