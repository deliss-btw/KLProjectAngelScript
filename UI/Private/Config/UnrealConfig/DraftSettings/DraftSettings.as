

UCLASS(Abstract)
class UDraftTypeAdapterBase : UObject
{
    UPROPERTY()
    UScriptStruct SupportedTypedDraftDataModelType;
    UPROPERTY()
    uint ServerDraftType;

    UDraftTypeAdapterBase()
    {
        return;
    }
    FEUIModelRef GetTypedDraftData(const FEUIModelContext &inout Context, const FPbDraftInfo &inout ServerDraftInfo) const
    {
        return FEUIModelRef();
    }
    FEUIModelContainer MakeViewModels(const FEUIModelContext &inout Context, const FEUIModelRef &inout TypedDraftData) const
    {
        return FEUIModelContainer();
    }
    bool HandleDraftInviteFail(const FEUIModelContext &inout Context, const TEUIModelRef<FM_Draft> &inout FailedDraft) const
    {
        return false;
    }
}

struct FDraftSettingsInfo
{
    UPROPERTY()
    TSubclassOf<UDraftTypeAdapterBase> DraftTypeAdaptersData;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DraftTypeAdaptersWidget;

    FDraftSettingsInfo()
    {
        return;
    }
}

struct FDraftSettingsCache
{
    UPROPERTY()
    TMap<UScriptStruct, FDraftSettingsInfo> TypedDraftDataModelTypeToAdapter;
    UPROPERTY()
    TMap<uint, FDraftSettingsInfo> ServerDraftTypeToAdapter;

    FDraftSettingsCache()
    {
        return;
    }
}

class UDraftSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TArray<FDraftSettingsInfo> DraftTypeAdapters;
    UPROPERTY()
    float32 DraftReplyTimeout = 15.0f;
    UPROPERTY()
    float32 DraftSuccessWaitTime = 3.0f;
    UPROPERTY()
    float32 DraftFailWaitTime = 3.0f;


    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FDraftSettingsCache local_40;
        for (auto& local_56 : this.DraftTypeAdapters)
        {
            UDraftTypeAdapterBase local_58 = local_56.DraftTypeAdaptersData.GetDefaultObject();
            UDraftTypeAdapterBase local_58_2 = local_56.DraftTypeAdaptersData.GetDefaultObject();
        }
        return FInstancedStruct::Make(local_40);
    }
    const UDraftTypeAdapterBase GetDraftTypeAdapter(const UScriptStruct TypedDraftDataModelType) const
    {
        TConstRawPtr<FDraftSettingsCache> local_18 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (false)
        {
            FDraftSettingsInfo local_12;
            return local_12.DraftTypeAdaptersData.GetDefaultObject();
        }
        UDraftTypeAdapterBase local_24;
        return local_24;
    }
    TSoftClassPtr<UEUIUserWidget> GetDraftTypeAdapterWidgetClass(const UScriptStruct TypedDraftDataModelType) const
    {
        TConstRawPtr<FDraftSettingsCache> local_18 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (false)
        {
            FDraftSettingsInfo local_12;
            return local_12.DraftTypeAdaptersWidget;
        }
        return TSoftClassPtr<UEUIUserWidget>(nullptr);
    }
    const UDraftTypeAdapterBase GetDraftTypeAdapterByServerDraftType(const uint ServerDraftType) const
    {
        TConstRawPtr<FDraftSettingsCache> local_18 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (false)
        {
            FDraftSettingsInfo local_12;
            return local_12.DraftTypeAdaptersData.GetDefaultObject();
        }
        UDraftTypeAdapterBase local_24;
        return local_24;
    }
}

