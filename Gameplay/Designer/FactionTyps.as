
enum EFaction
{
    None,
    NATIVE_MAX = 0,
    Player,
    Invader,
    SimpleProp,
    SimpleAnimal,
    Monster,
    Boss,
    Shadow,
    QiongQi,
    Wolf,
    Lili,
    Dani,
    Qinyuan,
    NPCHuman,
    NPCVillageHuman,
    NPCBandit,
    NPCRefugee,
    Weather,
    HarbingerOfDoom,
    PlayerFriendlyProp,
    Mount,
    TheLostBeast,
    YingLong,
    BanditSui,
    EnchantedSui,
    TombRobber,
    Revenant,
    JinWu,
    PVX_Common_Enemy,
    PVX_Common_FinalBoss,
    PVX_Common_MonsterPlayerControl,
    RandomEchoBoss,
    RevenantBoss,
    Max,
}


struct FDamageFactionRelationConfig
{
    UPROPERTY()
    EFactionRelation Player = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Invader = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation SimpleProp = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation SimpleAnimal = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Monster = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation PlayerFriendlyProp = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Mount = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Boss = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation NPCHuman = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation NPCVillageHuman = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation NPCBandit = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation NPCRefugee = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Weather = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Shadow = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation QiongQi = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Wolf = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Lili = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation YingLong = EFactionRelation(2);
    UPROPERTY()
    EFactionRelation Dani = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Qinyuan = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation HarbingerOfDoom = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation TheLostBeast = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation BanditSui = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation EnchantedSui = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation TombRobber = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation Revenant = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation JinWu = EFactionRelation(2);
    UPROPERTY()
    EFactionRelation PVX_Common_Enemy = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation PVX_Common_FinalBoss = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation PVX_Common_MonsterPlayerControl = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation RandomEchoBoss = EFactionRelation(1);
    UPROPERTY()
    EFactionRelation RevenantBoss = EFactionRelation(1);


    TArray<EFactionRelation> ToRelationArray()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        TArray<EFactionRelation> __r; return __r;
    }
}

