

class ULevelSpotSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<FGameplayTag, TDataObjectPtr<FPresentationRuleConfig>> AutoApplyRuleConfigByTag;

    ULevelSpotSettings()
    {
        return;
    }
}

