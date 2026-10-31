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
        FPlayerSettingsCache local_60;
        TDataObjectIterator<FPlayerLevelConfig> local_76;
        for (; local_76; )
        {
            TDataObjectPtr<FPlayerLevelConfig> local_142 = local_76.GetDataPtr();
            int local_146 = this.GetLevelIndexInCache(::NumericUtils::AsInt32(local_142.opArrow().Level));
            if (local_60.LevelConfigs.Num() <= local_146)
            {
                local_60.LevelConfigs.SetNum(local_146 + 1);
            }
            local_60.LevelConfigs[local_146] = local_142;
            local_76.Next();
        }
        int local_146_2 = 0;
        for (; local_146_2 < local_60.LevelConfigs.Num(); ++local_146_2)
        {
            TDataObjectPtr<FPlayerLevelConfig> local_118;
            local_118 = local_60.LevelConfigs[local_146_2];
            if ((local_118 == nullptr))
            {
                continue;
            }
            int local_145 = this.GetLevelByIndexInCache(local_146_2);
            if (local_60.LevelConfigs[local_146_2].opArrow().IsBreakthroughLevel)
            {
                local_60.BreakthroughLevels.Add(local_145);
            }
            if (local_60.LevelConfigs[local_146_2].opArrow().bIsStigmataLevel)
            {
                local_60.StigmataLevels.Add(local_145);
                local_60.FakeStigmataPointNums.Add(local_145, local_60.LevelConfigs[local_146_2].opArrow().FakeStigmataPointNum);
            }
        }
        bool local_93 = false;
        local_60.StigmataLevels.Sort(local_93);
        TDataObjectIterator<FStigmataConfig> local_188;
        for (; local_188; )
        {
            TDataObjectPtr<FStigmataConfig> local_252 = local_188.GetDataPtr();
            if (local_252.opArrow().UnlockCost.Num() == 0)
            {
                local_60.NoCostStigmataConfigs.Add(local_252);
            }
            else
            {
                int local_171 = this.FindOwnerStigmataLevel(local_60.StigmataLevels, ::NumericUtils::AsInt32(local_252.opArrow().RoleLevel));
                if (local_171 != INDEX_NONE)
                {
                    local_60.HasCostStigmataConfigsByLevel.FindOrAdd(local_171).Configs.Add(local_252);
                }
            }
            local_188.Next();
        }
        __Lambda_Legacy_Settings_PlayerSettings_204 local_254;
        local_60.NoCostStigmataConfigs.Sort(local_254);
        for (auto& local_272 : local_60.HasCostStigmataConfigsByLevel)
        {
            __Lambda_Legacy_Settings_PlayerSettings_207 local_274;
            local_272.GetValue().Configs.Sort(local_274);
        }
        if (this.AttributeGrowByLevelConfigTable != nullptr)
        {
            TArray<FName> local_280;
            this.AttributeGrowByLevelConfigTable.GetRowNames(local_280);
            int local_171_2 = 0;
            while (local_93)
            {
                UDataTable::FindDataObject local_286;
                TDataObjectPtr<FGameAttributeGrowByLevelConfig> local_310 = local_286.opCall(local_280[local_171_2]);
                if (local_310)
                {
                    local_60.AttributeGrowByLevelConfigs.Add(local_310);
                }
                ++local_171_2;
                if (local_171_2 >= local_60.LevelConfigs.Num())
                {
                    local_93 = false;
                    continue;
                }
                local_93 = (local_171_2 < local_280.Num());
            }
        }
        return FInstancedStruct::Make(local_60);
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
        return FInstancedStruct::GetPtr(this.GetCacheData()).opCall().Get().BreakthroughLevels;
    }
    TArray<int> GetStigmataLevels() const property
    {
        return FInstancedStruct::GetPtr(this.GetCacheData()).opCall().Get().StigmataLevels;
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
        int local_2 = this.GetLevelIndexInCache(ToLevel);
        int local_1 = this.GetLevelIndexInCache(FromLevel);
        TConstRawPtr<FPlayerSettingsCache> local_10 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_12.IsValidIndex(local_2))
        {
            if (local_12.IsValidIndex(local_1))
            {
                return (local_12[local_2].Get().HPMax - local_12[local_1].Get().HPMax);
            }
            return local_12[local_2].Get().HPMax;
        }
        float32 local_14_2 = 0.0f;
        return local_14_2;
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
        return FInstancedStruct::GetPtr(this.GetCacheData()).opCall().Get().NoCostStigmataConfigs;
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
        int local_1 = INDEX_NONE;
        for (auto local_16 : InStigmataLevels)
        {
            if (local_16 > RoleLevel)
            {
                break;
            }
            local_1 = local_16;
        }
        return local_1;
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

