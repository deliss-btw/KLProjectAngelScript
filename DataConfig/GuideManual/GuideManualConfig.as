
enum EGuidePageAssetType
{
    Picture = 1,
    Animation,
    Video,
}

enum EGuideManualType
{
    PopupOnly,
    PopupAndManual,
    HintAndManual,
    ManualOnly,
    None,
    NoActionHintAndManual,
}

enum EGuideManualTab
{
    System = 1,
    Gameplay,
    Combat,
    Character,
    Other,
}


struct FGuidePageConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int PageId;
    UPROPERTY()
    EGuidePageAssetType AssetType = EGuidePageAssetType(1);
    UPROPERTY()
    FSoftBrush AssetImage;
    UPROPERTY()
    UMediaSource AssetVideo = nullptr;
    UPROPERTY()
    FText Desc;


}

struct FGuideGroupConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int GroupId;
    UPROPERTY()
    TArray<FDataObjectPtr> m_ActiveConds;
    UPROPERTY()
    TArray<FClientConditionGroup> ClientConditions;
    UPROPERTY()
    EGuideManualType IsInManual = EGuideManualType(0);
    UPROPERTY()
    FText Name;
    UPROPERTY()
    EGuideManualTab ManualTab = EGuideManualTab(1);
    UPROPERTY()
    int SortOrder;
    UPROPERTY()
    TArray<FDataObjectPtr> m_GuidePageList;


    const TArray<TDataObjectPtr<FServerConditionConfigBase>> GetActiveConds() const property
    {
        const TArray<TDataObjectPtr<FServerConditionConfigBase>> __r;
        return __r;
    }
    void SetActiveConds(const TArray<TDataObjectPtr<FServerConditionConfigBase>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FServerConditionConfigBase>>> local_2;
        this.m_ActiveConds = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FGuidePageConfig>> GetGuidePageList() const property
    {
        const TArray<TDataObjectPtr<FGuidePageConfig>> __r;
        return __r;
    }
    void SetGuidePageList(const TArray<TDataObjectPtr<FGuidePageConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FGuidePageConfig>>> local_2;
        this.m_GuidePageList = local_2;
        return;
    }
}

struct FGuideManualTabSetting
{
    UPROPERTY()
    EGuideManualTab Tab = EGuideManualTab(1);
    UPROPERTY()
    FText TabName;
    UPROPERTY()
    FSoftBrush Icon;


}

class UGuideManualSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TArray<FGuideManualTabSetting> TabSettings;
    UPROPERTY()
    FEUIInputAction HintInputAction;
    UPROPERTY()
    float32 HintCountdownSeconds = 3.0f;
    UPROPERTY()
    float32 TutorialCompletionLingerSeconds = 1.9f;


}

struct FTutorialStepInfo
{
    UPROPERTY()
    FText DescKey;

    FTutorialStepInfo()
    {
        return;
    }
}

struct FTutorialInfoConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FTutorialStepInfo> Steps;
    UPROPERTY()
    FText ExtraDescKey;

    FTutorialInfoConfig()
    {
        return;
    }
}

