

struct FIntrusionPolicyConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText IntrusionName;
    UPROPERTY()
    FText IntrusionTips;
    UPROPERTY()
    FText IntrusionDescription;
    UPROPERTY()
    FSoftBrush IntrusionIcon;
    UPROPERTY()
    TSet<TSoftClassPtr<AKLLevelScriptActor>> ExtraLoadDatalayerClasses;


}

