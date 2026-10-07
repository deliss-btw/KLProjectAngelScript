

struct FMarkIconConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> IconWidget;
    UPROPERTY()
    TSoftObjectPtr<UTexture2D> IconTexture;
    UPROPERTY()
    FSoftBrush IconBrush;
    UPROPERTY()
    FLinearColor SelfColor;
    UPROPERTY()
    FLinearColor TeammateColor;

    FMarkIconConfig()
    {
        return;
    }
}

struct FMarkPoolConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int MaxNum = 1;


}

struct FMarkConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_MarkPool;
    UPROPERTY()
    FDataObjectPtr m_PresentationConfig;
    UPROPERTY()
    bool bShowDistanceInNavigationBar = true;
    UPROPERTY()
    bool bShareWithTeammates = true;
    UPROPERTY()
    bool bDisableManuallyRemove;
    UPROPERTY()
    bool bRemoveWhenNoLongerGuidingTarget;
    UPROPERTY()
    float32 RemoveWhenCreaterApproachDistance = -1.0f;


    const TDataObjectPtr<FMarkPoolConfig> GetMarkPool() const property
    {
        const TDataObjectPtr<FMarkPoolConfig> __r;
        return __r;
    }
    void SetMarkPool(const TDataObjectPtr<FMarkPoolConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMarkPoolConfig>> local_2;
        this.m_MarkPool = local_2;
        return;
    }
    TDataObjectPtr<FPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FPresentationConfig> __r;
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPresentationConfig>> local_2;
        this.m_PresentationConfig = local_2;
        return;
    }
}

class UMarkSettings : UGameplaySettingsBase
{
    UPROPERTY()
    FEUIInputAction ViewportFastMarkAction;
    UPROPERTY()
    float32 PositionMark2DIconZOffset;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> PositionMarkPresentationRule;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> TeammatePositionMarkPresentationRule;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> MarkedEntityPresentationRule;
    UPROPERTY()
    TMap<FGameplayTag, TDataObjectPtr<FPresentationRuleConfig>> MarkedEntityPresentationRuleBySpotTypeOverrides;
    UPROPERTY()
    TSubclassOf<AMarkPrefab> MarkPrefab;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> FastMarkConfig;
    UPROPERTY()
    TMap<FGameplayTag, TDataObjectPtr<FMarkConfig>> FastMarkBySpotTypeOverrides;
    UPROPERTY()
    bool bMinimapAllowMarkEntity;
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> MinimapTempMark;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> MinimapTempMarkDialog;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> MinimapTempMarkTips;
    UPROPERTY()
    bool bCanEditConstantMark;
    UPROPERTY()
    TArray<TDataObjectPtr<FMarkConfig>> MinimapMarkIcons;
    UPROPERTY()
    int DefaultMinimapMarkIconIndex;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> MinimapMarkDialog;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> MinimapConstantMarkTips;
    UPROPERTY()
    bool bShowTeammateMarkInNavigationBar;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> MinimapMarkTips;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SocialDungeonMinimapMarkTips;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> WorldEventMinimapMarkTips;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> RegionEventMinimapMarkTips;

    UMarkSettings()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

