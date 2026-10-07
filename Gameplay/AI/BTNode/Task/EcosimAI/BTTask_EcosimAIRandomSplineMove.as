

struct FEcosimAIRandomSplineMoveBTTaskInstanceData
{
    UPROPERTY()
    USplineComponent Spline;
    UPROPERTY()
    FVector EndLocation = FVector::ZeroVector;
    UPROPERTY()
    float32 FollowSplineCurrentDistance;
    UPROPERTY()
    float32 TargetSplineDistance;
    UPROPERTY()
    FVector LastLocation;


}

class UBTTask_EcosimAIRandomSplineMove : UBTTask_ECSScriptBase
{
    UPROPERTY()
    ECharacterMoveStance MoveStance = ECharacterMoveStance(1);

    default SetNodeName("EcosimAIRandomSplineMove");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FEcosimAIRandomSplineMoveBTTaskInstanceData;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        XLog(ELog(43), FString().Append("ChangeMoveStance EcosimAIRandomSplineMove ").Append(Context.PawnEntity.GetIdValue()).Append(" , ").Append(this.MoveStance).Append("}"));
        ECS::GetContextTime();
        return EBTNodeResult(3);
    }
    UFUNCTION()
    void TickTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        return;
    }
    UFUNCTION()
    void OnTaskFinished_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const EBTNodeResult TaskResult) const
    {
        FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
        Remove local_6;
        local_6.opCall();
        return;
    }
    FEcosimAIRandomSplineMoveBTTaskInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FEcosimAIRandomSplineMoveBTTaskInstanceData __r;
        return __r;
    }
    void SimulateInputTowardsTarget(const FECSEntity &inout ControlledPawn, const FC_CharacterMovementControl &inout MoveControl, const FC_Transform &inout Transform, const FVector &inout TargetPos)
    {
        FRotator local_18 = FAIInputUtils::GetAimInput(Transform.GetPosition(), TargetPos, Transform.GetRotation().GetUpVector());
        if (MoveControl.GetbDrivingMode())
        {
            FAIInputUtils::SimulateViewInput(ControlledPawn, Transform.GetRotation().Rotator());
            FVector local_26(local_18.GetForwardVector());
            if (local_26.DotProduct(Transform.GetRotation().GetForwardVector()) < 0.0)
            {
                FVector local_36(Transform.GetRotation().GetRightVector());
                local_26 = local_36.opMul_r(FMath::Sign(local_26.DotProduct(local_36)));
            }
            FAIInputUtils::SimulateMoveInputWorld(ControlledPawn, local_26, EAIMoveSimulateType(1), true);
            return;
        }
        FAIInputUtils::SimulateViewInput(ControlledPawn, local_18);
        FAIInputUtils::SimulateMoveInputLocal(ControlledPawn, FVector::ForwardVector, EAIMoveSimulateType(0), false);
        return;
    }
}

