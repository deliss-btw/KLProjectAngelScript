

struct FAttackIgnoreTargetCondition : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FBuffConfigRef> IgnoreByBuff;

    FAttackIgnoreTargetCondition()
    {
        return;
    }
}

