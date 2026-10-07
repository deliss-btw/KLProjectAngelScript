

struct FMetaBuffConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    EMetaBuffSlot MetaBuffSlot;
    UPROPERTY()
    int Duration;


}

struct FMetaBuffCapabilityConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_CapabilityConfig;
    UPROPERTY()
    int Level = 1;


    const TDataObjectPtr<FCapabilityConfig> GetCapabilityConfig() const property
    {
        const TDataObjectPtr<FCapabilityConfig> __r;
        return __r;
    }
    void SetCapabilityConfig(const TDataObjectPtr<FCapabilityConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCapabilityConfig>> local_2;
        this.m_CapabilityConfig = local_2;
        return;
    }
}

namespace FMetaBuffCapabilityConfig
{
TDataObjectPtr<FMetaBuffCapabilityConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FMetaBuffCapabilityConfig>();
}
}
namespace FMetaBuffConfig
{
TDataObjectPtr<FMetaBuffConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FMetaBuffConfig>();
}
}
