
enum ETalentType
{
    None,
    Foundation,
    FoundationPassive,
    CommonPassive,
    ReplaceSkill,
    FoundationFinish,
    FoundationSkill,
    MaxCount,
}

enum ETalentDivision
{
    None,
    Attack,
    Defense,
    Support,
    MaxCount,
}

enum EUnlockType
{
    None,
    Default,
    Base,
    Upgrade,
    Choose,
    MaxCount,
}


struct FTalentConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_Avatar;
    UPROPERTY()
    FDataObjectPtr m_SkillConfig;
    UPROPERTY()
    int SkillCapabilityLevel;
    UPROPERTY()
    ESkillType TalentSkillType;
    UPROPERTY()
    float32 TalentSkillCDSeconds;
    UPROPERTY()
    FDataObjectPtr m_CapabilityConfig;
    UPROPERTY()
    int CapabilityLevel;
    UPROPERTY()
    TArray<FCapabilityParamModifier> CapabilityParamModifiers;
    UPROPERTY()
    ETalentType TalentType;
    UPROPERTY()
    FNameHandle_EntityBBVarInt FoundationTalentBBKey;
    UPROPERTY()
    int FoundationTalentBBValue;
    UPROPERTY()
    FDataObjectPtr m_FoundationTalent;
    UPROPERTY()
    ETalentDivision TalentDivision;
    UPROPERTY()
    uint UnlockLevel;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockCondition;
    UPROPERTY()
    TArray<FItemParamConfig> UnlockCost;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockFrontTalent;
    UPROPERTY()
    EUnlockType UnlockType;
    UPROPERTY()
    FDataObjectPtr m_BaseTalent;
    UPROPERTY()
    uint TalentLevel;
    UPROPERTY()
    FDataObjectPtr m_ChooseTalent;
    UPROPERTY()
    FDataObjectPtr m_DoubleFormTalent;
    UPROPERTY()
    FText TalentName;
    UPROPERTY()
    FText ShotDesc;
    UPROPERTY()
    FText TalentDesc;
    UPROPERTY()
    FText TalentUpgradeDesc;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    UMediaSource PreviewMovie;
    UPROPERTY()
    FSoftBrush PreviewImage;
    UPROPERTY()
    FDataObjectPtr m_FoundationTalentUnlockTalent;
    UPROPERTY()
    TArray<FDataObjectPtr> m_PassiveLinkedTalentArray;
    UPROPERTY()
    bool bHide;

    FTalentConfig()
    {
        this.DataId = 0;
        this.TalentType = ETalentType(0);
        this.TalentDivision = ETalentDivision(0);
        this.UnlockLevel = 0;
        this.UnlockType = EUnlockType(0);
        this.PreviewMovie = nullptr;
        this.bHide = false;
        this.SkillCapabilityLevel = 1;
        this.TalentSkillType = ESkillType(0);
        this.TalentSkillCDSeconds = -1.0f;
        this.CapabilityLevel = 1;
        FNameHandle_EntityBBVarInt local_12;
        local_12;
        this.FoundationTalentBBKey = local_12;
        this.FoundationTalentBBValue = 1;
        this.TalentLevel = 1;
        return;
    }
    TDataObjectPtr<FAvatarMappingConfig> GetAvatar() const property
    {
        TDataObjectPtr<FAvatarMappingConfig> __r;
        return __r;
    }
    void SetAvatar(const TDataObjectPtr<FAvatarMappingConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAvatarMappingConfig>> local_2;
        this.m_Avatar = local_2;
        return;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillConfig() const property
    {
        TDataObjectPtr<FSkillInitConfig> __r;
        return __r;
    }
    void SetSkillConfig(const TDataObjectPtr<FSkillInitConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSkillInitConfig>> local_2;
        this.m_SkillConfig = local_2;
        return;
    }
    const TDataObjectPtr<FCapabilityConfig> GetCapabilityConfig() const property
    {
        const TDataObjectPtr<FCapabilityConfig> __r;
        return __r;
    }
    void SetCapabilityConfig(const TDataObjectPtr<FCapabilityConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCapabilityConfig>> local_2;
        this.m_CapabilityConfig = local_2;
        return;
    }
    const TDataObjectPtr<FTalentConfig> GetFoundationTalent() const property
    {
        const TDataObjectPtr<FTalentConfig> __r;
        return __r;
    }
    void SetFoundationTalent(const TDataObjectPtr<FTalentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTalentConfig>> local_2;
        this.m_FoundationTalent = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FServerConditionConfigBase>> GetUnlockCondition() const property
    {
        const TArray<TDataObjectPtr<FServerConditionConfigBase>> __r;
        return __r;
    }
    void SetUnlockCondition(const TArray<TDataObjectPtr<FServerConditionConfigBase>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FServerConditionConfigBase>>> local_2;
        this.m_UnlockCondition = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FTalentConfig>> GetUnlockFrontTalent() const property
    {
        const TArray<TDataObjectPtr<FTalentConfig>> __r;
        return __r;
    }
    void SetUnlockFrontTalent(const TArray<TDataObjectPtr<FTalentConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FTalentConfig>>> local_2;
        this.m_UnlockFrontTalent = local_2;
        return;
    }
    const TDataObjectPtr<FTalentConfig> GetBaseTalent() const property
    {
        const TDataObjectPtr<FTalentConfig> __r;
        return __r;
    }
    void SetBaseTalent(const TDataObjectPtr<FTalentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTalentConfig>> local_2;
        this.m_BaseTalent = local_2;
        return;
    }
    const TDataObjectPtr<FTalentConfig> GetChooseTalent() const property
    {
        const TDataObjectPtr<FTalentConfig> __r;
        return __r;
    }
    void SetChooseTalent(const TDataObjectPtr<FTalentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTalentConfig>> local_2;
        this.m_ChooseTalent = local_2;
        return;
    }
    const TDataObjectPtr<FTalentConfig> GetDoubleFormTalent() const property
    {
        const TDataObjectPtr<FTalentConfig> __r;
        return __r;
    }
    void SetDoubleFormTalent(const TDataObjectPtr<FTalentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTalentConfig>> local_2;
        this.m_DoubleFormTalent = local_2;
        return;
    }
    const TDataObjectPtr<FTalentConfig> GetFoundationTalentUnlockTalent() const property
    {
        const TDataObjectPtr<FTalentConfig> __r;
        return __r;
    }
    void SetFoundationTalentUnlockTalent(const TDataObjectPtr<FTalentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTalentConfig>> local_2;
        this.m_FoundationTalentUnlockTalent = local_2;
        return;
    }
    TArray<TDataObjectPtr<FTalentConfig>> GetPassiveLinkedTalentArray() const property
    {
        TArray<TDataObjectPtr<FTalentConfig>> __r;
        return __r;
    }
    void SetPassiveLinkedTalentArray(const TArray<TDataObjectPtr<FTalentConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FTalentConfig>>> local_2;
        this.m_PassiveLinkedTalentArray = local_2;
        return;
    }
}

