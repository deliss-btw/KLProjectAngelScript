

struct FAttributeSettingsCache
{
    UPROPERTY()
    TMap<FGameAttributeRef, TDataObjectPtr<FAttributeConfig>> AttributeConfigs;

    FAttributeSettingsCache()
    {
        return;
    }
}

class UAttributeSettingsSettings : UGameplaySettingsBase
{
    UPROPERTY()
    UDataTable AttributeConfigTable;

    UAttributeSettingsSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FAttributeSettingsCache local_20;
        TDataObjectIterator<FAttributeConfig> local_36;
        for (; local_36; )
        {
            const FAttributeConfig& local_40 = local_36.GetData();
            if (local_40.Attribute.IsValid())
            {
                local_20.AttributeConfigs.FindOrAdd(local_40.Attribute) = TDataObjectPtr<FAttributeConfig>(local_40);
            }
            local_36.Next();
        }
        return FInstancedStruct::Make(local_20);
    }
    TDataObjectPtr<FAttributeConfig> GetAttributeConfig(const FGameAttributeRef &inout Attribute) const
    {
        TMap<FGameAttributeRef, TDataObjectPtr<FAttributeConfig>> local_8;
        TConstRawPtr<FAttributeSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        for (auto& local_28 : local_8)
        {
            if (local_28.GetKey().GetGlobalIndex() == Attribute.GetGlobalIndex())
            {
                return TDataObjectPtr<FAttributeConfig>();
            }
        }
        return (TDataObjectPtr<FAttributeConfig>(nullptr));
    }
}

