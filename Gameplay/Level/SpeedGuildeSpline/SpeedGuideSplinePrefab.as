class ASpeedGuideSplinePrefab : ASplinePrefabBase
{
    UPROPERTY()
    USceneComponent RootSceneComponent;
    UPROPERTY()
    USplineComponent SplineComponent;
    UPROPERTY()
    float32 MaxExtraSpeedPct = 0.5f;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    UStaticMesh CollisionBoxMesh;
    UPROPERTY()
    float32 CollisionBoxBaseSize = 256.0f;
    UPROPERTY()
    float32 SplineCollisionWidth = 256.0f;
    UPROPERTY()
    float32 SplineCollisionHeight = 256.0f;
    UPROPERTY()
    FName NiagaraSplineParamName = n"User.Spline";
    UPROPERTY()
    FT_SpeedGuideSplineFXParam FXParam;

    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        int local_3;
        if (this.SplineCollisionWidth <= 0.0f)
        {
            local_3 = 1;
        }
        else
        {
            bool local_4 = (this.SplineCollisionHeight <= 0.0f);
            local_3 = local_4;
        }
        if (local_3 != 0)
        {
            local_3 = 1;
        }
        else
        {
            bool local_4_2 = (this.CollisionBoxBaseSize <= 0.0f);
            local_3 = local_4_2;
        }
        if (local_3 != 0)
        {
            local_3 = 1;
        }
        else
        {
            bool local_4_3 = (this.CollisionBoxMesh == nullptr);
            local_3 = local_4_3;
        }
        if (local_3 != 0)
        {
            return;
        }
        int local_8 = FMath::CeilToInt((this.SplineComponent.GetSplineLength() / this.SplineCollisionWidth));
        float32 local_1 = this.SplineComponent.GetSplineLength();
        if (local_8 <= 0)
        {
            return;
        }
        USplineComponent local_14 = USplineComponent::Create(this, NAME_None);
        local_14.ClearSplinePoints(false);
        int local_15 = 0;
        for (; local_15 <= local_8; )
        {
            float32 local_2_2 = FMath::Min((local_15 * this.SplineCollisionWidth), local_1);
            FVector local_32 = this.SplineComponent.GetRelativeTransform().TransformPosition((this.SplineComponent.GetLocationAtDistanceAlongSpline(local_2_2, ESplineCoordinateSpace(0))));
            local_14.AddSplinePoint(local_32, ESplineCoordinateSpace(0), false);
            ++local_15;
        }
        local_14.UpdateSpline();
        FVector2D local_66 = FVector2D((this.SplineCollisionWidth / this.CollisionBoxBaseSize), (this.SplineCollisionHeight / this.CollisionBoxBaseSize));
        UInstancedSplineMeshComponent local_74 = UInstancedSplineMeshComponent::Create(this, NAME_None);
        local_74.AttachToComponent(this.GetRootComponent(), NAME_None, EAttachmentRule(2), EAttachmentRule(1));
        local_74.SetStaticMesh(this.CollisionBoxMesh);
        local_74.SetStartScale(local_66, false);
        local_74.SetEndScale(local_66, false);
        local_74.SetVisibility(false, false);
        local_74.SetHiddenInGame(true, false);
        local_74.SetCollisionEnabled(ECollisionEnabled(1));
        local_74.SetCollisionProfileName(n"EventVolume", true);
        local_74.InitFromSplineComponent(local_14, true);
        local_14.DestroyComponent();
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        int local_20 = 0;
        Assign local_4;
        local_4.opCall(FC_PredictableOverlappingTag());
        Modify local_10;
        FC_PrefabLoaded& local_12 = local_10.opCall();
        if (local_12)
        {
            local_12.TryGetPrefabActor();
            local_20.PrefabPath = local_12.Prefab;
        }
        return;
    }
}

