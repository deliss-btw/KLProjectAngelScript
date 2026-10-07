

struct FFriendSettingsConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int FriendMaxCount;
    UPROPERTY()
    int FriendApplyCoolDown;
    UPROPERTY()
    int FriendApplyExpireHours;
    UPROPERTY()
    int FriendApplyMaxCount;


}

