

struct FBoonRandomSingleTrait
{
    UPROPERTY()
    int Weight = 1;
    UPROPERTY()
    FTraitParam Param;


}

struct FBoonRandomTraitPoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FBoonRandomSingleTrait> TraitParams;

    FBoonRandomTraitPoolConfig()
    {
        return;
    }
}

struct FBoonRandomSingleSlotSinglePool
{
    UPROPERTY()
    int Weight = 1;
    UPROPERTY()
    TDataObjectPtr<FBoonRandomTraitPoolConfig> PoolConfig;


}

struct FBoonRandomSingleSlot
{
    UPROPERTY()
    TArray<FBoonRandomSingleSlotSinglePool> Pools;

    FBoonRandomSingleSlot()
    {
        return;
    }
}

struct FBoonRandomSlotsConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FBoonRandomSingleSlot> Slots;

    FBoonRandomSlotsConfig()
    {
        return;
    }
}

