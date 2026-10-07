
enum ESystemModule
{
    Common,
    Partner,
    Avatar,
    DivineSkill,
    Talent,
    ModeEntrance,
    Chat,
    AccountLevel,
    Mail,
    Tailsman,
    Map,
    Team,
    Friend,
    Commission,
    Shop,
    Inventory,
    Forge,
    Craft,
    Fashion,
    Menu,
    Motion,
    PartnerAssist = 101,
    AvatarCareer,
    AvatarTraining,
    MapWorld,
    TeamCreate,
    TeamExit,
    FriendDelete,
    FriendChat,
    CommissionQuest,
    CommissionNormal,
    CommissionChallenge,
    CommissionNight,
    CommissionActive,
    ModeEntrancePVX,
    ModeEntrancePVP,
    InventoryQuickSlot,
    FashionMount,
    HealHerbs,
}


struct FSystemControlConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ESystemModule SystemModule;
    UPROPERTY()
    uint UnlockLevel;
    UPROPERTY()
    FDataObjectPtr m_Condition;
    UPROPERTY()
    TArray<FDataObjectPtr> m_LockWidgetConfigList;
    UPROPERTY()
    bool bShowUnlockMessageHint = true;
    UPROPERTY()
    FText ForbiddenTips;
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FSoftBrush UnlockIcon;
    UPROPERTY()
    FText Content;
    UPROPERTY()
    FEUIWidgetTag EntranceWidget;
    UPROPERTY()
    FEUIInputAction EntranceInput;
    UPROPERTY()
    bool bHasHUDEntrance;
    UPROPERTY()
    FDataObjectPtr m_RedPointCfg;
    UPROPERTY()
    TArray<int64> ExtraArgs;
    UPROPERTY()
    TArray<ELevelType> AllowedScenes;
    UPROPERTY()
    FDataObjectPtr m_RefreshRuleConfig;


    const TDataObjectPtr<FServerConditionConfigBase> GetCondition() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_Condition = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FEUIWidgetConfig>> GetLockWidgetConfigList() const property
    {
        const TArray<TDataObjectPtr<FEUIWidgetConfig>> __r;
        return __r;
    }
    void SetLockWidgetConfigList(const TArray<TDataObjectPtr<FEUIWidgetConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FEUIWidgetConfig>>> local_2;
        this.m_LockWidgetConfigList = local_2;
        return;
    }
    const TDataObjectPtr<FRedPointConfig> GetRedPointCfg() const property
    {
        const TDataObjectPtr<FRedPointConfig> __r;
        return __r;
    }
    void SetRedPointCfg(const TDataObjectPtr<FRedPointConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRedPointConfig>> local_2;
        this.m_RedPointCfg = local_2;
        return;
    }
    TDataObjectPtr<FRefreshRuleConfig> GetRefreshRuleConfig() const property
    {
        TDataObjectPtr<FRefreshRuleConfig> __r;
        return __r;
    }
    void SetRefreshRuleConfig(const TDataObjectPtr<FRefreshRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRefreshRuleConfig>> local_2;
        this.m_RefreshRuleConfig = local_2;
        return;
    }
}

