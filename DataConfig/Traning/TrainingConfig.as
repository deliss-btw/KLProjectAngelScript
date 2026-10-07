

struct FTrainingInfoConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FDataObjectPtr> m_TrainingAvatarConfigs;
    UPROPERTY()
    FDataObjectPtr m_LevelInfoConfig;
    UPROPERTY()
    TSoftClassPtr<AKLLevelScriptActor> LBPClass;
    UPROPERTY()
    FText TrainingName;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockCondition;
    UPROPERTY()
    FDataObjectPtr m_FinishReward;


    const TArray<TDataObjectPtr<FAvatarBuildOverrideConfig>> GetTrainingAvatarConfigs() const property
    {
        const TArray<TDataObjectPtr<FAvatarBuildOverrideConfig>> __r;
        return __r;
    }
    void SetTrainingAvatarConfigs(const TArray<TDataObjectPtr<FAvatarBuildOverrideConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FAvatarBuildOverrideConfig>>> local_2;
        this.m_TrainingAvatarConfigs = local_2;
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetLevelInfoConfig() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    void SetLevelInfoConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FLevelInfoConfig>> local_2;
        this.m_LevelInfoConfig = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FServerConditionConfigBase>> GetUnlockCondition() const property
    {
        const TArray<TDataObjectPtr<FServerConditionConfigBase>> __r;
        return __r;
    }
    void SetUnlockCondition(const TArray<TDataObjectPtr<FServerConditionConfigBase>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FServerConditionConfigBase>>> local_2;
        this.m_UnlockCondition = local_2;
        return;
    }
    const TDataObjectPtr<FRewardConfig> GetFinishReward() const property
    {
        const TDataObjectPtr<FRewardConfig> __r;
        return __r;
    }
    void SetFinishReward(const TDataObjectPtr<FRewardConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRewardConfig>> local_2;
        this.m_FinishReward = local_2;
        return;
    }
}

namespace FTrainingInfoConfig
{
TDataObjectPtr<FTrainingInfoConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FTrainingInfoConfig>();
}
}
