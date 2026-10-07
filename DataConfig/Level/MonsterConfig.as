

struct FMonsterPresentationConfig : FPresentationConfig
{
    FPresentationConfig _base_FPresentationConfig;
    UPROPERTY()
    int HPBarSegment;
    UPROPERTY()
    TArray<EDamageType> AttributeTypes;
    UPROPERTY()
    TArray<EDamageType> WeaknessDamageTypes;
    UPROPERTY()
    FText Prefix;
    UPROPERTY()
    FText HuntInfo;
    UPROPERTY()
    FText BackgroundStory;
    UPROPERTY()
    bool bShowChangeArea;
    UPROPERTY()
    FDataObjectPtr m_DivineLiteraryType;

    default SpotOffset = FPresentationSpotOffset::DefaultAnchorTop;
    default SpotType = GameplayTags::SpotType_Monster;

    FMonsterPresentationConfig()
    {
        super();
        this.bShowChangeArea = false;
        this.HPBarSegment = 1;
        this.__InitDefaults();
        return;
    }
    const TDataObjectPtr<FDivineLiteraryTypeConfig> GetDivineLiteraryType() const property
    {
        const TDataObjectPtr<FDivineLiteraryTypeConfig> __r;
        return __r;
    }
    void SetDivineLiteraryType(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDivineLiteraryTypeConfig>> local_2;
        this.m_DivineLiteraryType = local_2;
        return;
    }
}

struct FMonsterBaseConfig : FCombatUnitBaseConfig
{
    FCombatUnitBaseConfig _base_FCombatUnitBaseConfig;
    UPROPERTY()
    int MonsterStrength = -1;


}

struct FMonsterMainConfig : FCreatureUnitConfig
{
    FCreatureUnitConfig _base_FCreatureUnitConfig;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int MonsterId;
    UPROPERTY()
    int Level = 1;
    UPROPERTY()
    FDataObjectPtr m_PresentationConfig;
    UPROPERTY()
    FDataObjectPtr m_AttributeInheritConfig;
    UPROPERTY()
    EFaction FactionOverride = EFaction(0);
    UPROPERTY()
    EAbnormalState WeaknessAbnormalState = EAbnormalState(0);
    UPROPERTY()
    TArray<EAbnormalState> AbnormalStateResistanceArr;


    TDataObjectPtr<FMonsterPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FMonsterPresentationConfig> __r;
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FMonsterPresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMonsterPresentationConfig>> local_2;
        this.m_PresentationConfig = local_2;
        return;
    }
    const TDataObjectPtr<FGameAttributeInherit> GetAttributeInheritConfig() const property
    {
        const TDataObjectPtr<FGameAttributeInherit> __r;
        return __r;
    }
    void SetAttributeInheritConfig(const TDataObjectPtr<FGameAttributeInherit> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FGameAttributeInherit>> local_2;
        this.m_AttributeInheritConfig = local_2;
        return;
    }
}

struct FMonsterWeaknessPartConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText PartName;
    UPROPERTY()
    FDataObjectPtr m_DestroyDropItemConfig;

    FMonsterWeaknessPartConfig()
    {
        return;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetDestroyDropItemConfig() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetDestroyDropItemConfig(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_DestroyDropItemConfig = local_2;
        return;
    }
}

