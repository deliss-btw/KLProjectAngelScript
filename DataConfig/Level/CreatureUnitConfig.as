
enum ENPCWatchPlayerLookMode
{
    DefaultEnabled,
    DefaultDisabled,
    DialogueOnly,
}


struct FCreatureAttributeScaleData
{
    UPROPERTY()
    TMap<TSubclassOf<UGameAttribute>, float32> AttributeScale;

    FCreatureAttributeScaleData()
    {
        return;
    }
}

struct FCreatureAttributeScaleByLevelConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TMap<int, FCreatureAttributeScaleData> AttributeScaleByLevel;

    FCreatureAttributeScaleByLevelConfig()
    {
        return;
    }
}

struct FCombatUnitBaseConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FString FriendlyName;
    UPROPERTY()
    TSoftClassPtr<ACharacterPrefab> Prefab;
    UPROPERTY()
    FDataObjectPtr m_InitAttributeValues;
    UPROPERTY()
    FDataObjectPtr m_TargetingConfig;
    UPROPERTY()
    FDataObjectPtr m_QuitCombatConfig;
    UPROPERTY()
    FDataObjectPtr m_PerceptionConfig;
    UPROPERTY()
    EMonsterRank Rank = EMonsterRank(0);


    const TDataObjectPtr<FGameAttributeInitConfig_CombatUnit> GetInitAttributeValues() const property
    {
        const TDataObjectPtr<FGameAttributeInitConfig_CombatUnit> __r;
        return __r;
    }
    void SetInitAttributeValues(const TDataObjectPtr<FGameAttributeInitConfig_CombatUnit> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FGameAttributeInitConfig_CombatUnit>> local_2;
        this.m_InitAttributeValues = local_2;
        return;
    }
    const TDataObjectPtr<FAITargetingConfig> GetTargetingConfig() const property
    {
        const TDataObjectPtr<FAITargetingConfig> __r;
        return __r;
    }
    void SetTargetingConfig(const TDataObjectPtr<FAITargetingConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAITargetingConfig>> local_2;
        this.m_TargetingConfig = local_2;
        return;
    }
    const TDataObjectPtr<FAIQuitCombatConfig> GetQuitCombatConfig() const property
    {
        const TDataObjectPtr<FAIQuitCombatConfig> __r;
        return __r;
    }
    void SetQuitCombatConfig(const TDataObjectPtr<FAIQuitCombatConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAIQuitCombatConfig>> local_2;
        this.m_QuitCombatConfig = local_2;
        return;
    }
    const TDataObjectPtr<FAIPerceptionConfig> GetPerceptionConfig() const property
    {
        const TDataObjectPtr<FAIPerceptionConfig> __r;
        return __r;
    }
    void SetPerceptionConfig(const TDataObjectPtr<FAIPerceptionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAIPerceptionConfig>> local_2;
        this.m_PerceptionConfig = local_2;
        return;
    }
}

struct FNPCWatchPlayerLookPresetConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    ENPCWatchPlayerLookMode WatchPlayerLookMode = ENPCWatchPlayerLookMode(1);
    UPROPERTY()
    float32 MinPitchAngle = -30.0f;
    UPROPERTY()
    float32 MaxPitchAngle = 45.0f;
    UPROPERTY()
    float32 MinYawAngle = -60.0f;
    UPROPERTY()
    float32 MaxYawAngle = 60.0f;
    UPROPERTY()
    float32 EnterRange = 400.0f;
    UPROPERTY()
    float32 ExitRange = 600.0f;
    UPROPERTY()
    int Priority = 12;


}

struct FCreatureUnitConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FString FriendlyName;
    UPROPERTY()
    FDataObjectPtr m_CombatConfig;
    UPROPERTY()
    TMap<TSubclassOf<UGameAttribute>, float32> AttributeScale;
    UPROPERTY()
    FDataObjectPtr m_PresentationRuleConfig;
    UPROPERTY()
    FDataObjectPtr m_WatchPlayerLookPreset;
    UPROPERTY()
    TArray<FDataObjectPtr> m_DropItems;
    UPROPERTY()
    TArray<FBuffConfigRef> InitBuffs;
    UPROPERTY()
    FGameplayTagContainer InitGameplayTags;
    UPROPERTY()
    FDataObjectPtr m_Creature;
    UPROPERTY()
    bool bAvailableForLevelPlacement = true;


    TSubclassOf<ACharacterPrefab> GetCombatPrefab() const
    {
        if (!(this.GetCombatConfig()))
        {
            return TSubclassOf<ACharacterPrefab>(nullptr);
        }
        if (unresolved.Prefab.IsNull())
        {
            return TSubclassOf<ACharacterPrefab>(nullptr);
        }
        if (unresolved.Prefab.IsPending())
        {
            FSoftObjectPath local_12;
            local_12.TryLoad();
        }
        return TSubclassOf<ACharacterPrefab>();
    }
    TSoftClassPtr<ACharacterPrefab> GetSoftCombatPrefab() const
    {
        TSoftClassPtr<ACharacterPrefab> __r;
        if (!(this.GetCombatConfig()))
        {
            return TSoftClassPtr<ACharacterPrefab>(nullptr);
        }
        return __r;
    }
    const TDataObjectPtr<FCombatUnitBaseConfig> GetCombatConfig() const property
    {
        const TDataObjectPtr<FCombatUnitBaseConfig> __r;
        return __r;
    }
    void SetCombatConfig(const TDataObjectPtr<FCombatUnitBaseConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCombatUnitBaseConfig>> local_2;
        this.m_CombatConfig = local_2;
        return;
    }
    const TDataObjectPtr<FPresentationRuleConfig> GetPresentationRuleConfig() const property
    {
        const TDataObjectPtr<FPresentationRuleConfig> __r;
        return __r;
    }
    void SetPresentationRuleConfig(const TDataObjectPtr<FPresentationRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPresentationRuleConfig>> local_2;
        this.m_PresentationRuleConfig = local_2;
        return;
    }
    const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> GetWatchPlayerLookPreset() const property
    {
        const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> __r;
        return __r;
    }
    void SetWatchPlayerLookPreset(const TDataObjectPtr<FNPCWatchPlayerLookPresetConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNPCWatchPlayerLookPresetConfig>> local_2;
        this.m_WatchPlayerLookPreset = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FDropItemConfigBase>> GetDropItems() const property
    {
        const TArray<TDataObjectPtr<FDropItemConfigBase>> __r;
        return __r;
    }
    void SetDropItems(const TArray<TDataObjectPtr<FDropItemConfigBase>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FDropItemConfigBase>>> local_2;
        this.m_DropItems = local_2;
        return;
    }
    const TDataObjectPtr<FEcologyCreatureDefinitionRow> GetCreature() const property
    {
        const TDataObjectPtr<FEcologyCreatureDefinitionRow> __r;
        return __r;
    }
    void SetCreature(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FEcologyCreatureDefinitionRow>> local_2;
        this.m_Creature = local_2;
        return;
    }
}

