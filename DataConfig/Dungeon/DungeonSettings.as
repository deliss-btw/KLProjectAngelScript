

struct FDungeonSettingsCache
{
    UPROPERTY()
    TMap<TDataObjectPtr<FLevelInfoConfig>, TDataObjectPtr<FDungeonConfig>> Dungeons;

    FDungeonSettingsCache()
    {
        return;
    }
}

class UDungeonSettings : UGameplaySettingsBase
{
    UPROPERTY()
    UDataTable DungeonConfigTable;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DungeonInteractWaitWidgetClass;

    UDungeonSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FDungeonSettingsCache local_20;
        if (this.DungeonConfigTable != nullptr)
        {
            TDataObjectIterator<FDungeonConfig> local_40;
            for (; local_40; )
            {
                const FDungeonConfig& local_42 = local_40.GetData();
                if (local_42.GetLevelConfig())
                {
                    local_20.Dungeons.FindOrAdd(local_42.GetLevelConfig()) = TDataObjectPtr<FDungeonConfig>(local_42);
                }
                local_40.Next();
            }
        }
        return FInstancedStruct::Make(local_20);
    }
    TDataObjectPtr<FDungeonConfig> GetDungeonsConfigOfLevel(const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig) const
    {
        int local_8 = 0;
        TConstRawPtr<FDungeonSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_8.Dungeons.Contains(LevelInfoConfig))
        {
            return local_8.Dungeons[LevelInfoConfig];
        }
        return TDataObjectPtr<FDungeonConfig>();
    }
}

