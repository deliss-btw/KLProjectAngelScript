

struct FForgeTreeLevelConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int ForgeLv;
    UPROPERTY()
    TArray<FDataObjectPtr> m_ShowCondition;


    const TArray<TDataObjectPtr<FConditionConfig>> GetShowCondition() const property
    {
        const TArray<TDataObjectPtr<FConditionConfig>> __r;
        return __r;
    }
    void SetShowCondition(const TArray<TDataObjectPtr<FConditionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FConditionConfig>>> local_2;
        this.m_ShowCondition = local_2;
        return;
    }
}

