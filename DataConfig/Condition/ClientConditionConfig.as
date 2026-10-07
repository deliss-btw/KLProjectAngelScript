
enum EClientConditionTriggerReason
{
    None,
    MonsterExecutionBreak,
    InitialLockedFashionUnlocked,
}


struct FClientConditionBase
{
    FClientConditionBase()
    {
        return;
    }
}

struct FClientCond_WidgetTag : FClientConditionBase
{
    FClientConditionBase _base_FClientConditionBase;
    UPROPERTY()
    FEUIWidgetTag WidgetTag;

    FClientCond_WidgetTag()
    {
        super();
        return;
    }
}

struct FClientCond_CommissionInMap : FClientConditionBase
{
    FClientConditionBase _base_FClientConditionBase;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;

    FClientCond_CommissionInMap()
    {
        super();
        return;
    }
}

struct FClientCond_LevelType : FClientConditionBase
{
    FClientConditionBase _base_FClientConditionBase;
    UPROPERTY()
    ELevelType LevelType;


}

struct FClientCond_InputType : FClientConditionBase
{
    FClientConditionBase _base_FClientConditionBase;
    UPROPERTY()
    EEUIInputType InputType;


}

struct FClientCond_TriggerReason : FClientConditionBase
{
    FClientConditionBase _base_FClientConditionBase;
    UPROPERTY()
    EClientConditionTriggerReason Reason;


}

struct FClientCond_InTeam : FClientConditionBase
{
    FClientConditionBase _base_FClientConditionBase;
    UPROPERTY()
    bool bRequireInTeam;


}

struct FClientConditionGroup : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FInstancedStruct> Conditions;

    FClientConditionGroup()
    {
        return;
    }
}

