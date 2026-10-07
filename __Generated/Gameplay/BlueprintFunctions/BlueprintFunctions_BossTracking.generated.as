

class UASBossTrackingWaitForDiscoveredWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASBossTrackingWaitForDiscovered Action;
    UPROPERTY()
    FECSEntity BossEntity;
    UPROPERTY()
    float32 DiscoverDistance = 3000.0f;
    UPROPERTY()
    float32 CheckInterval = 0.5f;
    UPROPERTY()
    FECSAsyncActionDelegate_Entity OnDiscovered;


    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASBossTrackingWaitForDiscovered;
    }
}

class UASBossTrackingWaitForChangeAreaWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASBossTrackingWaitForChangeArea Action;
    UPROPERTY()
    FECSEntity BossEntity;
    UPROPERTY()
    float32 CheckInterval = 0.5f;
    UPROPERTY()
    FECSAsyncActionDelegate OnChangeAreaStarted;
    UPROPERTY()
    FECSAsyncActionDelegate OnChangeAreaFinished;


    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASBossTrackingWaitForChangeArea;
    }
}

class UASBossTrackingWaitForBossSpawnedWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASBossTrackingWaitForBossSpawned Action;
    UPROPERTY()
    float32 CheckInterval = 0.5f;
    UPROPERTY()
    FECSAsyncActionDelegate OnBossSpawned;


    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASBossTrackingWaitForBossSpawned;
    }
}

namespace FECSAsyncActionFactory_ASBossTrackingWaitForDiscovered
{
UASBossTrackingWaitForDiscoveredWrapper MakeWrapper(const FASBossTrackingWaitForDiscovered &inout ActionData)
{
    return UASBossTrackingWaitForDiscoveredWrapper.GetDefaultObject();
}
UFUNCTION()
UASBossTrackingWaitForDiscoveredWrapper Init_FECSEntity_float_float(const FECSEntity &inout InBossEntity, const float32 InDiscoverDistance, const float32 InCheckInterval)
{
    FASBossTrackingWaitForDiscovered local_18;
    local_18.Init(InBossEntity, InDiscoverDistance, InCheckInterval);
    return FECSAsyncActionFactory_ASBossTrackingWaitForDiscovered::MakeWrapper(local_18);
}
}
namespace FECSAsyncActionFactory_ASBossTrackingWaitForChangeArea
{
UASBossTrackingWaitForChangeAreaWrapper MakeWrapper(const FASBossTrackingWaitForChangeArea &inout ActionData)
{
    return UASBossTrackingWaitForChangeAreaWrapper.GetDefaultObject();
}
UFUNCTION()
UASBossTrackingWaitForChangeAreaWrapper Init_FECSEntity_float(const FECSEntity &inout InBossEntity, const float32 InCheckInterval)
{
    FASBossTrackingWaitForChangeArea local_22;
    local_22.Init(InBossEntity, InCheckInterval);
    return FECSAsyncActionFactory_ASBossTrackingWaitForChangeArea::MakeWrapper(local_22);
}
}
namespace FECSAsyncActionFactory_ASBossTrackingWaitForBossSpawned
{
UASBossTrackingWaitForBossSpawnedWrapper MakeWrapper(const FASBossTrackingWaitForBossSpawned &inout ActionData)
{
    return UASBossTrackingWaitForBossSpawnedWrapper.GetDefaultObject();
}
UFUNCTION()
UASBossTrackingWaitForBossSpawnedWrapper Init_float(const float32 InCheckInterval)
{
    FASBossTrackingWaitForBossSpawned local_12;
    local_12.Init(InCheckInterval);
    return FECSAsyncActionFactory_ASBossTrackingWaitForBossSpawned::MakeWrapper(local_12);
}
}
