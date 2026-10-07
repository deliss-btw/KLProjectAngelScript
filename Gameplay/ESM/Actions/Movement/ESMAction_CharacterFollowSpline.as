
enum EFollowSplineState
{
    Wait,
    EntryingPoint,
    NaviagetingSpline,
    Finish,
}


struct FESMCharacterFollowSplineInstanceData
{
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


}

class UESMAction_CharacterFollowSpline : UESMBPBaseSpanTickAction
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


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCharacterFollowSplineInstanceData);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_156 = 0;
        FESMCharacterFollowSplineInstanceData& local_2 = this.ModifyInstanceData(Context);
        FECSRuntimeView local_42 = Context.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_46;
        local_46.opCall();
        Exclude(local_42).opCall();
        FECSRuntimeViewIterator local_84 = local_42.Iterator();
        for (; local_84.CanProceed;)
        {
            const FECSEntity& local_122 = local_84.Proceed();
            if ((FString(this.SplineTagPriorityMatching) == 0.Tag))
            {
                local_2.SplineEntity = local_122;
                break;
            }
        }
        Get local_126;
        USplineComponent local_134 = local_126.opCall().GetSpline();
        if (local_134 == nullptr)
        {
            return;
        }
        FVector local_142 = local_2.EntryPointLocation;
        float local_144 = local_2.SplineStartLocationDistance;
        ::FSplineMoveUtils::FindBestSplinePoint(local_142, local_144, local_134, Context.GetEntity(), this.FindBestPointDistanceWeight, this.FindBestPointAngleWeight, this.FindBestPointSampleInterval);
        local_2.EntryPointLocation = local_142;
        local_2.SplineStartLocationDistance = local_144;
        local_2.FollowState = EFollowSplineState(1);
        local_2.StartLocation = local_156.GetPosition();
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.ModifyInstanceData(Context).FollowState = EFollowSplineState(3);
        Remove local_8;
        local_8.opCall();
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_16 = 0;
        int local_22 = 0;
        FECSWorldPtr local_4 = Context.GetEntity().GetWorld();
        FESMCharacterFollowSplineInstanceData& local_28 = this.ModifyInstanceData(Context);
        Get local_34;
        USplineComponent local_30 = local_34.opCall().GetSpline();
        if (local_30 == nullptr)
        {
            return;
        }
        float local_40 = Time.ActionDeltaTime.ToSeconds();
        float32 local_41 = float32(local_40);
        if (int(local_28.FollowState) == 1)
        {
            FVector local_62 = (local_28.EntryPointLocation - local_28.StartLocation).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            FVector local_68 = local_28.EntryPointLocation;
            FVector local_56 = (local_68 - local_28.StartLocation);
            local_56.Normalize(9.99999993922529e-9);
            FQuat local_92 = FQuat::FindBetweenVectors(FVector::ForwardVector, local_56);
            FRotator local_104 = local_92.Rotator();
            FAIInputUtils::SimulateViewInput(Context.GetEntity(), FAIInputUtils::GetAimInput(local_22.GetPosition(), local_28.EntryPointLocation, local_22.GetRotation().GetUpVector()));
            FVector local_116(FVector::ForwardVector);
            FAIInputUtils::SimulateMoveInputLocal(Context.GetEntity(), local_116, EAIMoveSimulateType(0), false);
            float local_40_2 = local_22.GetPosition().Distance(local_28.EntryPointLocation);
            if (local_40_2 < this.EnterFirstPointDistance)
            {
                local_28.FollowState = EFollowSplineState(2);
            }
            return;
        }
        if (int(local_28.FollowState) == 2)
        {
            float local_120_2 = (FVector(local_22.GetPosition()) - local_28.LastLocation).Size();
            if ((local_28.LastLocation == FVector::ZeroVector))
            {
                FC_CharacterMovementParam local_10;
                float32 local_123 = local_10.MoveSpeed;
                float32 local_38 = local_16.GetMovementSpeedScale();
                local_123 = local_123 * local_38;
                local_38 = local_123 * local_41;
                local_120_2 = local_38;
            }
            if (local_28.FollowSplineCurrentDistance == -1.0)
            {
                local_28.FollowSplineCurrentDistance = local_28.SplineStartLocationDistance;
            }
            float32 local_38_2 = local_30.GetSplineLength();
            float local_40_4 = local_28.FollowSplineCurrentDistance + local_120_2;
            local_28.FollowSplineCurrentDistance = local_40_4;
            FVector local_68_2 = local_30.GetLocationAtDistanceAlongSpline(float32(local_28.FollowSplineCurrentDistance), ESplineCoordinateSpace(1));
            FQuat local_84 = FQuat(local_30.GetRotationAtDistanceAlongSpline(float32(local_28.FollowSplineCurrentDistance), ESplineCoordinateSpace(1)));
            FAIInputUtils::SimulateViewInput(Context.GetEntity(), FAIInputUtils::GetAimInput(local_22.GetPosition(), local_68_2, local_22.GetRotation().GetUpVector()));
            FAIInputUtils::SimulateMoveInputLocal(Context.GetEntity(), FVector::ForwardVector, EAIMoveSimulateType(0), false);
            float local_122 = local_38_2;
            if (local_28.FollowSplineCurrentDistance > local_122)
            {
                local_122 = 0.0;
                local_28.FollowSplineCurrentDistance = 0.0;
            }
            local_28.LastLocation = local_22.GetPosition();
        }
        return;
    }
    FESMCharacterFollowSplineInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterFollowSplineInstanceData __r;
        return __r;
    }
    FESMCharacterFollowSplineInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMCharacterFollowSplineInstanceData __r;
        return __r;
    }
    void FindBestSplinePoint(FESMCharacterFollowSplineInstanceData &inout InstanceData, const USplineComponent SplineComponent, const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        FVector local_12 = local_6.GetPosition();
        FQuat local_20 = local_6.GetRotation();
        FVector local_26 = local_20.Vector();
        float local_34 = 999999.0;
        float32 local_37 = 0.0f;
        float32 local_38 = SplineComponent.GetSplineLength();
        while (true)
        {
            if (local_37 >= local_38)
            {
                break;
            }
            FVector local_32 = SplineComponent.GetLocationAtDistanceAlongSpline(local_37, ESplineCoordinateSpace(1));
            float local_56 = (local_32.Distance(local_12) * this.FindBestPointDistanceWeight) + (((this.GetFlyToPointTurnAngle(local_12, local_32, local_26)) + this.GetTurnToPointDirAngle(local_12, local_32, SplineComponent.GetDirectionAtDistanceAlongSpline(local_37, ESplineCoordinateSpace(1)))) * this.FindBestPointAngleWeight);
            FECSDebugDraw::DrawDebugString(n"SplineMove", (local_32 + FVector(0.0, 0.0, 200.0)), (FString("") + local_56), FColor(FColor::Blue), 1.0f, FColor(FColor::Blue), 10.0f);
            FECSDebugDraw::DrawDebugSphere(n"SplineMove", local_32, 100.0f, 10, FColor(FColor::Blue), FColor(FColor::Blue), 10.0f, uint8(0), 0.0f);
            if (local_56 < local_34)
            {
                local_34 = local_56;
                InstanceData.EntryPointLocation = local_32;
                InstanceData.SplineStartLocationDistance = local_37;
            }
            local_37 = local_37 + this.FindBestPointSampleInterval;
        }
        FECSDebugDraw::DrawDebugString(n"SplineMove", (InstanceData.EntryPointLocation + FVector(0.0, 0.0, 200.0)), (FString("") + local_34), FColor(FColor::Red), 1.5f, FColor(FColor::Blue), 10.0f);
        FECSDebugDraw::DrawDebugSphere(n"SplineMove", InstanceData.EntryPointLocation, 150.0f, 10, FColor(FColor::Red), FColor(FColor::Red), 10.0f, uint8(0), 0.0f);
        return;
    }
    float GetAngleBetweenTwoDir(const FVector &inout InDirA, const FVector &inout InDirB) const
    {
        return FMath::RadiansToDegrees(FMath::Acos(InDirA.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).DotProduct(InDirB.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))));
    }
    float GetFlyToPointTurnAngle(const FVector &inout StartLocation, const FVector &inout TargetLocation, const FVector &inout StartForward) const
    {
        return FMath::RadiansToDegrees(FMath::Acos(StartForward.DotProduct((TargetLocation - StartLocation).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))));
    }
    float GetTurnToPointDirAngle(const FVector &inout StartLocation, const FVector &inout TargetLocation, const FVector &inout PointForward) const
    {
        return FMath::RadiansToDegrees(FMath::Acos(PointForward.DotProduct((TargetLocation - StartLocation).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))));
    }
}

