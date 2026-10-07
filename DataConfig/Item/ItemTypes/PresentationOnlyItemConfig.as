

struct FPresentationOnlyItemConfig : FItemConfig
{
    FItemConfig _base_FItemConfig;

    default ItemType = EItemType(0);
    default ItemTrunk = EItemTrunk(0);

    FPresentationOnlyItemConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FRemnantItemConfig : FPresentationOnlyItemConfig
{
    FPresentationOnlyItemConfig _base_FPresentationOnlyItemConfig;
    UPROPERTY()
    USkillConfig ItemSkillConfig;
    UPROPERTY()
    FBuffConfigRef ItemBuffConfig;
    UPROPERTY()
    int UsableCount;
    UPROPERTY()
    FDataObjectPtr m_Hint;

    default ItemCategory = FFilteredGameplayTag(GameplayTags::ItemCategory_Presentation_Special_Remnant, GameplayTags::ItemCategory_Presentation_Special_Remnant);

    FRemnantItemConfig()
    {
        super();
        this.ItemSkillConfig = nullptr;
        this.UsableCount = 1;
        this.__InitDefaults();
        return;
    }
    const TDataObjectPtr<FMessageHintConfig_LargeHint> GetHint() const property
    {
        const TDataObjectPtr<FMessageHintConfig_LargeHint> __r;
        return __r;
    }
    void SetHint(const TDataObjectPtr<FMessageHintConfig_LargeHint> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMessageHintConfig_LargeHint>> local_2;
        this.m_Hint = local_2;
        return;
    }
}

