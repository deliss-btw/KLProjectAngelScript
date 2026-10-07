

struct FTalismanSlotConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    uint SlotCount;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockCondition;


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
}

