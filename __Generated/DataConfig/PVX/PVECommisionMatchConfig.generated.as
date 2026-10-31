namespace __FPveCommissionMatchConfigFunctions
{
UFUNCTION()
EMatchMode __FPveCommissionMatchConfig_GetMatchMode(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{
    int local_47 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MatchMode' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig local_46;
        local_47 = int(local_46.MatchMode);
        return EMatchMode(local_47);
    }
    return EMatchMode(local_47);
}
UFUNCTION()
int __FPveCommissionMatchConfig_GetConfirmWaitTime(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmWaitTime' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig defaultValue;
        return defaultValue.ConfirmWaitTime;
    }
    return DataObject.Get().ConfirmWaitTime;
}
UFUNCTION()
ECommissionType __FPveCommissionMatchConfig_GetCommissionType(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{
    int local_47 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionType' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig local_46;
        local_47 = int(local_46.CommissionType);
        return ECommissionType(local_47);
    }
    return ECommissionType(local_47);
}
UFUNCTION()
int __FPveCommissionMatchConfig_GetMaxPlayerNum(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxPlayerNum' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig defaultValue;
        return defaultValue.MaxPlayerNum;
    }
    return DataObject.Get().MaxPlayerNum;
}
UFUNCTION()
int __FPveCommissionMatchConfig_GetMinTeamNum(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinTeamNum' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig defaultValue;
        return defaultValue.MinTeamNum;
    }
    return DataObject.Get().MinTeamNum;
}
UFUNCTION()
int __FPveCommissionMatchConfig_GetMatchingTimeoutSec(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MatchingTimeoutSec' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig defaultValue;
        return defaultValue.MatchingTimeoutSec;
    }
    return DataObject.Get().MatchingTimeoutSec;
}
UFUNCTION()
int __FPveCommissionMatchConfig_GetStopMatchingTimeoutSec(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StopMatchingTimeoutSec' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig defaultValue;
        return defaultValue.StopMatchingTimeoutSec;
    }
    return DataObject.Get().StopMatchingTimeoutSec;
}
UFUNCTION()
TDataObjectPtr<FSystemControlConfig> __FPveCommissionMatchConfig_GetSystemControlCfg(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SystemControlCfg' from a null 'FPveCommissionMatchConfig' DataObject!");
        }
        FPveCommissionMatchConfig local_46;
        return local_46.GetSystemControlCfg();
    }
    return GetSystemControlCfg();
}
UFUNCTION()
FPveCommissionMatchConfig CastToFPveCommissionMatchConfig(const TDataObjectPtr<FPveCommissionMatchConfig> &inout DataObject)
{
    FPveCommissionMatchConfig __r;
    return __r;
}
}
