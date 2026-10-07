

struct FItemFeatureConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_ItemConfig;
    UPROPERTY()
    bool bSpecialProps = false;
    UPROPERTY()
    bool bSpecialBg = false;
    UPROPERTY()
    FSoftBrush SpecialBgImage;


    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FItemConfig>> local_2;
        this.m_ItemConfig = local_2;
        return;
    }
}

namespace FItemFeatureConfig
{
FDataObjectPtr FindByKey(const TDataObjectPtr<FItemConfig> &inout Value)
{
    FindByGlobalKeyValue<TDataObjectPtr<FItemConfig>> local_28 = FindByGlobalKeyValue<TDataObjectPtr<FItemConfig>>(__DataObjectStructName(n"FItemFeatureConfig"), Value);
    return local_28.opImplConv();
}
}
