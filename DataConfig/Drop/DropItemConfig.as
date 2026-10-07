

struct FDropItemConfigBase : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FString Comments;

    FDropItemConfigBase()
    {
        return;
    }
}

struct FDropItemPackage
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    int Num;

    FDropItemPackage()
    {
        this.Num = 1;
        return;
    }
    FDropItemPackage(const TDataObjectPtr<FItemConfig> &inout InItem, const int InNum = 1)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FDropItemData
{
    UPROPERTY()
    TArray<FDropItemPackage> DropItemPackages;
    UPROPERTY()
    int Weight = 100;


}

struct FDropItemGroundBagConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftClassPtr<ACollectionPrefab> GroundBagPrefab;
    UPROPERTY()
    FText GroundBagInteractText;
    UPROPERTY()
    bool bShowRewardPopup = false;


}

struct FDropItemConfig : FDropItemConfigBase
{
    FDropItemConfigBase _base_FDropItemConfigBase;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FDropItemData> Drops;
    UPROPERTY()
    EDropItemAllocation DropAllocation = EDropItemAllocation(2);
    UPROPERTY()
    EDSDropType DropType = EDSDropType(0);
    UPROPERTY()
    FDataObjectPtr m_GroundBagConfig;


    const TDataObjectPtr<FDropItemGroundBagConfig> GetGroundBagConfig() const property
    {
        const TDataObjectPtr<FDropItemGroundBagConfig> __r;
        return __r;
    }
    void SetGroundBagConfig(const TDataObjectPtr<FDropItemGroundBagConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemGroundBagConfig>> local_2;
        this.m_GroundBagConfig = local_2;
        return;
    }
}

struct FDropGroupItemData
{
    UPROPERTY()
    TDataObjectPtr<FDropItemConfig> Item;
    UPROPERTY()
    float32 DropRate = 100.0f;
    UPROPERTY()
    bool bUseBadWeatherDropRateUpRule;


}

struct FDropItemGroupConfig : FDropItemConfigBase
{
    FDropItemConfigBase _base_FDropItemConfigBase;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FDropGroupItemData> Drops;
    UPROPERTY()
    EDropItemAllocation DropAllocation = EDropItemAllocation(0);
    UPROPERTY()
    EDropTriggerType TriggerType;
    UPROPERTY()
    EDSDropType DropType = EDSDropType(0);
    UPROPERTY()
    FDataObjectPtr m_GroundBagConfig;


    const TDataObjectPtr<FDropItemGroundBagConfig> GetGroundBagConfig() const property
    {
        const TDataObjectPtr<FDropItemGroundBagConfig> __r;
        return __r;
    }
    void SetGroundBagConfig(const TDataObjectPtr<FDropItemGroundBagConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemGroundBagConfig>> local_2;
        this.m_GroundBagConfig = local_2;
        return;
    }
}

