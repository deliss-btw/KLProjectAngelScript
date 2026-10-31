namespace __FMatchConfigFunctions
{
UFUNCTION()
EMatchMode __FMatchConfig_GetMatchMode(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    int local_181 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MatchMode' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        local_181 = int(local_180.MatchMode);
        return EMatchMode(local_181);
    }
    return EMatchMode(local_181);
}
UFUNCTION()
int __FMatchConfig_GetConfirmWaitTime(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmWaitTime' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig defaultValue;
        return defaultValue.ConfirmWaitTime;
    }
    return DataObject.Get().ConfirmWaitTime;
}
UFUNCTION()
int __FMatchConfig_GetTeamMergeTime(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TeamMergeTime' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig defaultValue;
        return defaultValue.TeamMergeTime;
    }
    return DataObject.Get().TeamMergeTime;
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FMatchConfig_GetLevelConfig(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelConfig' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.GetLevelConfig();
    }
    return GetLevelConfig();
}
UFUNCTION()
TArray<TDataObjectPtr<FOpenTimeRange>> __FMatchConfig_GetOpenPeriods(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OpenPeriods' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.GetOpenPeriods();
    }
    return GetOpenPeriods();
}
UFUNCTION()
FText __FMatchConfig_GetOutOfOpenPeriodTips(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OutOfOpenPeriodTips' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.OutOfOpenPeriodTips;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FSystemControlConfig> __FMatchConfig_GetSystemControlCfg(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SystemControlCfg' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.GetSystemControlCfg();
    }
    return GetSystemControlCfg();
}
UFUNCTION()
FText __FMatchConfig_GetModeName(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeName' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeName;
    }
    return __r;
}
UFUNCTION()
FText __FMatchConfig_GetModeDesc(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeDesc' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeDesc;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FMatchConfig_GetModeEntranceImage(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeEntranceImage' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeEntranceImage;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FMatchConfig_GetModeEntranceImageBG(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeEntranceImageBG' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeEntranceImageBG;
    }
    return __r;
}
UFUNCTION()
TArray<FItemParamConfig> __FMatchConfig_GetModeRewards(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    TArray<FItemParamConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeRewards' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeRewards;
    }
    return __r;
}
UFUNCTION()
FGameplayTag __FMatchConfig_GetWidgetTag(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    FGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WidgetTag' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.WidgetTag;
    }
    return __r;
}
UFUNCTION()
FMatchConfig CastToFMatchConfig(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    FMatchConfig __r;
    return __r;
}
}
namespace __FPvxMatchConfigFunctions
{
UFUNCTION()
int __FPvxMatchConfig_GetMinTeamMemberNum(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinTeamMemberNum' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig defaultValue;
        return defaultValue.MinTeamMemberNum;
    }
    return DataObject.Get().MinTeamMemberNum;
}
UFUNCTION()
int __FPvxMatchConfig_GetMaxTeamMemberNum(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxTeamMemberNum' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig defaultValue;
        return defaultValue.MaxTeamMemberNum;
    }
    return DataObject.Get().MaxTeamMemberNum;
}
UFUNCTION()
int __FPvxMatchConfig_GetPlayerNum(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerNum' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig defaultValue;
        return defaultValue.PlayerNum;
    }
    return DataObject.Get().PlayerNum;
}
UFUNCTION()
int __FPvxMatchConfig_GetPlayerCampNum(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerCampNum' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig defaultValue;
        return defaultValue.PlayerCampNum;
    }
    return DataObject.Get().PlayerCampNum;
}
UFUNCTION()
int __FPvxMatchConfig_GetBossNum(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BossNum' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig defaultValue;
        return defaultValue.BossNum;
    }
    return DataObject.Get().BossNum;
}
UFUNCTION()
int __FPvxMatchConfig_GetBossCampNum(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BossCampNum' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig defaultValue;
        return defaultValue.BossCampNum;
    }
    return DataObject.Get().BossCampNum;
}
UFUNCTION()
TArray<FPvxRewardFactor> __FPvxMatchConfig_GetPvxRewardArray(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    TArray<FPvxRewardFactor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PvxRewardArray' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.PvxRewardArray;
    }
    return __r;
}
UFUNCTION()
FText __FPvxMatchConfig_GetPlayerName(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerName' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.PlayerName;
    }
    return __r;
}
UFUNCTION()
FText __FPvxMatchConfig_GetBossName(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BossName' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.BossName;
    }
    return __r;
}
UFUNCTION()
FText __FPvxMatchConfig_GetPlayerDesc(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerDesc' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.PlayerDesc;
    }
    return __r;
}
UFUNCTION()
FText __FPvxMatchConfig_GetBossDesc(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BossDesc' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.BossDesc;
    }
    return __r;
}
UFUNCTION()
FPvxMatchConfig CastToFPvxMatchConfig(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    FPvxMatchConfig __r;
    return __r;
}
}
namespace __FPvpMatchConfigFunctions
{
UFUNCTION()
FPvpMatchConfig CastToFPvpMatchConfig(const TDataObjectPtr<FPvpMatchConfig> &inout DataObject)
{
    FPvpMatchConfig __r;
    return __r;
}
}
