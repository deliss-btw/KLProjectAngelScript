
enum ECreatureActivityTargetScopeType
{
    SimpleRange,
    Point,
    Voxel,
}


struct FCreatureActivityTargetScopeConfig
{
    UPROPERTY()
    ECreatureActivityTargetScopeType ScopeType;


}

struct FCreatureActivityTargetConfig
{
    UPROPERTY()
    FDataObjectPtr Template;
    UPROPERTY()
    TArray<FCreatureActivityDefintion> Activities;
    UPROPERTY()
    FCreatureActivityTargetScopeConfig Scope;
    UPROPERTY()
    FEcologyConfig Config;

    FCreatureActivityTargetConfig()
    {
        return;
    }
}

class UEcologyBehaviorBase : UEcologyDataAssetBase
{
    UEcologyBehaviorBase()
    {
        return;
    }
}

struct FConfigReference
{
    UPROPERTY()
    FECSEntityId ConfigRef;

    FConfigReference()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FConfigReference(const FECSEntityId &inout InConfigRef)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    bool IsValid() const
    {
        return (!((FECSEntityId(this) == ENTITY_ID_NULL)));
    }
}

