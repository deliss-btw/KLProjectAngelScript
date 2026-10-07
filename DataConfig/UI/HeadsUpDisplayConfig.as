
enum EHeadsUpDisplayType
{
    WorldSpace,
    ScreenSpace,
}

enum EHeadsUpDisplayRelationType
{
    None,
    Teammate,
    Enemy,
}


struct FHeadsUpDisplayConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FPresentationDisplayRule DisplayRule;
    UPROPERTY()
    FPresentationIcon Icon;
    UPROPERTY()
    EHeadsUpDisplayType DisplayType;
    UPROPERTY()
    FPresentationDisplayRule NameDisplayRule;
    UPROPERTY()
    bool bOnlyShowNameWhenSocialInteraction;
    UPROPERTY()
    FPresentationDisplayRule AlwaysShowIconRule;
    UPROPERTY()
    EHeadsUpDisplayRelationType RelationType;
    UPROPERTY()
    FPresentationDisplayRule EnergyDisplayRule;
    UPROPERTY()
    FGameAttributeRef EnergyDisplayRuleAttribute;
    UPROPERTY()
    FGameAttributeRef EnergyDisplayRuleAttributeMax;


}

