

namespace EcologyProp
{
struct FEcologyPropPointBakedDataItem
{
    UPROPERTY()
    TDataObjectPtr<FEcologyPropLayoutDef> m_EcologyPropDef;
    UPROPERTY()
    int m_BakedOrderIndex;


    const TDataObjectPtr<FEcologyPropLayoutDef> GetEcologyPropDef() const property
    {
        const TDataObjectPtr<FEcologyPropLayoutDef> __r;
        return __r;
    }
    TDataObjectPtr<FEcologyPropLayoutDef> GetEcologyPropDef() property
    {
        TDataObjectPtr<FEcologyPropLayoutDef> __r;
        return __r;
    }
    void SetEcologyPropDef(const TDataObjectPtr<FEcologyPropLayoutDef> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetBakedOrderIndex() const property
    {
        return this.m_BakedOrderIndex;
    }
    void SetBakedOrderIndex(const int __Value) property
    {
        this.m_BakedOrderIndex = __Value;
        return;
    }
}

struct FEcologyPropBakedData
{
    UPROPERTY()
    int m_BakeDataIndex;
    UPROPERTY()
    TArray<EcologyProp::FEcologyPropPointBakedDataItem> m_PointBakedData;


    int GetBakeDataIndex() const property
    {
        return this.m_BakeDataIndex;
    }
    void SetBakeDataIndex(const int __Value) property
    {
        this.m_BakeDataIndex = __Value;
        return;
    }
    const TArray<EcologyProp::FEcologyPropPointBakedDataItem> GetPointBakedData() const property
    {
        const TArray<EcologyProp::FEcologyPropPointBakedDataItem> __r;
        return __r;
    }
    TArray<EcologyProp::FEcologyPropPointBakedDataItem> GetPointBakedData() property
    {
        TArray<EcologyProp::FEcologyPropPointBakedDataItem> __r;
        return __r;
    }
    void SetPointBakedData(const TArray<EcologyProp::FEcologyPropPointBakedDataItem> &inout __Value) property
    {
        this.m_PointBakedData = __Value;
        return;
    }
}

struct FEcologyPropAndCountRangeDef
{
    UPROPERTY()
    TDataObjectPtr<FEcologyPropLayoutDef> EcologyPropDef;
    UPROPERTY()
    int MinCount;
    UPROPERTY()
    int MaxCount;


}

struct FEcologyPropDefToIndicesMap
{
    UPROPERTY()
    TMap<TDataObjectPtr<FEcologyPropLayoutDef>, FIndicesArray> Map;

    FEcologyPropDefToIndicesMap()
    {
        return;
    }
}

}
