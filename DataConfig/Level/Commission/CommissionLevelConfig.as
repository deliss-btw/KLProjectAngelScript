

struct FCommissionLevelAttackConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int CommissionLevel = 1;
    UPROPERTY()
    float32 Attack = 0.0f;
    UPROPERTY()
    float32 PostureAttack = 0.0f;


}

