namespace __FMissionPhaseConfigFunctions
{
UFUNCTION()
bool __FMissionPhaseConfig_GetbFinishMission(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bFinishMission' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.bFinishMission;
    }
    return DataObject.Get().bFinishMission;
}
UFUNCTION()
FText __FMissionPhaseConfig_GetMissionPhaseTitle(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionPhaseTitle' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.MissionPhaseTitle;
    }
    return DataObject.Get().MissionPhaseTitle;
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
    return DataObject.Get().GetObjective();
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
    return DataObject.Get().GetDialogues();
}
UFUNCTION()
TArray<FMissionActionConfig> __FMissionPhaseConfig_GetActionList(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActionList' from a null 'FMissionPhaseConfig' DataObject!");
        }
        FMissionPhaseConfig local_76;
        return local_76.ActionList;
    }
    return DataObject.Get().ActionList;
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
    return DataObject.Get().GetOverrideGuidePresentation();
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
    return DataObject.Get().GetFromPhase();
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
    return DataObject.Get().GetToPhase();
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
    return DataObject.Get().GetCondition();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoPinHUD' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.bAutoPinHUD;
    }
    return DataObject.Get().bAutoPinHUD;
}
UFUNCTION()
EMissionHideType __FMissionPresentationRuleConfig_GetMissionHideType(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionHideType' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.MissionHideType;
    }
    return DataObject.Get().MissionHideType;
}
UFUNCTION()
bool __FMissionPresentationRuleConfig_GetbAutoStartFirstPhaseGuide(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoStartFirstPhaseGuide' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.bAutoStartFirstPhaseGuide;
    }
    return DataObject.Get().bAutoStartFirstPhaseGuide;
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
    return DataObject.Get().GetGuidePresentation();
}
UFUNCTION()
bool __FMissionPresentationRuleConfig_GetbAutoShowGuidingPath(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoShowGuidingPath' from a null 'FMissionPresentationRuleConfig' DataObject!");
        }
        FMissionPresentationRuleConfig local_110;
        return local_110.bAutoShowGuidingPath;
    }
    return DataObject.Get().bAutoShowGuidingPath;
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
    return DataObject.Get().GetMissionStartHint();
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
    return DataObject.Get().GetMissionFinishHint();
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
    return DataObject.Get().GetMissionPhaseHint();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionType' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.MissionType;
    }
    return DataObject.Get().MissionType;
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
    return DataObject.Get().GetBelongChapter();
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
    return DataObject.Get().GetFirstPhase();
}
UFUNCTION()
FText __FMissionConfig_GetMissionTitle(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionTitle' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.MissionTitle;
    }
    return DataObject.Get().MissionTitle;
}
UFUNCTION()
FText __FMissionConfig_GetMissionDescription(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MissionDescription' from a null 'FMissionConfig' DataObject!");
        }
        FMissionConfig local_150;
        return local_150.MissionDescription;
    }
    return DataObject.Get().MissionDescription;
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
    return DataObject.Get().GetStartCondition();
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
    return DataObject.Get().GetMissionRewardConfig();
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
    return DataObject.Get().GetFollowUpTrackingMissions();
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
    return DataObject.Get().GetPresentationRule();
}
UFUNCTION()
FMissionConfig CastToFMissionConfig(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    FMissionConfig __r;
    return __r;
}
}
