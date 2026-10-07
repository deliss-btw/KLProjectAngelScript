
const FName DebugDrawKey_HitPresentation = n"HitPresentation";
const FConsoleCommand CVar_Debug_DrawHitPresentation = FConsoleCommand();

namespace FHitPresentationUtils
{
void GetHitPresentationStepTranforms(const FTransform &inout RootTransform, const FAreaStrikeShape &inout Shape, TArray<FTransform> &inout OutTransforms)
{
    OutTransforms.Empty(0);
    int local_5 = FMath::Clamp(int(Shape.NumDivision), 2, 16);
    float32 local_8_2 = -Shape.Angle / 2.0f;
    float32 local_6_2 = local_8_2 + Shape.AngleOffset;
    int local_11 = 0;
    for (; local_11 <= local_5; )
    {
        FTransform local_100 = (FTransform(FRotator(0.0, (local_6_2 + ((Shape.Angle / local_5) * local_11)), 0.0)) * FTransform(Shape.Rotation, Shape.Position, FVector::OneVector));
        OutTransforms.Add((local_100 * RootTransform));
        ++local_11;
    }
    return;
}
FHitPresentationData GetHitPresentationData(const USceneComponent SrcRoot, const TArray<UMeshComponent> &inout MeshComps, const FHitStrikeData &inout StrikeData, const FVector &inout HitPoint, const bool bPreferHitPoint)
{
    bool local_275;
    UMeshComponent local_322;
    UPhysicalMaterial local_432;
    FHitPresentationData local_24;
    if (!(MeshComps.IsEmpty()))
    {
        bool local_289;
        bool local_208;
        int local_205;
        const FAreaStrikeShape& local_28 = StrikeData.GetStrikeShape();
        FTransform local_52;
        if (StrikeData.GetbUseCustomStrikeTransform())
        {
            local_52 = FTransform(StrikeData.GetCustomStrikeTransformRot(), StrikeData.GetCustomStrikeTransformPos(), FVector::OneVector);
        }
        else
        {
            local_52 = (FTransform(local_28.Rotation, local_28.Position, FVector::OneVector) * SrcRoot.GetWorldTransform());
        }
        FTransform local_148 = local_52;
        FVector local_170 = local_148.GetRotation().GetForwardVector();
        FVector local_154 = local_148.GetRotation().GetUpVector();
        FVector local_188 = (HitPoint - local_148.GetLocation());
        FVector local_176 = (local_154 * local_188.DotProduct(local_154));
        float32 local_197 = 0.0f;
        int local_203 = FMath::Clamp(int(local_28.NumDivision), 2, 16);
        int local_199 = FMath::IntegerDivisionTrunc(local_203, 2);
        local_205 = 0;
        int local_206 = 0;
        float32 local_207 = 0.0f;
        local_208 = false;
        FHitResult local_274;
        if (bPreferHitPoint || (int(local_28.PreferDivisionIndex) < 0))
        {
            float32 local_198;
            FVector local_182 = local_148.InverseTransformPosition(HitPoint);
            local_182.Z = 0.0;
            local_182 = local_182.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            local_198 = float32(local_182.DotProduct(FVector::ForwardVector));
            local_198 = FMath::RadiansToDegrees(FMath::Acos(local_198));
            if (FVector::ForwardVector.CrossProduct(local_182).Z < 0.0)
            {
                float32 local_284 = -local_198;
                local_198 = local_284;
            }
            float32 local_284_2 = local_28.Angle;
            if (FMath::IsNearlyZero(local_284_2, 1e-8f))
            {
                local_170 = local_170.RotateAngleAxis(local_198, local_154);
            }
            else
            {
                local_284_2 = local_28.Angle;
                local_207 = local_284_2 / local_203;
                float32 local_283 = -local_28.Angle;
                local_284_2 = 2.0f;
                local_283 = local_283 / local_284_2;
                float32 local_288 = local_28.AngleOffset;
                local_284_2 = local_283 + local_288;
                if (local_284_2 > 0.0f)
                {
                    local_288 = local_28.Angle;
                    local_198 = FMath::Clamp(local_198, local_284_2 + local_288, local_284_2);
                }
                else
                {
                    local_288 = local_284_2 + local_28.Angle;
                    local_198 = FMath::Clamp(local_198, local_284_2, local_288);
                }
                local_170 = local_170.RotateAngleAxis((local_198 % local_207), local_154);
                local_288 = local_198 / local_207;
                local_206 = local_203 + ((FMath::Abs(local_199 - FMath::FloorToInt(local_288))) * 2);
            }
        }
        else
        {
            local_207 = local_28.Angle / local_203;
            local_205 = int(local_28.PreferDivisionIndex) - local_199;
            local_206 = local_203 + ((FMath::Abs(local_199 - local_205)) * 2);
            local_170 = local_170.RotateAngleAxis((local_207 * local_205), local_154);
        }
        local_289 = true;
        int local_290 = 0;
        while (true)
        {
            int local_291 = local_205;
            FECSDebugDraw::DrawDebugSphere(DebugDrawKey_HitPresentation, HitPoint, 3.0f, 12, FColor::Red, FColor::Red, 5.0f, uint8(0), 0.0f);
            FVector local_182_2(StrikeData.GetStrikeDirection());
            float local_294 = 100000.0;
            int local_295 = 0;
            for (; local_295 <= local_206; ++local_295)
            {
                int local_201 = local_295 % 2;
                int local_296 = local_201 == 0 ? 1 : -1;
                local_291 = local_291 + (local_295 * local_296);
                if (local_291 < -local_199 || (local_291 > local_199))
                {
                    continue;
                }
                float32 local_288_3 = local_291 * local_207;
                FVector local_194 = local_170.RotateAngleAxis(local_288_3, local_154);
                FVector local_282 = local_148.GetLocation();
                FVector local_314 = (local_282 + (local_194 * StrikeData.GetStrikeShape().InnerRadius));
                FVector local_302 = local_148.GetLocation();
                local_288_3 = StrikeData.GetStrikeShape().OuterRadius;
                local_282 = (local_302 + (local_194 * local_288_3));
                FECSDebugDraw::DrawDebugLine(DebugDrawKey_HitPresentation, local_314, local_282, FColor::Green, FColor::Green, 5.0f, uint8(0), 0.0f);
                local_208 = false;
                float32 local_283_3 = -1.0f;
                for (auto local_336 : MeshComps)
                {
                    FHitResult local_402;
                    local_275 = true;
                    bool local_25 = false;
                    if (FPhysicsUtils::LineTraceComponent(local_402, local_336, EPhysicsTraceTag(19), local_314, local_282, local_25, local_275))
                    {
                        local_208 = true;
                        local_283_3 = local_274.Distance;
                        if (local_283_3 == -1.0f || ((local_402.Distance < local_274.Distance)))
                        {
                            local_274 = local_402;
                            local_322 = local_336;
                        }
                    }
                }
                if (!(local_208))
                {
                    continue;
                }
                FECSDebugDraw::DrawDebugSphere(DebugDrawKey_HitPresentation, local_274.ImpactPoint, 3.0f, 12, FColor::Yellow, FColor::Yellow, 5.0f, uint8(0), 0.0f);
                FECSDebugDraw::DrawDebugLine(DebugDrawKey_HitPresentation, local_274.ImpactPoint, (FVector(local_274.ImpactPoint) + (FVector(local_274.ImpactNormal) * 50.0)), FColor::Yellow, FColor::Yellow, 5.0f, uint8(0), 0.0f);
                local_302 = (local_182_2 * 100.0);
                FECSDebugDraw::DrawDebugLine(DebugDrawKey_HitPresentation, local_274.ImpactPoint, (FVector(local_274.ImpactPoint) + local_302), FColor::Cyan, FColor::Cyan, 5.0f, uint8(0), 0.0f);
                local_275 = (FVector(local_274.ImpactPoint) - local_314).IsNearlyZero(9.999999747378752e-5);
                if (local_275)
                {
                    continue;
                }
                float local_196_5 = 0.0;
                if (local_182_2.DotProduct(local_274.ImpactNormal) > local_196_5)
                {
                    FHitResult local_402;
                    local_302 = (local_182_2 * 30.0);
                    FVector local_320 = (FVector(local_274.ImpactPoint) - local_302);
                    if (FPhysicsUtils::LineTraceComponent(local_402, local_322, EPhysicsTraceTag(19), local_320, local_274.ImpactPoint, false, false))
                    {
                        FVector local_410 = local_182_2.RotateAngleAxis(90.0, local_148.GetRotation().GetForwardVector().CrossProduct(local_182_2));
                        local_282 = ((FVector(local_274.ImpactPoint) + local_402.ImpactPoint) * 0.5);
                        local_196_5 = (local_28.OuterRadius - local_28.InnerRadius);
                        local_302 = (local_410 * local_196_5);
                        if ((FPhysicsUtils::LineTraceComponent(local_402, local_322, EPhysicsTraceTag(19), (local_282 + local_302), local_282, false, true)) && !(local_402.GetbStartPenetrating()))
                        {
                            local_274 = local_402;
                        }
                        FECSDebugDraw::DrawDebugSphere(DebugDrawKey_HitPresentation, local_274.ImpactPoint, 3.0f, 12, FColor::Blue, FColor::Blue, 5.0f, uint8(0), 0.0f);
                        FECSDebugDraw::DrawDebugLine(DebugDrawKey_HitPresentation, local_274.ImpactPoint, (FVector(local_274.ImpactPoint) + (FVector(local_274.ImpactNormal) * 50.0)), FColor::Blue, FColor::Blue, 5.0f, uint8(0), 0.0f);
                    }
                }
                float local_286 = (FVector(local_274.ImpactPoint) - HitPoint).Size();
                float local_418 = (FVector(local_274.ImpactPoint) - local_148.GetLocation()).Size();
                if (bPreferHitPoint)
                {
                    local_196_5 = 1.5;
                }
                else
                {
                    local_196_5 = 0.8;
                }
                float local_420 = local_286 * local_196_5;
                float local_422 = local_418 + local_420;
                float local_428 = 1.0;
                local_420 = FMath::IntegerDivisionTrunc(local_295 + 1, 2);
                local_420 = local_420 * 0.1;
                local_420 = local_422 * (local_428 + local_420);
                local_422 = local_420 * (local_290 + 1);
                if (local_422 < local_294)
                {
                    local_294 = local_422;
                    local_24.HitLocation = local_274.ImpactPoint;
                    local_24.HitNormal = local_274.ImpactNormal;
                    local_24.HitBoneName = local_274.BoneName;
                    local_24.HitMeshComp = local_322;
                    local_24.HitFanPlaneNormal = local_154;
                    local_24.PhysicsMaterial = local_322.BodyInstance.PhysMaterialOverride;
                    if (local_24.PhysicsMaterial == nullptr)
                    {
                        local_432 = local_274.GetPhysMaterial();
                        local_24.PhysicsMaterial = local_432;
                    }
                    if (!(bPreferHitPoint) || (local_295 < 3 && ((local_286 < (local_176.Size() * local_295)))))
                    {
                        local_289 = false;
                    }
                }
            }
            if (local_289)
            {
                local_197 = local_197 + 0.5f;
                if (local_197 > 1.0f)
                {
                    break;
                }
                FVector local_416_2 = local_52.GetLocation();
                FVector local_320_2 = (local_176 * local_197);
                local_148.SetLocation((local_416_2 + local_320_2));
                if (!(bPreferHitPoint))
                {
                    ++local_290;
                }
            }
            else
            {
                break;
            }
        }
    }
    return local_24;
}
}
void CMD_EnableDebugDrawHitPresentation(const TArray<FString> &inout Arguments)
{
    if (Arguments.Num() == 0 || (FString(Arguments[0]) == "1") || (Arguments[0].ToLower() == "true"))
    {
        FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_HitPresentation, true);
        return;
    }
    FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_HitPresentation, false);
    return;
}
