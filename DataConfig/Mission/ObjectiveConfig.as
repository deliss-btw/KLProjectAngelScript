
enum EObjectiveStatus
{
    None,
    Activated,
    Finished,
    Failed,
    Aborted,
}

enum EObjectiveType
{
    Single,
    Group,
}

enum EObjectiveFinishType
{
    All,
    Any,
    Sequence,
}

enum EObjectiveProgressTextType
{
    Default,
    Distance,
    Percent,
    Segment,
}

enum EObjectiveProgressUIType
{
    Default,
    ProgressBar,
    ProgressSegmented,
}

enum EObjectiveProgressTextOrderType
{
    Default,
    Reverse,
}


struct FObjectiveConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EObjectiveType ObjectiveType;


}

struct FObjectiveSingleConfig : FObjectiveConfig
{
    FObjectiveConfig _base_FObjectiveConfig;
    UPROPERTY()
    bool bHidden;
    UPROPERTY()
    FText ObjectiveTitle;
    UPROPERTY()
    FText ObjectiveProgressFormat;
    UPROPERTY()
    EObjectiveProgressTextType ProgressTextType;
    UPROPERTY()
    EObjectiveProgressUIType ProgressUIType;
    UPROPERTY()
    EObjectiveProgressTextOrderType ProgressTextOrderType;
    UPROPERTY()
    bool bIgnoreStatusInGroup;
    UPROPERTY()
    FDataObjectPtr m_FinishCondition;
    UPROPERTY()
    FDataObjectPtr m_FailCondition;
    UPROPERTY()
    FGuideConfig GuideConfig;

    default ObjectiveType = EObjectiveType(0);

    FObjectiveSingleConfig()
    {
        super();
        this.bHidden = false;
        this.ProgressTextType = EObjectiveProgressTextType(0);
        this.ProgressUIType = EObjectiveProgressUIType(0);
        this.ProgressTextOrderType = EObjectiveProgressTextOrderType(0);
        this.bIgnoreStatusInGroup = false;
        this.__InitDefaults();
        return;
    }
    const TDataObjectPtr<FConditionConfigBase> GetFinishCondition() const property
    {
        const TDataObjectPtr<FConditionConfigBase> __r;
        return __r;
    }
    void SetFinishCondition(const TDataObjectPtr<FConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FConditionConfigBase>> local_2;
        this.m_FinishCondition = local_2;
        return;
    }
    const TDataObjectPtr<FConditionConfigBase> GetFailCondition() const property
    {
        const TDataObjectPtr<FConditionConfigBase> __r;
        return __r;
    }
    void SetFailCondition(const TDataObjectPtr<FConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FConditionConfigBase>> local_2;
        this.m_FailCondition = local_2;
        return;
    }
}

struct FObjectiveGroupConfig : FObjectiveConfig
{
    FObjectiveConfig _base_FObjectiveConfig;
    UPROPERTY()
    EObjectiveFinishType FinishType;
    UPROPERTY()
    TArray<FDataObjectPtr> m_ChildObjectives;

    default ObjectiveType = EObjectiveType(1);

    FObjectiveGroupConfig()
    {
        super();
        this.FinishType = EObjectiveFinishType(0);
        this.__InitDefaults();
        return;
    }
    const TArray<TDataObjectPtr<FObjectiveSingleConfig>> GetChildObjectives() const property
    {
        const TArray<TDataObjectPtr<FObjectiveSingleConfig>> __r;
        return __r;
    }
    void SetChildObjectives(const TArray<TDataObjectPtr<FObjectiveSingleConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FObjectiveSingleConfig>>> local_2;
        this.m_ChildObjectives = local_2;
        return;
    }
}

