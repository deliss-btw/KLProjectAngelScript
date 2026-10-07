
enum EAvatarCombatType
{
    Default,
    Wizard,
}

enum EAvatarIllustrate
{
    Attack,
    Defense,
    Support,
    MaxCount,
}

enum EGenderType
{
    Male,
    Female,
}

const FAvatarPrefabConfig DefaultAvatarConfig = FAvatarPrefabConfig();
namespace FAvatarPrefabConfig
{
    const uint MALE_DEFAULT_SPECIALTY_ID = 6;
    const uint FEMALE_DEFAULT_SPECIALTY_ID = 1;
    const uint FEMALE_BORN_SELECT_SPECIALTY_AVATAR_ID = 3;
    const uint MALE_BORN_SELECT_SPECIALTY_AVATAR_ID = 7;

}
struct FPVPOverrideAvatarConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftClassPtr<ACharacterPrefab> CharacterPrefab;
    UPROPERTY()
    TArray<FDataObjectPtr> m_Skills;
    UPROPERTY()
    FPVPGameAttributeByLevelConfig GameAttributeConfig;
    UPROPERTY()
    FDataObjectPtr m_DefaultWeapon;

    FPVPOverrideAvatarConfig()
    {
        return;
    }
    const TArray<TDataObjectPtr<FSkillInitConfig>> GetSkills() const property
    {
        const TArray<TDataObjectPtr<FSkillInitConfig>> __r;
        return __r;
    }
    void SetSkills(const TArray<TDataObjectPtr<FSkillInitConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FSkillInitConfig>>> local_2;
        this.m_Skills = local_2;
        return;
    }
    const TDataObjectPtr<FWeaponConfig> GetDefaultWeapon() const property
    {
        const TDataObjectPtr<FWeaponConfig> __r;
        return __r;
    }
    void SetDefaultWeapon(const TDataObjectPtr<FWeaponConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FWeaponConfig>> local_2;
        this.m_DefaultWeapon = local_2;
        return;
    }
}

struct FGameModeOverrideAvatarConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftClassPtr<ACharacterPrefab> CharacterPrefab;
    UPROPERTY()
    TArray<FDataObjectPtr> m_Skills;
    UPROPERTY()
    FPVPGameAttributeByLevelConfig GameAttributeConfig;
    UPROPERTY()
    FDataObjectPtr m_DefaultWeapon;

    FGameModeOverrideAvatarConfig()
    {
        return;
    }
    const TArray<TDataObjectPtr<FSkillInitConfig>> GetSkills() const property
    {
        const TArray<TDataObjectPtr<FSkillInitConfig>> __r;
        return __r;
    }
    void SetSkills(const TArray<TDataObjectPtr<FSkillInitConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FSkillInitConfig>>> local_2;
        this.m_Skills = local_2;
        return;
    }
    const TDataObjectPtr<FWeaponConfig> GetDefaultWeapon() const property
    {
        const TDataObjectPtr<FWeaponConfig> __r;
        return __r;
    }
    void SetDefaultWeapon(const TDataObjectPtr<FWeaponConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FWeaponConfig>> local_2;
        this.m_DefaultWeapon = local_2;
        return;
    }
}

struct FTrainingLevelConfig
{
    UPROPERTY()
    TDataObjectPtr<FTalentConfig> TalentConfig;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelConfig;
    UPROPERTY()
    uint AvatarId;


}

struct FAvatarPrefabConfig : FBasePrefabConfig
{
    FBasePrefabConfig _base_FBasePrefabConfig;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    int SortPriority = 0;
    UPROPERTY()
    TSoftClassPtr<ACharacterPrefab> CharacterPrefab;
    UPROPERTY()
    EGenderType GenderType = EGenderType(0);
    UPROPERTY()
    FSoftBrush AvatarIcon;
    UPROPERTY()
    FSoftBrush AvatarLargeIcon;
    UPROPERTY()
    FSoftBrush UnlockedAvatarLargeIcon;
    UPROPERTY()
    TSoftClassPtr<AActor> ShowcaseActor;
    UPROPERTY()
    TSoftClassPtr<AActor> ShowcaseLightActor;
    UPROPERTY()
    FVector ShowcaseOffset = FVector::ZeroVector;
    UPROPERTY()
    TSoftObjectPtr<UTexture2D> Avatar3DIconSoft;
    UPROPERTY()
    EDamageType DamageType;
    UPROPERTY()
    EAvatarCombatType CombatType;
    UPROPERTY()
    FSoftBrush PlayerPowerIcon;
    UPROPERTY()
    FSoftBrush PlayerTachie;
    UPROPERTY()
    FSoftBrush PlayerTachieBack;
    UPROPERTY()
    FSoftBrush PlayerClassIcon;
    UPROPERTY()
    FText PlayerPowerName;
    UPROPERTY()
    FText PlayerIllustrate1;
    UPROPERTY()
    FText AvatarBackgroundDesc;
    UPROPERTY()
    FText SpecialtyDesc;
    UPROPERTY()
    EAvatarIllustrate AvatarIllustrate;
    UPROPERTY()
    EWeaponType WeaponType;
    UPROPERTY()
    bool bIsMainPlayer;
    UPROPERTY()
    bool bAlwaysHidden = false;
    UPROPERTY()
    bool bIsOfficialAvatar = true;
    UPROPERTY()
    FDataObjectPtr InitValues;
    UPROPERTY()
    FName AvatarAudioSwitchName;
    UPROPERTY()
    TArray<FDataObjectPtr> m_Skills;
    UPROPERTY()
    FDataObjectPtr m_SkillConfig;
    UPROPERTY()
    FDataObjectPtr m_DefaultWeapon;
    UPROPERTY()
    FDataObjectPtr m_DefaultFoundation;
    UPROPERTY()
    FDataObjectPtr m_SkillBtnConfig;
    UPROPERTY()
    bool bDefaultUnlock;
    UPROPERTY()
    TArray<FDataObjectPtr> m_UnlockCondition;
    UPROPERTY()
    FDataObjectPtr m_PVPOverride;
    UPROPERTY()
    TMap<EGameModeType, FDataObjectPtr> m_GameModeOverride;
    UPROPERTY()
    TArray<FTrainingLevelConfig> TrainingLevelConfigs;
    UPROPERTY()
    TArray<FDataObjectPtr> m_TrainingInfoConfigs;
    UPROPERTY()
    FDataObjectPtr m_DefaultFashion;


