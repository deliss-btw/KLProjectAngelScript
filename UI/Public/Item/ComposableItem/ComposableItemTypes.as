
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
        EItemDisplayFeature local_2;
        if (this.FeatureConditions.Find(Feature, local_2) && (local_2 != nullptr))
        {
            return local_2.IsConditionMet(ItemData);
        }
        return true;
    }
    TSoftClassPtr<UEUIUserWidget> GetWidgetClassForFeature(const EItemDisplayType DisplayType, const EItemDisplayFeature Feature) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        TSoftClassPtr<UEUIUserWidget> __r; return __r;
    }
    TArray<EItemDisplayFeature> GetActiveFeaturesForScenario(const EItemDisplayScenario Scenario) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        TArray<EItemDisplayFeature> __r; return __r;
    }
    bool IsFeatureActive(const EItemDisplayScenario Scenario, const EItemDisplayFeature Feature) const
    {
        return this.GetActiveFeaturesForScenario(EItemDisplayScenario(Scenario)).Contains(Feature);
    }
}

