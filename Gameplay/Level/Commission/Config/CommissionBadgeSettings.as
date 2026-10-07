

struct FCommissionBadgeConfigsCache
{
    UPROPERTY()
    TArray<TDataObjectPtr<FCommissionBadgeConfig>> BadgeConfigs;

    FCommissionBadgeConfigsCache()
    {
        return;
    }
}

class UCommissionBadgeSettings : UGameplaySettingsBase
{
    UPROPERTY()
    UDataTable CommissionBadgeConfigTable;

    UCommissionBadgeSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FCommissionBadgeConfigsCache local_4;
        TDataObjectIterator<FCommissionBadgeConfig> local_20;
        for (; local_20; )
        {
            local_4.BadgeConfigs.Add(TDataObjectPtr<FCommissionBadgeConfig>(local_20.GetData()));
            local_20.Next();
        }
        return FInstancedStruct::Make(local_4);
    }
    TArray<TDataObjectPtr<FCommissionBadgeConfig>> GetAllCommissionBadgeConfig() const
    {
        // body not fully recovered вЂ” stub [no-return]
        TArray<TDataObjectPtr<FCommissionBadgeConfig>> __r; return __r;
    }
}

