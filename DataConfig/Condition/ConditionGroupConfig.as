
enum EConditionGroupOperator
{
    And,
    Or,
    Nand,
    Nor,
}

enum EConditionSpecContextType
{
    Default,
    Team,
    Player,
    Global,
}


struct FConditionSpec
{
    UPROPERTY()
    EConditionSpecContextType ContextType;
    UPROPERTY()
    TDataObjectPtr<FLocalConditionConfigBase> ConditionConfig;


}

struct FConditionGroupConfig : FLocalConditionConfigBase
{
    FLocalConditionConfigBase _base_FLocalConditionConfigBase;
    UPROPERTY()
    EConditionGroupOperator Operator;
    UPROPERTY()
    TArray<FConditionSpec> ConditionSpecs;

    default LocalConditionType = ELocalConditionConfigType(2);

    FConditionGroupConfig()
    {
        super();
        this.Operator = EConditionGroupOperator(0);
        this.__InitDefaults();
        return;
    }
}

