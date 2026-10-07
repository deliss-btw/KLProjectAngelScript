

struct FForgeNodeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FString ForgeName;
    UPROPERTY()
    int ForgeLv;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockCondition;
    UPROPERTY()
    TArray<FItemParamConfig> Cost;
    UPROPERTY()
    FDataObjectPtr m_Craft;


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
    const TArray<TDataObjectPtr<FConditionConfig>> GetUnlockCondition() const property
    {
        const TArray<TDataObjectPtr<FConditionConfig>> __r;
        return __r;
    }
    void SetUnlockCondition(const TArray<TDataObjectPtr<FConditionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FConditionConfig>>> local_2;
        this.m_UnlockCondition = local_2;
        return;
    }
    const TDataObjectPtr<FCraftConfig> GetCraft() const property
    {
        const TDataObjectPtr<FCraftConfig> __r;
        return __r;
    }
    void SetCraft(const TDataObjectPtr<FCraftConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCraftConfig>> local_2;
        this.m_Craft = local_2;
        return;
    }
}

