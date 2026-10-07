

struct FCommonPopupOccupyRuleConfig
{
    UPROPERTY()
    ECommonPopupOccupyRule DefaultOccupyRule = ECommonPopupOccupyRule(0);
    UPROPERTY()
    TMap<FGameplayTag, ECommonPopupOccupyRule> BehaviorToPreviousPopup;
    UPROPERTY()
    int DefaultPriority = 0;


}

struct FCommonTipsSettings
{
    UPROPERTY()
    FGameplayTag WidgetTag;
    UPROPERTY()
    float32 DefaultTipsLifetime = 2.0f;


}

class UCommonPopupSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<ECommonPopupQueueType, FCommonPopupQueueRule> ShardQueueRules;
    UPROPERTY()
    TMap<ECommonTipsType, FCommonTipsSettings> TipsSettings;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommonDialogWidget;
    UPROPERTY()
    TMap<ECommonDialogAnswerType, FEUIInputAction> CommonDialogAction;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommonRewardDialogWidget;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommonHoverWidget;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommonLoadingWidget;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommonBannerWidget;
    UPROPERTY()
    TMap<EBannerWidgetType, TSoftClassPtr<UEUIUserWidget>> SpecialBannerWidget;
    UPROPERTY()
    float32 DefaultBannerLifetime = 2.0f;
    UPROPERTY()
    float32 BannerOutAnimLifetime = 0.58f;
    UPROPERTY()
    float32 SmallSideHintDisplayInterval = 0.3f;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DefaultSmallSideHintWidget;
    UPROPERTY()
    float32 DefaultSmallSideHintLifetime = 3.0f;
    UPROPERTY()
    float32 LargeSideHintDisplayInterval = 0.3f;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DefaultLargeSideHintWidget;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DefaultLargeSideHintWithActionWidget;
    UPROPERTY()
    float32 DefaultLargeSideHintLifetime = 3.0f;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommonNewsTickerWidget;
    UPROPERTY()
    float32 DefaultNewsTickerLifetime = 5.0f;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PendingConfirmBubbleWidget;
    UPROPERTY()
    float32 PendingConfirmFadeOutTime = 0.5f;
    UPROPERTY()
    TMap<EPendingConfirmFeature, TDataObjectPtr<FPendingConfirmHintConfig>> PendingConfirmConfigs;
    UPROPERTY()
    TMap<FGameplayTag, FCommonPopupOccupyRuleConfig> OccupyRules;
    UPROPERTY()
    ECommonPopupOccupyRule DefaultOccupyRule = ECommonPopupOccupyRule(0);


}

