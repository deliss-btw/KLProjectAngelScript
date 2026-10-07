
enum ECraftType
{
    Equip,
    Cook,
    Item,
    MaterialShop,
    MaxCount,
}


struct FCraftConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ECraftType CraftType;
    UPROPERTY()
    FItemParamConfig Product;
    UPROPERTY()
    TArray<FItemParamConfig> Cost;
    UPROPERTY()
    bool bCanBatch;
    UPROPERTY()
    bool bDefaultUnlock;
    UPROPERTY()
    FDataObjectPtr m_UnlockCond;
    UPROPERTY()
    FText Note;


    bool ContainsCost(const TDataObjectPtr<FItemConfig> &inout Item) const
    {
        FDataObjectPtr local_40;
        for (auto& local_16 : this.Cost)
        {
            local_16;
            local_40;
            if ((Item == local_40))
            {
                return true;
            }
        }
        return false;
    }
    const TDataObjectPtr<FConditionConfig> GetUnlockCond() const property
    {
        const TDataObjectPtr<FConditionConfig> __r;
        return __r;
    }
    void SetUnlockCond(const TDataObjectPtr<FConditionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FConditionConfig>> local_2;
        this.m_UnlockCond = local_2;
        return;
    }
}

