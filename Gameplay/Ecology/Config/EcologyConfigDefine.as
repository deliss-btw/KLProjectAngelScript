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
        this.ConfigRef = ENTITY_ID_NULL;
        return;
    }
    FConfigReference(const FECSEntityId &inout InConfigRef)
    {
        this.ConfigRef = InConfigRef;
        return;
    }
    bool IsValid() const
    {
        return (!((this.ConfigRef == ENTITY_ID_NULL)));
    }
}