    TRawPtr<FAvatarIllustrateInfo> GetAvatarIllustrateInfo() const
    {
        const UAvatarBuildSettings local_2;
        GetGameplaySettings<UAvatarBuildSettings> local_4;
        local_2 = local_4;
        if (local_2 != nullptr)
        {
            return local_2.AvatarIllustrateInfos.Find(this.AvatarIllustrate);
        }
        return TRawPtr<FAvatarIllustrateInfo>(nullptr);
    }
    TRawPtr<FDamageTypeInfoConfig> GetDamageTypeInfo() const
    {
        const UDamageSettings local_2;
        GetGameplaySettings<UDamageSettings> local_4;
        local_2 = local_4;
        if (local_2 != nullptr)
        {
            return local_2.DamageTypeInfos.Find(this.DamageType);
        }
        return TRawPtr<FDamageTypeInfoConfig>(nullptr);
    }
    const TArray<TDataObjectPtr<FSkillInitConfig>> GetSkills() const property
    {
        const TArray<TDataObjectPtr<FSkillInitConfig>> __r;
        return __r;
    }
    void SetSkills(const TArray<TDataObjectPtr<FSkillInitConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FSkillInitConfig>>> local_2;
        this.m_Skills = local_2;
        return;
    }
    TDataObjectPtr<FAvatarSkillConfig> GetSkillConfig() const property
    {
        TDataObjectPtr<FAvatarSkillConfig> __r;
        return __r;
    }
    void SetSkillConfig(const TDataObjectPtr<FAvatarSkillConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAvatarSkillConfig>> local_2;
        this.m_SkillConfig = local_2;
        return;
    }
    const TDataObjectPtr<FWeaponConfig> GetDefaultWeapon() const property
    {
        const TDataObjectPtr<FWeaponConfig> __r;
        return __r;
    }
    void SetDefaultWeapon(const TDataObjectPtr<FWeaponConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FWeaponConfig>> local_2;
        this.m_DefaultWeapon = local_2;
        return;
    }
    const TDataObjectPtr<FTalentConfig> GetDefaultFoundation() const property
    {
        const TDataObjectPtr<FTalentConfig> __r;
        return __r;
    }
    void SetDefaultFoundation(const TDataObjectPtr<FTalentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FTalentConfig>> local_2;
        this.m_DefaultFoundation = local_2;
        return;
    }
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
    const TDataObjectPtr<FPVPOverrideAvatarConfig> GetPVPOverride() const property
    {
        const TDataObjectPtr<FPVPOverrideAvatarConfig> __r;
        return __r;
    }
    void SetPVPOverride(const TDataObjectPtr<FPVPOverrideAvatarConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPVPOverrideAvatarConfig>> local_2;
        this.m_PVPOverride = local_2;
        return;
    }
    const TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideAvatarConfig>> GetGameModeOverride() const property
    {
        const TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideAvatarConfig>> __r;
        return __r;
    }
    void SetGameModeOverride(const TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideAvatarConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TMap<EGameModeType, FDataObjectPtr>, TMap<EGameModeType, TDataObjectPtr<FGameModeOverrideAvatarConfig>>> local_2;
        this.m_GameModeOverride = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FTrainingInfoConfig>> GetTrainingInfoConfigs() const property
    {
        const TArray<TDataObjectPtr<FTrainingInfoConfig>> __r;
        return __r;
    }
    void SetTrainingInfoConfigs(const TArray<TDataObjectPtr<FTrainingInfoConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FTrainingInfoConfig>>> local_2;
        this.m_TrainingInfoConfigs = local_2;
        return;
    }
    const TDataObjectPtr<FCharacterDefaultFashionConfig> GetDefaultFashion() const property
    {
        const TDataObjectPtr<FCharacterDefaultFashionConfig> __r;
        return __r;
    }
    void SetDefaultFashion(const TDataObjectPtr<FCharacterDefaultFashionConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCharacterDefaultFashionConfig>> local_2;
        this.m_DefaultFashion = local_2;
        return;
    }
}

UFUNCTION()
TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig(const FECSEntity &inout Entity)
{
    return TDataObjectPtr<FAvatarPrefabConfig>(GetPrefabConfigPtr(Entity).CastTo(FAvatarPrefabConfig));
}
const FAvatarPrefabConfig GetDefaultedAvatarConfig(const FECSEntity &inout Entity)
{
    const FAvatarPrefabConfig __r;
    if (GetAvatarConfig(Entity))
    {
    }
    else
    {
    }
    return __r;
}
namespace FAvatarPrefabConfig
{
TArray<FAvatarPrefabConfig> GetAll()
{
    UDataTable local_2;
    if (local_2 == nullptr)
    {
        XWarning(ELog(0), "can not find datatable: FAvatarPrefabConfig");
        return TArray<FAvatarPrefabConfig>();
    }
    TArray<FAvatarPrefabConfig> local_14;
    local_2.GetAllRows(local_14);
    return local_14;
}
TDataObjectPtr<FAvatarPrefabConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FAvatarPrefabConfig>();
}
TSoftClassPtr<ACharacterPrefab> GetEffectiveCharacterPrefab(const FECSWorldPtr &inout World, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    bool local_17 = false;
    int local_24 = 0;
    bool local_53;
    TSoftClassPtr<ACharacterPrefab> __r;
    bool local_1 = !(AvatarConfig);
    if (local_1)
    {
        return TSoftClassPtr<ACharacterPrefab>();
    }
    if (!(World.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_16;
        local_17 = local_16.opCall();
        local_1 = local_17;
    }
    if (local_1)
    {
        if ((int(local_24.GetGameModeType())) != 0)
        {
            TDataObjectPtr<FGameModeOverrideAvatarConfig> local_52;
            if (!(GetGameModeOverride().Find(local_24.GetGameModeType(), local_52)))
            {
                local_1 = false;
            }
            else
            {
                local_17 = local_52;
                local_1 = local_17;
            }
            if (!(local_1))
            {
                local_53 = false;
            }
            else
            {
                local_17 = !local_17;
                local_53 = !(false);
                local_17 = (local_17 == local_53);
                local_53 = local_17;
            }
            if (local_53)
            {
            }
            else
            {
                TDataObjectPtr<FPVPOverrideAvatarConfig> local_78 = GetPVPOverride();
                if (!(local_78))
                {
                    local_17 = false;
                }
                else
                {
                    local_1 = !local_1;
                    local_17 = !(false);
                    local_17 = (local_1 == local_17);
                }
                if (local_17)
                {
                }
                else
                {
                }
            }
        }
    }
    return __r;
}
TArray<TDataObjectPtr<FSkillInitConfig>> GetEffectiveSkills(const FECSWorldPtr &inout World, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    int local_18 = 0;
    bool local_1 = !(AvatarConfig);
    if (local_1)
    {
        return TArray<TDataObjectPtr<FSkillInitConfig>>();
    }
    if (!(World.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_10;
        local_1 = local_10.opCall();
    }
    if (local_1)
    {
        if (int(local_18.GetGameModeType()) != 0)
        {
            TDataObjectPtr<FGameModeOverrideAvatarConfig> local_46;
            if (!(GetGameModeOverride().Find(local_18.GetGameModeType(), local_46)))
            {
                local_1 = false;
            }
            else
            {
                local_1 = local_46;
            }
            local_1 = local_1 && (GetSkills().Num() > 0);
            if (local_1)
            {
                return GetSkills();
            }
            TDataObjectPtr<FPVPOverrideAvatarConfig> local_70 = GetPVPOverride();
            if (local_70 && (GetSkills().Num() > 0))
            {
                return GetSkills();
            }
        }
    }
    return GetSkills();
}
TArray<TDataObjectPtr<FSkillInitConfig>> GetEffectiveSkills(const EGameModeType GameModeType, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    bool local_1 = !(AvatarConfig);
    if (local_1)
    {
        return TArray<TDataObjectPtr<FSkillInitConfig>>();
    }
    if (int(GameModeType) != 0)
    {
        TDataObjectPtr<FGameModeOverrideAvatarConfig> local_32;
        if (!(GetGameModeOverride().Find(GameModeType, local_32)))
        {
            local_1 = false;
        }
        else
        {
            local_1 = local_32;
        }
        local_1 = local_1 && (GetSkills().Num() > 0);
        if (local_1)
        {
            return GetSkills();
        }
    }
    return GetSkills();
}
}
