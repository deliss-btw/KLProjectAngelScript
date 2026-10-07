
enum ETestEnumType
{
    None,
    TEST,
    MaxCount,
}


struct FTestStruct
{
    UPROPERTY()
    FString First;
    UPROPERTY()
    int Second;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    TArray<TDataObjectPtr<FItemConfig>> ItemList;


}

struct FTestMemberStruct
{
    UPROPERTY()
    FString First;
    UPROPERTY()
    int Second;
    UPROPERTY()
    int Third;


}

struct FTestItemParam
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    uint Cnt;
    UPROPERTY()
    TArray<TDataObjectPtr<FItemConfig>> ItemList;


}

struct FTestConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText ServerText;
    UPROPERTY()
    FInstancedPropertyBag MyBag;
    UPROPERTY()
    FText ClientText;
    UPROPERTY()
    ETestEnumType TestType;
    UPROPERTY()
    FTestStruct TestStruct;
    UPROPERTY()
    TArray<FTestItemParam> ItemParamList;


}

struct FTestFatherConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText ServerText;
    UPROPERTY()
    FDataObjectPtr m_TestConfigItem;


    const TDataObjectPtr<FTestConfig> GetTestConfigItem() const property
    {
        const TDataObjectPtr<FTestConfig> __r;
        return __r;
    }
    void SetTestConfigItem(const TDataObjectPtr<FTestConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTestConfig>> local_2;
        this.m_TestConfigItem = local_2;
        return;
    }
}

