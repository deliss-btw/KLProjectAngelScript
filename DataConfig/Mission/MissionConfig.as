
enum EMissionType
{
    MainStory,
    SideStory,
}

enum EMissionStatus
{
    None,
    Started,
    Finished,
    Failed,
    Aborted,
}

enum EMissionTriggerType
{
    None,
    OnMissionPhaseStart,
    OnMissionPhaseFinish,
    OnMissionPhaseFail,
}

enum EMissionHideType
{
    None,
    HideFirstPhase,
    HideAllPhases,
}


struct FMissionActionConfig
{
    UPROPERTY()
    EMissionTriggerType TriggerType;
    UPROPERTY()
    FInstancedStruct ActionData;


}

struct FMissionPhaseConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    bool bFinishMission;
    UPROPERTY()
    FText MissionPhaseTitle;
    UPROPERTY()
    FDataObjectPtr m_Objective;
    UPROPERTY()
    TArray<FDataObjectPtr> m_Dialogues;
    UPROPERTY()
    TArray<FMissionActionConfig> ActionList;
    UPROPERTY()
    FDataObjectPtr m_OverrideGuidePresentation;


    const TDataObjectPtr<FObjectiveConfig> GetObjective() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    void SetObjective(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FObjectiveConfig>> local_2;
        this.m_Objective = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FDialogueConfig>> GetDialogues() const property
    {
        const TArray<TDataObjectPtr<FDialogueConfig>> __r;
        return __r;
    }
    void SetDialogues(const TArray<TDataObjectPtr<FDialogueConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FDialogueConfig>>> local_2;
        this.m_Dialogues = local_2;
        return;
    }
    const TDataObjectPtr<FGuidePresentationConfig> GetOverrideGuidePresentation() const property
    {
        const TDataObjectPtr<FGuidePresentationConfig> __r;
        return __r;
    }
    void SetOverrideGuidePresentation(const TDataObjectPtr<FGuidePresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FGuidePresentationConfig>> local_2;
        this.m_OverrideGuidePresentation = local_2;
        return;
    }
}

struct FMissionPhaseTransitionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_FromPhase;
    UPROPERTY()
    FDataObjectPtr m_ToPhase;
    UPROPERTY()
    FDataObjectPtr m_Condition;


    const TDataObjectPtr<FMissionPhaseConfig> GetFromPhase() const property
    {
        const TDataObjectPtr<FMissionPhaseConfig> __r;
        return __r;
    }
    void SetFromPhase(const TDataObjectPtr<FMissionPhaseConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMissionPhaseConfig>> local_2;
        this.m_FromPhase = local_2;
        return;
    }
    const TDataObjectPtr<FMissionPhaseConfig> GetToPhase() const property
    {
        const TDataObjectPtr<FMissionPhaseConfig> __r;
        return __r;
    }
    void SetToPhase(const TDataObjectPtr<FMissionPhaseConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMissionPhaseConfig>> local_2;
        this.m_ToPhase = local_2;
        return;
    }
    const TDataObjectPtr<FServerConditionConfigBase> GetCondition() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_Condition = local_2;
        return;
    }
}

