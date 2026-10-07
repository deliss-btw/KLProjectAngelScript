

struct FStigmataConfigGroup
{
    UPROPERTY()
    TArray<TDataObjectPtr<FStigmataConfig>> Configs;

    FStigmataConfigGroup()
    {
        return;
    }
}

struct FPlayerSettingsCache
{
    UPROPERTY()
    TArray<TDataObjectPtr<FPlayerLevelConfig>> LevelConfigs;
    UPROPERTY()
    TArray<TDataObjectPtr<FGameAttributeGrowByLevelConfig>> AttributeGrowByLevelConfigs;
    UPROPERTY()
    TArray<int> BreakthroughLevels;
    UPROPERTY()
    TArray<int> StigmataLevels;
    UPROPERTY()
    TMap<int, int> FakeStigmataPointNums;
    UPROPERTY()
    TArray<TDataObjectPtr<FStigmataConfig>> NoCostStigmataConfigs;
    UPROPERTY()
    TMap<int, FStigmataConfigGroup> HasCostStigmataConfigsByLevel;

    FPlayerSettingsCache()
    {
        return;
    }
}

class UPlayerInfoSettings : UGameplaySettingsBase
{
    UPROPERTY()
    int StartLevel = 1;
    UPROPERTY()
    UDataTable PlayerLevelConfigTable;
    UPROPERTY()
    UDataTable AttributeGrowByLevelConfigTable;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig_Banner> LevelUpBannerMessageHintConfig;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> DefaultAvatarConfig;
    UPROPERTY()
    UStringValidatorConfig PlayerNameValidator;
    UPROPERTY()
    FText StigmataUnlockTitle;
    UPROPERTY()
    FText StigmataUnlockContentFormat;
    UPROPERTY()
    FEUIInputActionDataRow StigmataUnlockConfirmAction;


    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FInstancedStruct __r; return __r;
    }
    TDataObjectPtr<FPlayerLevelConfig> GetLevelConfig(const int Level) const
    {
        TArray<TDataObjectPtr<FPlayerLevelConfig>> local_10;
        int local_2 = this.GetLevelIndexInCache(Level);
        TConstRawPtr<FPlayerSettingsCache> local_8 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_10.IsValidIndex(local_2))
        {
            return local_10[local_2];
        }
        return TDataObjectPtr<FPlayerLevelConfig>(nullptr);
    }
    int GetMaxLevel() const property
    {
        TArray<TDataObjectPtr<FPlayerLevelConfig>> local_8;
        TConstRawPtr<FPlayerSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_8.Num() > 0)
        {
            return this.GetLevelByIndexInCache((local_8.Num() - 1));
        }
        return 0;
    }
    TArray<int> GetBreakthroughLevels() const property
    {
        // body not fully recovered вЂ” stub [no-return]
        TArray<int> __r; return __r;
    }
    TArray<int> GetStigmataLevels() const property
    {
        // body not fully recovered вЂ” stub [no-return]
        TArray<int> __r; return __r;
    }
    uint GetLevelupTotalUpgradeExp(const int FromLevel, const int ToLevel) const
    {
        TArray<TDataObjectPtr<FPlayerLevelConfig>> local_12;
        int local_2 = this.GetLevelIndexInCache(ToLevel);
        int local_1 = this.GetLevelIndexInCache(FromLevel);
        TConstRawPtr<FPlayerSettingsCache> local_10 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        int local_13 = 0;
        int local_15 = local_1;
        for (; local_15 < local_2; ++local_15)
        {
            if (!(!(local_12.IsValidIndex(local_15))) && local_12[local_15])
            {
                local_13 = local_13 + local_12[local_15].opArrow().UpgradeExp;
            }
        }
        return local_13;
    }
    float32 GetLevelUpAttributeHpGrow(const int FromLevel, const int ToLevel) const
    {
        TArray<TDataObjectPtr<FGameAttributeGrowByLevelConfig>> local_12;
        float32 local_14 = 0.0f;
        float32 local_15 = 0.0f;
        int local_2 = this.GetLevelIndexInCache(ToLevel);
        int local_1 = this.GetLevelIndexInCache(FromLevel);
        TConstRawPtr<FPlayerSettingsCache> local_10 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_12.IsValidIndex(local_2))
        {
            if (local_12.IsValidIndex(local_1))
            {
                local_14 = local_14 - local_15;
                return local_14;
            }
            return local_15;
        }
        return 0.0f;
    }
    int GetFakeStigmataPointNum(const int Level) const
    {
        TMap<int, int> local_8;
        TConstRawPtr<FPlayerSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_8.Contains(Level))
        {
            return local_8[Level];
        }
        return 0;
    }
    TDataObjectPtr<FGameAttributeGrowByLevelConfig> GetAttributeGrowthAtLevel(const int Level) const
    {
        TArray<TDataObjectPtr<FGameAttributeGrowByLevelConfig>> local_10;
        int local_2 = this.GetLevelIndexInCache(Level);
        TConstRawPtr<FPlayerSettingsCache> local_8 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_10.IsValidIndex(local_2))
        {
            return local_10[local_2];
        }
        return TDataObjectPtr<FGameAttributeGrowByLevelConfig>(nullptr);
    }
    TArray<TDataObjectPtr<FStigmataConfig>> GetAllNoCostStigmataConfigs() const
    {
        // body not fully recovered вЂ” stub [no-return]
        TArray<TDataObjectPtr<FStigmataConfig>> __r; return __r;
    }
    TArray<TDataObjectPtr<FStigmataConfig>> GetNoCostStigmataConfigsInRange(const int MinLevel, const int MaxLevelExclusive) const
    {
        TArray<TDataObjectPtr<FStigmataConfig>> local_4;
        for (auto& local_24 : this.GetAllNoCostStigmataConfigs())
        {
            int local_27 = ::NumericUtils::AsInt32(local_24.opArrow().RoleLevel);
            if ((local_27 > MinLevel && (local_27 <= MaxLevelExclusive)))
            {
                local_4.Add(local_24);
            }
        }
        return local_4;
    }
    TArray<TDataObjectPtr<FStigmataConfig>> GetHasCostStigmataConfigsForLevel(const int StigmataLevel) const
    {
        TMap<int, FStigmataConfigGroup> local_8;
        TConstRawPtr<FPlayerSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_8.Contains(StigmataLevel))
        {
            return local_8[StigmataLevel].Configs;
        }
        return TArray<TDataObjectPtr<FStigmataConfig>>();
    }
    int GetLevelIndexInCache(const int Level) const
    {
        return (Level - this.StartLevel);
    }
    int GetLevelByIndexInCache(const int LevelIndex) const
    {
        return (LevelIndex + this.StartLevel);
    }
    int FindOwnerStigmataLevel(const TArray<int> &inout InStigmataLevels, const int RoleLevel) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
}

struct __Lambda_Legacy_Settings_PlayerSettings_204
{
    __Lambda_Legacy_Settings_PlayerSettings_204()
    {
        return;
    }
    bool opCall(const TDataObjectPtr<FStigmataConfig> &inout A, const TDataObjectPtr<FStigmataConfig> &inout B)
    {
        return (A.opArrow().RoleLevel < B.opArrow().RoleLevel);
    }
}

struct __Lambda_Legacy_Settings_PlayerSettings_207
{
    __Lambda_Legacy_Settings_PlayerSettings_207()
    {
        return;
    }
    bool opCall(const TDataObjectPtr<FStigmataConfig> &inout A, const TDataObjectPtr<FStigmataConfig> &inout B)
    {
        return (A.opArrow().RoleLevel < B.opArrow().RoleLevel);
    }
}

