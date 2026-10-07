
enum ESkillButtonType
{
    None,
    SimpleSkill,
    UltraSkill,
    ConsumableItem,
    SpecialAttack,
    LinkSkill,
}


struct FNormalSkillBtnConfig
{
    UPROPERTY()
    ESkillSlot SkillSlot;
    UPROPERTY()
    ESkillButtonType SkillButtonType = ESkillButtonType(1);
    UPROPERTY()
    TDataObjectPtr<FTalentConfig> DefaultTalent;
    UPROPERTY()
    bool bShowInputActionOnKeyBoard = true;
    UPROPERTY()
    bool bShowInputActionOnGamepad = false;
    UPROPERTY()
    bool bShowInputActionOnTouch = false;


    bool GetShowInputActionVisibility() const
    {
        switch (int(::UICommonUtil::GetCurrentInputType(nullptr)))
        {
        case 0:
        {
            return this.bShowInputActionOnKeyBoard;
        }
        case 1:
        {
            return this.bShowInputActionOnGamepad;
        }
        case 2:
        {
            return this.bShowInputActionOnTouch;
        }
        }
        return false;
    }
}

UCLASS(Abstract)
class UExclusiveSkillModelAdapterBase : UObject
{
    UExclusiveSkillModelAdapterBase()
    {
        return;
    }
    FEUIModelRef MakeViewModels(const FEUIModelContext &inout Context) const
    {
        return FEUIModelRef();
    }
}

struct FSkillBtnInputActionConfig : FDataObject
{
    FDataObject _base_FDataObject;

    FSkillBtnInputActionConfig()
    {
        return;
    }
}

struct FSkillBtnConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_AvatarMapping;
    UPROPERTY()
    FName AvatarName;
    UPROPERTY()
    bool bEnableExclusiveSkill = true;
    UPROPERTY()
    bool bEnableGamepadRightShoulderAnim = true;
    UPROPERTY()
    bool bRebuildSkillResourceWidgetOnExit = false;
    UPROPERTY()
    TArray<FName> BanInputNames;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> ExclusiveSkillWidget;
    UPROPERTY()
    TSubclassOf<UExclusiveSkillModelAdapterBase> ExclusiveSkillModelAdapter;
    UPROPERTY()
    bool bHasUltraSkill = false;
    UPROPERTY()
    FNormalSkillBtnConfig UltraSkillBtnConfig;
    UPROPERTY()
    bool bHasSpecialAttack = false;
    UPROPERTY()
    FNormalSkillBtnConfig SpecialAttackSkillBtnConfig;
    UPROPERTY()
    bool bHasSimpleSkill1 = false;
    UPROPERTY()
    FNormalSkillBtnConfig SimpleSkill1BtnConfig;
    UPROPERTY()
    bool bHasSimpleSkill2 = false;
    UPROPERTY()
    FNormalSkillBtnConfig SimpleSkill2BtnConfig;
    UPROPERTY()
    bool bHasSimpleSkill3 = false;
    UPROPERTY()
    FNormalSkillBtnConfig SimpleSkill3BtnConfig;
    UPROPERTY()
    bool bHasDivineSkill = false;
    UPROPERTY()
    FNormalSkillBtnConfig DivineSkillBtnConfig;


    const TDataObjectPtr<FAvatarMappingConfig> GetAvatarMapping() const property
    {
        const TDataObjectPtr<FAvatarMappingConfig> __r;
        return __r;
    }
    void SetAvatarMapping(const TDataObjectPtr<FAvatarMappingConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAvatarMappingConfig>> local_2;
        this.m_AvatarMapping = local_2;
        return;
    }
}

struct FAddTemporarySkillConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    USkillConfig SkillConfig = nullptr;
    UPROPERTY()
    int MaxUsableTime = 1;
    UPROPERTY()
    FDataObjectPtr m_Hint;


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

struct FSkillInitConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    USkillConfig SkillConfig = nullptr;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText TypeDesc;
    UPROPERTY()
    ESkillType SkillType = ESkillType(0);
    UPROPERTY()
    bool bIsDefault = false;
    UPROPERTY()
    ESkillSlot DefaultSkillSlot;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    UMediaSource PreviewMovie = nullptr;
    UPROPERTY()
    FSoftBrush PreviewPicture;


}

struct FAvatarSkillSlotConfig
{
    UPROPERTY()
    ESkillSlot SkillSlot;
    UPROPERTY()
    ESkillType SkillType;
    UPROPERTY()
    TDataObjectPtr<FTalentConfig> DefaultTalent;


}

struct FAvatarSkillConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FAvatarSkillSlotConfig> SkillInitConfigs;


}

struct FSkillEffectNounsConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText Description;

    FSkillEffectNounsConfig()
    {
        return;
    }
}

struct FSkillReplaceEntry
{
    UPROPERTY()
    USkillConfig SkillConfig;
    UPROPERTY()
    ESkillSlot Slot = ESkillSlot(0);
    UPROPERTY()
    bool bReplaceInSameSlot = true;


}

struct FSkillPresentationOverrideConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    bool bEnableChangeSkillPanel = false;
    UPROPERTY()
    FDataObjectPtr m_SkillBtnConfig;
    UPROPERTY()
    bool bEnableReplaceSkill = false;
    UPROPERTY()
    TArray<FSkillReplaceEntry> ReplaceSkills;


    const TDataObjectPtr<FSkillBtnConfig> GetSkillBtnConfig() const property
    {
        const TDataObjectPtr<FSkillBtnConfig> __r;
        return __r;
    }
    void SetSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSkillBtnConfig>> local_2;
        this.m_SkillBtnConfig = local_2;
        return;
    }
}

