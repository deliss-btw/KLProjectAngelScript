
enum ECommissionEntryRuleType
{
    None,
    Default,
    BossTracking,
    Rescue,
    Escape,
    AllyAssist,
}


struct FCommissionEntryRuleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    ECommissionEntryRuleType RuleType;
    UPROPERTY()
    FText RuleName;
    UPROPERTY()
    FSoftBrush RuleIcon;
    UPROPERTY()
    TSet<TSoftClassPtr<AKLLevelScriptActor>> ExtraLoadDatalayerClasses;


}

