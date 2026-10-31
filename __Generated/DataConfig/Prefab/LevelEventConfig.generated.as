namespace __FLevelEventInfoConfigBaseFunctions
{
UFUNCTION()
ELevelEventType __FLevelEventInfoConfigBase_GetEventType(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout DataObject)
{
    int local_141 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventType' from a null 'FLevelEventInfoConfigBase' DataObject!");
        }
        FLevelEventInfoConfigBase local_140;
        local_141 = int(local_140.EventType);
        return ELevelEventType(local_141);
    }
    return ELevelEventType(local_141);
}
UFUNCTION()
TDataObjectPtr<FPresentationConfig> __FLevelEventInfoConfigBase_GetPresentationConfig(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationConfig' from a null 'FLevelEventInfoConfigBase' DataObject!");
        }
        FLevelEventInfoConfigBase local_140;
        return local_140.GetPresentationConfig();
    }
    return GetPresentationConfig();
}
UFUNCTION()
FText __FLevelEventInfoConfigBase_GetEventTargetTitle(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventTargetTitle' from a null 'FLevelEventInfoConfigBase' DataObject!");
        }
        FLevelEventInfoConfigBase local_140;
        return local_140.EventTargetTitle;
    }
    return __r;
}
UFUNCTION()
FText __FLevelEventInfoConfigBase_GetEventDescription(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventDescription' from a null 'FLevelEventInfoConfigBase' DataObject!");
        }
        FLevelEventInfoConfigBase local_140;
        return local_140.EventDescription;
    }
    return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FObjectiveConfig>> __FLevelEventInfoConfigBase_GetLevelObjectives(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelObjectives' from a null 'FLevelEventInfoConfigBase' DataObject!");
        }
        FLevelEventInfoConfigBase local_140;
        return local_140.GetLevelObjectives();
    }
    return GetLevelObjectives();
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FLevelEventInfoConfigBase_GetDropRewardView(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropRewardView' from a null 'FLevelEventInfoConfigBase' DataObject!");
        }
        FLevelEventInfoConfigBase local_140;
        return local_140.GetDropRewardView();
    }
    return GetDropRewardView();
}
UFUNCTION()
FLevelEventInfoConfigBase CastToFLevelEventInfoConfigBase(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout DataObject)
{
    FLevelEventInfoConfigBase __r;
    return __r;
}
}
namespace __FEventScoreModifierConfigFunctions
{
UFUNCTION()
FName __FEventScoreModifierConfig_GetName(const TDataObjectPtr<FEventScoreModifierConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FEventScoreModifierConfig' DataObject!");
        }
        FEventScoreModifierConfig local_96;
        return local_96.Name;
    }
    return __r;
}
UFUNCTION()
TMap<TDataObjectPtr<FWeatherConfig>, float32> __FEventScoreModifierConfig_GetWeatherModifier(const TDataObjectPtr<FEventScoreModifierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherModifier' from a null 'FEventScoreModifierConfig' DataObject!");
        }
        FEventScoreModifierConfig local_96;
        return local_96.GetWeatherModifier();
    }
    return GetWeatherModifier();
}
UFUNCTION()
TMap<TDataObjectPtr<FMonsterMainConfig>, float32> __FEventScoreModifierConfig_GetCommissionBossModifier(const TDataObjectPtr<FEventScoreModifierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionBossModifier' from a null 'FEventScoreModifierConfig' DataObject!");
        }
        FEventScoreModifierConfig local_96;
        return local_96.GetCommissionBossModifier();
    }
    return GetCommissionBossModifier();
}
UFUNCTION()
TMap<TDataObjectPtr<FNPCMainConfig>, float32> __FEventScoreModifierConfig_GetCommissionNPCModifier(const TDataObjectPtr<FEventScoreModifierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionNPCModifier' from a null 'FEventScoreModifierConfig' DataObject!");
        }
        FEventScoreModifierConfig local_96;
        return local_96.GetCommissionNPCModifier();
    }
    return GetCommissionNPCModifier();
}
UFUNCTION()
TMap<TDataObjectPtr<FCommissionTimeConfig>, float32> __FEventScoreModifierConfig_GetCommissionTimeModifier(const TDataObjectPtr<FEventScoreModifierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionTimeModifier' from a null 'FEventScoreModifierConfig' DataObject!");
        }
        FEventScoreModifierConfig local_96;
        return local_96.GetCommissionTimeModifier();
    }
    return GetCommissionTimeModifier();
}
UFUNCTION()
FEventScoreModifierConfig CastToFEventScoreModifierConfig(const TDataObjectPtr<FEventScoreModifierConfig> &inout DataObject)
{
    FEventScoreModifierConfig __r;
    return __r;
}
}
namespace __FLevelRandomEventInfoConfigFunctions
{
UFUNCTION()
ELevelRandomEventType __FLevelRandomEventInfoConfig_GetLevelRandomEventType(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{
    int local_189 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelRandomEventType' from a null 'FLevelRandomEventInfoConfig' DataObject!");
        }
        FLevelRandomEventInfoConfig local_188;
        local_189 = int(local_188.LevelRandomEventType);
        return ELevelRandomEventType(local_189);
    }
    return ELevelRandomEventType(local_189);
}
UFUNCTION()
FGameplayTag __FLevelRandomEventInfoConfig_GetEventFamilyTag(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{
    FGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventFamilyTag' from a null 'FLevelRandomEventInfoConfig' DataObject!");
        }
        FLevelRandomEventInfoConfig local_188;
        return local_188.EventFamilyTag;
    }
    return __r;
}
UFUNCTION()
float32 __FLevelRandomEventInfoConfig_GetBaseScore(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseScore' from a null 'FLevelRandomEventInfoConfig' DataObject!");
        }
        FLevelRandomEventInfoConfig defaultValue;
        return defaultValue.BaseScore;
    }
    return DataObject.Get().BaseScore;
}
UFUNCTION()
TDataObjectPtr<FEventScoreModifierConfig> __FLevelRandomEventInfoConfig_GetScoreModifierConfig(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScoreModifierConfig' from a null 'FLevelRandomEventInfoConfig' DataObject!");
        }
        FLevelRandomEventInfoConfig local_188;
        return local_188.GetScoreModifierConfig();
    }
    return GetScoreModifierConfig();
}
UFUNCTION()
FText __FLevelRandomEventInfoConfig_GetEventRewardBuffDesc(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventRewardBuffDesc' from a null 'FLevelRandomEventInfoConfig' DataObject!");
        }
        FLevelRandomEventInfoConfig local_188;
        return local_188.EventRewardBuffDesc;
    }
    return __r;
}
UFUNCTION()
FText __FLevelRandomEventInfoConfig_GetEventRewardBriefDesc(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventRewardBriefDesc' from a null 'FLevelRandomEventInfoConfig' DataObject!");
        }
        FLevelRandomEventInfoConfig local_188;
        return local_188.EventRewardBriefDesc;
    }
    return __r;
}
UFUNCTION()
TSoftObjectPtr<ULevelEventAttribute> __FLevelRandomEventInfoConfig_GetLevelEventAttribute(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{
    TSoftObjectPtr<ULevelEventAttribute> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelEventAttribute' from a null 'FLevelRandomEventInfoConfig' DataObject!");
        }
        FLevelRandomEventInfoConfig local_188;
        return local_188.LevelEventAttribute;
    }
    return __r;
}
UFUNCTION()
FLevelRandomEventInfoConfig CastToFLevelRandomEventInfoConfig(const TDataObjectPtr<FLevelRandomEventInfoConfig> &inout DataObject)
{
    FLevelRandomEventInfoConfig __r;
    return __r;
}
}
namespace __FLevelPublicEventInfoConfigFunctions
{
UFUNCTION()
float32 __FLevelPublicEventInfoConfig_GetPrepareToInteractDuration(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PrepareToInteractDuration' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.PrepareToInteractDuration;
    }
    return DataObject.Get().PrepareToInteractDuration;
}
UFUNCTION()
float32 __FLevelPublicEventInfoConfig_GetInteractableKeepDuration(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InteractableKeepDuration' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.InteractableKeepDuration;
    }
    return DataObject.Get().InteractableKeepDuration;
}
UFUNCTION()
float32 __FLevelPublicEventInfoConfig_GetInProgressDuration(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InProgressDuration' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.InProgressDuration;
    }
    return DataObject.Get().InProgressDuration;
}
UFUNCTION()
float32 __FLevelPublicEventInfoConfig_GetSuccessUnloadDuration(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SuccessUnloadDuration' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.SuccessUnloadDuration;
    }
    return DataObject.Get().SuccessUnloadDuration;
}
UFUNCTION()
float32 __FLevelPublicEventInfoConfig_GetFailedUnloadDuration(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FailedUnloadDuration' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.FailedUnloadDuration;
    }
    return DataObject.Get().FailedUnloadDuration;
}
UFUNCTION()
float32 __FLevelPublicEventInfoConfig_GetMaxDistanceToGetReward(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxDistanceToGetReward' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.MaxDistanceToGetReward;
    }
    return DataObject.Get().MaxDistanceToGetReward;
}
UFUNCTION()
float32 __FLevelPublicEventInfoConfig_GetCoolDownDuration(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CoolDownDuration' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.CoolDownDuration;
    }
    return DataObject.Get().CoolDownDuration;
}
UFUNCTION()
int __FLevelPublicEventInfoConfig_GetPriority(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
FText __FLevelPublicEventInfoConfig_GetEventRewardBuffDesc(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EventRewardBuffDesc' from a null 'FLevelPublicEventInfoConfig' DataObject!");
        }
        FLevelPublicEventInfoConfig local_152;
        return local_152.EventRewardBuffDesc;
    }
    return __r;
}
UFUNCTION()
FLevelPublicEventInfoConfig CastToFLevelPublicEventInfoConfig(const TDataObjectPtr<FLevelPublicEventInfoConfig> &inout DataObject)
{
    FLevelPublicEventInfoConfig __r;
    return __r;
}
}
