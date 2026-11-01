class ASplinePointPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FString SplineTag;
    UPROPERTY()
    USplineComponent Spline;
    UPROPERTY()
    FT_SplinePoint SplinePoint;
    UPROPERTY()
    FT_InteractTrait Interact;
    UPROPERTY()
    FT_EntityBlackboard EntityBlackboard;
    UPROPERTY()
    FT_Ability Ability;
    UPROPERTY()
    FT_Skill Skill;
    UPROPERTY()
    FT_Prop Prop;
    UPROPERTY()
    FT_Collision Collision;
    UPROPERTY()
    FT_Prop_Presentation PropPresentation;

    ASplinePointPrefab()
    {
        this.bStatic = false;
        this.bHasActor = true;
        this.bHasTransform = true;
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        Has local_4;
        bool local_5;
        int local_14 = 0;
        ASplinePointPrefab local_24;
        if (!(local_4.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Get local_22;
            local_14.SplinePrefab = local_22.opCall().Prefab;
            local_24 = (Cast<ASplinePointPrefab>(local_14.SplinePrefab.Get()));
            if (local_24 != nullptr)
            {
                local_14.Tag = local_24.SplineTag;
            }
        }
        return;
    }
    UFUNCTION()
    float32 GetCollisionHalfHeight_Implementation() const
    {
        return 0.0f;
    }
    void DrawDebug()
    {
        bool local_16;
        if (this.Spline == nullptr)
        {
            return;
        }
        float32 local_5 = this.Spline.GetSplineLength();
        float32 local_6 = 100.0f;
        TArray<FColor> local_10 = {FColor::Red, FColor::Blue, FColor::Green, FColor::Yellow, FColor::Cyan};
        int local_13 = 0;
        for (; local_13 < this.SplinePoint.Config_FC_SplineMoveConfig.SplineOffsets.Num(); ++local_13)
        {
            local_16 = true;
            FVector local_22(FVector::ZeroVector);
            FVector local_28(FVector::ZeroVector);
            float32 local_29 = 0.0f;
            for (; local_29 <= local_5; )
            {
                FVector local_44 = this.Spline.GetLocationAtDistanceAlongSpline(local_29, ESplineCoordinateSpace(1));
                FVector local_58 = this.Spline.GetTangentAtDistanceAlongSpline(local_29, ESplineCoordinateSpace(1)).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                FVector local_64 = this.SplinePoint.Config_FC_SplineMoveConfig.SplineOffsets[local_13];
                FColor local_65 = local_10[(local_13 % local_10.Num())];
                FVector local_36 = (local_44 + local_58.Rotation().RotateVector(local_64));
                if (!(local_16))
                {
                    DebugDraw::DrawDebugLine(this.GetWorld(), local_28, local_36, local_65, true, -1.0f, uint8(0), 2.0f);
                }
                local_22 = local_44;
                local_28 = local_36;
                local_16 = false;
                local_29 = local_29 + local_6;
            }
        }
        return;
    }
}

