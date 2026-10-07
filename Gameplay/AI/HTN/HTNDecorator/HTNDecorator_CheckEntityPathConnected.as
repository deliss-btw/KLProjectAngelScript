

class UHTNDecorator_CheckEntityPathConnected : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bUseSourceEntity = false;
    UPROPERTY()
    FAISmart_EntityId SourceEntity;
    UPROPERTY()
    FAISmart_EntityId TargetEntity;
    UPROPERTY()
    float32 CacheTTLSeconds = 1.0f;
    UPROPERTY()
    float32 QuantizeCellSize = 100.0f;

    default SetNodeName("Check Entity Path Connected");


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        FECSEntity local_18;
        int local_28 = 0;
        int local_30 = 0;
        if (this.bUseSourceEntity)
        {
            local_18 = FECSEntity(this.SourceEntity.GetValue(Context.opImplConv()));
        }
        else
        {
            local_18 = Context.PawnEntity;
        }
        if (!(local_18.IsValid()))
        {
            return false;
        }
        FECSEntity local_14 = FECSEntity(this.TargetEntity.GetValue(Context.opImplConv()));
        if (!(local_14.IsValid()))
        {
            return false;
        }
        if (!(local_28))
        {
            return false;
        }
        if (!(local_30))
        {
            return false;
        }
        return ::FAIPathConnectionCacheUtils_AS::IsPathConnectedCached(FECSEntity(local_18), local_14, local_28.GetPosition(), local_30.GetPosition(), this.CacheTTLSeconds, this.QuantizeCellSize);
    }
}

namespace FAIPathConnectionCacheUtils_AS
{
FName MakeCacheKey(const FECSEntity &inout TargetEntity, const FVector &inout StartLocation, const FVector &inout EndLocation, const float32 QuantizeCellSize)
{
    float32 local_3 = FMath::Max(1.0f, QuantizeCellSize);
    int local_9 = FMath::FloorToInt((StartLocation.X / local_3));
    int local_4 = FMath::FloorToInt((StartLocation.Y / local_3));
    int local_10 = FMath::FloorToInt((StartLocation.Z / local_3));
    int local_11 = FMath::FloorToInt((EndLocation.X / local_3));
    int local_12 = FMath::FloorToInt((EndLocation.Y / local_3));
    int local_19 = TargetEntity.GetIdValue();
    return FName(FString().Append(local_19).Append("_").Append(local_9).Append("_").Append(local_4).Append("_").Append(local_10).Append("_").Append(local_11).Append("_").Append(local_12).Append("_").Append(FMath::FloorToInt((EndLocation.Z / local_3))));
}
bool IsPathConnectedCached(const FECSEntity &inout NavEntity, const FECSEntity &inout TargetEntity, const FVector &inout StartLocation, const FVector &inout EndLocation, const float32 CacheTTLSeconds, const float32 QuantizeCellSize)
{
    int local_20 = 0;
    if (!(NavEntity.IsValid()))
    {
        return false;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    FFPTime local_4 = FFPTime(local_10.opCall().Time);
    FName local_14 = FAIPathConnectionCacheUtils_AS::MakeCacheKey(TargetEntity, StartLocation, EndLocation, QuantizeCellSize);
    if (CacheTTLSeconds > 0.0f && local_20.Cache.Contains(local_14))
    {
        FAIPathConnectionCacheEntry local_26;
        if (float32(((local_4 - local_26.LastCheckTime).ToSeconds())) <= CacheTTLSeconds)
        {
            return local_26.bConnected;
        }
    }
    FAIPathConnectionCacheEntry local_26;
    local_26.bConnected = FAIPathSessionUtils::IsPathConnectedForEntity(NavEntity, StartLocation, EndLocation);
    local_26.LastCheckTime = local_4;
    local_20.Cache.Add(local_14, local_26);
    return local_26.bConnected;
}
}
