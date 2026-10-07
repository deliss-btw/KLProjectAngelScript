
namespace FEnvSurfaceImpactUtils
{
    const FConsoleVariable CVar_EnvSurfaceImpact_Log = FConsoleVariable();
    const FConsoleVariable CVar_EnvSurfaceImpact_PrintToScreen = FConsoleVariable();
    const FConsoleVariable CVar_EnvSurfaceImpact_DrawTrace = FConsoleVariable();
    const FConsoleVariable CVar_EnvSurfaceImpact_DrawBestTrace = FConsoleVariable();
    const FConsoleVariable CVar_EnvSurfaceImpact_DrawNotTrace = FConsoleVariable();
    const FConsoleVariable CVar_EnvSurfaceImpact_DrawFxDirection = FConsoleVariable();
    const FName EnvSufaceImpactTableRowName = n"Environment";
    const FName DebugDrawKey_EnvPresentation = n"EnvPresentation";

UFUNCTION()
bool EnableLog()
{
    return FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_Log.GetBool();
}
bool EnableDrawTrace()
{
    return FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_DrawTrace.GetBool();
}
UFUNCTION()
bool CheckEnvSurfaceHit(FEnvHitPresentationData &inout Result, const FECSEntity &inout Sender, const FStrikeEventData &inout StrikeEventData)
{
    FAreaStrikeShape local_4;
    const AActor local_6;
    USceneComponent local_14;
    bool local_1 = false;
    local_6 = Sender.GetActor();
    if (local_6 != nullptr)
    {
        local_14 = local_6.GetRootComponent();
    }
    else
    {
    }
    USceneComponent local_10 = local_14;
    if (!((local_10 != nullptr)))
    {
        XWarning(ELog(49), "CheckEnvSurfaceHit, Sender has no SceneComponent.");
        return false;
    }
    FTransformUtils::GetSocketTransformInActor(Sender, n"None", ERelativeTransformSpace(0));
    FTransform local_140 = (FTransform(local_4.Rotation, local_4.Position, FVector::OneVector) * local_10.GetWorldTransform());
    FTransform local_164 = local_140;
    FVector local_186 = local_164.GetRotation().GetForwardVector();
    FVector local_170 = local_164.GetRotation().GetUpVector();
    float32 local_193 = 0.0f;
    int local_198 = FMath::Clamp(int(local_4.NumDivision), 2, 16);
    int local_195 = FMath::IntegerDivisionTrunc(local_198, 2);
    FHitResult local_270;
    float32 local_202_2 = local_4.Angle / local_198;
    int local_200_2 = int(local_4.PreferDivisionIndex) - local_195;
    int local_199_2 = FMath::Abs((local_195 - local_200_2)) * 2;
    int local_201_2 = local_198 + local_199_2;
    local_186 = local_186.RotateAngleAxis((local_202_2 * local_200_2), local_170);
    bool local_275 = true;
    int local_276 = 0;
    while (true)
    {
        int local_277 = local_200_2;
        FVector local_284(StrikeEventData.StrikeDirection);
        float local_286 = 100000.0;
        int local_287 = 0;
        for (; local_287 <= local_201_2; ++local_287)
        {
            int local_41 = local_287 % 2;
            local_277 = local_277 + (local_287 * (local_41 == 0 ? 1 : -1));
            if (local_277 < -local_195 || (local_277 > local_195))
            {
                continue;
            }
            FVector local_192 = local_186.RotateAngleAxis((local_277 * local_202_2), local_170);
            FVector local_296 = (local_192 * local_4.InnerRadius);
            FVector local_314 = (local_164.GetLocation() + local_296);
            local_296 = local_164.GetLocation();
            float local_274 = local_4.OuterRadius;
            FVector local_302 = (local_192 * local_274);
            FVector local_308 = (local_296 + local_302);
            if (FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_DrawTrace.GetBool())
            {
                DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_314, local_308, FColor::Blue, false, 5.0f, uint8(0), 0.0f);
            }
            FName local_325;
            if (FEnvSurfaceImpactUtils::LineTraceMulti_EnvironmentSurface(Sender, local_325, local_270, local_314, local_308))
            {
                if (FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_Log.GetBool())
                {
                    Print(FString().Append("CheckEnvSurfaceHit, PhysicalSurface is ").Append(local_325), 5.0f, FLinearColor::LucBlue);
                }
            }
            else
            {
                continue;
            }
            if (FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_DrawTrace.GetBool())
            {
                DebugDraw::DrawDebugSphere(ECS::GetUEWorld(), local_270.ImpactPoint, 3.0f, 12, FColor::Yellow, false, 5.0f, uint8(0), 0.0f);
                DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_270.ImpactPoint, (FVector(local_270.ImpactPoint) + (FVector(local_270.ImpactNormal) * 50.0)), FColor::Red, false, 5.0f, uint8(0), 0.0f);
                local_296 = (local_284 * 50.0);
                DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_270.ImpactPoint, (FVector(local_270.ImpactPoint) - local_296), FColor::Cyan, false, 5.0f, uint8(0), 0.0f);
            }
            bool local_289 = (FVector(local_270.ImpactPoint) - local_314).IsNearlyZero(9.999999747378752e-5);
            if (local_289)
            {
                continue;
            }
            if (local_284.DotProduct(local_270.ImpactNormal) > 0.0)
            {
                FHitResult local_400;
                local_296 = (local_284 * 30.0);
                if ((FEnvSurfaceImpactUtils::LineTraceMulti_EnvironmentSurface(Sender, local_325, local_400, (FVector(local_270.ImpactPoint) - local_296), local_270.ImpactPoint)))
                {
                    FVector local_406 = local_284.RotateAngleAxis(90.0, local_164.GetRotation().GetForwardVector().CrossProduct(local_284));
                    local_308 = ((FVector(local_270.ImpactPoint) + local_400.ImpactPoint) * 0.5);
                    local_302 = (local_406 * (local_4.OuterRadius - local_4.InnerRadius));
                    if (FEnvSurfaceImpactUtils::LineTraceMulti_EnvironmentSurface(Sender, local_325, local_400, (local_308 + local_302), local_308) && !(local_400.GetbStartPenetrating()))
                    {
                        local_270 = local_400;
                    }
                }
            }
            float local_414 = 0.0;
            float local_334_2 = (FVector(local_270.ImpactPoint) - local_164.GetLocation()).Size();
            if (local_1)
            {
                local_274 = 1.5;
            }
            else
            {
                local_274 = 0.8;
            }
            float local_416 = local_414 * local_274;
            float local_418 = local_334_2 + local_416;
            float local_424 = 1.0;
            local_416 = FMath::IntegerDivisionTrunc(local_287 + 1, 2);
            local_416 = local_416 * 0.1;
            local_416 = local_418 * (local_424 + local_416);
            local_418 = local_416 * (local_276 + 1);
            if (local_418 < local_286)
            {
                local_286 = local_418;
                Result.HitLocation = local_270.ImpactPoint;
                Result.HitNormal = local_270.ImpactNormal;
                Result.HitBoneName = local_270.BoneName;
                Result.HitFanPlaneNormal = local_170;
                Result.PhysicsMaterial = local_270.GetPhysMaterial();
                if (!(local_1))
                {
                    local_275 = false;
                }
            }
        }
        if (local_275)
        {
            local_193 = local_193 + 0.5f;
            if (local_193 > 1.0f)
            {
                break;
            }
            FVector local_302_2 = local_170.opMul_r(1.0);
            FVector local_296_2 = local_140.GetLocation();
            local_164.SetLocation((local_296_2 + (local_302_2 * local_193)));
            if (!(local_1))
            {
                ++local_276;
            }
        }
        else
        {
            break;
        }
    }
    if (FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_DrawBestTrace.GetBool())
    {
        FVector local_412_2 = Result.HitNormal;
        FVector local_296_3 = (local_412_2 * 100.0);
        DebugDraw::DrawDebugLine(ECS::GetUEWorld(), Result.HitLocation, (Result.HitLocation + local_296_3), FColor::Green, false, 5.0f, uint8(0), 0.0f);
    }
    return !(local_275);
}
UFUNCTION()
void ShowEnvSurfaceImpact_Effect(const FCE_EnvSurfaceImpactFXEvent &inout Event, const bool bDebug, const bool bPrintOnScreen)
{
    UDataTable local_10;
    if (bDebug)
    {
        XLog(ELog(0), FString().Append("HandleEnvSurfaceImpact_Effect ").Append(Event.ImpactSurfaceTypeName));
    }
    if (local_10 == nullptr)
    {
        XWarning(ELog(49), "HandleEnvSurfaceImpact_Effect, can not find datatable: SurfaceContactVFXConfig.");
        return;
    }
    FECSEntity local_16 = FECSEntity(Event.Sender);
    if (!(local_16.IsValid()))
    {
        XWarning(ELog(49), "HandleEnvSurfaceImpact_Effect, PawnEntity is not valid.");
        return;
    }
    FName local_18(local_16.GetEntityName());
    ECharacterBodySize local_21 = Event.CharacterBodySize;
    EArealStrikeEnvSurfaceFXStyle_Sparks local_23 = Event.FXStyle_Sparks;
    FName local_26 = Event.ImpactSurfaceTypeName;
    UDataTable::FindDataObject local_54;
    if (local_54.opCall(FEnvSurfaceImpactUtils::EnvSufaceImpactTableRowName))
    {
        const FArealStrikeEnvSurfaceVFXData& local_80 = GetData();
        const FImpactFXData& local_82 = local_80.GetDataRawBySecondType();
        if (local_82.FXActor.IsNull())
        {
            return;
        }
        FFXConfig local_198;
        if (bDebug)
        {
            if (bPrintOnScreen)
            {
                Print(FString().Append("Env Surface Impact ").Append(local_18).Append(": ").Append(local_21).Append(" -> ").Append(local_23).Append(" -> FxActor: ").Append(local_82.FXActor), 5.0f, FLinearColor::LucBlue);
            }
        }
        local_198.SetAsset(FSoftClassPath(local_82.FXActor.ToString()));
        local_198.SetLocationOffset(Event.ImpactPosition);
        local_198.SetRotationOffset(FRotator(Event.ImpactRotation));
        float32 local_199 = local_82.RandomRotationAngle;
        if (local_199 >= 0.0f && !(Event.ImpactOutDir.IsZero()))
        {
            float32 local_215 = FMath::DegreesToRadians(FMath::RandRange(0.0f, local_82.RandomRotationAngle));
            local_199 = float32(FMath::Acos(local_198.GetRotationOffset().GetForwardVector().DotProduct(Event.ImpactOutDir)));
            if (local_215 > local_199)
            {
                local_215 = local_199;
            }
            FVector local_242 = local_198.GetRotationOffset().GetForwardVector().CrossProduct(Event.ImpactOutDir);
            local_198.SetRotationOffset((FQuat(local_242, local_215) * local_198.GetRotationOffset().Quaternion()).Rotator());
        }
        if (!((local_82.LocationOffset == FVector3f::ZeroVector)) || !((local_82.RotationOffset == FRotator3f::ZeroRotator)))
        {
            FTransform local_300 = FTransform(local_198.GetRotationOffset(), local_198.GetLocationOffset(), FVector::OneVector);
            local_198.SetLocationOffset(local_300.TransformPosition(FVector(local_82.LocationOffset)));
            local_198.SetRotationOffset(local_300.TransformRotation(FRotator(local_82.RotationOffset)));
        }
        local_198.SetScale(FVector(local_82.Scale));
        local_198.SetbUseWorldOriginAsBaseTransformSource(true);
        local_198.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_198.SetRotationOffsetSpace(EFXOffsetSpace(2));
        local_198.SetbDetach(true);
        local_198.SetDeterminedSurfaceName(local_26);
        if (FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_DrawFxDirection.GetBool())
        {
            DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_198.GetLocationOffset(), (FVector(local_198.GetLocationOffset()) + (local_198.GetRotationOffset().GetForwardVector() * 100.0)), FColor::Yellow, false, 60.0f, uint8(0), 0.0f);
        }
        if (Event.bDurational)
        {
            ECSFX::PlayFXDurational(local_16, local_198, Event.Time, 1.0f, false);
        }
        else
        {
            ECSFX::PlayFXInstant(local_16, local_198, Event.Time, 1.0f, false, true);
        }
    }
    else
    {
        if (bDebug)
        {
            if (bPrintOnScreen)
            {
                Print(FString().Append("Env Surface Impact ").Append(local_18).Append(": ").Append(local_26).Append(" -> ").Append(local_21).Append(" -> FxActor No Config!"), 5.0f, FLinearColor::LucBlue);
            }
        }
    }
    return;
}
UFUNCTION()
bool GetWeaponHitEnvSurfaceHitInfo(FEnvHitPresentationData &inout Result, const FECSEntity &inout EventSender, const FStrikeEventData &inout StrikeEventData, const FSurfaceContactInfo &inout SurfaceContactInfo)
{
    return FEnvSurfaceImpactUtils::GetWeaponHitEnvSurfaceResult(Result, EventSender, StrikeEventData, SurfaceContactInfo);
}
UFUNCTION()
bool GetWeaponHitEnvSurfaceResult(FEnvHitPresentationData &inout Result, const FECSEntity &inout EventSender, const FStrikeEventData &inout StrikeEventData, const FSurfaceContactInfo &inout SurfaceContactInfo)
{
    bool local_1;
    local_1 = FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_Log.GetBool();
    if (!(EventSender.IsValid()))
    {
        XLogIf(local_1, ELog(1), (FString("GetWeaponHitEnvSurfaceName Entity is not valid! EntityName: ") + EventSender.GetEntityName()));
        return false;
    }
    if (!(FECSWorldPtr(EventSender.GetWorld()).IsValid()))
    {
        XLogIf(local_1, ELog(1), "GetWeaponHitEnvSurfaceName: unexpected World!");
        return false;
    }
    if (!(IsValid(Cast<USkinnedMeshComponent>(EventSender.GetActorVisualSkeletalMesh()))))
    {
        XLogIf(local_1, ELog(1), "GetWeaponHitEnvSurfaceName: unexpected TargetMesh!");
        return false;
    }
    FTransform local_148 = FTransform((FTransform(StrikeEventData.StrikeShape.Rotation, StrikeEventData.StrikeShape.Position, FVector::OneVector) * FTransformUtils::GetSocketTransformInActor(EventSender, n"None", ERelativeTransformSpace(0))));
    FVector local_170 = local_148.GetRotation().GetUpVector();
    FName local_4 = FGamePhysicsUtils::GetDefaultPhysicalSurfaceName();
    FHitResult local_240;
    bool local_241 = false;
    local_4 = FEnvSurfaceImpactUtils::DoTraceEnvSurfaceInfo(local_241, local_240, EventSender, SurfaceContactInfo);
    Result.HitFanPlaneNormal = local_170;
    Result.HitLocation = local_240.ImpactPoint;
    Result.HitNormal = local_240.ImpactNormal;
    Result.SurfaceName = local_4;
    XLogIf(local_1, ELog(1), (FString("GetLineTraceSurfaceName, Name: ") + local_4));
    return local_241;
}
UFUNCTION()
FName DoTraceEnvSurfaceInfo(bool &inout bTraceResult, FHitResult &inout OutHitResult, const FECSEntity &inout PawnEntity, const FSurfaceContactInfo &inout SurfaceContactInfo)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FName __r; return __r;
}
UFUNCTION()
bool LineTraceMulti_EnvironmentSurface(const FECSEntity &inout PawnEntity, FName &inout OutSurfaceName, FHitResult &inout OutHitResult, const FVector &inout TraceStart, const FVector &inout TraceEnd)
{
    const AActor local_8;
    const AActor local_10;
    TArray<AActor> local_4;
    int local_16 = 0;
    UPrimitiveComponent local_148;
    local_8 = PawnEntity.GetActor();
    if (local_16)
    {
        FECSEntity local_22 = local_16.GetCurrentWeaponEntity();
        local_10 = local_22.GetActor();
    }
    if (local_8 != nullptr)
    {
        local_4.Add(local_8);
    }
    if (local_10 != nullptr)
    {
        local_4.Add(local_10);
    }
    FCollisionQueryParams local_62;
    local_62.bTraceComplex = true;
    local_62.bReturnPhysicalMaterial = true;
    local_62.AddIgnoredActors(local_4);
    TArray<FHitResult> local_66;
    FCollisionObjectQueryParams local_68;
    local_68.AddObjectTypesToQuery(ECollisionChannel(0));
    local_68.AddObjectTypesToQuery(ECollisionChannel(7));
    if (FPhysicsUtils::LineTraceMulti(ECS::GetUEWorld(), EPhysicsTraceTag(32), local_66, TraceStart, TraceEnd, local_68, local_62))
    {
        TArray<FHitResult> local_76;
        int local_77 = 0;
        for (; local_77 < local_66.Num(); ++local_77)
        {
            FHitResult& local_80 = local_66[local_77];
            if (!(FSceneInteractUtils::FilterInvalidHitResult(local_80)))
            {
                continue;
            }
            local_76.Add(local_80);
        }
        if (local_76.Num() > 0)
        {
        }
        else
        {
        }
        FHitResult local_146;
        OutHitResult = local_146;
        if (local_146.GetbBlockingHit() && (local_148 != nullptr))
        {
            OutSurfaceName = FSceneInteractUtils::GetPhysicalMaterialNameFromHitResult(local_146);
            return true;
        }
    }
    return false;
}
}
