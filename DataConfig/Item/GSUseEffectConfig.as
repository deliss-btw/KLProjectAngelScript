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
        return;
    }
}

