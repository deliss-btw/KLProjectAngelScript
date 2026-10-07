
enum ERewardSource
{
    Commission,
    Mission,
    Achievement,
    Mail,
    PvP,
    Shop,
    GM,
    System,
}

enum ERewardClaimType
{
    Auto,
    Popup,
}


struct FRewardEntry
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    int Count = 1;
    UPROPERTY()
    bool bAutoUse;


}

struct FRewardConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ERewardSource RewardSource;
    UPROPERTY()
    TArray<FRewardEntry> RewardItems;
    UPROPERTY()
    bool bIsPreviewable;
    UPROPERTY()
    ERewardClaimType ClaimType;


}

