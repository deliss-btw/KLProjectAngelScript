
enum EStigmataType
{
    None,
    Modifier,
    SystemControl,
    AddHealLimit,
    MaxCount,
}


struct FStigmataAddHealLimitConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int Value = 1;


}

struct FStigmataConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    uint RoleLevel;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockCondition;
    UPROPERTY()
    TArray<FItemParamConfig> UnlockCost;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText Instructions;
    UPROPERTY()
    FSoftBrush NodeIcon;
    UPROPERTY()
    EStigmataType NodeType;
    UPROPERTY()
    FDataObjectPtr m_NodeEffect;


    UScriptStruct GetNodeDataType() const
    {
        int local_2 = int(this.NodeType);
        if (local_2 <= 3)
        {
            if (local_2 != 1)
            {
                if (local_2 != 3)
                {
                }
            }
            else
            {
                return FGameplayModifierConfig;
            }
        }
        return FDataObject;
    }
    const TArray<TDataObjectPtr<FServerConditionConfigBase>> GetUnlockCondition() const property
    {
        const TArray<TDataObjectPtr<FServerConditionConfigBase>> __r;
        return __r;
    }
    void SetUnlockCondition(const TArray<TDataObjectPtr<FServerConditionConfigBase>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FServerConditionConfigBase>>> local_2;
        this.m_UnlockCondition = local_2;
        return;
    }
    const TDataObjectPtr<FDataObject> GetNodeEffect() const property
    {
        const TDataObjectPtr<FDataObject> __r;
        return __r;
    }
    void SetNodeEffect(const TDataObjectPtr<FDataObject> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDataObject>> local_2;
        this.m_NodeEffect = local_2;
        return;
    }
}

