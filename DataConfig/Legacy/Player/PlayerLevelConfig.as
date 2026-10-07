

struct FPlayerLevelConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    uint Level;
    UPROPERTY()
    uint UpgradeExp;
    UPROPERTY()
    bool IsBreakthroughLevel = false;
    UPROPERTY()
    FText BreakthroughLevelName;
    UPROPERTY()
    TArray<FDataObjectPtr> m_BreakthroughCondition;
    UPROPERTY()
    FDataObjectPtr m_BreakthroughLevel;
    UPROPERTY()
    FDataObjectPtr m_AchieveCondition;
    UPROPERTY()
    FDataObjectPtr m_BreakthroughRewardConfig;
    UPROPERTY()
    bool bIsStigmataLevel = false;
    UPROPERTY()
    int FakeStigmataPointNum = 0;


    const TArray<TDataObjectPtr<FServerConditionConfigBase>> GetBreakthroughCondition() const property
    {
        const TArray<TDataObjectPtr<FServerConditionConfigBase>> __r;
        return __r;
    }
    void SetBreakthroughCondition(const TArray<TDataObjectPtr<FServerConditionConfigBase>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FServerConditionConfigBase>>> local_2;
        this.m_BreakthroughCondition = local_2;
        return;
    }
    TDataObjectPtr<FCommissionConfig> GetBreakthroughLevel() const property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        return __r;
    }
    void SetBreakthroughLevel(const TDataObjectPtr<FCommissionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCommissionConfig>> local_2;
        this.m_BreakthroughLevel = local_2;
        return;
    }
    TDataObjectPtr<FServerConditionConfigBase> GetAchieveCondition() const property
    {
        TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetAchieveCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_AchieveCondition = local_2;
        return;
    }
    const TDataObjectPtr<FRewardConfig> GetBreakthroughRewardConfig() const property
    {
        const TDataObjectPtr<FRewardConfig> __r;
        return __r;
    }
    void SetBreakthroughRewardConfig(const TDataObjectPtr<FRewardConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRewardConfig>> local_2;
        this.m_BreakthroughRewardConfig = local_2;
        return;
    }
}

struct FExpOverflowConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    uint ExpDecRatio;
    UPROPERTY()
    uint ExpOverflowLimit;
    UPROPERTY()
    uint ExpConvertRatio;
    UPROPERTY()
    FDataObjectPtr m_ConvertResourceType;
    UPROPERTY()
    uint HotSpringExpLimit;
    UPROPERTY()
    FDataObjectPtr m_HotSpringExpRefreshRule;


    const TDataObjectPtr<FVirtualItemConfig> GetConvertResourceType() const property
    {
        const TDataObjectPtr<FVirtualItemConfig> __r;
        return __r;
    }
    void SetConvertResourceType(const TDataObjectPtr<FVirtualItemConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FVirtualItemConfig>> local_2;
        this.m_ConvertResourceType = local_2;
        return;
    }
    const TDataObjectPtr<FRefreshRuleConfig> GetHotSpringExpRefreshRule() const property
    {
        const TDataObjectPtr<FRefreshRuleConfig> __r;
        return __r;
    }
    void SetHotSpringExpRefreshRule(const TDataObjectPtr<FRefreshRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRefreshRuleConfig>> local_2;
        this.m_HotSpringExpRefreshRule = local_2;
        return;
    }
}

struct FPlayerLevelScheduleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    uint LevelCap;
    UPROPERTY()
    FDataObjectPtr m_RefreshRule;
    UPROPERTY()
    FString LevelCapUnlockTime;


    const TDataObjectPtr<FRefreshRuleConfig> GetRefreshRule() const property
    {
        const TDataObjectPtr<FRefreshRuleConfig> __r;
        return __r;
    }
    void SetRefreshRule(const TDataObjectPtr<FRefreshRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRefreshRuleConfig>> local_2;
        this.m_RefreshRule = local_2;
        return;
    }
}

