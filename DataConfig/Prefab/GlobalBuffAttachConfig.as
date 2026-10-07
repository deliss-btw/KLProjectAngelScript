
enum EBuffAttachConditionType
{
    RandomEventNormal,
    RandomEventHard,
    PublicEvent,
}


struct FBuffAttachListConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FBuffConfigRef> Buffs;

    FBuffAttachListConfig()
    {
        return;
    }
}

struct FBuffAttachLevelEventMapping
{
    UPROPERTY()
    EBuffAttachConditionType ConditionType;
    UPROPERTY()
    bool bUseSpecificEvent = false;
    UPROPERTY()
    TDataObjectPtr<FLevelRandomEventInfoConfig> NormalRandomEventInfo;
    UPROPERTY()
    TDataObjectPtr<FLevelRandomEventInfoConfig> HardRandomEventInfo;
    UPROPERTY()
    TDataObjectPtr<FLevelPublicEventInfoConfig> PublicEventInfo;
    UPROPERTY()
    TDataObjectPtr<FBuffAttachListConfig> BuffList;


}

struct FBuffAttachRuleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FBuffAttachLevelEventMapping> LevelEventMappings;

    FBuffAttachRuleConfig()
    {
        return;
    }
}

class UBuffAttachSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TArray<TDataObjectPtr<FBuffAttachRuleConfig>> GlobalBuffAttachRules;

    UBuffAttachSettings()
    {
        return;
    }
}

