namespace __FTeamAssembleConfigFunctions
{
UFUNCTION()
int __FTeamAssembleConfig_GetDSMaxCapacity(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DSMaxCapacity' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.DSMaxCapacity;
    }
    return DataObject.Get().DSMaxCapacity;
}
UFUNCTION()
int __FTeamAssembleConfig_GetDSExtraCapacity(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DSExtraCapacity' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.DSExtraCapacity;
    }
    return DataObject.Get().DSExtraCapacity;
}
UFUNCTION()
int __FTeamAssembleConfig_GetAssembleReservationTTL(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssembleReservationTTL' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.AssembleReservationTTL;
    }
    return DataObject.Get().AssembleReservationTTL;
}
UFUNCTION()
int __FTeamAssembleConfig_GetTravelDSReservationTTL(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TravelDSReservationTTL' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.TravelDSReservationTTL;
    }
    return DataObject.Get().TravelDSReservationTTL;
}
UFUNCTION()
int __FTeamAssembleConfig_GetTeamAssembleCD(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TeamAssembleCD' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.TeamAssembleCD;
    }
    return DataObject.Get().TeamAssembleCD;
}
UFUNCTION()
int __FTeamAssembleConfig_GetScoreA(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScoreA' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.ScoreA;
    }
    return DataObject.Get().ScoreA;
}
UFUNCTION()
int __FTeamAssembleConfig_GetScoreB(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScoreB' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.ScoreB;
    }
    return DataObject.Get().ScoreB;
}
UFUNCTION()
int __FTeamAssembleConfig_GetOverflowThreshold(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverflowThreshold' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.OverflowThreshold;
    }
    return DataObject.Get().OverflowThreshold;
}
UFUNCTION()
int __FTeamAssembleConfig_GetMaxPlayerOpTimeout(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxPlayerOpTimeout' from a null 'FTeamAssembleConfig' DataObject!");
        }
        FTeamAssembleConfig defaultValue;
        return defaultValue.MaxPlayerOpTimeout;
    }
    return DataObject.Get().MaxPlayerOpTimeout;
}
UFUNCTION()
FTeamAssembleConfig CastToFTeamAssembleConfig(const TDataObjectPtr<FTeamAssembleConfig> &inout DataObject)
{
    FTeamAssembleConfig __r;
    return __r;
}
}
