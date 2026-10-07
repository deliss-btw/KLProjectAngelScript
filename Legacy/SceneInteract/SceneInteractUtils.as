
namespace FSceneInteractUtils
{
    const FName CustomProfileName = n"Custom";
    const FName WaterBodyCollisionName = n"WaterBodyCollision";
    const FConsoleVariable CVar_Enable_SceneInteract_DebugLog = FConsoleVariable();
    const FConsoleVariable CVar_Enable_WeaponDraggingOnGround_DebugDraw = FConsoleVariable();

UFUNCTION()
FVector GetFootLocation(const FECSEntity &inout PawnEntity)
{
    return FTransformUtils::GetGroundingPosition(PawnEntity, 0);
}
UFUNCTION()
FName GetSurfaceType(bool &inout bTraceSucess, FVector &inout OutBlockPoint, FVector &inout OutHitNormal, FQuat4f &inout OutBlockRotation, const FECSEntity &inout PawnEntity, const FSurfaceContactInfo &inout SurfaceContactInfo)
{
    return FSceneInteractUtils::RaySceneInteract(bTraceSucess, PawnEntity, OutBlockPoint, OutHitNormal, OutBlockRotation, SurfaceContactInfo);
}
UFUNCTION()
FName RaySceneInteract(bool &inout bTraceResult, const FECSEntity &inout PawnEntity, FVector &inout BlockLocation, FVector &inout HitNormal, FQuat4f &inout OutBlockRotation, const FSurfaceContactInfo &inout SurfaceContactInfo)
{
    float32 local_31;
    float32 local_32;
    bool local_37;
    bool local_55;
    AActor local_102;
    const AActor local_104;
    float local_256;
    int local_264 = 0;
    const AActor local_272;
    USceneComponent local_274;
    int local_310 = 0;
    UPrimitiveComponent local_468;
    bTraceResult = false;
    FName local_5 = FGamePhysicsUtils::GetDefaultPhysicalSurfaceName();
    FVector local_12(SurfaceContactInfo.GetTraceDir());
    FName local_14(SurfaceContactInfo.GetRootBoneName());
    FName local_16(SurfaceContactInfo.GetWeaponMeshComponent());
    FAttachRefName local_18 = FAttachRefName(SurfaceContactInfo.GetSocketName());
    FVector local_24(SurfaceContactInfo.GetFxStartLocation());
    FVector local_30(SurfaceContactInfo.GetTraceStartOffset());
    local_31 = SurfaceContactInfo.GetTraceLength();
    EApplyTargetType local_33;
    local_33 = SurfaceContactInfo.GetApplyTargetType();
    EImpactRotationType local_35;
    local_35 = SurfaceContactInfo.GetImpactRotationType();
    local_37 = FSceneInteractUtils::CVar_Enable_SceneInteract_DebugLog.GetBool();
    if (local_12.IsZero())
    {
        local_12 = FVector(0.0, 0.0, -1.0);
    }
    const USceneComponent local_54 = PawnEntity.GetActorVisualSceneRoot();
    if (!((local_54 != nullptr)) && PawnEntity.IsValid())
    {
        XLogIf(local_37, ELog(1), (FString("RaySceneInteract PawnEntity has no visual scene root: ") + PawnEntity.GetEntityName()));
        return local_5;
    }
    FVector local_94;
    if (int(local_33) == 3)
    {
        local_94 = (local_24 + local_30);
    }
    else
    {
        FVector local_88;
        if (PawnEntity.IsValid())
        {
            local_88 = FTransformUtils::GetLocation(PawnEntity, FFPTime(-1));
        }
        else
        {
            local_88 = local_24;
        }
        local_94 = local_88;
    }
    FVector local_100 = local_94;
    local_104 = PawnEntity.GetActor();
    if (PawnEntity.IsValid() && (local_104 == nullptr))
    {
        XLogIf(local_37, ELog(1), (FString("RaySceneInteract PawnEntity has no Actor: ") + PawnEntity.GetEntityName()));
        return local_5;
    }
    USceneComponent local_110 = local_104.GetDefaultAttachComponent();
    if (!((local_110 != nullptr)) && PawnEntity.IsValid())
    {
        XLogIf(local_37, ELog(1), (FString("RaySceneInteract PawnEntity has no default attach component: ") + PawnEntity.GetEntityName()));
        return local_5;
    }
    FName local_3 = FImpactFXUtils::GetImpactRootBoneName(PawnEntity, local_14);
    if (PawnEntity.IsValid())
    {
        ModifyOrAdd local_116;
        local_116.opCall().FinalRootName = local_3;
    }
    FECSEntity local_120 = FECSEntity(ENTITY_NULL);
    if (int(local_33) == 0)
    {
        float local_254;
        FVector local_88;
        EOffsetRefType local_173;
        local_120 = PawnEntity;
        FTransform local_172 = FTransformUtils::GetSocketTransformInActor(PawnEntity, local_3, ERelativeTransformSpace(0));
        local_173 = EOffsetRefType(1);
        if (local_18.ToOffsetRefType(local_173))
        {
            float32 local_175;
            local_175 = 0.0f;
            Get local_180;
            const FC_Collision& local_182 = local_180.opCall();
            if (local_182)
            {
                local_175 = local_182.GetScaledHalfHeight();
            }
            else
            {
                float local_46;
                local_46 = local_110.GetBounds().BoxExtent.Z;
                local_175 = float32(local_46);
            }
            FVector local_202(FVector::ZeroVector);
            int local_74 = int(local_173);
            if (local_74 <= 2)
            {
                float local_46;
                if (local_74 != 0)
                {
                    if (local_74 != 2)
                    {
                    }
                }
                else
                {
                    local_46 = local_175;
                    local_172.AddToTranslation((FVector(FVector::DownVector) * local_46));
                    local_172.AddToTranslation((FVector(FVector::UpVector) * local_175));
                }
            }
        }
        if (local_18.Name.IsNone())
        {
            local_94 = local_172.TransformPosition(local_30);
            local_12 = local_172.GetRotation().RotateVector(local_12);
        }
        else
        {
            FTransform local_144 = FTransformUtils::GetSocketTransformInActor(PawnEntity, local_18.Name, ERelativeTransformSpace(0));
            FQuat local_212 = local_172.GetRotation();
            local_144.SetRotation(FQuat(local_212));
            local_94 = local_144.TransformPosition(local_30);
            local_12 = local_212.RotateVector(local_12);
        }
        local_254 = 0.0;
        if (local_31 > 0.0f)
        {
            local_254 = local_31;
        }
        else
        {
            float local_46;
            if (local_54 != nullptr)
            {
                float local_50 = local_54.GetBounds().BoxExtent.Z;
                local_46 = 1.1;
                local_256 = local_50 * local_46;
            }
            else
            {
                local_256 = 200.0;
            }
            local_254 = local_256;
        }
        local_254 = FMath::Max(local_254, 10.0);
        local_88 = local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        if (local_254 > 0.0)
        {
            local_32 = local_31;
        }
        else
        {
            local_32 = 100.0f;
        }
        local_100 = (local_94 + (local_88 * local_32));
    }
    else
    {
        float local_254;
        float local_46;
        if (int(local_33) == 1)
        {
            if (local_264)
            {
                FECSEntity local_268 = FECSEntity(local_264.GetCurrentWeaponEntity());
                if (local_268.GetActor() != nullptr)
                {
                    local_120 = local_268;
                    FTransform local_236 = FTransformUtils::GetTransformWithScale(local_268, FFPTime(-1));
                    FTransform local_172_2 = FTransformUtils::GetSocketTransformInActor(local_268, local_18.Name, ERelativeTransformSpace(0));
                    FQuat local_244 = local_236.GetRotation();
                    local_172_2.SetRotation(FQuat(local_244));
                    local_94 = local_172_2.TransformPosition(local_30);
                    local_12 = local_244.RotateVector(local_12);
                }
                else
                {
                    if (!(local_16.IsNone()))
                    {
                        local_272 = PawnEntity.GetActor();
                        if (local_272 != nullptr)
                        {
                            UStaticMeshComponent local_276 = Cast<UStaticMeshComponent>(local_272.GetComponentByClass(UStaticMeshComponent));
                            if (local_276 != nullptr && (local_276.GetName() == local_16.ToString()))
                            {
                                local_274 = local_276;
                            }
                            else
                            {
                                USkeletalMeshComponent local_280 = Cast<USkeletalMeshComponent>(local_272.GetComponentByClass(USkeletalMeshComponent));
                                if (local_280 != nullptr && (local_280.GetName() == local_16.ToString()))
                                {
                                    local_274 = local_280;
                                }
                            }
                            if (local_274 != nullptr)
                            {
                                local_120 = PawnEntity;
                                FTransform local_144_2 = FTransformUtils::GetTransformWithScale(PawnEntity, FFPTime(-1));
                                FTransform local_236_2 = local_274.GetSocketTransform(local_18.Name, ERelativeTransformSpace(0));
                                FQuat local_252 = local_144_2.GetRotation();
                                local_236_2.SetRotation(FQuat(local_252));
                                local_94 = local_236_2.TransformPosition(local_30);
                                local_12 = local_252.RotateVector(local_12);
                            }
                            else
                            {
                                local_120 = PawnEntity;
                                FTransform local_172_3 = FTransformUtils::GetTransformWithScale(PawnEntity, FFPTime(-1));
                                FTransform local_236_3 = FTransformUtils::GetSocketTransformInActor(PawnEntity, local_18.Name, ERelativeTransformSpace(0));
                                FQuat local_212_2 = local_172_3.GetRotation();
                                local_236_3.SetRotation(FQuat(local_212_2));
                                local_94 = local_236_3.TransformPosition(local_30);
                                local_12 = local_212_2.RotateVector(local_12);
                            }
                        }
                    }
                    else
                    {
                        local_120 = PawnEntity;
                        FTransform local_144_3 = FTransformUtils::GetTransformWithScale(PawnEntity, FFPTime(-1));
                        FTransform local_236_4 = FTransformUtils::GetSocketTransformInActor(PawnEntity, local_18.Name, ERelativeTransformSpace(0));
                        FQuat local_252_2 = local_144_3.GetRotation();
                        local_236_4.SetRotation(FQuat(local_252_2));
                        local_94 = local_236_4.TransformPosition(local_30);
                        local_12 = local_252_2.RotateVector(local_12);
                    }
                }
            }
            local_254 = 0.0;
            if (local_31 > 0.0f)
            {
                local_254 = local_31;
            }
            else
            {
                if (local_54 != nullptr)
                {
                    local_46 = local_54.GetBounds().GetBox().GetExtent().Z * 1.1;
                }
                else
                {
                    local_46 = 200.0;
                }
                local_254 = local_46;
            }
            local_254 = FMath::Max(local_254, 10.0);
            FVector local_72 = local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            if (local_254 > 0.0)
            {
                local_32 = local_31;
            }
            else
            {
                local_32 = 100.0f;
            }
            FVector local_44_2 = (local_72 * local_32);
            local_100 = (local_94 + local_44_2);
        }
        else
        {
            if (int(local_33) == 3)
            {
                FVector local_72_2 = (local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_31);
                local_100 = (local_94 + local_72_2);
            }
        }
    }
    if (PawnEntity.IsValid())
    {
        ModifyOrAdd local_116;
        local_116.opCall().SocketAttachedEntity = local_120;
    }
    TArray<FECSEntity> local_300;
    if (int(local_33) == 0)
    {
        Has local_304;
        local_55 = local_304.opCall();
        if (local_55)
        {
            if (local_310.GetOwnerEntity().IsValid())
            {
                FECSEntity local_268_2 = FECSEntity(local_310.GetOwnerEntity());
                Get local_318;
                const FC_PlayerController& local_320 = local_318.opCall();
                if (local_320)
                {
                    local_300 = local_320.GetAllPlayerPawnEntities();
                }
            }
        }
    }
    TArray<FHitResult> local_324;
    TArray<AActor> local_328;
    if (local_104 != nullptr)
    {
        local_328.Add(local_104);
    }
    if (local_102 != nullptr)
    {
        local_328.Add(local_102);
    }
    for (auto& local_342 : local_300)
    {
        local_272 = local_342.GetActor();
        if (local_272 != nullptr)
        {
            local_328.Add(local_272);
        }
    }
    FHitResult local_408;
    FCollisionQueryParams local_446;
    local_446.bTraceComplex = true;
    local_446.bReturnPhysicalMaterial = true;
    local_446.AddIgnoredActors(local_328);
    FCollisionResponseParams local_454;
    local_55 = FPhysicsUtils::LineTraceMulti(ECS::GetUEWorld(), EPhysicsTraceTag(32), local_324, local_94, local_100, ECollisionChannel(0), local_446, local_454);
    if (local_55)
    {
        ModifyOrAdd local_116;
        TArray<FHitResult> local_462;
        int local_463 = 0;
        for (; local_463 < local_324.Num(); ++local_463)
        {
            FHitResult& local_466 = local_324[local_463];
            if (!(FSceneInteractUtils::FilterInvalidHitResult(local_466)))
            {
                continue;
            }
            local_462.Add(local_466);
        }
        if (local_462.Num() > 0)
        {
        }
        else
        {
        }
        if (local_408.GetbBlockingHit() && (local_468 != nullptr))
        {
            local_5 = FSceneInteractUtils::GetPhysicalMaterialNameFromHitResult(local_408);
            if (local_37)
            {
                XLogIf(local_37, ELog(1), FString().Append("FSceneInteractUtils::RaySceneInteract, PhysicalSurface is ").Append(local_5));
            }
            if (PawnEntity.IsValid())
            {
                local_116.opCall().PhysicalSurfaceName = local_5;
                UPrimitiveComponent local_470;
                local_116.opCall().HitPrimitiveComponent = local_470;
            }
            BlockLocation = local_408.ImpactPoint;
            HitNormal = local_408.Normal;
            bTraceResult = true;
            if (int(local_35) == 0)
            {
                OutBlockRotation = FTransformUtils::GetSocketRotationInActor(local_120, local_3);
            }
            else
            {
                OutBlockRotation = FQuat4f(HitNormal.ToOrientationQuat());
            }
        }
    }
    else
    {
        XLogIf(local_37, ELog(1), FString().Append("FPhysicsTraceUtils::LineTraceMultiByObject faild!"));
    }
    if (PawnEntity.IsValid())
    {
        ModifyOrAdd local_116;
        local_116.opCall().PhysicalSurfaceName = local_5;
    }
    return local_5;
}
UFUNCTION()
FName GetPhysicalMaterialNameFromHitResult(const FHitResult &inout HitResult)
{
    FName local_2(NAME_None);
    AActor local_4 = HitResult.HitObjectHandle.GetCachedActor();
    if (local_4 != nullptr)
    {
        UWaterBodyComponent local_10 = Cast<UWaterBodyComponent>(local_4.GetComponentByClass(UWaterBodyComponent));
        local_2 = local_10 != nullptr ? FGamePhysicsUtils::GetPhysicalSurfaceName(local_10.GetWaterMaterial().GetPhysicalMaterial()) : FGamePhysicsUtils::GetPhysicalSurfaceName(HitResult.GetPhysMaterial());
    }
    return local_2;
}
UFUNCTION()
bool FilterInvalidHitResult(const FHitResult &inout HitResult)
{
    UPrimitiveComponent local_2;
    bool local_5 = false;
    UPrimitiveComponent local_16;
    if ((local_2 != nullptr && local_5))
    {
        return false;
    }
    if (HitResult.GetActor() != nullptr)
    {
        FName local_22(local_16.GetCollisionProfileName());
        if ((int(local_16.GetCollisionResponseToChannel(ECollisionChannel(4)))) != 2)
        {
            local_5 = false;
        }
        else
        {
            local_5 = true;
            local_5 = local_22.IsEqual(FSceneInteractUtils::CustomProfileName, true, local_5);
        }
        if (local_5)
        {
            return false;
        }
    }
    return true;
}
UFUNCTION()
FName GetLineTraceSurfaceName(bool &inout bOutTraceSucess, FVector &inout OutBlockPoint, FVector &inout OutHitNormal, FQuat4f &inout OutBlockRotation, const FECSEntity &inout EventSender, const FSurfaceContactInfo &inout SurfaceContactInfo)
{
    bool local_4;
    int local_28 = 0;
    FName local_2(n"SurfaceType_Default");
    local_4 = FSceneInteractUtils::CVar_Enable_SceneInteract_DebugLog.GetBool();
    if (!(FECSWorldPtr(EventSender.GetWorld()).IsValid()))
    {
        XLogIf(local_4, ELog(1), "GetLineTraceSurfaceName: unexpected World!");
        return local_2;
    }
    if (EventSender.IsValid())
    {
        if (!(IsValid(EventSender.GetActor())))
        {
            XLogIf(local_4, ELog(1), "GetLineTraceSurfaceName: unexpected SrcActor!");
            return local_2;
        }
    }
    FName local_20 = FGamePhysicsUtils::GetDefaultPhysicalSurfaceName();
    if (EventSender.IsValid())
    {
        local_20 = FSceneInteractUtils::GetSurfaceType(bOutTraceSucess, OutBlockPoint, OutHitNormal, OutBlockRotation, EventSender, SurfaceContactInfo);
        UPrimitiveComponent local_22;
        local_22 = local_28.HitPrimitiveComponent;
    }
    else
    {
        local_20 = FSceneInteractUtils::RaySceneInteract(bOutTraceSucess, EventSender, OutBlockPoint, OutHitNormal, OutBlockRotation, SurfaceContactInfo);
    }
    XLogIf(local_4, ELog(1), (FString("GetLineTraceSurfaceName, Name: ") + local_20));
    return local_20;
}
}
