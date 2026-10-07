

class UHTNDecorator_CheckTargetOnNavMesh : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bUseTargetEntity;
    UPROPERTY()
    FAISmart_EntityId TargetEntity;
    UPROPERTY()
    FAISmart_Vector TargetLocation;
    UPROPERTY()
    FVector QueryExtent;
    UPROPERTY()
    float32 CacheTTLSeconds;
    UPROPERTY()
    float32 QuantizeCellSize;
    UPROPERTY()
    bool bWriteProjectedLocation;
    UPROPERTY()
    FBlackboardKeySelector ProjectedLocationKey;

    default SetNodeName("Check Target On NavMesh");

    UHTNDecorator_CheckTargetOnNavMesh()
    {
        this.bUseTargetEntity = false;
        this.QueryExtent = FVector(100.0, 100.0, 800.0);
        this.CacheTTLSeconds = 1.0f;
        this.QuantizeCellSize = 50.0f;
        this.bWriteProjectedLocation = false;
        this.ProjectedLocationKey.AddVectorFilter(this, n"ProjectedLocationKey");
        return;
    }
    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FVector local_6(FVector::ZeroVector);
        if (this.bUseTargetEntity)
        {
            if (!(FECSEntity(this.TargetEntity.GetValue(Context.opImplConv())).IsValid()))
            {
                return false;
            }
            GetDefaulted local_24;
            local_6 = local_24.opCall().GetPosition();
        }
        else
        {
            local_6 = this.TargetLocation.GetValue(Context.opImplConv());
        }
        FVector local_36 = local_6;
        bool local_7 = ::FAINavProjectionCacheUtils_AS::ProjectPointToNavigationCached(Context.PawnEntity, local_6, this.QueryExtent, this.CacheTTLSeconds, this.QuantizeCellSize, local_36);
        if ((local_7 && this.bWriteProjectedLocation))
        {
            HTNNode::SetWorldStateValueAsVector(Context, this.ProjectedLocationKey, local_36);
        }
        return local_7;
    }
}

namespace FAINavProjectionCacheUtils_AS
{
FName MakeCacheKey(const FVector &inout Point, const FVector &inout Extent, const float32 QuantizeCellSize)
{
    float32 local_3 = FMath::Max(1.0f, QuantizeCellSize);
    int local_9 = FMath::FloorToInt((Point.X / local_3));
    int local_4 = FMath::FloorToInt((Point.Y / local_3));
    int local_10 = FMath::FloorToInt((Point.Z / local_3));
    int local_11 = FMath::FloorToInt((Extent.X / local_3));
    int local_12 = FMath::FloorToInt((Extent.Y / local_3));
    return FName(FString().Append(local_9).Append("_").Append(local_4).Append("_").Append(local_10).Append("_").Append(local_11).Append("_").Append(local_12).Append("_").Append(FMath::FloorToInt((Extent.Z / local_3))));
}
bool ProjectPointToNavigationCached(const FECSEntity &inout PawnEntity, const FVector &inout Location, const FVector &inout Extent, const float32 CacheTTLSeconds, const float32 QuantizeCellSize, FVector &inout OutProjectedLocation)
{
    int local_20 = 0;
    OutProjectedLocation = Location;
    if (!(PawnEntity.IsValid()))
    {
        return false;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    FFPTime local_4 = FFPTime(local_10.opCall().Time);
    FName local_14 = FAINavProjectionCacheUtils_AS::MakeCacheKey(Location, Extent, QuantizeCellSize);
    if (CacheTTLSeconds > 0.0f && local_20.Cache.Contains(local_14))
    {
        FAINavProjectionCacheEntry local_32;
        if (float32(((local_4 - local_32.LastCheckTime).ToSeconds())) <= CacheTTLSeconds)
        {
            OutProjectedLocation = local_32.ProjectedLocation;
            return local_32.bProjected;
        }
    }
    FAINavProjectionCacheEntry local_32;
    local_32.bProjected = FAIPathFollowUtils::IsPointOnNavigation(PawnEntity, Location, Extent);
    FVector local_48;
    if (local_32.bProjected)
    {
        local_48 = FAIPathFollowUtils::ProjectPointToNavigation(PawnEntity, Location, Extent);
    }
    else
    {
        local_48 = Location;
    }
    local_32.ProjectedLocation = local_48;
    local_32.LastCheckTime = local_4;
    local_20.Cache.Add(local_14, local_32);
    OutProjectedLocation = local_32.ProjectedLocation;
    return local_32.bProjected;
}
}
