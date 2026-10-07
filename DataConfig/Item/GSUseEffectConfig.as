

struct FGSUseEffectBase
{
    FGSUseEffectBase()
    {
        return;
    }
}

struct FGSUseEffectUnlockMotion : FGSUseEffectBase
{
    FGSUseEffectBase _base_FGSUseEffectBase;
    UPROPERTY()
    TDataObjectPtr<FMotionData> MotionData;

    FGSUseEffectUnlockMotion()
    {
        super();
        return;
    }
}

struct FGSUseEffectGrantCurrency : FGSUseEffectBase
{
    FGSUseEffectBase _base_FGSUseEffectBase;
    UPROPERTY()
    EVirtualItemType CurrencyType;
    UPROPERTY()
    int Count;


}

struct FGSUseEffectGrantDropItem : FGSUseEffectBase
{
    FGSUseEffectBase _base_FGSUseEffectBase;
    UPROPERTY()
    TDataObjectPtr<FDropItemConfigBase> DropItem;

    FGSUseEffectGrantDropItem()
    {
        super();
        return;
    }
}

struct FGSUseEffectUnlockOutfit : FGSUseEffectBase
{
    FGSUseEffectBase _base_FGSUseEffectBase;
    UPROPERTY()
    TDataObjectPtr<FFashionConfig> FashionData;

    FGSUseEffectUnlockOutfit()
    {
        super();
        return;
    }
}

struct FGSUseEffectGrantReward : FGSUseEffectBase
{
    FGSUseEffectBase _base_FGSUseEffectBase;
    UPROPERTY()
    TDataObjectPtr<FRewardConfig> RewardData;

    FGSUseEffectGrantReward()
    {
        super();
        return;
    }
}

