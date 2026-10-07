

struct FCommissionPropAttributeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FCommissionAttributeScale AttributeModifierToPlayer;
    UPROPERTY()
    TMap<EMonsterRank, FCommissionAttributeScale> AttributeModifiersToMonster;
    UPROPERTY()
    FCommissionAttributeScale AttributeModifiersOfSelf;

    FCommissionPropAttributeConfig()
    {
        return;
    }
}

