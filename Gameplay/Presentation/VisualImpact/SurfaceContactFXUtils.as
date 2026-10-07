
namespace FSurfaceContactFXUtils
{
UFUNCTION()
TArray<int> GetSurfaceVfxCodeList(const FECSEntity &inout Caster, const FName &inout SurfaceName)
{
    UDataTable local_8;
    TArray<int> local_4;
    if (local_8 == nullptr)
    {
        XWarning(ELog(49), "GetSurfaceVfxCodeList can not find datatable: SurfaceContactVFXConfig");
        return local_4;
    }
    UDataTable::FindDataObject local_38;
    if (local_38.opCall(n"Default"))
    {
        const FVFXCodeData& local_66 = SurfaceName.GetDataRawByName();
        for (auto& local_80 : local_66.Code)
        {
            local_4.Add(local_80.Code);
        }
    }
    else
    {
        Print(FString().Append("Surface VFX Code :").Append(Caster).Append(", ").Append(SurfaceName).Append(" ->  No Config!"), 5.0f, FLinearColor::LucBlue);
    }
    return local_4;
}
AFXActor DoSurfaceTrace(const FKLSpawnFxActorHelper &inout SpawnFxActorHelper, const FTransform &inout SpawnTransform)
{
    const FFXSurfaceTraceParam& local_2 = SpawnFxActorHelper.Config.GetSurfaceTraceParam();
    if (!(local_2.GetbCheckSurfaceMaterial()) && !(local_2.GetbFinalFxTransformAdjustment()))
    {
        return nullptr;
    }
    FECSEntity local_10 = FECSEntity(SpawnFxActorHelper.OwnerEntity);
    FSurfaceLineTraceConfig local_56;
    local_56.TraceStartBoneOrSocketName = local_2.GetTraceStartBoneOrSocketName();
    local_56.TraceLength = local_2.GetTraceLength();
    local_56.FxStartLocation = SpawnTransform.GetLocation();
    local_56.TraceStartOffset = local_2.GetTraceStartOffset();
    local_56.TraceDir = local_2.GetTraceDir();
    local_56.RootBoneName = local_2.GetRootBoneName();
    local_56.bFinalFxTransformAdjustment = local_2.GetbFinalFxTransformAdjustment();
    local_56.bAdjustFxTransformOnSurfaceDetected = local_2.GetbAdjustFxTransformOnSurfaceDetected();
    local_56.FxAdjustmentSpace = local_2.GetFxAdjustmentSpace();
    local_56.FxAdjustLocationOffset = local_2.GetFxAdjustLocationOffset();
    local_56.FxAdjustRotationOffset = local_2.GetFxAdjustRotationOffset();
    if (local_2.GetRefEntityId() != 0)
    {
        return FSurfaceContactFXUtils::PlaySurfaceVFX(local_2.GetRefEntityId(), local_56, SpawnFxActorHelper, SpawnTransform);
    }
    if (local_10.IsValid())
    {
        return FSurfaceContactFXUtils::PlaySurfaceVFX(local_10.GetIdValue(), local_56, SpawnFxActorHelper, SpawnTransform);
    }
    FECSEntity local_14;
    if (local_14.IsValid())
    {
        return FSurfaceContactFXUtils::PlaySurfaceVFX(local_14.GetIdValue(), local_56, SpawnFxActorHelper, SpawnTransform);
    }
    AFXActor local_6;
    return local_6;
}
bool FXScenePhysicsTest(FName &inout SurfaceName, bool &inout bTraceResult, const FECSEntity &inout OwnerEntity, FVector &inout BlockLocation, FVector &inout HitNormal, FQuat4f &inout OutBlockRotation, const FSurfaceContactInfo &inout SurfaceContactInfo)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
UFUNCTION()
AFXActor PlaySurfaceVFX(const int RefEntityId, const FSurfaceLineTraceConfig &inout TraceConfig, const FKLSpawnFxActorHelper &inout SpawnFxActorHelper, const FTransform &inout SpawnTransform)
{
    if (RefEntityId == 0)
    {
        XWarning(ELog(49), "PlaySurfaceVFX RefEntityId is not valid.");
        return nullptr;
    }
    FECSEntity local_14 = FECSEntity(RefEntityId);
    FSurfaceContactInfo local_44;
    if (!(TraceConfig.FxStartLocation.IsZero()))
    {
        local_44.SetApplyTargetType(EApplyTargetType(EApplyTargetType(3)));
    }
    FImpactFXUtils::FilllSurfaceContactEventData(EApplyTargetType(local_44.GetApplyTargetType()), local_14, local_44, TraceConfig, EImpactEventType(1));
    bool local_47 = false;
    FVector local_54;
    FVector local_60;
    FQuat4f local_64;
    FName local_66;
    if ((int(local_44.GetApplyTargetType())) == 3 && (local_14.GetActor() == nullptr))
    {
        FSurfaceContactFXUtils::FXScenePhysicsTest(local_66, local_47, local_14, local_54, local_60, local_64, local_44);
    }
    else
    {
        local_66 = FSceneInteractUtils::GetLineTraceSurfaceName(local_47, local_54, local_60, local_64, local_14, local_44);
    }
    if (local_47)
    {
        FKLSpawnFxActorHelper local_240 = SpawnFxActorHelper;
        local_240.Config.SetDeterminedSurfaceName(local_66);
        FTransform local_264 = SpawnTransform;
        if (TraceConfig.bFinalFxTransformAdjustment)
        {
            FVector local_282;
            if (TraceConfig.bAdjustFxTransformOnSurfaceDetected)
            {
                local_282 = local_54;
            }
            else
            {
                local_282 = SpawnTransform.GetLocation();
            }
            local_264 = FSurfaceContactFXUtils::AdjustFxFinalTransform(local_282, SpawnTransform.GetRotation(), TraceConfig, local_60, nullptr, true);
        }
        local_240.Config.SetbUseWorldOriginAsBaseTransformSource(true);
        local_240.Config.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_240.Config.SetRotationOffsetSpace(EFXOffsetSpace(2));
        local_240.Config.SetLocationOffset(local_264.GetLocation());
        local_240.Config.SetRotationOffset(local_264.GetRotation().Rotator());
        return local_240.DoSpawn();
    }
    AFXActor local_6;
    return local_6;
}
FTransform AdjustFxFinalTransform(const FVector &inout BaseLocation, const FQuat &inout BaseRotation, const FSurfaceLineTraceConfig &inout TraceConfig, const FVector &inout ImpactNormal, const AActor FxActor, const bool bApplyOwnerScale = true)
{
    FVector local_6 = TraceConfig.FxAdjustLocationOffset;
    FRotator local_12 = TraceConfig.FxAdjustRotationOffset;
    FVector local_18 = BaseLocation;
    FQuat local_28 = FQuat(FQuat::Identity);
    FVector local_34(FVector::OneVector);
    FVector local_56;
    switch (int(TraceConfig.FxAdjustmentSpace))
    {
    case 1:
    {
        FQuat local_28_2 = (FQuat::FindBetweenNormals(FVector::UpVector, ImpactNormal.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)) * local_12.Quaternion());
        local_18 += local_28_2.RotateVector(local_6);
        break;
    }
    case 0:
    {
        FQuat local_28_3 = BaseRotation;
        local_18 += local_6;
        break;
    }
    case 2:
    {
        if (FxActor != nullptr)
        {
            FTransform local_104 = FxActor.GetActorTransform();
            FQuat local_28_4 = (local_104.GetRotation() * local_12.Quaternion());
            local_18 = local_104.TransformPosition(local_6);
            if (bApplyOwnerScale)
            {
                local_56 = local_104.GetScale3D();
            }
            else
            {
                local_56 = FVector::OneVector;
            }
            local_34 = local_56;
        }
        else
        {
            local_18 += local_12.Quaternion().RotateVector(local_6);
        }
        break;
    }
    default:
    {
        local_18 += local_12.Quaternion().RotateVector(local_6);
    }
    }
    return FTransform();
}
}
