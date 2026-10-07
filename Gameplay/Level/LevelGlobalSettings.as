

class ULevelGlobalSettings : ULevelGlobalSettingsBase
{
    UPROPERTY()
    float32 TeleportBlackScreenTime = 1.0f;
    UPROPERTY()
    float32 TeleportBlockInputTime = 1.5f;
    UPROPERTY()
    TArray<FName> TeleportHideMeshNames;
    UPROPERTY()
    FName TeleportLoopStateName = n"TeleportArea_Loop";
    UPROPERTY()
    FName TeleportLandStateName = n"TeleportArea";
    UPROPERTY()
    TMap<FName, FName> TeleportKeepStateExitMap;
    UPROPERTY()
    TArray<FBuffConfigRef> TeleportCleanupBuffs;
    UPROPERTY()
    float32 TeleportSettleMaxWaitTime = 1.0f;
    UPROPERTY()
    float32 TeleportCrossDSLandMaxWaitTime = 5.0f;
    UPROPERTY()
    float32 KillZTeleportHeightOffset = 150.0f;
    UPROPERTY()
    float32 KillZoneDeathDelay = 0.3f;
    UPROPERTY()
    FName KillZoneCameraLookAtSocketName = n"pelvis";
    UPROPERTY()
    FVector KillZoneCameraLookAtSocketOffset = FVector::ZeroVector;
    UPROPERTY()
    TDataObjectPtr<FCameraLookAtTargetConfig> KillZoneCameraLookAtConfig;
    UPROPERTY()
    UDataTable LevelGroupLoadingPassConfigTable;

    default TeleportKeepStateExitMap.Add(n"Social_Sit_HotSpring", n"Social_Sit_HotSpring_End");


}

namespace ULevelGlobalSettings
{
FName GetTeleportLoopStateName()
{
    ULevelGlobalSettings local_4 = ULevelGlobalSettings::Get();
    FName local_8;
    if (local_4 != nullptr)
    {
        local_8 = local_4.TeleportLoopStateName;
    }
    else
    {
        local_8 = n"TeleportArea_Loop";
    }
    return local_8;
}
FName GetTeleportLandStateName()
{
    ULevelGlobalSettings local_4 = ULevelGlobalSettings::Get();
    FName local_8;
    if (local_4 != nullptr)
    {
        local_8 = local_4.TeleportLandStateName;
    }
    else
    {
        local_8 = n"TeleportArea";
    }
    return local_8;
}
FName GetTeleportKeepStateExitState(const FName &inout CurrentStateName)
{
    ULevelGlobalSettings local_4 = ULevelGlobalSettings::Get();
    if (local_4 == nullptr)
    {
        return NAME_None;
    }
    FName local_7;
    if (local_4.TeleportKeepStateExitMap.Find(CurrentStateName, local_7))
    {
        return local_7;
    }
    return NAME_None;
}
float32 GetTeleportSettleMaxWaitTime()
{
    float32 local_6;
    ULevelGlobalSettings local_4 = ULevelGlobalSettings::Get();
    if (local_4 != nullptr)
    {
        local_6 = local_4.TeleportSettleMaxWaitTime;
    }
    else
    {
        local_6 = 1.0f;
    }
    return local_6;
}
float32 GetTeleportCrossDSLandMaxWaitTime()
{
    float32 local_6;
    ULevelGlobalSettings local_4 = ULevelGlobalSettings::Get();
    if (local_4 != nullptr)
    {
        local_6 = local_4.TeleportCrossDSLandMaxWaitTime;
    }
    else
    {
        local_6 = 5.0f;
    }
    return local_6;
}
TArray<FBuffConfigRef> GetTeleportCleanupBuffs()
{
    ULevelGlobalSettings local_4 = ULevelGlobalSettings::Get();
    if (local_4 != nullptr)
    {
        return local_4.TeleportCleanupBuffs;
    }
    return TArray<FBuffConfigRef>();
}
}
