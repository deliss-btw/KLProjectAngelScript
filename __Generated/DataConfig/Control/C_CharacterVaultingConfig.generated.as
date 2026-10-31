namespace __FCharacterVaultProbeConfigFunctions
{
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMinVaultHeight(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinVaultHeight' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MinVaultHeight;
    }
    return DataObject.Get().MinVaultHeight;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxUpstairsHeight(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxUpstairsHeight' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxUpstairsHeight;
    }
    return DataObject.Get().MaxUpstairsHeight;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxVaultHeight(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxVaultHeight' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxVaultHeight;
    }
    return DataObject.Get().MaxVaultHeight;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxDropAfterVault(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxDropAfterVault' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxDropAfterVault;
    }
    return DataObject.Get().MaxDropAfterVault;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetGapHeightForVault(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GapHeightForVault' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.GapHeightForVault;
    }
    return DataObject.Get().GapHeightForVault;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetGapWidthForVault(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GapWidthForVault' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.GapWidthForVault;
    }
    return DataObject.Get().GapWidthForVault;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxVaultWidth(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxVaultWidth' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxVaultWidth;
    }
    return DataObject.Get().MaxVaultWidth;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMinStandableWidth(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinStandableWidth' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MinStandableWidth;
    }
    return DataObject.Get().MinStandableWidth;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetForwardCheckDistance(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForwardCheckDistance' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.ForwardCheckDistance;
    }
    return DataObject.Get().ForwardCheckDistance;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetForwardRaycastInterval(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForwardRaycastInterval' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.ForwardRaycastInterval;
    }
    return DataObject.Get().ForwardRaycastInterval;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetDownwardRaycastInterval(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DownwardRaycastInterval' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.DownwardRaycastInterval;
    }
    return DataObject.Get().DownwardRaycastInterval;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetProbeInterval(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProbeInterval' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.ProbeInterval;
    }
    return DataObject.Get().ProbeInterval;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMinWallRunStartHeight(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinWallRunStartHeight' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MinWallRunStartHeight;
    }
    return DataObject.Get().MinWallRunStartHeight;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxWallRunStartHeight(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxWallRunStartHeight' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxWallRunStartHeight;
    }
    return DataObject.Get().MaxWallRunStartHeight;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetWallRunAttemptHeight(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WallRunAttemptHeight' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.WallRunAttemptHeight;
    }
    return DataObject.Get().WallRunAttemptHeight;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxAngleBetweenInputAndFacingDir(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxAngleBetweenInputAndFacingDir' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxAngleBetweenInputAndFacingDir;
    }
    return DataObject.Get().MaxAngleBetweenInputAndFacingDir;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxAngleToWallNormalForVault(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxAngleToWallNormalForVault' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxAngleToWallNormalForVault;
    }
    return DataObject.Get().MaxAngleToWallNormalForVault;
}
UFUNCTION()
FFPTime __FCharacterVaultProbeConfig_GetKeepSteerTimeForVault(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KeepSteerTimeForVault' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig local_56;
        return local_56.KeepSteerTimeForVault;
    }
    return DataObject.Get().KeepSteerTimeForVault;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetMaxAngleToWallNormalForWallRun(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxAngleToWallNormalForWallRun' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.MaxAngleToWallNormalForWallRun;
    }
    return DataObject.Get().MaxAngleToWallNormalForWallRun;
}
UFUNCTION()
FFPTime __FCharacterVaultProbeConfig_GetKeepSteerTimeForWallRun(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KeepSteerTimeForWallRun' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig local_56;
        return local_56.KeepSteerTimeForWallRun;
    }
    return DataObject.Get().KeepSteerTimeForWallRun;
}
UFUNCTION()
TArray<int> __FCharacterVaultProbeConfig_GetUpstairsLevelSeparationHeights(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UpstairsLevelSeparationHeights' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig local_56;
        return local_56.UpstairsLevelSeparationHeights;
    }
    return DataObject.Get().UpstairsLevelSeparationHeights;
}
UFUNCTION()
TArray<FCharacterVaultProbePerHeightLevelConfig> __FCharacterVaultProbeConfig_GetUpstairsPerHeightLevelConfigs(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UpstairsPerHeightLevelConfigs' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig local_56;
        return local_56.UpstairsPerHeightLevelConfigs;
    }
    return DataObject.Get().UpstairsPerHeightLevelConfigs;
}
UFUNCTION()
TArray<int> __FCharacterVaultProbeConfig_GetVaultLevelSeparationHeights(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VaultLevelSeparationHeights' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig local_56;
        return local_56.VaultLevelSeparationHeights;
    }
    return DataObject.Get().VaultLevelSeparationHeights;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetLeapOffForwardCheckDistance(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LeapOffForwardCheckDistance' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.LeapOffForwardCheckDistance;
    }
    return DataObject.Get().LeapOffForwardCheckDistance;
}
UFUNCTION()
float32 __FCharacterVaultProbeConfig_GetLeapOffStartHeight(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LeapOffStartHeight' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig defaultValue;
        return defaultValue.LeapOffStartHeight;
    }
    return DataObject.Get().LeapOffStartHeight;
}
UFUNCTION()
TArray<int> __FCharacterVaultProbeConfig_GetLeapOffLevelSeparationHeights(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LeapOffLevelSeparationHeights' from a null 'FCharacterVaultProbeConfig' DataObject!");
        }
        FCharacterVaultProbeConfig local_56;
        return local_56.LeapOffLevelSeparationHeights;
    }
    return DataObject.Get().LeapOffLevelSeparationHeights;
}
UFUNCTION()
FCharacterVaultProbeConfig CastToFCharacterVaultProbeConfig(const TDataObjectPtr<FCharacterVaultProbeConfig> &inout DataObject)
{
    FCharacterVaultProbeConfig __r;
    return __r;
}
}