struct FMissionPresentationRuleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    bool bAutoPinHUD;
    UPROPERTY()
    EMissionHideType MissionHideType;
    UPROPERTY()
    bool bAutoStartFirstPhaseGuide;
    UPROPERTY()
    FDataObjectPtr m_GuidePresentation;
    UPROPERTY()
    bool bAutoShowGuidingPath;
    UPROPERTY()
    FDataObjectPtr m_MissionStartHint;
    UPROPERTY()
    FDataObjectPtr m_MissionFinishHint;
    UPROPERTY()
    TMap<EMissionStatus, FDataObjectPtr> m_MissionPhaseHint;


    const TDataObjectPtr<FGuidePresentationConfig> GetGuidePresentation() const property
    {
        const TDataObjectPtr<FGuidePresentationConfig> __r;
        return __r;
    }
    void SetGuidePresentation(const TDataObjectPtr<FGuidePresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FGuidePresentationConfig>> local_2;
        this.m_GuidePresentation = local_2;
        return;
    }
    const TDataObjectPtr<FMessageHintConfig> GetMissionStartHint() const property
    {
        const TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    void SetMissionStartHint(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMessageHintConfig>> local_2;
        this.m_MissionStartHint = local_2;
        return;
    }
    const TDataObjectPtr<FMessageHintConfig> GetMissionFinishHint() const property
    {
        const TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    void SetMissionFinishHint(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMessageHintConfig>> local_2;
        this.m_MissionFinishHint = local_2;
        return;
    }
    const TMap<EMissionStatus, TDataObjectPtr<FMessageHintConfig>> GetMissionPhaseHint() const property
    {
        const TMap<EMissionStatus, TDataObjectPtr<FMessageHintConfig>> __r;
        return __r;
    }
    void SetMissionPhaseHint(const TMap<EMissionStatus, TDataObjectPtr<FMessageHintConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<EMissionStatus, FDataObjectPtr>, TMap<EMissionStatus, TDataObjectPtr<FMessageHintConfig>>> local_2;
        this.m_MissionPhaseHint = local_2;
        return;
    }
}

struct FMissionConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EMissionType MissionType;
    UPROPERTY()
    FDataObjectPtr m_BelongChapter;
    UPROPERTY()
    FDataObjectPtr m_FirstPhase;
    UPROPERTY()
    FText MissionTitle;
    UPROPERTY()
    FText MissionDescription;
    UPROPERTY()
    int RecommendPlayerLevel;
    UPROPERTY()
    FDataObjectPtr m_StartCondition;
    UPROPERTY()
    FDataObjectPtr m_MissionRewardConfig;
    UPROPERTY()
    TArray<FDataObjectPtr> m_FollowUpTrackingMissions;
    UPROPERTY()
    FDataObjectPtr m_PresentationRule;


    const TDataObjectPtr<FChapterConfig> GetBelongChapter() const property
    {
        const TDataObjectPtr<FChapterConfig> __r;
        return __r;
    }
    void SetBelongChapter(const TDataObjectPtr<FChapterConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChapterConfig>> local_2;
        this.m_BelongChapter = local_2;
        return;
    }
    const TDataObjectPtr<FMissionPhaseConfig> GetFirstPhase() const property
    {
        const TDataObjectPtr<FMissionPhaseConfig> __r;
        return __r;
    }
    void SetFirstPhase(const TDataObjectPtr<FMissionPhaseConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMissionPhaseConfig>> local_2;
        this.m_FirstPhase = local_2;
        return;
    }
    const TDataObjectPtr<FServerConditionConfigBase> GetStartCondition() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetStartCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_StartCondition = local_2;
        return;
    }
    const TDataObjectPtr<FRewardConfig> GetMissionRewardConfig() const property
    {
        const TDataObjectPtr<FRewardConfig> __r;
        return __r;
    }
    void SetMissionRewardConfig(const TDataObjectPtr<FRewardConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRewardConfig>> local_2;
        this.m_MissionRewardConfig = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FMissionConfig>> GetFollowUpTrackingMissions() const property
    {
        const TArray<TDataObjectPtr<FMissionConfig>> __r;
        return __r;
    }
    void SetFollowUpTrackingMissions(const TArray<TDataObjectPtr<FMissionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FMissionConfig>>> local_2;
        this.m_FollowUpTrackingMissions = local_2;
        return;
    }
    const TDataObjectPtr<FMissionPresentationRuleConfig> GetPresentationRule() const property
    {
        const TDataObjectPtr<FMissionPresentationRuleConfig> __r;
        return __r;
    }
    void SetPresentationRule(const TDataObjectPtr<FMissionPresentationRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMissionPresentationRuleConfig>> local_2;
        this.m_PresentationRule = local_2;
        return;
    }
}

