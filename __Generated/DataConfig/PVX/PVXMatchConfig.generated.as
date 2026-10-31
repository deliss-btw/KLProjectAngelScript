namespace __FMatchConfigFunctions
{
UFUNCTION()
EMatchMode __FMatchConfig_GetMatchMode(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MatchMode' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.MatchMode;
    }
    return DataObject.Get().MatchMode;
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
    return DataObject.Get().GetLevelConfig();
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
    return DataObject.Get().GetOpenPeriods();
}
UFUNCTION()
FText __FMatchConfig_GetOutOfOpenPeriodTips(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OutOfOpenPeriodTips' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.OutOfOpenPeriodTips;
    }
    return DataObject.Get().OutOfOpenPeriodTips;
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
    return DataObject.Get().GetSystemControlCfg();
}
UFUNCTION()
FText __FMatchConfig_GetModeName(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeName' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeName;
    }
    return DataObject.Get().ModeName;
}
UFUNCTION()
FText __FMatchConfig_GetModeDesc(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeDesc' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeDesc;
    }
    return DataObject.Get().ModeDesc;
}
UFUNCTION()
FSoftBrush __FMatchConfig_GetModeEntranceImage(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeEntranceImage' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeEntranceImage;
    }
    return DataObject.Get().ModeEntranceImage;
}
UFUNCTION()
FSoftBrush __FMatchConfig_GetModeEntranceImageBG(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeEntranceImageBG' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeEntranceImageBG;
    }
    return DataObject.Get().ModeEntranceImageBG;
}
UFUNCTION()
TArray<FItemParamConfig> __FMatchConfig_GetModeRewards(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModeRewards' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.ModeRewards;
    }
    return DataObject.Get().ModeRewards;
}
UFUNCTION()
FGameplayTag __FMatchConfig_GetWidgetTag(const TDataObjectPtr<FMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WidgetTag' from a null 'FMatchConfig' DataObject!");
        }
        FMatchConfig local_180;
        return local_180.WidgetTag;
    }
    return DataObject.Get().WidgetTag;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PvxRewardArray' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.PvxRewardArray;
    }
    return DataObject.Get().PvxRewardArray;
}
UFUNCTION()
FText __FPvxMatchConfig_GetPlayerName(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerName' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.PlayerName;
    }
    return DataObject.Get().PlayerName;
}
UFUNCTION()
FText __FPvxMatchConfig_GetBossName(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BossName' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.BossName;
    }
    return DataObject.Get().BossName;
}
UFUNCTION()
FText __FPvxMatchConfig_GetPlayerDesc(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerDesc' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.PlayerDesc;
    }
    return DataObject.Get().PlayerDesc;
}
UFUNCTION()
FText __FPvxMatchConfig_GetBossDesc(const TDataObjectPtr<FPvxMatchConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BossDesc' from a null 'FPvxMatchConfig' DataObject!");
        }
        FPvxMatchConfig local_208;
        return local_208.BossDesc;
    }
    return DataObject.Get().BossDesc;
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
