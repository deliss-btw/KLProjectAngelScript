
enum ECondType
{
    None,
    CompleteCommission,
    PlayerLevel,
    PreviouslyObtainedItem,
    MissionStatus,
    MissionPhaseStatus,
    CurrentPackageItem,
    PlayerLevelBreakthrough,
    SystemOpen,
    EventNone = 100,
    EventCraftItem,
    EventEnterCommission,
    EventCraftItemExceptForge,
    EventCook,
    UnlockStigmata,
    UnlockTalent,
    EventFinishCommission,
    EventForge,
    MaxCount,
}

enum ECondGroupLogicType
{
    NONE,
    COND_OR,
    COND_AND,
    MaxCount,
}


struct FConditionConfig : FServerConditionConfigBase
{
    FServerConditionConfigBase _base_FServerConditionConfigBase;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ECondCmpType CmpType;
    UPROPERTY()
    int CmpValue;
    UPROPERTY()
    FString Param1;
    UPROPERTY()
    FString Param2;
    UPROPERTY()
    FString Param3;
    UPROPERTY()
    FString Param4;
    UPROPERTY()
    ECondType CondType;
    UPROPERTY()
    TArray<FDataObjectPtr> m_RefData;
    UPROPERTY()
    FText ConditionErrorCode;
    UPROPERTY()
    FText Note;

    default ConfigType = EConditionConfigType(1);

    FConditionConfig()
    {
        super();
        this.DataId = 0;
        this.CmpType = ECondCmpType(0);
        this.CmpValue = 0;
        this.CondType = ECondType(0);
        this.__InitDefaults();
        return;
    }
    UScriptStruct GetCondRefDataType() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        return nullptr;
    }
    const TArray<TDataObjectPtr<FDataObject>> GetRefData() const property
    {
        const TArray<TDataObjectPtr<FDataObject>> __r;
        return __r;
    }
    void SetRefData(const TArray<TDataObjectPtr<FDataObject>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FDataObject>>> local_2;
        this.m_RefData = local_2;
        return;
    }
}

struct FGsConditionGroupConfig : FServerConditionConfigBase
{
    FServerConditionConfigBase _base_FServerConditionConfigBase;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ECondGroupLogicType LogicType;
    UPROPERTY()
    TArray<FDataObjectPtr> m_CondVec;

    default ConfigType = EConditionConfigType(1);

    FGsConditionGroupConfig()
    {
        super();
        this.DataId = 0;
        this.LogicType = ECondGroupLogicType(0);
        this.__InitDefaults();
        return;
    }
    const TArray<TDataObjectPtr<FConditionConfig>> GetCondVec() const property
    {
        const TArray<TDataObjectPtr<FConditionConfig>> __r;
        return __r;
    }
    void SetCondVec(const TArray<TDataObjectPtr<FConditionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FConditionConfig>>> local_2;
        this.m_CondVec = local_2;
        return;
    }
}

