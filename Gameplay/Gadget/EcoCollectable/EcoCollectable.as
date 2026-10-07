

struct FIndicesArray
{
    UPROPERTY()
    TArray<int> Indices;

    FIndicesArray()
    {
        return;
    }
}

namespace EcoCollectable
{
struct FEcoCollectablePointBakedDataItem
{
    UPROPERTY()
    TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> m_CreatureDef;
    UPROPERTY()
    int m_BakedOrderIndex;


    const TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> GetCreatureDef() const property
    {
        const TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> __r;
        return __r;
    }
    TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> GetCreatureDef() property
    {
        TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> __r;
        return __r;
    }
    void SetCreatureDef(const TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> &inout __Value) property
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

struct FEcoCollectableBakedData
{
    UPROPERTY()
    int m_BakeDataIndex;
    UPROPERTY()
    TArray<EcoCollectable::FEcoCollectablePointBakedDataItem> m_PointBakedData;


    int GetBakeDataIndex() const property
    {
        return this.m_BakeDataIndex;
    }
    void SetBakeDataIndex(const int __Value) property
    {
        this.m_BakeDataIndex = __Value;
        return;
    }
    const TArray<EcoCollectable::FEcoCollectablePointBakedDataItem> GetPointBakedData() const property
    {
        const TArray<EcoCollectable::FEcoCollectablePointBakedDataItem> __r;
        return __r;
    }
    TArray<EcoCollectable::FEcoCollectablePointBakedDataItem> GetPointBakedData() property
    {
        TArray<EcoCollectable::FEcoCollectablePointBakedDataItem> __r;
        return __r;
    }
    void SetPointBakedData(const TArray<EcoCollectable::FEcoCollectablePointBakedDataItem> &inout __Value) property
    {
        this.m_PointBakedData = __Value;
        return;
    }
}

struct FEcoCollectableCreatureAndCountRangeDef
{
    UPROPERTY()
    TDataObjectPtr<FEcoCollectableCreatureDefinitionRow> EcoCollectableCreatureDef;
    UPROPERTY()
    int MinCount;
    UPROPERTY()
    int MaxCount;


}

struct FCreatureDefToIndicesMap
{
    UPROPERTY()
    TMap<TDataObjectPtr<FEcoCollectableCreatureDefinitionRow>, FIndicesArray> Map;

    FCreatureDefToIndicesMap()
    {
        return;
    }
}

}
