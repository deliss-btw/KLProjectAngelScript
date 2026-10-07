

struct FAvatarBuildOverrideConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_AvatarMappingConfig;
    UPROPERTY()
    FDataObjectPtr m_AttributeInitConfig;
    UPROPERTY()
    int Level = 1;
    UPROPERTY()
    FDataObjectPtr m_WeaponConfig;
    UPROPERTY()
    bool bOverrideTalisman = false;
    UPROPERTY()
    TArray<FDataObjectPtr> m_Talismans;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockTalents;
    UPROPERTY()
    FDataObjectPtr m_FoundationTalent;
    UPROPERTY()
    TMap<ESkillSlot, FDataObjectPtr> m_ReplaceSkillSlotTalents;
    UPROPERTY()
    FDataObjectPtr m_DivineSkill;


    TDataObjectPtr<FAvatarMappingConfig> GetAvatarMappingConfig() const property
    {
        TDataObjectPtr<FAvatarMappingConfig> __r;
        return __r;
    }
    void SetAvatarMappingConfig(const TDataObjectPtr<FAvatarMappingConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAvatarMappingConfig>> local_2;
        this.m_AvatarMappingConfig = local_2;
        return;
    }
    const TDataObjectPtr<FGameAttributeInitConfig_Avatar> GetAttributeInitConfig() const property
    {
        const TDataObjectPtr<FGameAttributeInitConfig_Avatar> __r;
        return __r;
    }
    void SetAttributeInitConfig(const TDataObjectPtr<FGameAttributeInitConfig_Avatar> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FGameAttributeInitConfig_Avatar>> local_2;
        this.m_AttributeInitConfig = local_2;
        return;
    }
    const TDataObjectPtr<FWeaponConfig> GetWeaponConfig() const property
    {
        const TDataObjectPtr<FWeaponConfig> __r;
        return __r;
    }
    void SetWeaponConfig(const TDataObjectPtr<FWeaponConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FWeaponConfig>> local_2;
        this.m_WeaponConfig = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FTalismanConfig>> GetTalismans() const property
    {
        const TArray<TDataObjectPtr<FTalismanConfig>> __r;
        return __r;
    }
    void SetTalismans(const TArray<TDataObjectPtr<FTalismanConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FTalismanConfig>>> local_2;
        this.m_Talismans = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FTalentConfig>> GetUnlockTalents() const property
    {
        const TArray<TDataObjectPtr<FTalentConfig>> __r;
        return __r;
    }
    void SetUnlockTalents(const TArray<TDataObjectPtr<FTalentConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FTalentConfig>>> local_2;
        this.m_UnlockTalents = local_2;
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
    const TMap<ESkillSlot, TDataObjectPtr<FTalentConfig>> GetReplaceSkillSlotTalents() const property
    {
        const TMap<ESkillSlot, TDataObjectPtr<FTalentConfig>> __r;
        return __r;
    }
    void SetReplaceSkillSlotTalents(const TMap<ESkillSlot, TDataObjectPtr<FTalentConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<ESkillSlot, FDataObjectPtr>, TMap<ESkillSlot, TDataObjectPtr<FTalentConfig>>> local_2;
        this.m_ReplaceSkillSlotTalents = local_2;
        return;
    }
    TDataObjectPtr<FDivineSkillConfig> GetDivineSkill() const property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        return __r;
    }
    void SetDivineSkill(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDivineSkillConfig>> local_2;
        this.m_DivineSkill = local_2;
        return;
    }
}

