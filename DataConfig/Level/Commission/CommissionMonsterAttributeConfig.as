

struct FCommissionAttributeScale
{
    UPROPERTY()
    TMap<TSoftClassPtr<UGameAttribute>, float32> AttributeScale;

    FCommissionAttributeScale()
    {
        return;
    }
}

struct FCommissionMonsterAttributeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TMap<EMonsterRank, FCommissionAttributeScale> MonsterRankConfig;

    FCommissionMonsterAttributeConfig()
    {
        return;
    }
}

