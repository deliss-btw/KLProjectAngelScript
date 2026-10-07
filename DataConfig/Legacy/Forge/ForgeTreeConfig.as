

struct FForgeTreeData
{
    UPROPERTY()
    TDataObjectPtr<FForgeNodeConfig> NodeConfig;

    FForgeTreeData()
    {
        return;
    }
}

struct FForgeTreeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int Priority;
    UPROPERTY()
    FText ForgeTreeName;
    UPROPERTY()
    FSoftBrush ForgeTreeImage;
    UPROPERTY()
    FSoftBrush ForgeTreeHiddenImage;
    UPROPERTY()
    EWeaponType WeaponType;
    UPROPERTY()
    TArray<FDataObjectPtr> m_ShowCondition;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockCondition;
    UPROPERTY()
    TArray<FForgeTreeData> BranchArray1;
    UPROPERTY()
    TArray<FForgeTreeData> BranchArray2;
    UPROPERTY()
    TArray<FForgeTreeData> BranchArray3;


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
}

