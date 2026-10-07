
const FMonsterPrefabConfig DefaultMonsterConfig = FMonsterPrefabConfig();

struct FPVPOverrideMonsterConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FPVPGameAttributeByLevelConfig GameAttributeConfig;

    FPVPOverrideMonsterConfig()
    {
        return;
    }
}

struct FGameModeOverrideMonsterConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FPVPGameAttributeByLevelConfig GameAttributeConfig;

    FGameModeOverrideMonsterConfig()
    {
        return;
    }
}

struct FMonsterPrefabConfig : FBasePrefabConfig
{
    FBasePrefabConfig _base_FBasePrefabConfig;
    UPROPERTY()
    EMonsterRank MonsterRank = EMonsterRank(0);
    UPROPERTY()
    uint8 WeakDamageType;
    UPROPERTY()
    FDataObjectPtr m_SkillBtnConfig;
    UPROPERTY()
    int HPBarSegment = 1;
    UPROPERTY()
    FText DisplayPrefix = NSLOCTEXT("MonsterPrefabConfig", "DisplayPrefix", "");
    UPROPERTY()
    FDataObjectPtr m_PVPOverride;
    UPROPERTY()
    TMap<EGameModeType, FDataObjectPtr> m_GameModeOverride;


    const TDataObjectPtr<FSkillBtnConfig> GetSkillBtnConfig() const property
    {
        const TDataObjectPtr<FSkillBtnConfig> __r;
        return __r;
    }
    void SetSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSkillBtnConfig>> local_2;
        this.m_SkillBtnConfig = local_2;
        return;
    }
    const TDataObjectPtr<FPVPOverrideMonsterConfig> GetPVPOverride() const property
    {
        const TDataObjectPtr<FPVPOverrideMonsterConfig> __r;
        return __r;
    }
    void SetPVPOverride(const TDataObjectPtr<FPVPOverrideMonsterConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPVPOverrideMonsterConfig>> local_2;
        this.m_PVPOverride = local_2;
        return;
    }
    const TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideMonsterConfig>> GetGameModeOverride() const property
    {
        const TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideMonsterConfig>> __r;
        return __r;
    }
    void SetGameModeOverride(const TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideMonsterConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<EGameModeType, FDataObjectPtr>, TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideMonsterConfig>>> local_2;
        this.m_GameModeOverride = local_2;
        return;
    }
}

UFUNCTION()
TDataObjectPtr<FMonsterPrefabConfig> GetMonsterConfig(const FECSEntity &inout Entity)
{
    return TDataObjectPtr<FMonsterPrefabConfig>(GetPrefabConfigPtr(Entity).CastTo(FMonsterPrefabConfig));
}
const FMonsterPrefabConfig GetDefaultedMonsterConfig(const FECSEntity &inout Entity)
{
    const FMonsterPrefabConfig __r;
    if (GetMonsterConfig(Entity))
    {
    }
    else
    {
    }
    return __r;
}
