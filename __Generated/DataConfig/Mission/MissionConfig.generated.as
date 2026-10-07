
namespace __FMissionPhaseConfigFunctions
{
UFUNCTION()
bool __FMissionPhaseConfig_GetbFinishMission(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
UFUNCTION()
FText __FMissionPhaseConfig_GetMissionPhaseTitle(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FText __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FObjectiveConfig> __FMissionPhaseConfig_GetObjective(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FObjectiveConfig> __r; return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FDialogueConfig>> __FMissionPhaseConfig_GetDialogues(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TArray<TDataObjectPtr<FDialogueConfig>> __r; return __r;
}
UFUNCTION()
TArray<FMissionActionConfig> __FMissionPhaseConfig_GetActionList(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TArray<FMissionActionConfig> __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FGuidePresentationConfig> __FMissionPhaseConfig_GetOverrideGuidePresentation(const TDataObjectPtr<FMissionPhaseConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FGuidePresentationConfig> __r; return __r;
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FMissionPhaseConfig> __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FMissionPhaseConfig> __FMissionPhaseTransitionConfig_GetToPhase(const TDataObjectPtr<FMissionPhaseTransitionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FMissionPhaseConfig> __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FMissionPhaseTransitionConfig_GetCondition(const TDataObjectPtr<FMissionPhaseTransitionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FServerConditionConfigBase> __r; return __r;
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
UFUNCTION()
EMissionHideType __FMissionPresentationRuleConfig_GetMissionHideType(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    EMissionHideType __r; return __r;
}
UFUNCTION()
bool __FMissionPresentationRuleConfig_GetbAutoStartFirstPhaseGuide(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FGuidePresentationConfig> __FMissionPresentationRuleConfig_GetGuidePresentation(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FGuidePresentationConfig> __r; return __r;
}
UFUNCTION()
bool __FMissionPresentationRuleConfig_GetbAutoShowGuidingPath(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FMissionPresentationRuleConfig_GetMissionStartHint(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FMessageHintConfig> __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FMissionPresentationRuleConfig_GetMissionFinishHint(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FMessageHintConfig> __r; return __r;
}
UFUNCTION()
TMap<EMissionStatus, TDataObjectPtr<FMessageHintConfig>> __FMissionPresentationRuleConfig_GetMissionPhaseHint(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TMap<EMissionStatus, TDataObjectPtr<FMessageHintConfig>> __r; return __r;
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    EMissionType __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FChapterConfig> __FMissionConfig_GetBelongChapter(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FChapterConfig> __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FMissionPhaseConfig> __FMissionConfig_GetFirstPhase(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FMissionPhaseConfig> __r; return __r;
}
UFUNCTION()
FText __FMissionConfig_GetMissionTitle(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FText __r; return __r;
}
UFUNCTION()
FText __FMissionConfig_GetMissionDescription(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FText __r; return __r;
}
UFUNCTION()
int __FMissionConfig_GetRecommendPlayerLevel(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    int __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FMissionConfig_GetStartCondition(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FServerConditionConfigBase> __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FRewardConfig> __FMissionConfig_GetMissionRewardConfig(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FRewardConfig> __r; return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FMissionConfig>> __FMissionConfig_GetFollowUpTrackingMissions(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TArray<TDataObjectPtr<FMissionConfig>> __r; return __r;
}
UFUNCTION()
TDataObjectPtr<FMissionPresentationRuleConfig> __FMissionConfig_GetPresentationRule(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TDataObjectPtr<FMissionPresentationRuleConfig> __r; return __r;
}
UFUNCTION()
FMissionConfig CastToFMissionConfig(const TDataObjectPtr<FMissionConfig> &inout DataObject)
{
    FMissionConfig __r;
    return __r;
}
}
