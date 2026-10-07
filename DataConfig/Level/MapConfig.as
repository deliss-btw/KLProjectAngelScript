

struct FSimpleAudioSet
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> Switch;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> State;
    UPROPERTY()
    TMap<TSoftObjectPtr<UAkRtpc>, float32> RtpcMap;

    FSimpleAudioSet()
    {
        return;
    }
}

struct FDefaultCombatBGMConfig
{
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> DefaultCombatBGMStateRef;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> DefaultCombatBGMEventRef;
    UPROPERTY()
    float32 DefaultTraceBGMDuration = 60.0f;
    UPROPERTY()
    TSoftObjectPtr<UAkStateValue> DefaultTraceBGMStateRef;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> DefaultTraceBGMEventRef;


}

struct FMapConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText MapName;
    UPROPERTY()
    TSoftObjectPtr<UWorld> MapReference;
    UPROPERTY()
    FName AssetName;
    UPROPERTY()
    FName FullName;
    UPROPERTY()
    FSimpleAudioSet LoadMapAudioSet;
    UPROPERTY()
    FSimpleAudioSet UnLoadMapAudioSet;
    UPROPERTY()
    TMap<int, FDefaultCombatBGMConfig> DefaultCombatBGM;
    UPROPERTY()
    FDataObjectPtr m_MinimapDisplayConfig;


    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        FMapConfig local_176;
        if (!(DataTable.FindRow(InRowName, local_176)))
        {
            XWarning(ELog(0), FString().Append("MapConfig not found for ").Append(InRowName));
            return;
        }
        this.AssetName = FName(this.MapReference.GetAssetName());
        this.FullName = FName(this.MapReference.ToString());
        FDataTableMisc::InformWholeTableChange(DataTable, InRowName);
        return;
    }
    const TDataObjectPtr<FMinimapDisplayConfig> GetMinimapDisplayConfig() const property
    {
        const TDataObjectPtr<FMinimapDisplayConfig> __r;
        return __r;
    }
    void SetMinimapDisplayConfig(const TDataObjectPtr<FMinimapDisplayConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMinimapDisplayConfig>> local_2;
        this.m_MinimapDisplayConfig = local_2;
        return;
    }
}

