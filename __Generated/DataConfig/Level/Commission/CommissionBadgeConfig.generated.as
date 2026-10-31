namespace __FCommissionBadgeConfigFunctions
{
UFUNCTION()
ECommissionBadgeConfigType __FCommissionBadgeConfig_GetBadgeType(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BadgeType' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig local_80;
        return local_80.BadgeType;
    }
    return DataObject.Get().BadgeType;
}
UFUNCTION()
FSoftBrush __FCommissionBadgeConfig_GetIconBrush(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconBrush' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig local_80;
        return local_80.IconBrush;
    }
    return DataObject.Get().IconBrush;
}
UFUNCTION()
FText __FCommissionBadgeConfig_GetBadgeName(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BadgeName' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig local_80;
        return local_80.BadgeName;
    }
    return DataObject.Get().BadgeName;
}
UFUNCTION()
FText __FCommissionBadgeConfig_GetBadgeDesc(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BadgeDesc' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig local_80;
        return local_80.BadgeDesc;
    }
    return DataObject.Get().BadgeDesc;
}
UFUNCTION()
FText __FCommissionBadgeConfig_GetBadgeValueDesc(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BadgeValueDesc' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig local_80;
        return local_80.BadgeValueDesc;
    }
    return DataObject.Get().BadgeValueDesc;
}
UFUNCTION()
ECommissionPlayerStatsType __FCommissionBadgeConfig_GetCountState(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CountState' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig local_80;
        return local_80.CountState;
    }
    return DataObject.Get().CountState;
}
UFUNCTION()
ECommissionPlayerStateCountType __FCommissionBadgeConfig_GetCountType(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CountType' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig local_80;
        return local_80.CountType;
    }
    return DataObject.Get().CountType;
}
UFUNCTION()
int __FCommissionBadgeConfig_GetTarget(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Target' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig defaultValue;
        return defaultValue.Target;
    }
    return DataObject.Get().Target;
}
UFUNCTION()
int __FCommissionBadgeConfig_GetScore(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Score' from a null 'FCommissionBadgeConfig' DataObject!");
        }
        FCommissionBadgeConfig defaultValue;
        return defaultValue.Score;
    }
    return DataObject.Get().Score;
}
UFUNCTION()
FCommissionBadgeConfig CastToFCommissionBadgeConfig(const TDataObjectPtr<FCommissionBadgeConfig> &inout DataObject)
{
    FCommissionBadgeConfig __r;
    return __r;
}
}
