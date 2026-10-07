
namespace FThrowUtils
{
FECSEntity GetThrowTargetEntity(const FECSEntity &inout PawnEntity, const EAttachTargetType AttachTargetType, const FNameHandle_EntityBBVarEntity &inout AttachTargetEntityBBVar)
{
    FECSEntity local_4;
    if (int(AttachTargetType) == 0)
    {
        Get local_12;
        const FC_InteractionInfoForESM& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.GetTargetEntity().IsValid())
            {
                local_4 = local_14.GetTargetEntity();
            }
        }
    }
    else
    {
        if (int(AttachTargetType) == 1)
        {
            Get local_18;
            const FC_LockTarget& local_20 = local_18.opCall();
            if (local_20)
            {
                local_4 = local_20.GetTargetEntity();
            }
        }
        else
        {
            if (int(AttachTargetType) == 2)
            {
                FNameHandle_EntityBBVarEntity local_24;
                local_24;
                local_4 = PawnEntity.GetBB_Entity(local_24);
            }
        }
    }
    return local_4;
}
bool TrySendThrowPredictPath(const FECSEntity &inout Entity, const FThrowTargetInfo &inout TargetInfo)
{
    int local_52 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(ECS::GetRuntimeInfo().IsClient) || !(local_6.opCall()))
    {
        return false;
    }
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    ModifyOrAdd local_12;
    FCS_ThrowPredictPathTrace& local_14 = local_12.opCall();
    if (local_14)
    {
        if (local_14.UploadedProjectileKeys.Contains(TargetInfo))
        {
            return true;
        }
        FKLPredictProjectilePathResult local_44;
        if (!(local_14.PathTraceResults.Find(TargetInfo, local_44)) || (local_44.PathData.Num() == 0))
        {
            return false;
        }
        local_52.TargetInfo = TargetInfo;
        local_52.PredictPath = local_44;
        return true;
    }
    return false;
}
bool GetMatchedThrowTargetInfo(const FECSEntity &inout PropEntity, FThrowTargetInfo &inout OutMatchedTargetInfo, const bool bAllowPathKeyFallback = true)
{
    bool local_2;
    local_2 = false;
    bool local_1 = local_2;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FCS_ThrowPredictPathTrace& local_10 = local_8.opCall();
    if (local_10)
    {
        TArray<FThrowTargetInfo> local_14;
        local_10.PathTraceResults.GetKeys(local_14);
        for (auto& local_28 : local_14)
        {
            if ((int(local_28.GetTargetType())) == 1 && (FECSEntityId(local_28.GetPropEntityId()) == PropEntity.GetId()))
            {
                if (!(local_1))
                {
                    OutMatchedTargetInfo = local_28;
                    local_1 = true;
                }
                local_2 = ECS::GetRuntimeInfo().IsClient;
                if (!(local_2))
                {
                    local_2 = false;
                }
                else
                {
                    FECSEntity local_38 = FECSEntity(local_28.GetOwnerId());
                    Has local_42;
                    local_2 = local_42.opCall();
                }
                if (local_2)
                {
                    OutMatchedTargetInfo = local_28;
                    break;
                }
            }
        }
    }
    if (!(local_1) && bAllowPathKeyFallback)
    {
        Get local_46;
        const FC_ThrowPredictPathKey& local_48 = local_46.opCall();
        if (local_48)
        {
            OutMatchedTargetInfo = local_48.GetKeyInfo();
            local_1 = true;
        }
    }
    return local_1;
}
bool GetThrowSocketTransform(const FThrowTargetInfo &inout ThrowTargetInfo, const FName &inout SocketName, const FFPTime &inout WorldTime, FTransform &inout OutSocketTransform, const bool bForPresentation = false)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
FVector GetPropThrowVelocity(const FECSEntity &inout PropEntity, const FFPTime &inout WorldTime, const FThrowTargetInfo &inout InTargetInfo)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVector __r; return __r;
}
FVector GetPropThrowVelocity(const FECSEntity &inout PropEntity, const FFPTime &inout WorldTime)
{
    FThrowTargetInfo local_6;
    FThrowUtils::GetMatchedThrowTargetInfo(PropEntity, local_6, true);
    return FThrowUtils::GetPropThrowVelocity(PropEntity, WorldTime, local_6);
}
FTransform GetPropSpawnTransform(const FThrowTargetInfo &inout ThrowTargetInfo, const FFPTime &inout WorldTime, const FThrowAttachInfo &inout AttachInfo, const bool bForPresentation = false)
{
    int local_118 = 0;
    FTransform local_24 = FTransform(FTransform::Identity);
    FECSEntity local_32 = FECSEntity(ThrowTargetInfo.GetOwnerId());
    FECSEntity local_28 = FECSEntity(ThrowTargetInfo.GetPropEntityId());
    if (!(local_32.IsValid()) || !(local_28.IsValid()))
    {
        return local_24;
    }
    FTransform local_64;
    Get local_68;
    const FC_TransformHistory& local_70 = local_68.opCall();
    FTransform local_116;
    if (local_70)
    {
        FC_Transform local_92;
        local_70.GetInterpoValue(WorldTime, local_92);
        local_64 = local_92.ToFTransform();
    }
    else
    {
        local_116 = local_118.ToFTransform();
        local_64 = local_116;
    }
    FTransform local_24_2 = local_64;
    FTransform local_148;
    bool local_38 = FThrowUtils::GetThrowSocketTransform(FThrowTargetInfo(local_28.GetId(), local_32.GetId()), AttachInfo.GetSocketName(), WorldTime, local_148, bForPresentation);
    if (local_38)
    {
        local_24_2 = local_148;
    }
    FVector local_172 = local_24_2.TransformPosition(AttachInfo.GetAttachLocationOffset());
    FQuat local_196 = local_24_2.TransformRotation(AttachInfo.GetAttachRotationOffset().Quaternion());
    if (AttachInfo.GetbUseDetachOffset())
    {
        FVector local_166 = local_64.GetLocation();
        FRotator local_214 = local_64.GetRotation().Rotator();
        if (!(AttachInfo.GetbUseRootRotationOffset()) && local_38)
        {
            local_166 = local_148.GetLocation();
            local_214 = local_148.GetRotation().Rotator();
        }
        local_172 = (local_166 + local_214.RotateVector(AttachInfo.GetDetachLocationOffset()));
        local_196 = (local_214 + AttachInfo.GetDetachRotationOffset()).GetNormalized().Quaternion();
    }
    FVector local_220 = local_24_2.GetScale3D();
    return local_116;
}
void MatchPredictPath(const FECSEntity &inout Entity)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    FECSWorldPtr local_10 = ECS::GetECSWorld();
    ModifyOrAdd local_14;
    FCS_ThrowPredictPathTrace& local_16 = local_14.opCall();
    if (local_16)
    {
        FKLPredictProjectilePathResult local_46;
        if (local_16.PathTraceResults.Find(local_8.GetKeyInfo(), local_46) && (local_46.PathData.Num() > 0))
        {
            ModifyOrAdd local_54;
            local_54.opCall().PredictPath = local_46;
        }
    }
    return;
}
FVector GetFinalPredictPathPoint(const FKLPredictProjectilePathResult &inout PredictPath)
{
    FVector local_6(PredictPath.HitImpactPoint);
    if (PredictPath.PathData.Num() > 2)
    {
        int local_7 = PredictPath.PathData.Num() - 1;
        FVector local_16(PredictPath.PathData[local_7].Location);
        FVector local_22(PredictPath.PathData[(local_7 - 1)].Location);
        FVector local_28(PredictPath.PathData[(local_7 - 2)].Location);
        FVector local_34 = (local_28 - local_16);
        local_6 = local_6.PointPlaneProject(local_16, (local_22 - local_16).CrossProduct(local_34).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
    }
    return local_6;
}
bool HasThrowMovement(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Has local_6;
    if (local_6.opCall())
    {
        return true;
    }
    return false;
}
}
