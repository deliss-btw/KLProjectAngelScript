

struct FFashionGlobalConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_DefaultMount;


    const TDataObjectPtr<FMountFashionConfig> GetDefaultMount() const property
    {
        const TDataObjectPtr<FMountFashionConfig> __r;
        return __r;
    }
    void SetDefaultMount(const TDataObjectPtr<FMountFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMountFashionConfig>> local_2;
        this.m_DefaultMount = local_2;
        return;
    }
}

