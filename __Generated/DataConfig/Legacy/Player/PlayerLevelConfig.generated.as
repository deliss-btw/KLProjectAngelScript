namespace __FPlayerLevelConfigFunctions
{
UFUNCTION()
bool __FPlayerLevelConfig_GetIsBreakthroughLevel(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IsBreakthroughLevel' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig local_100;
        return local_100.IsBreakthroughLevel;
    }
    return local_1;
}
UFUNCTION()
FText __FPlayerLevelConfig_GetBreakthroughLevelName(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BreakthroughLevelName' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig local_100;
        return local_100.BreakthroughLevelName;
    }
    return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FServerConditionConfigBase>> __FPlayerLevelConfig_GetBreakthroughCondition(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BreakthroughCondition' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig local_100;
        return local_100.GetBreakthroughCondition();
    }
    return GetBreakthroughCondition();
}
UFUNCTION()
TDataObjectPtr<FCommissionConfig> __FPlayerLevelConfig_GetBreakthroughLevel(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BreakthroughLevel' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig local_100;
        return local_100.GetBreakthroughLevel();
    }
    return GetBreakthroughLevel();
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FPlayerLevelConfig_GetAchieveCondition(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AchieveCondition' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig local_100;
        return local_100.GetAchieveCondition();
    }
    return GetAchieveCondition();
}
UFUNCTION()
TDataObjectPtr<FRewardConfig> __FPlayerLevelConfig_GetBreakthroughRewardConfig(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BreakthroughRewardConfig' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig local_100;
        return local_100.GetBreakthroughRewardConfig();
    }
    return GetBreakthroughRewardConfig();
}
UFUNCTION()
bool __FPlayerLevelConfig_GetbIsStigmataLevel(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsStigmataLevel' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig local_100;
        return local_100.bIsStigmataLevel;
    }
    return local_1;
}
UFUNCTION()
int __FPlayerLevelConfig_GetFakeStigmataPointNum(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FakeStigmataPointNum' from a null 'FPlayerLevelConfig' DataObject!");
        }
        FPlayerLevelConfig defaultValue;
        return defaultValue.FakeStigmataPointNum;
    }
    return DataObject.Get().FakeStigmataPointNum;
}
UFUNCTION()
FPlayerLevelConfig CastToFPlayerLevelConfig(const TDataObjectPtr<FPlayerLevelConfig> &inout DataObject)
{
    FPlayerLevelConfig __r;
    return __r;
}
}
namespace __FExpOverflowConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FVirtualItemConfig> __FExpOverflowConfig_GetConvertResourceType(const TDataObjectPtr<FExpOverflowConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConvertResourceType' from a null 'FExpOverflowConfig' DataObject!");
        }
        FExpOverflowConfig local_68;
        return local_68.GetConvertResourceType();
    }
    return GetConvertResourceType();
}
UFUNCTION()
TDataObjectPtr<FRefreshRuleConfig> __FExpOverflowConfig_GetHotSpringExpRefreshRule(const TDataObjectPtr<FExpOverflowConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HotSpringExpRefreshRule' from a null 'FExpOverflowConfig' DataObject!");
        }
        FExpOverflowConfig local_68;
        return local_68.GetHotSpringExpRefreshRule();
    }
    return GetHotSpringExpRefreshRule();
}
UFUNCTION()
FExpOverflowConfig CastToFExpOverflowConfig(const TDataObjectPtr<FExpOverflowConfig> &inout DataObject)
{
    FExpOverflowConfig __r;
    return __r;
}
}
namespace __FPlayerLevelScheduleConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FRefreshRuleConfig> __FPlayerLevelScheduleConfig_GetRefreshRule(const TDataObjectPtr<FPlayerLevelScheduleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RefreshRule' from a null 'FPlayerLevelScheduleConfig' DataObject!");
        }
        FPlayerLevelScheduleConfig local_44;
        return local_44.GetRefreshRule();
    }
    return GetRefreshRule();
}
UFUNCTION()
FString __FPlayerLevelScheduleConfig_GetLevelCapUnlockTime(const TDataObjectPtr<FPlayerLevelScheduleConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelCapUnlockTime' from a null 'FPlayerLevelScheduleConfig' DataObject!");
        }
        FPlayerLevelScheduleConfig local_44;
        return local_44.LevelCapUnlockTime;
    }
    return __r;
}
UFUNCTION()
FPlayerLevelScheduleConfig CastToFPlayerLevelScheduleConfig(const TDataObjectPtr<FPlayerLevelScheduleConfig> &inout DataObject)
{
    FPlayerLevelScheduleConfig __r;
    return __r;
}
}
