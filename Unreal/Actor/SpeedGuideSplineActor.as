

struct FSpeedGuideSplineActorRibbonMeshConfig
{
    UPROPERTY()
    UStaticMesh RibbonStaticMesh;
    UPROPERTY()
    FVector2D Offset;

    FSpeedGuideSplineActorRibbonMeshConfig()
    {
        return;
    }
}

struct FSpeedGuideSplineActorConfig
{
    UPROPERTY()
    UStaticMesh DecalStaticMesh;
    UPROPERTY()
    UMaterialInterface DecalMaterial = nullptr;
    UPROPERTY()
    URuntimeVirtualTexture DecalRVT = nullptr;
    UPROPERTY()
    TArray<FSpeedGuideSplineActorRibbonMeshConfig> RibbonMesh;
    UPROPERTY()
    UMaterialInterface RibbonMaterial = nullptr;
    UPROPERTY()
    float32 SplineTileLength = 1000.0f;
    UPROPERTY()
    ESplineMeshAxis ForwardAxis = ESplineMeshAxis(1);
    UPROPERTY()
    float32 RiMeshRotation = 0.0f;
    UPROPERTY()
    float32 RiMeshScale = 1.0f;


}

class ASpeedGuideSplineActor : AGameActor
{
    UPROPERTY()
    TArray<UMaterialInstanceDynamic> MIDSplines;
    TArray<UInstancedSplineMeshComponent> EffectPlaneSplineMeshes;
    UPROPERTY()
    FSpeedGuideSplineActorConfig Config;

