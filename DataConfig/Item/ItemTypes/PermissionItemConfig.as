
enum EPermissionItemType
{
    None,
    DivineSkill,
    Other,
    MaxCount,
}


struct FPermissionItemConfig : FItemConfig
{
    FItemConfig _base_FItemConfig;
    UPROPERTY()
    EPermissionItemType PermissionType;
    UPROPERTY()
    FDataObjectPtr m_UnlockData;

    default ItemType = EItemType(6);

    FPermissionItemConfig()
    {
        super();
        this.PermissionType = EPermissionItemType(0);
        this.__InitDefaults();
        return;
    }
    UScriptStruct GetUnlockDataType() const
    {
        int local_2 = int(this.PermissionType);
        if (local_2 <= 1)
        {
            if (local_2 != 1)
            {
            }
            else
            {
                return FDivineSkillConfig;
            }
        }
        return FDataObject;
    }
    const TDataObjectPtr<FDataObject> GetUnlockData() const property
    {
        const TDataObjectPtr<FDataObject> __r;
        return __r;
    }
    void SetUnlockData(const TDataObjectPtr<FDataObject> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDataObject>> local_2;
        this.m_UnlockData = local_2;
        return;
    }
}

