
enum EDifficultyRank
{
    Normal,
    Elite,
    Boss,
    Env,
    NPC = 10,
}


struct FDifficultyAttributeScale
{
    UPROPERTY()
    float32 Attack = 1.0f;
    UPROPERTY()
    float32 HP = 1.0f;
    UPROPERTY()
    float32 Posture = 1.0f;


}

struct FDifficultyLevelAttributeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int Level = 0;
    UPROPERTY()
    TMap<EDifficultyRank, FDifficultyAttributeScale> AttributeByRank;


}

namespace FDifficultyLevelAttributeConfig
{
FDataObjectPtr FindByKey(const int &inout Value)
{
    FindByGlobalKeyValue<int> local_28 = FindByGlobalKeyValue<int>(__DataObjectStructName(n"FDifficultyLevelAttributeConfig"), Value);
    return local_28.opImplConv();
}
}
