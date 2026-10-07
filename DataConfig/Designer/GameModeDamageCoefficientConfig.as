
enum EGameModeDamageCoefficientEntity
{
    None,
    Player,
    ShuiJing,
    PlayerWizard,
    WaiXiangRen,
    Qiong,
    QiongSolarResonance,
    PlayerMan,
    PlayerManWizard,
    PC_Monster_QiongQi,
    MonsterCommon,
    Max,
}


struct FGameModeDamageCoefficientRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EGameModeDamageCoefficientEntity Taker;
    UPROPERTY()
    float32 Player = 1.0f;
    UPROPERTY()
    float32 ShuiJing = 1.0f;
    UPROPERTY()
    float32 PlayerWizard = 1.0f;
    UPROPERTY()
    float32 WaiXiangRen = 1.0f;
    UPROPERTY()
    float32 Qiong = 1.0f;
    UPROPERTY()
    float32 QiongSolarResonance = 1.0f;
    UPROPERTY()
    float32 PlayerMan = 1.0f;
    UPROPERTY()
    float32 PlayerManWizard = 1.0f;
    UPROPERTY()
    float32 PC_Monster_QiongQi = 1.0f;
    UPROPERTY()
    float32 MonsterCommon = 1.0f;


    TArray<float32> ToArray() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        TArray<float32> __r; return __r;
    }
    float32 GetByEntity(const EGameModeDamageCoefficientEntity Entity) const
    {
        TArray<float32> local_8 = this.ToArray();
        int local_10 = int(Entity);
        if (local_10 >= 0 && (local_10 < local_8.Num()))
        {
            return local_8[local_10];
        }
        return 1.0f;
    }
}

