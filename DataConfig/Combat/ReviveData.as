
enum EKnockdownCond
{
    None,
    All,
    Team,
}

enum EKnockdownHpType
{
    Fixed,
    Percent,
}

enum ERescueType
{
    All,
    Team,
}

enum EReviveType
{
    Situ,
    NearRevive,
    NearTeleport,
    OtherRevive,
    MAX,
}


struct FReviveData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int ReviveID;
    UPROPERTY()
    FString ReviveDes;
    UPROPERTY()
    bool bCanHitOrLockTargetWhenNearDeath;
    UPROPERTY()
    EKnockdownCond KnockdownCond = EKnockdownCond(1);
    UPROPERTY()
    EKnockdownHpType KnockdownHpType = EKnockdownHpType(1);
    UPROPERTY()
    int KnockdownHp = 100;
    UPROPERTY()
    int KnockdownDecHp;
    UPROPERTY()
    FBuffConfigRef KnockdownBuff;
    UPROPERTY()
    int KnockdownTimes;
    UPROPERTY()
    ERescueType RescueType = ERescueType(0);
    UPROPERTY()
    int RescueSkillID;
    UPROPERTY()
    int RescueHP = 100;
    UPROPERTY()
    int RescueBuff;
    UPROPERTY()
    int ReviveCD;
    UPROPERTY()
    int RevivePunishCD;
    UPROPERTY()
    int RevivePunishTime;
    UPROPERTY()
    TArray<EReviveType> ReviveType;
    UPROPERTY()
    int ReviveHp = 100;
    UPROPERTY()
    bool bIsReplyPotion = true;
    UPROPERTY()
    int ReviveBuff;
    UPROPERTY()
    bool bUseOverrideRevivePrefabClass = false;
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> RestPointRevivePrefabClass;


}

