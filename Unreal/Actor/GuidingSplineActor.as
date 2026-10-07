

UCLASS(Abstract)
class AGuidingSplineActor : AActor
{
    UPROPERTY()
    float32 SegmentTileLength = 200.0f;
    UPROPERTY()
    float32 UVTileLength = 1800.0f;
    UPROPERTY()
    float32 EmissiveUVTileLength = 1800.0f;
    UPROPERTY()
    float32 HeightOffset = 0.0f;
    UPROPERTY()
    bool bEnableSecondMeshLayer = true;
    UPROPERTY()
    UMaterialInterface SecondMeshLayerMaterial;
    UPROPERTY()
    UMaterialInterface DebugSplineGuideMaterial;
    UPROPERTY()
    UMaterialInterface DebugShaderMaterial;
    UPROPERTY()
    UMaterialParameterCollection DebugShaderMPC;
    UPROPERTY()
    int DebugUVSegmentCount = 8;
    UPROPERTY()
    float32 DebugUVMinSegmentLength = 120.0f;
    UPROPERTY()
    float32 DebugUVMaxSegmentLength = 600.0f;
    UPROPERTY()
    float32 DebugUVMaxTurnAngle = 65.0f;
    UPROPERTY()
    float32 DebugUVHeightJitter = 120.0f;
    UPROPERTY()
    float32 DebugUVTileLength = 200.0f;
    UPROPERTY()
    float32 DebugShaderDrawLength = 1800.0f;
    UPROPERTY()
    float32 DebugShaderFlowSpeed = 0.25f;
    UPROPERTY()
    float32 DebugShaderTimeDilation = 0.1f;
    UPROPERTY()
    float32 DebugShaderOffsetU = 0.0f;
    UPROPERTY()
    float32 DebugShaderDissolve = 1.0f;
    UPROPERTY()
    float32 DebugShaderEmissiveMaskPower = 1.0f;
    UPROPERTY()
    TArray<USplineMeshComponent> SecondMeshLayerComponents;

    default DebugSplineGuideMaterial = Cast<UMaterialInterface>(LoadObject(nullptr, "/Script/Engine.Material'/Game/OriginalRes/Dev/FX/Material/MaterialMaster/Ribbon/DebugSplineGuideMaterial.DebugSplineGuideMaterial'"));
    default DebugShaderMaterial = Cast<UMaterialInterface>(LoadObject(nullptr, "/Script/Engine.MaterialInstanceConstant'/Game/OriginalRes/Dev/FX/Material/MaterialInstance/Ribbon/MI_Ribbon_SplineFX_Guide.MI_Ribbon_SplineFX_Guide'"));
    default DebugShaderMPC = Cast<UMaterialParameterCollection>(LoadObject(nullptr, "/Script/Engine.MaterialParameterCollection'/Game/OriginalRes/Proto/FXLibrary/Common/Spline/MPC_Fingerprint.MPC_Fingerprint'"));


