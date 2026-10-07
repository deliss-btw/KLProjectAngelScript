

struct FCookRecipeRuntime
{
    UPROPERTY()
    FFoodCraftConfig Recipe;
    UPROPERTY()
    int LoadOrder = 0;


}

struct FCookOutcome
{
    UPROPERTY()
    bool bSuccess = false;
    UPROPERTY()
    int EnergyTotal = 0;
    UPROPERTY()
    int TierLevel = 1;
    UPROPERTY()
    TDataObjectPtr<FFoodProductConfig> ProductFood;
    UPROPERTY()
    TArray<TDataObjectPtr<FGameplayModifierConfig>> Modifiers;


}

namespace FCookUtils
{
int CalcEnergyTotal(const TArray<TDataObjectPtr<FItemConfig>> &inout Items)
{
    FGameplayTag local_20;
    int local_1 = 0;
    for (auto& local_18 : Items)
    {
        if (!(local_18))
        {
            continue;
        }
        if (!(local_20.MatchesTag(GameplayTags::ItemCategory_Material_Cook)))
        {
            continue;
        }
        TDataObjectPtr<FCookMaterialConfig> local_44 = TDataObjectPtr<FCookMaterialConfig>(local_18.opImplConv());
        FCookMaterialConfig local_70;
        local_1 = local_1 + int(local_70.EnergyAbundance);
    }
    return local_1;
}
bool LookupEnergyTier(const TArray<FCookEnergyThresholdConfig> &inout Tiers, const int TotalEnergy, int &inout OutTierLevel)
{
    for (auto& local_16 : Tiers)
    {
        if ((TotalEnergy >= int(local_16.MinAbundance) && (TotalEnergy < int(local_16.MaxAbundance))))
        {
            OutTierLevel = FMath::Clamp(int(local_16.AbundanceTierLevel), 1, 4);
            return true;
        }
    }
    return false;
}
TMap<FGameplayTag, int> CollectCookTagSums(const TArray<TDataObjectPtr<FItemConfig>> &inout Items)
{
    FGameplayTag local_38;
    int local_88;
    TMap<FGameplayTag, int> local_20;
    int local_108 = 0;
    for (auto& local_36 : Items)
    {
        if (!(local_36))
        {
            continue;
        }
        if (!(local_38.MatchesTag(GameplayTags::ItemCategory_Material_Cook)))
        {
            continue;
        }
        TDataObjectPtr<FCookMaterialConfig> local_62 = TDataObjectPtr<FCookMaterialConfig>(local_36.opImplConv());
        for (auto& local_106 : local_88.CookTags)
        {
            int local_107 = 0;
            local_20.Find(local_106.GetKey(), local_107);
            local_108 = local_107 + local_108;
            local_20.Add(local_106.GetKey(), local_108);
        }
    }
    return local_20;
}
int MatchBestRecipeIndex(const TArray<FCookRecipeRuntime> &inout SortedRecipes, const TMap<FGameplayTag, int> &inout TagSums)
{
    int local_1 = 0;
    for (; local_1 < SortedRecipes.Num(); ++local_1)
    {
        if (SortedRecipes[local_1].Recipe.Match(TagSums))
        {
            return local_1;
        }
    }
    return -1;
}
void AppendIngredientTierAttributes(const FCookMaterialConfig &inout Mat, const int TierLevel, TMap<ECookStatType, int> &inout InOutSums)
{
    int local_4 = FMath::Clamp(TierLevel, 1, 4);
    TArray<FCookIngredientAttribute> local_8;
    if (local_4 == 1)
    {
        local_8 = Mat.AbundanceTier1Attributes;
    }
    else
    {
        if (local_4 == 2)
        {
            local_8 = Mat.AbundanceTier2Attributes;
        }
        else
        {
            if (local_4 == 3)
            {
                local_8 = Mat.AbundanceTier3Attributes;
            }
            else
            {
                local_8 = Mat.AbundanceTier4Attributes;
            }
        }
    }
    for (auto& local_24 : local_8)
    {
        int local_25 = 0;
        InOutSums.Find(local_24.StatType, local_25);
        InOutSums.Add(local_24.StatType, local_25 + int(local_24.Value));
    }
    return;
}
TMap<ECookStatType, int> SumStatContributions(const TArray<TDataObjectPtr<FItemConfig>> &inout Items, const int TierLevel)
{
    FGameplayTag local_38;
    TMap<ECookStatType, int> local_20;
    int local_88 = 0;
    for (auto& local_36 : Items)
    {
        if (!(local_36))
        {
            continue;
        }
        if (!(local_38.MatchesTag(GameplayTags::ItemCategory_Material_Cook)))
        {
            continue;
        }
        TDataObjectPtr<FCookMaterialConfig> local_62 = TDataObjectPtr<FCookMaterialConfig>(local_36.opImplConv());
        FCookUtils::AppendIngredientTierAttributes(local_88, TierLevel, local_20);
    }
    return local_20;
}
TDataObjectPtr<FGameplayModifierConfig> LookupStatModifier(const TArray<FCookStatModifierLadderConfig> &inout Ladder, const ECookStatType StatType, const int Sum)
{
    TDataObjectPtr<FGameplayModifierConfig> local_24;
    int local_25 = -1;
    for (auto& local_42 : Ladder)
    {
        if (int(local_42.StatType) != int(StatType))
        {
            continue;
        }
        if ((int(local_42.LookupValue) <= Sum && (int(local_42.LookupValue) > local_25)))
        {
            local_25 = int(local_42.LookupValue);
            local_24 = local_42.GetModifier();
        }
    }
    return local_24;
}
FCookOutcome ResolveCookOutcome(const TArray<FCookRecipeRuntime> &inout SortedRecipes, const TArray<FCookEnergyThresholdConfig> &inout Tiers, const TArray<FCookStatModifierLadderConfig> &inout Ladder, const TArray<TDataObjectPtr<FItemConfig>> &inout Items)
{
    FCookOutcome local_32;
    FCookOutcome __r;
    if (Items.Num() != 4)
    {
        XError(ELog(46), FString().Append("[Cook] ResolveCookOutcome rejected: ingredient count must be 4, Current=").Append(Items.Num()));
    }
    else
    {
        local_32.EnergyTotal = FCookUtils::CalcEnergyTotal(Items);
        if (!(FCookUtils::LookupEnergyTier(Tiers, int(local_32.EnergyTotal), local_32.TierLevel)))
        {
            XError(ELog(46), FString().Append("[Cook] ResolveCookOutcome: LookupEnergyTier failed. EnergyTotal=").Append(local_32.EnergyTotal).Append(". Check DT_CookEnergyThreshold range coverage."));
        }
        else
        {
            TMap<ECookStatType, int> local_82 = FCookUtils::SumStatContributions(Items, int(local_32.TierLevel));
            TArray<ECookStatType> local_86;
            local_86.Add(ECookStatType(0));
            local_86.Add(ECookStatType(1));
            local_86.Add(ECookStatType(2));
            for (auto local_101 : local_86)
            {
                int local_102 = 0;
                local_82.Find(local_101, local_102);
                TDataObjectPtr<FGameplayModifierConfig> local_126 = FCookUtils::LookupStatModifier(Ladder, ECookStatType(local_101), local_102);
                if ((!((local_126 == nullptr))))
                {
                    local_32.Modifiers.Add(local_126);
                }
            }
        }
        TMap<FGameplayTag, int> local_190 = FCookUtils::CollectCookTagSums(Items);
        int local_33 = FCookUtils::MatchBestRecipeIndex(SortedRecipes, local_190);
        if (local_33 < 0)
        {
            XError(ELog(46), "[Cook] ResolveCookOutcome: no FoodCraftConfig matched. Check SDT_FoodCraft fallback recipe (negative Priority + empty RequiredCookTagSums).");
        }
        else
        {
            local_32.ProductFood = SortedRecipes[local_33].Recipe.GetProductFood();
            local_32.bSuccess = (!((local_32.ProductFood == nullptr)));
            XLog(ELog(46), FString().Append("[Cook] ResolveCookOutcome OK. Energy=").Append(local_32.EnergyTotal).Append(", Tier=").Append(local_32.TierLevel).Append(", ModNum=").Append(local_32.Modifiers.Num()));
        }
    }
    return __r;
}
}
