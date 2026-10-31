enum EItemDisplayType
{
    None,
    Normal,
    Rectangle,
    High,
}

enum EDisplayItemIconType
{
    Common,
    High,
}

enum EItemDisplayFeature
{
    None,
    Count,
    Level,
    EquipMark,
    RedDot,
    New,
    Mask,
    Tag,
    Grade,
    SpecialProps,
    SpecialBg,
}

enum EItemDisplayScenario
{
    Default,
    Inventory,
    Shop,
    Reward,
    Equipment,
    AvatarEquipSlotEntry,
    Forge,
    AvatarWardrobe,
    AvatarWardrobeSlotEntry,
}

struct FItemDisplayTypeConfig
{
    UPROPERTY()
    TMap<EItemDisplayFeature, TSoftClassPtr<UEUIUserWidget>> FeatureWidgetMap;

    FItemDisplayTypeConfig()
    {
        return;
    }
}

struct FItemScenarioConfig
{
    UPROPERTY()
    TArray<EItemDisplayFeature> ActiveFeatures;
    UPROPERTY()
    TArray<EItemDisplayFeature> ExcludeFeatures;

    FItemScenarioConfig()
    {
        return;
    }
}

UCLASS(Abstract)
class UItemFeatureConditionBase : UObject
{
    UItemFeatureConditionBase()
    {
        return;
    }
    bool IsConditionMet(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        return true;
    }
}

class UItemWidgetFeatureRegistrySettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<EItemDisplayType, FItemDisplayTypeConfig> FeatureConfigs;
    UPROPERTY()
    TMap<EItemDisplayScenario, FItemScenarioConfig> ScenarioConfigs;
    UPROPERTY()
    TArray<EItemDisplayFeature> DefaultActiveFeatures;
    UPROPERTY()
    TMap<EItemDisplayFeature, UItemFeatureConditionBase> FeatureConditions;

    UItemWidgetFeatureRegistrySettings()
    {
        return;
    }
    bool IsFeatureConditionMet(const EItemDisplayFeature Feature, const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        UItemFeatureConditionBase local_2;
        if (this.FeatureConditions.Find(Feature, local_2) && (local_2 != nullptr))
        {
            return local_2.IsConditionMet(ItemData);
        }
        return true;
    }
    TSoftClassPtr<UEUIUserWidget> GetWidgetClassForFeature(const EItemDisplayType DisplayType, const EItemDisplayFeature Feature) const
    {
        FItemDisplayTypeConfig local_20;
        if (!(this.FeatureConfigs.Find(DisplayType, local_20)))
        {
            return TSoftClassPtr<UEUIUserWidget>();
        }
        TSoftClassPtr<UEUIUserWidget> local_42;
        if (local_20.FeatureWidgetMap.Find(Feature, local_42))
        {
            return local_42;
        }
        return local_42;
    }
    TArray<EItemDisplayFeature> GetActiveFeaturesForScenario(const EItemDisplayScenario Scenario) const
    {
        FItemScenarioConfig local_8;
        bool local_10 = this.ScenarioConfigs.Find(Scenario, local_8);
        TArray<EItemDisplayFeature> local_14;
        for (auto local_27 : this.DefaultActiveFeatures)
        {
            if (local_10 && local_8.ExcludeFeatures.Contains(local_27))
            {
                continue;
            }
            local_14.AddUnique(local_27);
        }
        if (local_10)
        {
            for (auto local_27 : local_8.ActiveFeatures)
            {
                if (local_8.ExcludeFeatures.Contains(local_27))
                {
                    continue;
                }
                local_14.AddUnique(local_27);
            }
        }
        return local_14;
    }
    bool IsFeatureActive(const EItemDisplayScenario Scenario, const EItemDisplayFeature Feature) const
    {
        return this.GetActiveFeaturesForScenario(EItemDisplayScenario(Scenario)).Contains(Feature);
    }
}

