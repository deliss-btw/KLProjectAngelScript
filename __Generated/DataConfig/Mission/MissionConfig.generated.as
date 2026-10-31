namespace __FMissionPhaseConfigFunctions
{
UFUNCTION()
bool __FMissionPhaseConfig_GetbFinishMission(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bFinishMission' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.bFinishMission;
    }
    return local_1;
}
UFUNCTION()
FText __FMissionPhaseConfig_GetMissionPhaseTitle(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionPhaseTitle' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.MissionPhaseTitle;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FObjectiveConfig> __FMissionPhaseConfig_GetObjective(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Objective' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.GetObjective();
    }
    return GetObjective();
}
UFUNCTION()
TArray<TDataObjectPtr<FDialogueConfig>> __FMissionPhaseConfig_GetDialogues(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Dialogues' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.GetDialogues();
    }
    return GetDialogues();
}
UFUNCTION()
TArray<FMissionActionConfig> __FMissionPhaseConfig_GetActionList(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    TArray<FMissionActionConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActionList' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.ActionList;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FGuidePresentationConfig> __FMissionPhaseConfig_GetOverrideGuidePresentation(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverrideGuidePresentation' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.GetOverrideGuidePresentation();
    }
    return GetOverrideGuidePresentation();
}
UFUNCTION()
FMissionPhaseConfig CastToFMissionPhaseConfig(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    FMissionPhaseConfig __r;
    return __r;
}
}
namespace __FMissionPhaseTransitionConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FMissionPhaseConfig> __FMissionPhaseTransitionConfig_GetFromPhase(const TDataObjectPtr<FMissionPhaseTransitionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FromPhase' from a null 'FMissionPhaseTransitionConfig' DataObject!");
        }
        FMissionPhaseTransitionConfig local_88;
        return local_88.GetFromPhase();
    }
    return GetFromPhase();
}
UFUNCTION()
TDataObjectPtr<FMissionPhaseConfig> __FMissionPhaseTransitionConfig_GetToPhase(const TDataObjectPtr<FMissionPhaseTransitionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ToPhase' from a null 'FMissionPhaseTransitionConfig' DataObject!");
        }
        FMissionPhaseTransitionConfig local_88;
        return local_88.GetToPhase();
    }
    return GetToPhase();
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FMissionPhaseTransitionConfig_GetCondition(const TDataObjectPtr<FMissionPhaseTransitionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Condition' from a null 'FMissionPhaseTransitionConfig' DataObject!");
        }
        FMissionPhaseTransitionConfig local_88;
        return local_88.GetCondition();
    }
    return GetCondition();
}
UFUNCTION()
FMissionPhaseTransitionConfig CastToFMissionPhaseTransitionConfig(const TDataObjectPtr<FMissionPhaseTransitionConfig> &inout DataObject)
{
    FMissionPhaseTransitionConfig __r;
    return __r;
}
}
namespace __FMissionPresentationRuleConfigFunctions
{
UFUNCTION()
bool __FMissionPresentationRuleConfig_GetbAutoPinHUD(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoPinHUD' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.bAutoPinHUD;
    }
    return local_1;
}
UFUNCTION()
EMissionHideType __FMissionPresentationRuleConfig_GetMissionHideType(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    int local_111 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionHideType' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        local_111 = int(local_110.MissionHideType);
        return EMissionHideType(local_111);
    }
    return EMissionHideType(local_111);
}
UFUNCTION()
bool __FMissionPresentationRuleConfig_GetbAutoStartFirstPhaseGuide(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoStartFirstPhaseGuide' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.bAutoStartFirstPhaseGuide;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FGuidePresentationConfig> __FMissionPresentationRuleConfig_GetGuidePresentation(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GuidePresentation' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.GetGuidePresentation();
    }
    return GetGuidePresentation();
}
UFUNCTION()
bool __FMissionPresentationRuleConfig_GetbAutoShowGuidingPath(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoShowGuidingPath' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.bAutoShowGuidingPath;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FMissionPresentationRuleConfig_GetMissionStartHint(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionStartHint' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.GetMissionStartHint();
    }
    return GetMissionStartHint();
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FMissionPresentationRuleConfig_GetMissionFinishHint(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionFinishHint' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.GetMissionFinishHint();
    }
    return GetMissionFinishHint();
}
UFUNCTION()
TMap<EMissionStatus, TDataObjectPtr<FMessageHintConfig>> __FMissionPresentationRuleConfig_GetMissionPhaseHint(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionPhaseHint' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.GetMissionPhaseHint();
    }
    return GetMissionPhaseHint();
}
UFUNCTION()
FMissionPresentationRuleConfig CastToFMissionPresentationRuleConfig(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    FMissionPresentationRuleConfig __r;
    return __r;
}
}
namespace __FMissionConfigFunctions
{
UFUNCTION()
EMissionType __FMissionConfig_GetMissionType(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    int local_151 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionType' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        local_151 = int(local_150.MissionType);
        return EMissionType(local_151);
    }
    return EMissionType(local_151);
}
UFUNCTION()
TDataObjectPtr<FChapterConfig> __FMissionConfig_GetBelongChapter(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BelongChapter' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.GetBelongChapter();
    }
    return GetBelongChapter();
}
UFUNCTION()
TDataObjectPtr<FMissionPhaseConfig> __FMissionConfig_GetFirstPhase(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FirstPhase' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.GetFirstPhase();
    }
    return GetFirstPhase();
}
UFUNCTION()
FText __FMissionConfig_GetMissionTitle(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionTitle' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.MissionTitle;
    }
    return __r;
}
UFUNCTION()
FText __FMissionConfig_GetMissionDescription(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionDescription' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.MissionDescription;
    }
    return __r;
}
UFUNCTION()
int __FMissionConfig_GetRecommendPlayerLevel(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RecommendPlayerLevel' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig defaultValue;
        return defaultValue.RecommendPlayerLevel;
    }
    return DataObject.Get().RecommendPlayerLevel;
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FMissionConfig_GetStartCondition(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StartCondition' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.GetStartCondition();
    }
    return GetStartCondition();
}
UFUNCTION()
TDataObjectPtr<FRewardConfig> __FMissionConfig_GetMissionRewardConfig(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionRewardConfig' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.GetMissionRewardConfig();
    }
    return GetMissionRewardConfig();
}
UFUNCTION()
TArray<TDataObjectPtr<FMissionConfig>> __FMissionConfig_GetFollowUpTrackingMissions(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FollowUpTrackingMissions' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.GetFollowUpTrackingMissions();
    }
    return GetFollowUpTrackingMissions();
}
UFUNCTION()
TDataObjectPtr<FMissionPresentationRuleConfig> __FMissionConfig_GetPresentationRule(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationRule' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.GetPresentationRule();
    }
    return GetPresentationRule();
}
UFUNCTION()
FMissionConfig CastToFMissionConfig(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    FMissionConfig __r;
    return __r;
}
}
