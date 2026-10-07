
enum EMatchMode
{
    PVP,
    PVX,
    PVE_Commission,
}

enum EMatchCamp
{
    None,
    Player,
    Boss,
}

enum EPVXMenuCategoryType
{
    CombatPreparation,
    Match,
}


struct FMatchConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EMatchMode MatchMode;
    UPROPERTY()
    int ConfirmWaitTime = 15;
    UPROPERTY()
    int TeamMergeTime;
    UPROPERTY()
    FDataObjectPtr m_LevelConfig;
    UPROPERTY()
    TArray<FDataObjectPtr> m_OpenPeriods;
    UPROPERTY()
    FText OutOfOpenPeriodTips;
    UPROPERTY()
    FDataObjectPtr m_SystemControlCfg;
    UPROPERTY()
    FText ModeName;
    UPROPERTY()
    FText ModeDesc;
    UPROPERTY()
    FSoftBrush ModeEntranceImage;
    UPROPERTY()
    FSoftBrush ModeEntranceImageBG;
    UPROPERTY()
    TArray<FItemParamConfig> ModeRewards;
    UPROPERTY()
    FGameplayTag WidgetTag;


    TDataObjectPtr<FLevelInfoConfig> GetLevelConfig() const property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    void SetLevelConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FLevelInfoConfig>> local_2;
        this.m_LevelConfig = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FOpenTimeRange>> GetOpenPeriods() const property
    {
        const TArray<TDataObjectPtr<FOpenTimeRange>> __r;
        return __r;
    }
    void SetOpenPeriods(const TArray<TDataObjectPtr<FOpenTimeRange>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FOpenTimeRange>>> local_2;
        this.m_OpenPeriods = local_2;
        return;
    }
    const TDataObjectPtr<FSystemControlConfig> GetSystemControlCfg() const property
    {
        const TDataObjectPtr<FSystemControlConfig> __r;
        return __r;
    }
    void SetSystemControlCfg(const TDataObjectPtr<FSystemControlConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSystemControlConfig>> local_2;
        this.m_SystemControlCfg = local_2;
        return;
    }
}

struct FPvxRewardFactor
{
    UPROPERTY()
    FString CustomEvent;
    UPROPERTY()
    float32 Coefficient;
    UPROPERTY()
    TDataObjectPtr<FRewardConfig> Reward;


}

struct FPvxMatchConfig : FMatchConfig
{
    FMatchConfig _base_FMatchConfig;
    UPROPERTY()
    int MinTeamMemberNum;
    UPROPERTY()
    int MaxTeamMemberNum;
    UPROPERTY()
    int PlayerNum;
    UPROPERTY()
    int PlayerCampNum;
    UPROPERTY()
    int BossNum;
    UPROPERTY()
    int BossCampNum;
    UPROPERTY()
    TArray<FPvxRewardFactor> PvxRewardArray;
    UPROPERTY()
    FText PlayerName;
    UPROPERTY()
    FText BossName;
    UPROPERTY()
    FText PlayerDesc;
    UPROPERTY()
    FText BossDesc;

    default MatchMode = EMatchMode(1);

    FPvxMatchConfig()
    {
        super();
        this.MinTeamMemberNum = 0;
        this.MaxTeamMemberNum = 0;
        this.PlayerNum = 0;
        this.PlayerCampNum = 0;
        this.BossNum = 0;
        this.BossCampNum = 0;
        this.__InitDefaults();
        return;
    }
}

struct FPvpMatchConfig : FMatchConfig
{
    FMatchConfig _base_FMatchConfig;

    default MatchMode = EMatchMode(0);

    FPvpMatchConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FPVXMenuCategorySettings
{
    UPROPERTY()
    FText CategoryName;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PVXPageWidget;
    UPROPERTY()
    FEUIWidgetTag SubPageTag;

    FPVXMenuCategorySettings()
    {
        return;
    }
}

class UPVXEntrySettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<EPVXMenuCategoryType, FPVXMenuCategorySettings> MenuCategories;

    UPVXEntrySettings()
    {
        return;
    }
}

