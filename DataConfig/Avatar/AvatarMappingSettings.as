

struct FAvatarMappingSettingsCache
{
    UPROPERTY()
    TMap<TDataObjectPtr<FAvatarPrefabConfig>, TDataObjectPtr<FAvatarMappingConfig>> AvatarToMapping;

    FAvatarMappingSettingsCache()
    {
        return;
    }
}

class UAvatarMappingSettings : UGameplaySettingsBase
{
    UPROPERTY()
    UDataTable AvatarMappingConfigTable;

    UAvatarMappingSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FAvatarMappingSettingsCache local_20;
        if (this.AvatarMappingConfigTable != nullptr)
        {
            TDataObjectIterator<FAvatarMappingConfig> local_40;
            for (; local_40; )
            {
                const FAvatarMappingConfig& local_42 = local_40.GetData();
                for (auto& local_56 : local_42.GetAvatar())
                {
                    if (local_56)
                    {
                        local_20.AvatarToMapping.FindOrAdd(local_56) = TDataObjectPtr<FAvatarMappingConfig>(local_42);
                    }
                }
                local_40.Next();
            }
        }
        return FInstancedStruct::Make(local_20);
    }
    TDataObjectPtr<FAvatarMappingConfig> GetMappingConfigOfAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        int local_8 = 0;
        TConstRawPtr<FAvatarMappingSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_8.AvatarToMapping.Contains(AvatarConfig))
        {
            return local_8.AvatarToMapping[AvatarConfig];
        }
        return TDataObjectPtr<FAvatarMappingConfig>();
    }
    TDataObjectPtr<FAvatarMappingConfig> GetMappingConfigOfAvatar(const uint AvatarId) const
    {
        int local_56 = 0;
        TDataObjectPtr<FAvatarPrefabConfig> local_48 = ::FAvatarPrefabConfig::GetByDataId(AvatarId);
        TConstRawPtr<FAvatarMappingSettingsCache> local_54 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_56.AvatarToMapping.Contains(local_48))
        {
            return local_56.AvatarToMapping[local_48];
        }
        return TDataObjectPtr<FAvatarMappingConfig>();
    }
    bool IsInMappingGroup(const TDataObjectPtr<FAvatarMappingConfig> &inout MappingConfig, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        if ((!(MappingConfig) || !(AvatarConfig)))
        {
            return false;
        }
        return (this.GetMappingConfigOfAvatar(AvatarConfig) == MappingConfig.opImplConv());
    }
}