    UFUNCTION()
    void VFX_GuideSpline_Implementation()
    {
        return;
    }
    void VFX_GuideSpline()
    {
        __Evt_Execute(this, n"VFX_GuideSpline");
        return;
    }
    UMaterialInterface GetDebugSplineGuideMaterial()
    {
        if (this.DebugSplineGuideMaterial != nullptr)
        {
            return this.DebugSplineGuideMaterial;
        }
        return Cast<UMaterialInterface>(LoadObject(nullptr, "/Script/Engine.Material'/Game/OriginalRes/Dev/FX/Material/MaterialMaster/Ribbon/DebugSplineGuideMaterial.DebugSplineGuideMaterial'"));
    }
    UMaterialInterface GetDebugShaderMaterial()
    {
        if (this.DebugShaderMaterial != nullptr)
        {
            return this.DebugShaderMaterial;
        }
        return Cast<UMaterialInterface>(LoadObject(nullptr, "/Script/Engine.MaterialInstanceConstant'/Game/OriginalRes/Dev/FX/Material/MaterialInstance/Ribbon/MI_Ribbon_SplineFX_Guide.MI_Ribbon_SplineFX_Guide'"));
    }
    UMaterialParameterCollection GetDebugShaderMPC()
    {
        if (this.DebugShaderMPC != nullptr)
        {
            return this.DebugShaderMPC;
        }
        return Cast<UMaterialParameterCollection>(LoadObject(nullptr, "/Script/Engine.MaterialParameterCollection'/Game/OriginalRes/Proto/FXLibrary/Common/Spline/MPC_Fingerprint.MPC_Fingerprint'"));
    }
    UMaterialInterface GetSecondMeshLayerMaterial(const UMaterialInterface FallbackMaterial)
    {
        if (this.SecondMeshLayerMaterial != nullptr)
        {
            return this.SecondMeshLayerMaterial;
        }
        return FallbackMaterial;
    }
    bool CanRunEditorDebug() const
    {
        UWorld local_2 = this.GetWorld();
        return local_2 == nullptr || !(local_2.IsGameWorld());
    }
    FName GetSecondMeshLayerComponentTag() const
    {
        return n"GuidingSplineSecondMeshLayer";
    }
    bool IsSecondMeshLayerComponent(const USplineMeshComponent SplineMeshComponent) const
    {
        USplineMeshComponent local_8;
        if (SplineMeshComponent == nullptr)
        {
            return false;
        }
        if (SplineMeshComponent.ComponentHasTag(this.GetSecondMeshLayerComponentTag()))
        {
            return true;
        }
        int local_4 = 0;
        for (; local_4 < this.SecondMeshLayerComponents.Num(); ++local_4)
        {
            local_8 = this.SecondMeshLayerComponents[local_4];
            if (local_8 == SplineMeshComponent)
            {
                return true;
            }
        }
        return false;
    }
    void ClearSecondMeshLayer()
    {
        USplineMeshComponent local_16;
        TArray<USplineMeshComponent> local_8 = this.GetComponentsByClass(USplineMeshComponent);
        int local_12 = local_8.Num() - 1;
        for (; local_12 >= 0; --local_12)
        {
            local_16 = local_8[local_12];
            if (!(this.IsSecondMeshLayerComponent(local_16)))
            {
                continue;
            }
            local_16.SetVisibility(false, false);
            local_16.DestroyComponent();
        }
        this.SecondMeshLayerComponents.Empty(0);
        return;
    }
    float32 GetSplineMeshDistanceRangeStart(const FVector2D &inout DistanceRange) const
    {
        return float32((FMath::Min(DistanceRange.X, DistanceRange.Y)));
    }
    float32 GetSplineMeshDistanceRangeEnd(const FVector2D &inout DistanceRange) const
    {
        return float32((FMath::Max(DistanceRange.X, DistanceRange.Y)));
    }
    bool HasMatchingSplineMeshDistanceRange(const float32 RangeStart, const float32 RangeEnd, TArray<float32> &inout ExistingRangeStarts, TArray<float32> &inout ExistingRangeEnds, const float32 Tolerance) const
    {
        bool local_4 = false;
        int local_1 = 0;
        while (local_4)
        {
            if (FMath::Abs((RangeStart - ExistingRangeStarts[local_1])) <= Tolerance && (FMath::Abs((RangeEnd - ExistingRangeEnds[local_1])) <= Tolerance))
            {
                return true;
            }
            ++local_1;
            if (local_1 >= ExistingRangeStarts.Num())
            {
                local_4 = false;
                continue;
            }
            local_4 = (local_1 < ExistingRangeEnds.Num());
        }
        return false;
    }
    void InsertSourceSplineMeshComponentByDistance(const USplineMeshComponent SplineMeshComponent, const float32 RangeStart, const float32 RangeEnd, TArray<USplineMeshComponent> &inout OutSplineMeshComponents, TArray<float32> &inout OutRangeStarts, TArray<float32> &inout OutRangeEnds) const
    {
        int local_2 = OutSplineMeshComponents.Num();
        int local_3 = 0;
        for (; local_3 < OutSplineMeshComponents.Num(); ++local_3)
        {
            if (RangeStart < OutRangeStarts[local_3] || (FMath::IsNearlyEqual(RangeStart, OutRangeStarts[local_3], 1.0f) && (RangeEnd < OutRangeEnds[local_3])))
            {
                local_2 = local_3;
                break;
            }
        }
        OutSplineMeshComponents.Insert(SplineMeshComponent, local_2);
        OutRangeStarts.Insert(RangeStart, local_2);
        OutRangeEnds.Insert(RangeEnd, local_2);
        return;
    }
    void CollectSourceSplineMeshComponents(const USplineComponent SplineComponent, TArray<USplineMeshComponent> &inout OutSplineMeshComponents)
    {
        USplineMeshComponent local_28;
        OutSplineMeshComponents.Empty(0);
        if (SplineComponent == nullptr)
        {
            return;
        }
        float32 local_4 = SplineComponent.GetSplineLength();
        float32 local_6 = FMath::Max(local_4, 0.001f);
        float32 local_4_2 = FMath::Max(1.0f, local_6 * 0.0001f);
        TArray<float32> local_12;
        TArray<float32> local_16;
        TArray<USplineMeshComponent> local_24 = this.GetComponentsByClass(USplineMeshComponent);
        int local_25 = 0;
        for (; local_25 < local_24.Num(); ++local_25)
        {
            local_28 = local_24[local_25];
            if (local_28 == nullptr || this.IsSecondMeshLayerComponent(local_28) || (local_28.GetStaticMesh() == nullptr) || !(local_28.IsVisible()))
            {
                continue;
            }
            FVector2D local_40 = this.GetContinuousSplineDistanceRange(SplineComponent, local_28, local_6);
            float32 local_7 = FMath::Clamp(this.GetSplineMeshDistanceRangeStart(local_40), 0.0f, local_6);
            float32 local_3 = FMath::Clamp(this.GetSplineMeshDistanceRangeEnd(local_40), 0.0f, local_6);
            if ((local_3 - local_7) <= local_4_2)
            {
                continue;
            }
            if ((local_3 >= (local_6 - local_4_2) && this.HasMatchingSplineMeshDistanceRange(local_7, local_3, local_12, local_16, local_4_2)))
            {
                continue;
            }
            this.InsertSourceSplineMeshComponentByDistance(local_28, local_7, local_3, OutSplineMeshComponents, local_12, local_16);
        }
        return;
    }
    void CopySplineMeshSetup(const USplineMeshComponent SourceComponent, const USplineMeshComponent TargetComponent)
    {
        if ((SourceComponent == nullptr || (TargetComponent == nullptr)))
        {
            return;
        }
        TargetComponent.AttachToComponent(this.GetRootComponent(), NAME_None, EAttachmentRule(2), EAttachmentRule(1));
        TargetComponent.SetRelativeTransform(SourceComponent.GetRelativeTransform());
        TargetComponent.SetStaticMesh(SourceComponent.GetStaticMesh());
        TargetComponent.SetForwardAxis(SourceComponent.GetForwardAxis(), false);
        TargetComponent.SetSplineUpDir(SourceComponent.GetSplineUpDir(), false);
        TargetComponent.SetBoundaryMin(SourceComponent.GetBoundaryMin(), false);
        TargetComponent.SetBoundaryMax(SourceComponent.GetBoundaryMax(), false);
        TargetComponent.SetStartScale(SourceComponent.GetStartScale(), false);
        TargetComponent.SetEndScale(SourceComponent.GetEndScale(), false);
        TargetComponent.SetStartRoll(SourceComponent.GetStartRoll(), false);
        TargetComponent.SetEndRoll(SourceComponent.GetEndRoll(), false);
        TargetComponent.SetStartOffset(SourceComponent.GetStartOffset(), false);
        TargetComponent.SetEndOffset(SourceComponent.GetEndOffset(), false);
        TargetComponent.SetStartAndEnd(SourceComponent.GetStartPosition(), SourceComponent.GetStartTangent(), SourceComponent.GetEndPosition(), SourceComponent.GetEndTangent(), false);
        if (this.SecondMeshLayerMaterial != nullptr)
        {
            TargetComponent.SetMaterial(0, this.SecondMeshLayerMaterial);
        }
        else
        {
            int local_72 = FMath::Max(1, SourceComponent.GetNumMaterials());
            int local_73 = 0;
            for (; local_73 < local_72; ++local_73)
            {
                UMaterialInterface local_76 = SourceComponent.GetMaterial(local_73);
                if (local_76 != nullptr)
                {
                    TargetComponent.SetMaterial(local_73, local_76);
                }
            }
        }
        TargetComponent.SetCollisionEnabled(ECollisionEnabled(0));
        TargetComponent.SetCollisionProfileName(n"NoCollision", true);
        TargetComponent.SetCastShadow(false);
        TargetComponent.SetForceDisableNanite(true);
        TargetComponent.SetVisibility(SourceComponent.IsVisible(), false);
        TargetComponent.UpdateMesh();
        return;
    }
    void RebuildSecondMeshLayer(TArray<USplineMeshComponent> &inout SourceSplineMeshComponents)
    {
        USplineMeshComponent local_6;
        auto local_12;
        this.ClearSecondMeshLayer();
        if (!(this.bEnableSecondMeshLayer))
        {
            return;
        }
        int local_2 = 0;
        for (; local_2 < SourceSplineMeshComponents.Num(); ++local_2)
        {
            local_6 = SourceSplineMeshComponents[local_2];
            if (local_6 == nullptr || (local_6.GetStaticMesh() == nullptr))
            {
                local_12 = nullptr;
                this.SecondMeshLayerComponents.Add(local_12);
                continue;
            }
            USplineMeshComponent local_14 = USplineMeshComponent::Create(this, NAME_None);
            if (local_14 == nullptr)
            {
                local_12 = nullptr;
                this.SecondMeshLayerComponents.Add(local_12);
                continue;
            }
            local_14.ComponentTags.AddUnique(this.GetSecondMeshLayerComponentTag());
            this.CopySplineMeshSetup(local_6, local_14);
            this.SecondMeshLayerComponents.Add(local_14);
        }
        return;
    }
    FVector2D GetContinuousSplineDistanceRange(const USplineComponent SplineComponent, const USplineMeshComponent SplineMeshComponent, const float32 SplineLength) const
    {
        if ((SplineComponent == nullptr || (SplineMeshComponent == nullptr)))
        {
            return FVector2D(0.0, SplineLength);
        }
        FTransform local_60 = SplineMeshComponent.GetWorldTransform();
        return FVector2D(SplineComponent.GetDistanceAlongSplineAtSplineInputKey(SplineComponent.FindInputKeyClosestToWorldLocation(local_60.TransformPosition(SplineMeshComponent.GetStartPosition()))), SplineComponent.GetDistanceAlongSplineAtSplineInputKey(SplineComponent.FindInputKeyClosestToWorldLocation(local_60.TransformPosition(SplineMeshComponent.GetEndPosition()))));
    }
    void ApplyContinuousSplineUVData(const USplineComponent SplineComponent)
    {
        this.ApplyContinuousSplineUVDataWithTileLength(SplineComponent, this.UVTileLength);
        return;
    }
    void ApplySplineUVDataToComponent(const USplineMeshComponent SplineMeshComponent, const FVector2D &inout DistanceRange, const float32 SplineLength, const float32 TileLength)
    {
        if (SplineMeshComponent == nullptr)
        {
            return;
        }
        float32 local_4 = FMath::Max(SplineLength, 0.001f);
        float32 local_2 = FMath::Max(TileLength, 1.0f);
        float32 local_3 = float32((DistanceRange.X / local_4));
        float32 local_6 = float32((DistanceRange.Y / local_4));
        float32 local_11 = float32((DistanceRange.X / local_2));
        float32 local_12 = float32((DistanceRange.Y / local_2));
        float32 local_5 = local_4 / local_2;
        float32 local_16 = FMath::Max(this.EmissiveUVTileLength, 1.0f);
        float32 local_13 = local_4 / local_16;
        SplineMeshComponent.SetCustomPrimitiveDataFloat(0, local_3);
        SplineMeshComponent.SetCustomPrimitiveDataFloat(1, local_6);
        SplineMeshComponent.SetCustomPrimitiveDataFloat(2, local_4);
        SplineMeshComponent.SetCustomPrimitiveDataFloat(3, local_2);
        SplineMeshComponent.SetCustomPrimitiveDataFloat(4, local_5);
        SplineMeshComponent.SetCustomPrimitiveDataFloat(5, local_13);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"Start", local_3);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"End", local_6);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"Start1", local_3);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"End1", local_6);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"StartTileU", local_11);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"EndTileU", local_12);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"SplineLength", local_4);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"UV TileLength", local_2);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"TileLength", local_2);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"SplineUVTileCount", local_5);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"EmissiveUVTileLength", local_16);
        SplineMeshComponent.SetScalarParameterValueOnMaterials(n"EmissiveUVTileCount", local_13);
        return;
    }
    void ApplyContinuousSplineUVDataToComponents(const USplineComponent SplineComponent, const float32 TileLength, TArray<USplineMeshComponent> &inout SplineMeshComponents)
    {
        USplineMeshComponent local_14;
        if (SplineComponent == nullptr)
        {
            return;
        }
        int local_3 = SplineComponent.GetNumberOfSplinePoints();
        int local_2 = SplineMeshComponents.Num();
        if ((local_3 < 2 || (local_2 <= 0)))
        {
            return;
        }
        float32 local_9 = FMath::Max(SplineComponent.GetSplineLength(), 0.001f);
        float32 local_6 = FMath::Max(TileLength, 1.0f);
        int local_11 = 0;
        for (; local_11 < local_2; ++local_11)
        {
            local_14 = SplineMeshComponents[local_11];
            if (local_14 == nullptr)
            {
                continue;
            }
            FVector2D local_22 = this.GetContinuousSplineDistanceRange(SplineComponent, local_14, local_9);
            this.ApplySplineUVDataToComponent(local_14, local_22, local_9, local_6);
        }
        return;
    }
    void ApplyContinuousSplineUVDataToLayeredComponents(const USplineComponent SplineComponent, const float32 TileLength, TArray<USplineMeshComponent> &inout SourceSplineMeshComponents)
    {
        USplineMeshComponent local_14;
        USplineMeshComponent local_26;
        if (SplineComponent == nullptr)
        {
            return;
        }
        int local_3 = SplineComponent.GetNumberOfSplinePoints();
        int local_2 = SourceSplineMeshComponents.Num();
        if ((local_3 < 2 || (local_2 <= 0)))
        {
            return;
        }
        float32 local_9 = FMath::Max(SplineComponent.GetSplineLength(), 0.001f);
        float32 local_6 = FMath::Max(TileLength, 1.0f);
        int local_11 = 0;
        for (; local_11 < local_2; ++local_11)
        {
            local_14 = SourceSplineMeshComponents[local_11];
            if (local_14 == nullptr)
            {
                continue;
            }
            FVector2D local_22 = this.GetContinuousSplineDistanceRange(SplineComponent, local_14, local_9);
            this.ApplySplineUVDataToComponent(local_14, local_22, local_9, local_6);
            if (local_11 < this.SecondMeshLayerComponents.Num())
            {
                local_26 = this.SecondMeshLayerComponents[local_11];
                if (local_26 == nullptr)
                {
                    continue;
                }
                this.ApplySplineUVDataToComponent(local_26, local_22, local_9, local_6);
            }
        }
        return;
    }
    void ApplyContinuousSplineUVDataWithTileLength(const USplineComponent SplineComponent, const float32 TileLengthInput)
    {
        if (SplineComponent == nullptr)
        {
            return;
        }
        if (SplineComponent.GetNumberOfSplinePoints() < 2)
        {
            this.ClearSecondMeshLayer();
            return;
        }
        TArray<USplineMeshComponent> local_8;
        this.CollectSourceSplineMeshComponents(SplineComponent, local_8);
        if (local_8.Num() <= 0)
        {
            this.ClearSecondMeshLayer();
            return;
        }
        float32 local_12 = FMath::Max(TileLengthInput, 1.0f);
        this.RebuildSecondMeshLayer(local_8);
        this.ApplyContinuousSplineUVDataToLayeredComponents(SplineComponent, local_12, local_8);
        return;
    }
    void ApplyDebugMaterialToComponents(const USplineComponent SplineComponent, const UMaterialInterface MaterialToUse, const float32 TileLength, const bool bShaderDebug, TArray<USplineMeshComponent> &inout SplineMeshComponents)
    {
        USplineMeshComponent local_14;
        if ((SplineComponent == nullptr || (MaterialToUse == nullptr)))
        {
            return;
        }
        if (SplineComponent.GetNumberOfSplinePoints() < 2)
        {
            return;
        }
        int local_3 = SplineMeshComponents.Num();
        if (local_3 <= 0)
        {
            return;
        }
        float32 local_9 = FMath::Max(SplineComponent.GetSplineLength(), 0.001f);
        float32 local_6 = FMath::Max(TileLength, 1.0f);
        int local_11 = 0;
        for (; local_11 < local_3; ++local_11)
        {
            local_14 = SplineMeshComponents[local_11];
            if (local_14 == nullptr)
            {
                continue;
            }
            FVector2D local_22 = this.GetContinuousSplineDistanceRange(SplineComponent, local_14, local_9);
            this.ApplySplineUVDataToComponent(local_14, local_22, local_9, local_6);
            float local_26 = local_22.X / local_9;
            float32 local_10 = float32(local_26);
            local_26 = local_22.Y;
            local_26 = local_26 / local_9;
            float32 local_23 = float32(local_26);
            local_26 = local_22.X;
            local_26 = local_26 / local_6;
            float32 local_29 = float32(local_26);
            local_26 = local_22.Y;
            local_26 = local_26 / local_6;
            float32 local_30 = float32(local_26);
            float32 local_7 = FMath::Max(this.EmissiveUVTileLength, 1.0f);
            float32 local_8 = local_9 / local_7;
            int local_37 = FMath::Max(1, local_14.GetNumMaterials());
            int local_38 = 0;
            for (; local_38 < local_37; ++local_38)
            {
                UMaterialInstanceDynamic local_40 = local_14.CreateDynamicMaterialInstance(local_38, MaterialToUse, NAME_None);
                if (local_40 == nullptr)
                {
                    continue;
                }
                local_40.SetScalarParameterValue(n"Start", local_10);
                local_40.SetScalarParameterValue(n"End", local_23);
                local_40.SetScalarParameterValue(n"Start1", local_10);
                local_40.SetScalarParameterValue(n"End1", local_23);
                local_40.SetScalarParameterValue(n"StartTileU", local_29);
                local_40.SetScalarParameterValue(n"EndTileU", local_30);
                local_40.SetScalarParameterValue(n"SplineLength", local_9);
                local_40.SetScalarParameterValue(n"UseUVRemap", 1.0f);
                local_40.SetScalarParameterValue(n"UseRibbonUV", 1.0f);
                local_40.SetScalarParameterValue(n"UV TileLength", local_6);
                local_40.SetScalarParameterValue(n"TileLength", local_6);
                local_40.SetScalarParameterValue(n"SplineUVTileCount", local_9 / local_6);
                local_40.SetScalarParameterValue(n"EmissiveUVTileLength", local_7);
                local_40.SetScalarParameterValue(n"EmissiveUVTileCount", local_8);
                if (bShaderDebug)
                {
                    float32 local_33 = FMath::Max(local_9, 0.001f);
                    local_40.SetScalarParameterValue(n"DebugShaderDrawLength", local_33);
                    local_40.SetScalarParameterValue(n"DebugShaderTargetDrawLength", this.DebugShaderDrawLength);
                    local_40.SetScalarParameterValue(n"DebugShaderFlowSpeed", this.DebugShaderFlowSpeed);
                    local_40.SetScalarParameterValue(n"DebugShaderTimeDilation", this.DebugShaderTimeDilation);
                    local_40.SetScalarParameterValue(n"DrawLength", local_33);
                    local_40.SetScalarParameterValue(n"SplineDrawLength", local_33);
                    local_40.SetScalarParameterValue(n"TotalDrawLength", local_33);
                    local_40.SetScalarParameterValue(n"FlowSpeed", this.DebugShaderFlowSpeed);
                    local_40.SetScalarParameterValue(n"TimeDilation", this.DebugShaderTimeDilation);
                    local_40.SetScalarParameterValue(n"OffsetU", this.DebugShaderOffsetU);
                    local_40.SetScalarParameterValue(n"Dissolve", this.DebugShaderDissolve);
                    local_40.SetScalarParameterValue(n"EmissiveMaskPower", this.DebugShaderEmissiveMaskPower);
                    local_40.SetScalarParameterValue(n"MPC_OffsetU", this.DebugShaderOffsetU);
                    local_40.SetScalarParameterValue(n"MPC_Dissolve", this.DebugShaderDissolve);
                    local_40.SetScalarParameterValue(n"MPC_EmissiveMaskPower", this.DebugShaderEmissiveMaskPower);
                    local_40.SetScalarParameterValue(n"MPCOffsetU", this.DebugShaderOffsetU);
                    local_40.SetScalarParameterValue(n"MPCDissolve", this.DebugShaderDissolve);
                    local_40.SetScalarParameterValue(n"MPCEmissiveMaskPower", this.DebugShaderEmissiveMaskPower);
                }
            }
        }
        return;
    }
    void ApplyDebugMaterial(const USplineComponent SplineComponent, const UMaterialInterface MaterialToUse, const float32 TileLengthInput, const bool bShaderDebug)
    {
        float32 local_3 = FMath::Max(TileLengthInput, 1.0f);
        this.ApplyContinuousSplineUVDataWithTileLength(SplineComponent, local_3);
        if (bShaderDebug)
        {
            UMaterialParameterCollection local_6 = this.GetDebugShaderMPC();
            if (local_6 != nullptr)
            {
                Material::SetScalarParameterValue(__GetWorldContext(), local_6, n"OffsetU", this.DebugShaderOffsetU);
                Material::SetScalarParameterValue(__GetWorldContext(), local_6, n"Dissolve", this.DebugShaderDissolve);
                Material::SetScalarParameterValue(__GetWorldContext(), local_6, n"EmissiveMaskPower", this.DebugShaderEmissiveMaskPower);
            }
        }
        TArray<USplineMeshComponent> local_16;
        this.CollectSourceSplineMeshComponents(SplineComponent, local_16);
        this.ApplyDebugMaterialToComponents(SplineComponent, MaterialToUse, local_3, bShaderDebug, local_16);
        this.ApplyDebugMaterialToComponents(SplineComponent, this.GetSecondMeshLayerMaterial(MaterialToUse), local_3, bShaderDebug, this.SecondMeshLayerComponents);
        return;
    }
    void ApplyDebugUVMaterial(const USplineComponent SplineComponent)
    {
        this.ApplyDebugMaterial(SplineComponent, this.GetDebugSplineGuideMaterial(), this.DebugUVTileLength, false);
        return;
    }
    void ApplyDebugShaderMaterial(const USplineComponent SplineComponent)
    {
        this.ApplyDebugMaterial(SplineComponent, this.GetDebugShaderMaterial(), this.DebugShaderDrawLength, true);
        return;
    }
    void BuildDebugSpline(const USplineComponent SplineComponent, const bool bUseTargetLength, const float32 TargetLength)
    {
        float32 local_7;
        if (SplineComponent == nullptr)
        {
            return;
        }
        float32 local_5 = FMath::Max(1.0f, this.DebugUVMinSegmentLength);
        float32 local_4 = FMath::Max(1.0f, this.DebugUVMaxSegmentLength);
        if (local_4 < local_5)
        {
            local_7 = local_4;
            local_4 = local_5;
            local_5 = local_7;
        }
        SplineComponent.ClearSplinePoints(false);
        FVector local_14(FVector::ZeroVector);
        FVector local_20(FVector::ForwardVector);
        SplineComponent.AddSplinePoint(local_14, ESplineCoordinateSpace(0), false);
        int local_25 = FMath::Max(2, this.DebugUVSegmentCount);
        float32 local_6_2 = FMath::Max(TargetLength, (local_5 * local_25));
        int local_26 = 0;
        for (; local_26 < local_25; )
        {
            local_7 = FMath::RandRange(local_5, local_4);
            if (bUseTargetLength)
            {
                int local_23 = local_25 - local_26;
                float32 local_2 = local_5 * (local_23 - 1);
                if (local_23 == 1)
                {
                    local_7 = local_6_2;
                }
                else
                {
                    local_7 = FMath::Min(local_7, FMath::Max(local_5, local_6_2 - local_2));
                }
                local_6_2 = local_6_2 - local_7;
            }
            float32 local_29 = FMath::RandRange(-this.DebugUVMaxTurnAngle, this.DebugUVMaxTurnAngle);
            FVector local_62 = ((FRotator(0.0, local_29, 0.0).RotateVector(local_20).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_7) + FVector(0.0, 0.0, (FMath::RandRange(-this.DebugUVHeightJitter, this.DebugUVHeightJitter))));
            local_14 += local_62;
            SplineComponent.AddSplinePoint(local_14, ESplineCoordinateSpace(0), false);
            ++local_26;
        }
        SplineComponent.UpdateSpline();
        return;
    }
    UFUNCTION()
    void DebugUV()
    {
        if (!(this.CanRunEditorDebug()))
        {
            return;
        }
        USplineComponent local_4 = Cast<USplineComponent>(this.GetComponentByClass(USplineComponent));
        if (local_4 == nullptr)
        {
            return;
        }
        this.BuildDebugSpline(local_4, false, 0.0f);
        this.VFX_GuideSpline();
        this.ApplyDebugUVMaterial(local_4);
        return;
    }
    UFUNCTION()
    void DebugShader()
    {
        if (!(this.CanRunEditorDebug()))
        {
            return;
        }
        USplineComponent local_4 = Cast<USplineComponent>(this.GetComponentByClass(USplineComponent));
        if (local_4 == nullptr)
        {
            return;
        }
        this.BuildDebugSpline(local_4, true, int(this.DebugShaderDrawLength));
        this.VFX_GuideSpline();
        this.ApplyDebugShaderMaterial(local_4);
        return;
    }
}

