
enum ECookStatType
{
    HP,
    SP,
    ATK,
}


struct FCookIngredientAttribute
{
    UPROPERTY()
    ECookStatType StatType = ECookStatType(0);
    UPROPERTY()
    int Value = 0;


}

struct FCookEnergyThresholdConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int MinAbundance = 0;
    UPROPERTY()
    int MaxAbundance = 9999;
    UPROPERTY()
    int AbundanceTierLevel = 1;
    UPROPERTY()
    FText Description;


}

struct FCookStatModifierLadderConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ECookStatType StatType = ECookStatType(0);
    UPROPERTY()
    int LookupValue = 0;
    UPROPERTY()
    FDataObjectPtr m_Modifier;


    const TDataObjectPtr<FGameplayModifierConfig> GetModifier() const property
    {
        const TDataObjectPtr<FGameplayModifierConfig> __r;
        return __r;
    }
    void SetModifier(const TDataObjectPtr<FGameplayModifierConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FGameplayModifierConfig>> local_2;
        this.m_Modifier = local_2;
        return;
    }
}

struct FFoodCostConfig
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    int Num = 1;


}

struct FFoodCostTagConfig
{
    UPROPERTY()
    FGameplayTag FoodTag;
    UPROPERTY()
    int Num;

    FFoodCostTagConfig()
    {
        FGameplayTag::RequestGameplayTag(n"ItemCategory.Material.Cook", true);
        this.Num = 1;
        return;
    }
}

struct FFoodProductConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FSoftBrush ProductIcon;
    UPROPERTY()
    FText ProductName;
    UPROPERTY()
    EItemRarity ProductRarity;
    UPROPERTY()
    int OrderID;
    UPROPERTY()
    FText ProductDescription;
    UPROPERTY()
    FDataObjectPtr m_MetaBuffConfig;


    const TDataObjectPtr<FMetaBuffConfig> GetMetaBuffConfig() const property
    {
        const TDataObjectPtr<FMetaBuffConfig> __r;
        return __r;
    }
    void SetMetaBuffConfig(const TDataObjectPtr<FMetaBuffConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMetaBuffConfig>> local_2;
        this.m_MetaBuffConfig = local_2;
        return;
    }
}

struct FFoodCraftConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    TMap<FGameplayTag, int> RequiredCookTagSums;
    UPROPERTY()
    FDataObjectPtr m_ProductFood;


    bool Match(const TMap<FGameplayTag, int> &inout InvestedTagSums) const
    {
        for (auto& local_20 : this.RequiredCookTagSums)
        {
            int local_21 = 0;
            InvestedTagSums.Find(local_20.GetKey(), local_21);
            if (local_21 < 0)
            {
                return false;
            }
        }
        return true;
    }
    const TDataObjectPtr<FFoodProductConfig> GetProductFood() const property
    {
        const TDataObjectPtr<FFoodProductConfig> __r;
        return __r;
    }
    void SetProductFood(const TDataObjectPtr<FFoodProductConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FFoodProductConfig>> local_2;
        this.m_ProductFood = local_2;
        return;
    }
}

struct FCookBuffModifierConfig
{
    UPROPERTY()
    TArray<TDataObjectPtr<FGameplayModifierConfig>> Modifiers;

    FCookBuffModifierConfig()
    {
        return;
    }
}

struct FCookBuffModifierConfigsWithRarity
{
    UPROPERTY()
    TMap<EItemRarity, FCookBuffModifierConfig> CookModifierConfigsWithRarity;

    FCookBuffModifierConfigsWithRarity()
    {
        return;
    }
}

class UCookSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<TDataObjectPtr<FItemConfig>, FCookBuffModifierConfigsWithRarity> CookModifierConfigs;
    UPROPERTY()
    TArray<FSoftBrush> CookMainCategoryIcons;
    UPROPERTY()
    FName CookPlayerReadyESMTriggerName;
    UPROPERTY()
    FName CookStartESMTriggerName;
    UPROPERTY()
    float32 CookESMTriggerValidataTime = 0.2f;
    UPROPERTY()
    float32 DelayAllReadyEventTime = 4.0f;
    UPROPERTY()
    float32 DelayAutoReadtEventTime = 5.0f;
    UPROPERTY()
    float32 DelayFinishedEventTime = 6.0f;
    UPROPERTY()
    float32 DelayAddMetaBuffAndReset = 10.0f;


    FCookBuffModifierConfig GetCookModifier(const TDataObjectPtr<FItemConfig> &inout Item, const EItemRarity Rarity)
    {
        FCookBuffModifierConfig __r;
        if (this.CookModifierConfigs.Contains(Item))
        {
            if (this.CookModifierConfigs[Item].CookModifierConfigsWithRarity.Contains(Rarity))
            {
            }
            else
            {
            }
        }
        return __r;
    }
}

