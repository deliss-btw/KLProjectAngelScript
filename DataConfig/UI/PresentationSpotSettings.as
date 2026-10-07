
enum EPresentationSpotUsage
{
    Minimap,
    Indicator,
    NavigationBar,
    HeadUpDisplay,
    MarkViewportDisplay,
    WorldMap,
}


class UPresentationSpotSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TDataObjectPtr<FPresentationConfig> PlayerPresentationConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> LocalPlayerConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> FriendPlayerConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> TeammateConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> EnemyPlayerConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> OtherPlayerConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationConfig> PositionGuideTargetConfig;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> PositionGuideTargetRuleConfig;
    UPROPERTY()
    FSoftBrush NoConfigIcon;

    UPresentationSpotSettings()
    {
        return;
    }
}

