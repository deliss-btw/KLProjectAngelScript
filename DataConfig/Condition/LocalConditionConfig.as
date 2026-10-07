
enum ELocalCondType
{
    None,
    MonsterDeath,
    PlayerEnterRegion,
    CustomLevelEvent,
    AnyOfEntityDeath = 100,
}

enum ELocalConditionConfigType
{
    Invalid,
    Single,
    Group,
}

enum ELocalConditionPlayerFilter
{
    None,
    Player,
    NonPlayer,
}


struct FLocalConditionConfigBase : FConditionConfigBase
{
    FConditionConfigBase _base_FConditionConfigBase;
    UPROPERTY()
    ELocalConditionConfigType LocalConditionType;

    default ConfigType = EConditionConfigType(2);

    FLocalConditionConfigBase()
    {
        super();
        this.LocalConditionType = ELocalConditionConfigType(0);
        this.__InitDefaults();
        return;
    }
}

struct FLocalConditionConfig : FLocalConditionConfigBase
{
    FLocalConditionConfigBase _base_FLocalConditionConfigBase;
    UPROPERTY()
    FInstancedStruct ConditionTypeDefineConfig;
    UPROPERTY()
    ECondCmpType CompareType;
    UPROPERTY()
    int TargetValue;

    default LocalConditionType = ELocalConditionConfigType(1);

    FLocalConditionConfig()
    {
        super();
        this.CompareType = ECondCmpType(4);
        this.TargetValue = 1;
        this.__InitDefaults();
        return;
    }
}

