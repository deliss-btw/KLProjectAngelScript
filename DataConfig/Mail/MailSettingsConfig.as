

struct FMailSettingsConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int Capacity;
    UPROPERTY()
    int DefaultExpireDays;
    UPROPERTY()
    FDataObjectPtr m_ItemExceedLimitMail;


    const TDataObjectPtr<FMailConfig> GetItemExceedLimitMail() const property
    {
        const TDataObjectPtr<FMailConfig> __r;
        return __r;
    }
    void SetItemExceedLimitMail(const TDataObjectPtr<FMailConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMailConfig>> local_2;
        this.m_ItemExceedLimitMail = local_2;
        return;
    }
}

