

struct FTeleporterConfigArray
{
    UPROPERTY()
    TArray<TDataObjectPtr<FTeleporterConfig>> Array;

    FTeleporterConfigArray()
    {
        return;
    }
}

struct FTeleporterSettingsCache
{
    UPROPERTY()
    TMap<TDataObjectPtr<FLevelInfoConfig>, FTeleporterConfigArray> TeleportersInLevel;

    FTeleporterSettingsCache()
    {
        return;
    }
}

class UTeleporterSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> TeleporterDefaultPresentationRule;

    UTeleporterSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FTeleporterSettingsCache local_20;
        TDataObjectIterator<FTeleporterConfig> local_36;
        for (; local_36; )
        {
            const FTeleporterConfig& local_40 = local_36.GetData();
            if (local_40.GetLevelInfoConfig())
            {
                local_20.TeleportersInLevel.FindOrAdd(local_40.GetLevelInfoConfig()).Array.Add(TDataObjectPtr<FTeleporterConfig>(local_40));
            }
            local_36.Next();
        }
        return FInstancedStruct::Make(local_20);
    }
    TArray<TDataObjectPtr<FTeleporterConfig>> GetTeleportersInLevel(const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        TArray<TDataObjectPtr<FTeleporterConfig>> __r; return __r;
    }
}

