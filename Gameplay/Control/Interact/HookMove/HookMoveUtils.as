
namespace FHookMoveUtils
{
UFUNCTION()
FECSEntity SpawnSuperHookFlyItem(const FECSEntity &inout HookMovePointEntity, const FECSEntity &inout PlayerEntity)
{
    Has local_4;
    bool local_5;
    int local_18 = 0;
    int local_24 = 0;
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
        UClass local_38;
        local_38 = Cast<UClass>(local_24.Prefab.ToSoftObjectPath().TryLoad());
        TSubclassOf<AECSPrefab> local_26 = local_38;
        if (!(local_26.IsValid()))
        {
            XWarning(ELog(46), "SpawnSuperHookFlyItem failed, SuperHookFlyItem PrefabClass is invalid");
            return ENTITY_NULL;
        }
        USplineComponent local_44 = local_18.GetSpline();
        if (local_44 == nullptr)
        {
            XWarning(ELog(46), "SpawnSuperHookFlyItem failed, Spline is invalid");
            return ENTITY_NULL;
        }
        FVector local_58 = local_44.GetLocationAtSplinePoint(0, ESplineCoordinateSpace(1));
        FRotator local_70 = local_44.GetRotationAtSplinePoint(0, ESplineCoordinateSpace(1));
        FECSEntity local_80 = ECS::RequestEntityByPrefabDeferred(local_26, local_58, local_70, EPrefabCollisionAlignment(2), EECSRegType(0), false);
        if (local_80.IsValid())
        {
            FC_SuperHookFlyItem local_86;
            local_86.OwnerPlayerEntity = PlayerEntity;
            local_86.SplinePointEntity = HookMovePointEntity;
            local_86.StartTime = ECS::GetContextTime();
            local_86.DistanceAtSpline = 0.0f;
            local_86.Spline = local_44;
            FECSWorldPtr local_92 = ECS::GetECSWorld();
            Get local_96;
            ModifyOrAdd local_100;
            local_100.opCall().SetSpawnTime(local_96.opCall().Time);
        }
        return local_80;
    }
    return ENTITY_NULL;
}
bool bIsSplinePointOffsetIndexInUse(const FECSEntity &inout HookMovePointEntity, const int OffsetIndex)
{
    Get local_4;
    const FC_RuntimeInteractTargetStatus& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_22 : local_6.GetInteractionPointStatus())
        {
            for (auto& local_36 : local_22.GetInteractingSourceEntities())
            {
                local_36;
                Get local_40;
                const FC_RuntimeSplineMoveState& local_42 = local_40.opCall();
                if (local_42)
                {
                    if (local_42.GetCurrentOffsetIndex() == OffsetIndex)
                    {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
int GetBestOffsetIndexFromSpline(const FECSEntity &inout HookMovePointEntity, const FECSEntity &inout PlayerEntity, FVector &inout OutTargetPos)
{
    Has local_4;
    bool local_5;
    int local_18 = 0;
    int local_36 = 0;
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
        USplineComponent local_22 = local_18.GetSpline();
        if (local_22 == nullptr)
        {
            return -1;
        }
        FVector local_42 = local_36.GetPosition();
        float32 local_43 = 3.4028235e38f;
        int local_45 = -1;
        int local_46 = 0;
        while (local_46 < 0)
        {
            if (FHookMoveUtils::bIsSplinePointOffsetIndexInUse(HookMovePointEntity, local_46))
            {
            }
            else
            {
                FC_SplineMoveConfig local_30;
                FVector local_62 = local_22.GetLocationAtDistanceAlongSpline(local_30.StartDistanceOnSpline, ESplineCoordinateSpace(1));
                FVector local_54 = local_22.GetTangentAtDistanceAlongSpline(local_30.StartDistanceOnSpline, ESplineCoordinateSpace(1));
                ESplineCoordinateSpace local_76;
                FVector local_68 = (local_62 + local_76.Rotation().RotateVector(FVector(local_30.SplineOffsets[local_46])));
                float32 local_44 = float32(local_42.DistSquared(local_68));
                if (local_44 < local_43)
                {
                    local_43 = local_44;
                    local_45 = local_46;
                    OutTargetPos = local_68;
                }
            }
            ++local_46;
        }
        return local_45;
    }
    return -1;
}
}
