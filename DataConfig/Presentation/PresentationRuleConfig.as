
enum EPresentationDisplayConditionRequirement
{
    Ignore,
    Yes,
    No,
}

namespace FPresentationDisplayRule
{
    const FPresentationDisplayRule DefaultDisplay = FPresentationDisplayRule();
    const FPresentationDisplayRule DefaultHide = FPresentationDisplayRule();

}
struct FPresentationDisplayRuleBasic
{
    UPROPERTY()
    bool bEnableDisplay = true;
    UPROPERTY()
    float32 MinDistance = 0.0f;
    UPROPERTY()
    float32 MaxDistance = 0.0f;


    bool opEquals(const FPresentationDisplayRuleBasic &inout Other) const
    {
        bool local_1 = !(this.bEnableDisplay);
        bool local_2 = !(Other.bEnableDisplay);
        local_1 = local_1 == local_2 && (this.MinDistance == Other.MinDistance);
        local_1 = local_1 && (this.MaxDistance == Other.MaxDistance);
        return local_1;
    }
}

struct FPresentationDisplayCondition
{
    UPROPERTY()
    EPresentationDisplayConditionRequirement PlayerInCombat;
    UPROPERTY()
    EPresentationDisplayConditionRequirement EntityInCombat;


    bool opEquals(const FPresentationDisplayCondition &inout Other) const
    {
        return (int(this.PlayerInCombat) == int(Other.PlayerInCombat) && (int(this.EntityInCombat) == int(Other.EntityInCombat)));
    }
}

struct FPresentationDisplayConditionalRule
{
    UPROPERTY()
    FPresentationDisplayCondition Condition;
    UPROPERTY()
    FPresentationDisplayRuleBasic Rule;

    FPresentationDisplayConditionalRule()
    {
        return;
    }
    bool opEquals(const FPresentationDisplayConditionalRule &inout Other) const
    {
        FPresentationDisplayCondition local_2;
        local_2 = this;
        return ((local_2 == Other.Condition) && (this.Rule == Other.Rule));
    }
}

struct FPresentationDisplayRule
{
    UPROPERTY()
    bool bEnableDisplay = true;
    UPROPERTY()
    float32 MinDistance = 0.0f;
    UPROPERTY()
    float32 MaxDistance = 0.0f;
    UPROPERTY()
    TArray<FPresentationDisplayConditionalRule> ConditionalRules;
    UPROPERTY()
    bool bDisplayOnlyInCombat;

    FPresentationDisplayRule(const bool bInEnableDisplay, const float32 InMinDistance = 0, const float32 InMaxDistance = 0, const bool bInDisplayOnlyInCombat = false)
    {
        this.bEnableDisplay = bInEnableDisplay;
        this.MinDistance = InMinDistance;
        this.MaxDistance = InMaxDistance;
        this.bDisplayOnlyInCombat = bInDisplayOnlyInCombat;
        return;
    }
    bool opEquals(const FPresentationDisplayRule &inout Other) const
    {
        if (!(this.bEnableDisplay) != !(Other.bEnableDisplay))
        {
            return false;
        }
        if (this.MinDistance != Other.MinDistance)
        {
            return false;
        }
        if (this.MaxDistance != Other.MaxDistance)
        {
            return false;
        }
        if (!(this.bDisplayOnlyInCombat) != !(Other.bDisplayOnlyInCombat))
        {
            return false;
        }
        if (this.ConditionalRules.Num() != Other.ConditionalRules.Num())
        {
            return false;
        }
        int local_7 = 0;
        for (; local_7 < this.ConditionalRules.Num(); ++local_7)
        {
            FPresentationDisplayConditionalRule local_14;
            local_14 = this.ConditionalRules[local_7];
            if (!((local_14 == Other.ConditionalRules[local_7])))
            {
                return false;
            }
        }
        return true;
    }
    uint Hash() const
    {
        int local_1 = HashCombineFast((HashCombineFast((this.bEnableDisplay ? 1 : 0), uint(int(this.MinDistance)))), uint(int(this.MaxDistance)));
        int local_4 = this.bDisplayOnlyInCombat ? 1 : 0;
        local_1 = HashCombineFast(local_1, local_4);
        local_1 = HashCombineFast(local_1, this.ConditionalRules.Num());
        int local_7 = 0;
        for (; local_7 < this.ConditionalRules.Num(); )
        {
            local_1 = HashCombineFast(local_1, int(this.ConditionalRules[local_7].Condition.PlayerInCombat));
            local_1 = HashCombineFast(local_1, int(this.ConditionalRules[local_7].Condition.EntityInCombat));
            int local_3 = this.ConditionalRules[local_7].Rule.bEnableDisplay ? 1 : 0;
            local_1 = HashCombineFast(local_1, local_3);
            local_1 = HashCombineFast(local_1, uint(int(this.ConditionalRules[local_7].Rule.MinDistance)));
            local_1 = HashCombineFast(local_1, uint(int(this.ConditionalRules[local_7].Rule.MaxDistance)));
            ++local_7;
        }
        return local_1;
    }
}

struct FPresentationRuleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    bool bShowMinimapIcon;
    UPROPERTY()
    FDataObjectPtr m_MinimapIconSettings;
    UPROPERTY()
    bool bShowIndicator;
    UPROPERTY()
    FDataObjectPtr m_IndicatorConfig;
    UPROPERTY()
    bool bShowNavigationBarIcon;
    UPROPERTY()
    FDataObjectPtr m_NavigationBarIconConfig;
    UPROPERTY()
    bool bShowHeadsUpDisplay;
    UPROPERTY()
    FDataObjectPtr m_HeadsUpDisplayConfig;


    const TDataObjectPtr<FMinimapIconConfig> GetMinimapIconSettings() const property
    {
        const TDataObjectPtr<FMinimapIconConfig> __r;
        return __r;
    }
    void SetMinimapIconSettings(const TDataObjectPtr<FMinimapIconConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMinimapIconConfig>> local_2;
        this.m_MinimapIconSettings = local_2;
        return;
    }
    TDataObjectPtr<FIndicatorConfig> GetIndicatorConfig() const property
    {
        TDataObjectPtr<FIndicatorConfig> __r;
        return __r;
    }
    void SetIndicatorConfig(const TDataObjectPtr<FIndicatorConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FIndicatorConfig>> local_2;
        this.m_IndicatorConfig = local_2;
        return;
    }
    TDataObjectPtr<FNavigationBarIconConfig> GetNavigationBarIconConfig() const property
    {
        TDataObjectPtr<FNavigationBarIconConfig> __r;
        return __r;
    }
    void SetNavigationBarIconConfig(const TDataObjectPtr<FNavigationBarIconConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNavigationBarIconConfig>> local_2;
        this.m_NavigationBarIconConfig = local_2;
        return;
    }
    TDataObjectPtr<FHeadsUpDisplayConfig> GetHeadsUpDisplayConfig() const property
    {
        TDataObjectPtr<FHeadsUpDisplayConfig> __r;
        return __r;
    }
    void SetHeadsUpDisplayConfig(const TDataObjectPtr<FHeadsUpDisplayConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FHeadsUpDisplayConfig>> local_2;
        this.m_HeadsUpDisplayConfig = local_2;
        return;
    }
}

