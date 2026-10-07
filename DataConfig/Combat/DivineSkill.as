
enum EDivineSkillType
{
    DivineType_Main,
    DivineType_PVP,
}


struct FDivineSkillConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    bool bDefaultUnlock;
    UPROPERTY()
    EDivineSkillType DivineSkillType;
    UPROPERTY()
    FDataObjectPtr m_UpgradeSkill;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FText CostDescription;
    UPROPERTY()
    FText AttributeDescription;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    FText BackgroundDescription;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    FDataObjectPtr m_TypeConfig;
    UPROPERTY()
    FDataObjectPtr m_LiteraryTypeConfig;
    UPROPERTY()
    USkillConfig SkillConfig = nullptr;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    TArray<FGameplayModifierConfigRefWithArgs> Modifiers;
    UPROPERTY()
    TArray<FCapabilityConfigWithLevel> Capabilities;
    UPROPERTY()
    UMediaSource PreviewMovie = nullptr;


    const TDataObjectPtr<FDivineSkillConfig> GetUpgradeSkill() const property
    {
        const TDataObjectPtr<FDivineSkillConfig> __r;
        return __r;
    }
    void SetUpgradeSkill(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDivineSkillConfig>> local_2;
        this.m_UpgradeSkill = local_2;
        return;
    }
    const TDataObjectPtr<FDivineSkillTypeConfig> GetTypeConfig() const property
    {
        const TDataObjectPtr<FDivineSkillTypeConfig> __r;
        return __r;
    }
    void SetTypeConfig(const TDataObjectPtr<FDivineSkillTypeConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDivineSkillTypeConfig>> local_2;
        this.m_TypeConfig = local_2;
        return;
    }
    const TDataObjectPtr<FDivineLiteraryTypeConfig> GetLiteraryTypeConfig() const property
    {
        const TDataObjectPtr<FDivineLiteraryTypeConfig> __r;
        return __r;
    }
    void SetLiteraryTypeConfig(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDivineLiteraryTypeConfig>> local_2;
        this.m_LiteraryTypeConfig = local_2;
        return;
    }
}

