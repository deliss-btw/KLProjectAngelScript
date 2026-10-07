

struct FFollowSplineMoveBTTaskInstanceData
{
    UPROPERTY()
    float32 TimeCount;
    UPROPERTY()
    EFollowSplineState FollowState = EFollowSplineState(0);
    UPROPERTY()
    FECSEntity SplineEntity = ENTITY_NULL;
    UPROPERTY()
    FVector EntryPointLocation = FVector::ZeroVector;
    UPROPERTY()
    FVector StartLocation = FVector::ZeroVector;
    UPROPERTY()
    float FollowSplineCurrentDistance = -1.0;
    UPROPERTY()
    float SplineStartLocationDistance = 0.0;
    UPROPERTY()
    FVector LastLocation = FVector::ZeroVector;
    UPROPERTY()
    float32 SplineSearchTimer = 0.0f;


}

class UBTTask_FollowSplineMove : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FName SplineTagPriorityMatching;
    UPROPERTY()
    float32 FindBestPointSampleInterval = 1000.0f;
    UPROPERTY()
    float32 FindBestPointDistanceWeight = 0.5f;
    UPROPERTY()
    float32 FindBestPointAngleWeight = 0.5f;
    UPROPERTY()
    float32 EnterFirstPointDistance = 200.0f;
    UPROPERTY()
    float32 SplineArcLengthCompensation = 1.3f;
    UPROPERTY()
    bool bLoop = true;
    UPROPERTY()
    FAISmart_EntityId LocationEntityID;
    UPROPERTY()
    float32 SplineRefreshInterval = 3.0f;
    UPROPERTY()
    float32 WaitTime = 10.0f;
    UPROPERTY()
    bool bDrawDebug = false;

    default SetNodeName("FollowSplineMove");


    UFUNCTION()
    UScriptStruct GetNodeMemoryType_Implementation() const
    {
        return FFollowSplineMoveBTTaskInstanceData;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FFollowSplineMoveBTTaskInstanceData local_2;
        local_2.TimeCount = 0.0f;
        local_2.SplineEntity = ENTITY_NULL;
        local_2.SplineSearchTimer = this.SplineRefreshInterval;
        if (this.bDrawDebug)
        {
            FECSDebugDraw::SetDebugKeyEnable(n"FollowSplineMove", true);
        }
        if (!(this.TryFindAndUpdateSpline(Context, local_2)))
        {
            return EBTNodeResult(1);
        }
        return EBTNodeResult(3);
    }
    UFUNCTION()
    void TickTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const float32 DeltaSeconds) const
    {
        int local_30 = 0;
        int local_36 = 0;
        FFollowSplineMoveBTTaskInstanceData local_2;
        local_2.TimeCount += DeltaSeconds;
        float32 local_7_2 = local_2.TimeCount;
        if (local_7_2 >= this.WaitTime)
        {
            this.FinishLatentTask(Context, EBTNodeResult(1));
        }
        if (this.SplineRefreshInterval > 0.0f)
        {
            float32 local_7_3 = local_2.SplineSearchTimer + DeltaSeconds;
            local_2.SplineSearchTimer = local_7_3;
            if (local_2.SplineSearchTimer >= this.SplineRefreshInterval)
            {
                local_2.SplineSearchTimer = 0.0f;
                this.TryFindAndUpdateSpline(Context, local_2);
            }
        }
        FECSEntity local_14 = FECSEntity(Context.PawnEntity);
        FECSWorldPtr local_18 = local_14.GetWorld();
        Has local_44;
        if (!(local_2.SplineEntity.IsValid()) || !(local_44.opCall()))
        {
            this.FinishLatentTask(Context, EBTNodeResult(1));
            return;
        }
        Get local_52;
        USplineComponent local_48 = local_52.opCall().GetSpline();
        if (local_48 == nullptr)
        {
            this.FinishLatentTask(Context, EBTNodeResult(1));
            return;
        }
        if (int(local_2.FollowState) == 1)
        {
            FVector local_76 = (local_2.EntryPointLocation - local_2.StartLocation).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            FVector local_82 = local_2.EntryPointLocation;
            FVector local_70 = (local_82 - local_2.StartLocation);
            local_70.Normalize(9.99999993922529e-9);
            FQuat local_108 = FQuat::FindBetweenVectors(FVector::ForwardVector, local_70);
            FRotator local_120 = local_108.Rotator();
            FAIInputUtils::SimulateViewInput(local_14, FAIInputUtils::GetAimInput(local_36.GetPosition(), local_2.EntryPointLocation, local_36.GetRotation().GetUpVector()));
            FVector local_132(FVector::ForwardVector);
            FAIInputUtils::SimulateMoveInputLocal(local_14, local_132, EAIMoveSimulateType(0), false);
            float local_84 = local_36.GetPosition().Distance(local_2.EntryPointLocation);
            float32 local_7_5 = this.EnterFirstPointDistance;
            if (local_84 < local_7_5)
            {
                local_2.FollowState = EFollowSplineState(2);
            }
        }
        else
        {
            if (int(local_2.FollowState) == 2)
            {
                bool local_141;
                float local_136_2 = (FVector(local_36.GetPosition()) - local_2.LastLocation).Size();
                float32 local_8_2 = this.SplineArcLengthCompensation;
                local_136_2 = local_136_2 * local_8_2;
                if ((local_2.LastLocation == FVector::ZeroVector))
                {
                    FC_CharacterMovementParam local_24;
                    local_8_2 = local_24.MoveSpeed;
                    float32 local_7_6 = local_30.GetMovementSpeedScale();
                    local_8_2 = local_8_2 * local_7_6;
                    float32 local_7_7 = local_8_2 * DeltaSeconds;
                    local_136_2 = local_7_7;
                }
                if (local_2.FollowSplineCurrentDistance == -1.0)
                {
                    local_2.FollowSplineCurrentDistance = local_2.SplineStartLocationDistance;
                }
                float32 local_7_8 = local_48.GetSplineLength();
                local_2.FollowSplineCurrentDistance = (local_2.FollowSplineCurrentDistance + local_136_2);
                FVector local_82_2 = local_48.GetLocationAtDistanceAlongSpline(float32(local_2.FollowSplineCurrentDistance), ESplineCoordinateSpace(1));
                FQuat local_100 = FQuat(local_48.GetRotationAtDistanceAlongSpline(float32(local_2.FollowSplineCurrentDistance), ESplineCoordinateSpace(1)));
                FAIInputUtils::SimulateViewInput(local_14, FAIInputUtils::GetAimInput(local_36.GetPosition(), local_82_2, local_36.GetRotation().GetUpVector()));
                FAIInputUtils::SimulateMoveInputLocal(local_14, FVector::ForwardVector, EAIMoveSimulateType(0), false);
                local_141 = false;
                float local_138 = local_7_8;
                if (local_2.FollowSplineCurrentDistance > local_138)
                {
                    local_138 = 0.0;
                    local_2.FollowSplineCurrentDistance = 0.0;
                    local_141 = true;
                }
                local_2.LastLocation = local_36.GetPosition();
                if (!(this.bLoop) && local_141)
                {
                    FAIInputUtils::SimulateMoveInputLocal(local_14, FVector::ZeroVector, EAIMoveSimulateType(0), false);
                    local_2.FollowState = EFollowSplineState(3);
                    this.FinishLatentTask(Context, EBTNodeResult(0));
                }
            }
        }
        if (this.bDrawDebug)
        {
            this.DrawFollowSplineDebug(Context, local_2, local_48);
        }
        return;
    }
    UFUNCTION()
    void OnTaskFinished_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory, const EBTNodeResult TaskResult) const
    {
        FAIInputUtils::SimulateMoveInputLocal(Context.PawnEntity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
        FFollowSplineMoveBTTaskInstanceData local_2;
        local_2.FollowState = EFollowSplineState(3);
        Remove local_14;
        local_14.opCall();
        return;
    }
    FFollowSplineMoveBTTaskInstanceData GetInstanceData(const FBTNodeMemory &inout NodeMemory) const
    {
        FFollowSplineMoveBTTaskInstanceData __r;
        return __r;
    }
    bool TryFindAndUpdateSpline(const FAIBehaviorTreeContext &inout Context, FFollowSplineMoveBTTaskInstanceData &inout Data) const
    {
        Has local_66;
        int local_70 = 0;
        int local_162 = 0;
        USplineComponent local_168;
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Exclude(local_40).opCall();
        FECSEntityId local_51 = this.LocationEntityID.GetValue(Context.opImplConv());
        if (!(FECSEntity(local_51).IsValid()) || !(local_66.opCall()))
        {
            if (!(Context.PawnEntity.IsValid()) || !(local_66.opCall()))
            {
                return false;
            }
        }
        FVector local_80 = local_70.GetPosition();
        float32 local_81 = 3.4028235e38f;
        FECSEntity local_86 = FECSEntity(ENTITY_NULL);
        FECSRuntimeViewIterator local_120 = local_40.Iterator();
        for (; local_120.CanProceed;)
        {
            const FECSEntity& local_156 = local_120.Proceed();
            if ((FString(this.SplineTagPriorityMatching) == local_162.Tag))
            {
                local_168 = local_162.GetSpline();
                if (local_168 != nullptr)
                {
                    float32 local_171 = float32((local_80.Distance(local_168.GetLocationAtSplineInputKey(local_168.FindInputKeyClosestToWorldLocation(local_80), ESplineCoordinateSpace(1)))));
                    if (local_171 < local_81 && (local_171 <= 10000.0f))
                    {
                        local_81 = local_171;
                        local_86 = local_156;
                    }
                }
            }
        }
        if (!(local_86.IsValid()))
        {
            return Data.SplineEntity.IsValid();
        }
        if (!((local_86 == Data.SplineEntity)))
        {
            Get local_160;
            local_168 = local_160.opCall().GetSpline();
            if (local_168 == nullptr)
            {
                return Data.SplineEntity.IsValid();
            }
            Data.SplineEntity = local_86;
            ::FSplineMoveUtils::FindBestSplinePoint(Data.EntryPointLocation, Data.SplineStartLocationDistance, local_168, Context.PawnEntity, this.FindBestPointDistanceWeight, this.FindBestPointAngleWeight, this.FindBestPointSampleInterval);
            Data.FollowState = EFollowSplineState(1);
            Data.StartLocation = local_80;
            Data.FollowSplineCurrentDistance = -1.0;
            Data.LastLocation = FVector::ZeroVector;
        }
        return true;
    }
    FString GetFollowStateText(const EFollowSplineState State) const
    {
        if (int(State) == 0)
        {
            return "Wait";
        }
        if (int(State) == 1)
        {
            return "EntryingPoint";
        }
        if (int(State) == 2)
        {
            return "NavigatingSpline";
        }
        return "Finish";
    }
    void DrawFollowSplineDebug(const FAIBehaviorTreeContext &inout Context, const FFollowSplineMoveBTTaskInstanceData &inout Data, const USplineComponent Spline) const
    {
        int local_14 = 0;
        float local_54;
        Has local_10;
        if (!(FECSEntity(Context.PawnEntity).IsValid()) || !(local_10.opCall()))
        {
            return;
        }
        FVector local_24 = local_14.GetPosition();
        FName local_26(n"FollowSplineMove");
        FString local_38 = this.GetFollowStateText(Data.FollowState);
        FString local_42 = (FString("[FollowSpline] ") + local_38);
        FVector local_60 = (local_24 + FVector(0.0, 0.0, 240.0));
        FECSDebugDraw::DrawDebugString(local_26, local_60, local_42, FColor::White, 1.2f, FColor::White, -1.0f);
        FString local_66 = FString().Append("Timeout: ").Append(FString::ApplyFormat(Data.TimeCount, ".1")).Append("/").Append(FString::ApplyFormat(this.WaitTime, ".1")).Append("s");
        FString local_70;
        if (int(Data.FollowState) == 2 && (Spline != nullptr))
        {
            float local_52;
            if (Data.FollowSplineCurrentDistance < 0.0)
            {
                local_52 = Data.SplineStartLocationDistance;
                local_54 = local_52;
            }
            else
            {
                local_54 = Data.FollowSplineCurrentDistance;
            }
            float32 local_61_2 = Spline.GetSplineLength();
            if (this.bLoop)
            {
                local_70 = "Loop";
            }
            else
            {
                local_70 = "Once";
            }
            FString local_42_2 = ((FString(FString().Append("Dist: ").Append(FString::ApplyFormat(local_54, ".0")).Append("/").Append(FString::ApplyFormat(local_61_2, ".0")).Append(" ")) + local_70) + "  ");
            local_66 = (local_42_2 + local_66);
        }
        FVector local_60_2 = FVector(0.0, 0.0, 210.0);
        FECSDebugDraw::DrawDebugString(local_26, (local_24 + local_60_2), local_66, FColor::White, 1.0f, FColor::White, -1.0f);
        if (Spline != nullptr)
        {
            float32 local_75 = Spline.GetSplineLength();
            float32 local_85 = 200.0f;
            float32 local_86 = 0.0f;
            FVector local_60_3 = Spline.GetLocationAtDistanceAlongSpline(0.0f, ESplineCoordinateSpace(1));
            while (local_86 < local_75)
            {
                float32 local_61_3 = local_86 + local_85;
                if (local_61_3 > local_75)
                {
                    local_61_3 = local_75;
                }
                FVector local_92 = Spline.GetLocationAtDistanceAlongSpline(local_61_3, ESplineCoordinateSpace(1));
                FECSDebugDraw::DrawDebugLine(local_26, local_60_3, local_92, FColor::Silver, FColor::Silver, -1.0f, uint8(0), 2.0f);
                local_60_3 = local_92;
                local_86 = local_61_3;
            }
        }
        FECSDebugDraw::DrawDebugSphere(local_26, Data.EntryPointLocation, 60.0f, 12, FColor::Green, FColor::Green, -1.0f, uint8(0), 1.5f);
        FECSDebugDraw::DrawDebugString(local_26, (Data.EntryPointLocation + FVector(0.0, 0.0, 90.0)), "EntryPoint", FColor::Green, 1.0f, FColor::Green, -1.0f);
        FVector local_60_4 = (local_24 + (local_14.GetRotation().GetForwardVector() * 120.0));
        FECSDebugDraw::DrawDebugDirectionalArrow(local_26, local_24, local_60_4, 25.0f, FColor::Blue, FColor::Blue, -1.0f, uint8(0), 2.0f);
        if (int(Data.FollowState) == 1)
        {
            FECSDebugDraw::DrawDebugLine(local_26, Data.StartLocation, Data.EntryPointLocation, FColor::Cyan, FColor::Cyan, -1.0f, uint8(0), 2.0f);
            FVector local_60_5 = (Data.EntryPointLocation - local_24);
            FVector local_92_2 = (local_60_5.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 150.0);
            FECSDebugDraw::DrawDebugDirectionalArrow(local_26, local_24, (local_24 + local_92_2), 30.0f, FColor::Yellow, FColor::Yellow, -1.0f, uint8(0), 3.0f);
        }
        else
        {
            float local_52;
            if (int(Data.FollowState) == 2 && (Spline != nullptr))
            {
                if (Data.FollowSplineCurrentDistance < 0.0)
                {
                    local_52 = Data.SplineStartLocationDistance;
                }
                else
                {
                    local_52 = Data.FollowSplineCurrentDistance;
                }
                FVector local_60_6 = Spline.GetLocationAtDistanceAlongSpline(float32(local_52), ESplineCoordinateSpace(1));
                FECSDebugDraw::DrawDebugSphere(local_26, local_60_6, 40.0f, 12, FColor::Yellow, FColor::Yellow, -1.0f, uint8(0), 1.5f);
                FVector local_92_3 = FVector(0.0, 0.0, 60.0);
                FECSDebugDraw::DrawDebugString(local_26, (local_60_6 + local_92_3), "Target", FColor::Yellow, 1.0f, FColor::Yellow, -1.0f);
                FVector local_92_4 = (local_60_6 - local_24);
                FECSDebugDraw::DrawDebugDirectionalArrow(local_26, local_24, (local_24 + (local_92_4.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * 150.0)), 30.0f, FColor::Orange, FColor::Orange, -1.0f, uint8(0), 3.0f);
            }
        }
        return;
    }
}