    ASpeedGuideSplineActor()
    {
        return;
    }
    UFUNCTION()
    void PostSpawnForEntity_Implementation(const FECSEntity &inout Entity)
    {
        ASpeedGuideSplinePrefab local_10;
        Modify local_4;
        FC_PrefabLoaded& local_6 = local_4.opCall();
        if (local_6)
        {
            local_10 = (Cast<ASpeedGuideSplinePrefab>(local_6.TryGetPrefabActor()));
            if (local_10 != nullptr)
            {
                UNiagaraComponent local_18 = Cast<UNiagaraComponent>(this.GetComponentByClass(UNiagaraComponent));
                if (local_18 != nullptr)
                {
                    ECSFX::SetNiagaraSplineSourceActor(local_18, local_10.NiagaraSplineParamName, local_10);
                }
                this.OnCustomInit(local_10);
            }
        }
        return;
    }
    UFUNCTION()
    void AS_OnCustomInit(const AActor Prefab)
    {
        FCpuProfilerTraceScoped local_1 = FCpuProfilerTraceScoped(n"AS_OnCustomInit");
        ASpeedGuideSplinePrefab local_6 = (Cast<ASpeedGuideSplinePrefab>(Prefab));
        if (local_6 == nullptr)
        {
            return;
        }
        USplineComponent local_10 = local_6.SplineComponent;
        if (local_10 == nullptr)
        {
            return;
        }
        UNiagaraComponent local_12 = Cast<UNiagaraComponent>(this.GetComponentByClass(UNiagaraComponent));
        float32 local_16 = local_10.GetSplineLength();
        if (local_12 != nullptr)
        {
            local_12.SetFloatParameter(n"Length", local_16 * 0.001f);
            local_12.SetVariableObject(n"Object", local_10);
        }
        this.AS_EffectPlane(local_10);
        return;
    }
    void AS_DecalMesh(const USplineComponent SourceSpline)
    {
        FCpuProfilerTraceScoped local_1 = FCpuProfilerTraceScoped(n"AS_DecalMesh");
        if (SourceSpline == nullptr)
        {
            return;
        }
        USplineComponent local_8 = USplineComponent::Create(this, NAME_None);
        local_8.ClearSplinePoints(false);
        int local_2 = SourceSpline.GetNumberOfSplinePoints();
        int local_10 = 0;
        for (; local_10 < local_2; )
        {
            FVector local_26 = SourceSpline.GetLocationAtSplinePoint(local_10, ESplineCoordinateSpace(0));
            FVector local_18 = SourceSpline.GetArriveTangentAtSplinePoint(local_10, ESplineCoordinateSpace(0));
            FVector local_32 = SourceSpline.GetLeaveTangentAtSplinePoint(local_10, ESplineCoordinateSpace(0));
            local_8.AddSplinePoint(local_26, ESplineCoordinateSpace(0), false);
            local_8.SetSplinePointType(local_10, ESplinePointType(4), false);
            local_8.SetTangentsAtSplinePoint(local_10, local_18, local_32, ESplineCoordinateSpace(0), false);
            ++local_10;
        }
        local_8.UpdateSpline();
        UInstancedSplineMeshComponent local_44 = UInstancedSplineMeshComponent::Create(this, NAME_None);
        local_44.AttachToComponent(this.GetRootComponent(), NAME_None, EAttachmentRule(2), EAttachmentRule(1));
        local_44.SetStaticMesh(this.Config.DecalStaticMesh);
        local_44.SetMaterial(0, this.Config.DecalMaterial);
        local_44.SetStartScale(FVector2D(5.0, 5.0), false);
        local_44.SetEndScale(FVector2D(5.0, 5.0), false);
        local_44.RuntimeVirtualTextures.Empty(0);
        local_44.RuntimeVirtualTextures.Add(TObjectPtr<URuntimeVirtualTexture>(this.Config.DecalRVT));
        local_44.SetCastShadow(false);
        local_44.SetForceDisableNanite(true);
        local_44.SetCollisionEnabled(ECollisionEnabled(0));
        local_44.SetCollisionProfileName(n"NoCollision", true);
        local_44.SetbEnableVertexColorMeshPainting(true);
        local_44.SetbEnableTextureColorMeshPainting(true);
        local_44.InitFromSplineComponent(local_8, true);
        int local_11 = local_44.GetInstanceCount();
        local_44.SetNumCustomDataFloats(1);
        int local_61 = 0;
        for (; local_61 < local_11; )
        {
            float32 local_62 = 0.0f;
            if (local_11 == 1)
            {
                local_62 = 2.0f;
            }
            else
            {
                if (local_61 == 0)
                {
                    local_62 = 1.0f;
                }
                else
                {
                    if (local_61 == (local_11 - 1))
                    {
                        local_62 = -1.0f;
                    }
                }
            }
            local_44.SetCustomDataValue(local_61, 0, local_62, (local_61 == (local_11 - 1)));
            ++local_61;
        }
        local_8.DestroyComponent();
        return;
    }
    void AS_EffectPlane(const USplineComponent SourceSpline)
    {
        float32 local_31;
        FCpuProfilerTraceScoped local_1 = FCpuProfilerTraceScoped(n"AS_EffectPlane");
        if ((SourceSpline == nullptr || ((this.Config.SplineTileLength <= 0.0f))))
        {
            return;
        }
        float32 local_4 = SourceSpline.GetSplineLength();
        float32 local_7 = local_4 / this.Config.SplineTileLength;
        int local_2 = FMath::TruncToInt(local_7);
        if (local_2 <= 0)
        {
            return;
        }
        this.EffectPlaneSplineMeshes.Empty(0);
        USplineComponent local_12 = USplineComponent::Create(this, NAME_None);
        local_12.ClearSplinePoints(false);
        int local_13 = 0;
        for (; local_13 <= local_2; )
        {
            float32 local_5 = local_13;
            local_5 = local_5 * this.Config.SplineTileLength;
            float32 local_7_2 = FMath::Min(local_5, local_4);
            FVector local_30 = SourceSpline.GetLocationAtDistanceAlongSpline(local_7_2, ESplineCoordinateSpace(0));
            if (local_13 < local_2)
            {
                local_5 = (local_13 + 1);
                local_5 = local_5 * this.Config.SplineTileLength;
                local_31 = FMath::Min(local_5, local_4) - local_7_2;
            }
            else
            {
                local_5 = (local_13 - 1);
                local_5 = local_5 * this.Config.SplineTileLength;
                local_31 = local_7_2 - local_5;
            }
            FVector local_22 = SourceSpline.GetTangentAtDistanceAlongSpline(local_7_2, ESplineCoordinateSpace(0));
            local_22 = local_22.GetSafeNormal(0.0001, FVector::ZeroVector).opMul_r(FMath::Min(local_22.Size(), local_31));
            local_12.AddSplinePoint(local_30, ESplineCoordinateSpace(0), false);
            local_12.SetSplinePointType(local_13, ESplinePointType(4), false);
            local_12.SetTangentsAtSplinePoint(local_13, local_22, local_22, ESplineCoordinateSpace(0), false);
            ++local_13;
        }
        local_12.UpdateSpline();
        int local_13_2 = 0;
        FSpeedGuideSplineActorRibbonMeshConfig& local_54 = this.Config.RibbonMesh[local_13_2];
        UInstancedSplineMeshComponent local_58 = UInstancedSplineMeshComponent::Create(this, NAME_None);
        local_58.AttachToComponent(this.GetRootComponent(), NAME_None, EAttachmentRule(2), EAttachmentRule(1));
        local_58.SetStaticMesh(local_54.RibbonStaticMesh);
        local_58.SetMaterial(0, this.Config.RibbonMaterial);
        local_58.SetCollisionEnabled(ECollisionEnabled(0));
        local_58.SetCollisionProfileName(n"NoCollision", true);
        local_58.SetbEnableVertexColorMeshPainting(true);
        local_58.SetbEnableTextureColorMeshPainting(true);
        local_58.SetForwardAxis(this.Config.ForwardAxis, false);
        local_58.SetStartRollDegrees(this.Config.RiMeshRotation, false);
        local_58.SetEndRollDegrees(this.Config.RiMeshRotation, false);
        local_58.SetStartScale(FVector2D(this.Config.RiMeshScale, this.Config.RiMeshScale), false);
        local_58.SetEndScale(FVector2D(this.Config.RiMeshScale, this.Config.RiMeshScale), false);
        local_58.InitFromSplineComponent(local_12, false);
        local_58.SetUniformOffset(local_54.Offset, true);
        local_58.SetScalarParameterForDefaultCustomPrimitiveData(n"SplineLength", local_4);
        local_58.SetScalarParameterForDefaultCustomPrimitiveData(n"OUTLerp", 0.0f);
        local_58.SetScalarParameterForDefaultCustomPrimitiveData(n"Delta Time", 0.0f);
        int local_8 = local_58.GetInstanceCount();
        local_58.SetNumCustomDataFloats(2);
        int local_70 = 0;
        for (; local_70 < local_8; )
        {
            float32 local_32 = (local_70 + 1);
            local_32 = local_32 * this.Config.SplineTileLength;
            float32 local_7_3 = FMath::Min(local_32, local_4);
            if (local_4 > 0.0f)
            {
                local_32 = (local_70 * this.Config.SplineTileLength) / local_4;
            }
            else
            {
                local_32 = 0.0f;
            }
            if (local_4 > 0.0f)
            {
                local_31 = local_7_3 / local_4;
            }
            else
            {
                local_31 = 0.0f;
            }
            local_58.SetCustomDataValue(local_70, 0, local_32, false);
            local_58.SetCustomDataValue(local_70, 1, local_31, (local_70 == (local_8 - 1)));
            ++local_70;
        }
        while (local_13_2 < local_8)
        {
            this.EffectPlaneSplineMeshes.Add(local_58);
            ++local_13_2;
            local_8 = this.Config.RibbonMesh.Num();
        }
        local_12.DestroyComponent();
        return;
    }
}

