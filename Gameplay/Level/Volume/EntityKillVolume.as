

// NOTE: class defaults are not authored in this module: AEntityKillVolume (default scalar field AECSVolumeBase.bServerOnly has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FEntityKillVolumeUnitConfig : FSceneUnitConfigWithJsonData
{
    FSceneUnitConfigWithJsonData _base_FSceneUnitConfigWithJsonData;

    FEntityKillVolumeUnitConfig()
    {
        return;
    }
}

class AEntityKillVolume : AECSRegionVolumeBase
{
    UPROPERTY()
    float32 OverridKillZoneDeathDelay = -1.0f;
    UPROPERTY()
    bool bTeleportPlayerToSafePoint = false;


    UFUNCTION()
    void OnEntityBeginOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        if (!(Context.Runtime.IsServer))
        {
            return;
        }
        Get local_10;
        const FC_MountIsDrivenBy& local_12 = local_10.opCall();
        if (local_12)
        {
            Entity = local_12.GetDriverEntity();
        }
        float32 local_13 = this.OverridKillZoneDeathDelay;
        if (local_13 < 0.0f)
        {
            ULevelGlobalSettings local_18 = ::ULevelGlobalSettings::Get();
            if (local_18 != nullptr)
            {
                local_13 = local_18.KillZoneDeathDelay;
            }
        }
        FCE_EnterKillZone local_26;
        local_26.TriggerDeathDelay = FMath::Max(local_13, 0.0f);
        local_26.bTeleportPlayerToSafePoint = this.bTeleportPlayerToSafePoint;
        return;
    }
}

