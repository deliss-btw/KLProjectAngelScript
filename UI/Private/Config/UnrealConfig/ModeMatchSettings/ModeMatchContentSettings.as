UCLASS(Abstract)
class UModeMatchContentAdapterBase : UObject
{
    UPROPERTY()
    uint MatchMode;

    UModeMatchContentAdapterBase()
    {
        return;
    }
    FEUIModelContainer MakeViewModels(const FEUIModelContext &inout Context, const FEUIModelRef &inout Business) const
    {
        return FEUIModelContainer();
    }
}

struct FModeMatchContentInfo
{
    UPROPERTY()
    TSubclassOf<UModeMatchContentAdapterBase> Adapter;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> Widget;

    FModeMatchContentInfo()
    {
        return;
    }
}

struct FModeMatchContentCache
{
    UPROPERTY()
    TMap<uint, FModeMatchContentInfo> MatchModeToAdapter;

    FModeMatchContentCache()
    {
        return;
    }
}

class UModeMatchContentSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TArray<FModeMatchContentInfo> ContentAdapters;

    UModeMatchContentSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FModeMatchContentCache local_20;
        for (auto& local_36 : this.ContentAdapters)
        {
            UModeMatchContentAdapterBase local_38 = local_36.Adapter.GetDefaultObject();
        }
        return FInstancedStruct::Make(local_20);
    }
    const UModeMatchContentAdapterBase GetContentAdapter(const uint InMatchMode) const
    {
        FModeMatchContentInfo local_12;
        bool local_19 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall().Get().MatchModeToAdapter.Find(InMatchMode, local_12);
        if (local_19)
        {
            return local_12.Adapter.GetDefaultObject();
        }
        UModeMatchContentAdapterBase local_24;
        return local_24;
    }
    TSoftClassPtr<UEUIUserWidget> GetContentWidgetClass(const uint InMatchMode) const
    {
        FModeMatchContentInfo local_12;
        bool local_19 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall().Get().MatchModeToAdapter.Find(InMatchMode, local_12);
        if (local_19)
        {
            return local_12.Widget;
        }
        return TSoftClassPtr<UEUIUserWidget>(nullptr);
    }
}

