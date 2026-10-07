
enum EConditionConfigType
{
    Invalid,
    GameServer,
    Local,
}

enum ECondCmpType
{
    None,
    CmpBool,
    CmpBoolFalse,
    CmpGreater,
    CmpGreaterEqual,
    CmpLess,
    CmpLessEqual,
    CmpEqual,
    CmpNotEqual,
    MaxCount,
}


struct FConditionConfigBase : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EConditionConfigType ConfigType;


}

struct FServerConditionConfigBase : FConditionConfigBase
{
    FConditionConfigBase _base_FConditionConfigBase;
    UPROPERTY()
    FText ConditionTips;

    default ConfigType = EConditionConfigType(1);

    FServerConditionConfigBase()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

