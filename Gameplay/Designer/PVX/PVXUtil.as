
namespace PVXUtil
{
    const FGameplayTag Team1Tag = FGameplayTag();
    const FGameplayTag Team2Tag = FGameplayTag();
    const FGameplayTag Team3Tag = FGameplayTag();
    const FGameplayTag Team4Tag = FGameplayTag();
    const FGameplayTag TeamBossTag = FGameplayTag();

}
struct __Lambda_Gameplay_Designer_PVX_PVXUtil_284
{
    UPROPERTY()
    FECSEntity __PlayerPawn;
    UPROPERTY()
    FDefaultAvatarData __EvolveAvatarData;
    UPROPERTY()
    FSpawnFakeCharacterExtractData __ExtraData;

    __Lambda_Gameplay_Designer_PVX_PVXUtil_284()
    {
        return;
    }
    __Lambda_Gameplay_Designer_PVX_PVXUtil_284(const FECSEntity &inout _InPlayerPawn, const FDefaultAvatarData &inout _InEvolveAvatarData, const FSpawnFakeCharacterExtractData &inout _InExtraData)
    {
        this.__EvolveAvatarData = _InEvolveAvatarData;
        this.__ExtraData = _InExtraData;
        return;
    }
    FECSEntity GetPlayerPawn() property
    {
        FECSEntity __r;
        return __r;
    }
    FDefaultAvatarData GetEvolveAvatarData() property
    {
        FDefaultAvatarData __r;
        return __r;
    }
    FSpawnFakeCharacterExtractData GetExtraData() property
    {
        FSpawnFakeCharacterExtractData __r;
        return __r;
    }
    void opCall()
    {
        if (!(this.GetPlayerPawn().IsValid()))
        {
            return;
        }
        ::FFakeCharacterUtils::SpawnFakeCharacterAndControl(this.GetPlayerPawn(), this.GetEvolveAvatarData(), this.GetExtraData());
        return;
    }
}

namespace PVXUtil
{
int GetLevelRequiredExp(const int CurLevel, const EFaction Faction)
{
    UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
    if ((!((local_8 != nullptr))))
    {
        XError(ELog(0), "we need a UAS_GameModeSettingsPVX!");
    }
    TArray<FPVX_LevelExpConfig> local_14;
    if (int(Faction) == 6)
    {
        local_8.LevelExpDataTable_Boss.GetAllRows(local_14);
    }
    else
    {
        local_8.LevelExpDataTable.GetAllRows(local_14);
    }
    for (auto& local_30 : local_14)
    {
        if (int(local_30.Level) == CurLevel)
        {
            return int(local_30.Exp);
        }
    }
    return -1;
}
int GetLevelByExp(const int Exp, const EFaction Faction)
{
    UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
    if ((!((local_8 != nullptr))))
    {
        XError(ELog(0), "we need a UAS_GameModeSettingsPVX!");
    }
    int local_11 = 1;
    TArray<FPVX_LevelExpConfig> local_16;
    if (int(Faction) == 6)
    {
        local_8.LevelExpDataTable_Boss.GetAllRows(local_16);
    }
    else
    {
        local_8.LevelExpDataTable.GetAllRows(local_16);
    }
    for (auto& local_32 : local_16)
    {
        if ((int(local_32.Exp) <= Exp && (int(local_32.Level) > local_11)))
        {
            local_11 = int(local_32.Level);
        }
    }
    return local_11;
}
FGameplayTag GetEntityTeamTag(const FECSEntity &inout Entity)
{
    bool local_1;
    int local_14 = 0;
    if (!(Entity.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        if (int(local_14.GetFaction()) == 1)
        {
            switch (local_14.GetPlayerTeamID())
            {
            case 0:
            {
                return PVXUtil::Team1Tag;
            }
            case 1:
            {
                return PVXUtil::Team2Tag;
            }
            case 2:
            {
                return PVXUtil::Team3Tag;
            }
            case 3:
            {
                return PVXUtil::Team4Tag;
            }
            }
            return FGameplayTag();
        }
        else
        {
            if (int(local_14.GetFaction()) == 6)
            {
                return PVXUtil::TeamBossTag;
            }
        }
    }
    return FGameplayTag();
}
FDataObjectPtr GetPVPAttributeDataByLevel(const FECSEntity &inout Entity, const int Level)
{
    const FAvatarPrefabConfig& local_76;
    FPVPGameAttributeByLevelConfig local_104;
    bool local_49 = !(GetAvatarConfig(Entity));
    if (local_49)
    {
        return FDataObjectPtr();
    }
    TDataObjectPtr<FGameModeOverrideAvatarConfig> local_100;
    if (!(local_76.GetGameModeOverride().Find(EGameModeType(2), local_100)))
    {
        local_49 = false;
    }
    else
    {
        local_49 = local_100;
    }
    if (local_49)
    {
        if (local_104.IsValid())
        {
            TDataObjectPtr<FGameAttributeInitConfigBase> local_128 = local_104.FindAttributeConfigByLevel(Level);
            return local_128.opImplConv();
        }
    }
    if (!(local_76.GetPVPOverride()))
    {
        return FDataObjectPtr();
    }
    FPVPOverrideAvatarConfig local_130;
    local_104 = local_130.GameAttributeConfig;
    if (!(local_104.IsValid()))
    {
        return FDataObjectPtr();
    }
    TDataObjectPtr<FGameAttributeInitConfigBase> local_128_2 = local_104.FindAttributeConfigByLevel(Level);
    return local_128_2.opImplConv();
}
void ReplacePVPInitAttribute(const FECSEntity &inout Entity, const int Level)
{
    FDataObjectPtr local_48 = PVXUtil::GetPVPAttributeDataByLevel(Entity, Level);
    if (!(local_48.IsValid()))
    {
        return;
    }
    ModifyOrAdd local_54;
    local_54.opCall().InitValues = local_48;
    return;
}
FDataObjectPtr GetPVXAttributeDataByLevel(const FECSEntity &inout Entity, const int Level)
{
    Get local_4;
    if ((int(local_4.opCall().GetFactionId())) == 1)
    {
        FPVPGameAttributeByLevelConfig local_110;
        bool local_108;
        bool local_8 = !(GetAvatarConfig(Entity));
        if (local_8)
        {
            return FDataObjectPtr();
        }
        else
        {
            const FAvatarPrefabConfig& local_82;
            TDataObjectPtr<FGameModeOverrideAvatarConfig> local_106;
            if (!(local_82.GetGameModeOverride().Find(EGameModeType(1), local_106)))
            {
                local_8 = false;
            }
            else
            {
                local_8 = local_106;
            }
            if (local_8)
            {
                if (local_110.IsValid())
                {
                    TDataObjectPtr<FGameAttributeInitConfigBase> local_134 = local_110.FindAttributeConfigByLevel(Level);
                    return local_134.opImplConv();
                }
                else
                {
                }
            }
            local_108 = !(local_82.GetPVPOverride());
            if (local_108)
            {
                return FDataObjectPtr();
            }
            else
            {
                FPVPOverrideAvatarConfig local_136;
                local_110 = local_136.GameAttributeConfig;
                if (!(local_110.IsValid()))
                {
                    return FDataObjectPtr();
                }
                else
                {
                    TDataObjectPtr<FGameAttributeInitConfigBase> local_134_2 = local_110.FindAttributeConfigByLevel(Level);
                    return local_134_2.opImplConv();
                }
            }
        }
    }
    else
    {
        FPVPGameAttributeByLevelConfig local_110;
        bool local_108;
        if (!(GetMonsterConfig(Entity)))
        {
            return FDataObjectPtr();
        }
        else
        {
            const FMonsterPrefabConfig& local_186;
            TDataObjectPtr<FGameModeOverrideMonsterConfig> local_210;
            if (!(local_186.GetGameModeOverride().Find(EGameModeType(1), local_210)))
            {
                local_108 = false;
            }
            else
            {
                local_108 = local_210;
            }
            if (local_108)
            {
                if (local_110.IsValid())
                {
                    TDataObjectPtr<FGameAttributeInitConfigBase> local_134_3 = local_110.FindAttributeConfigByLevel(Level);
                    return local_134_3.opImplConv();
                }
                else
                {
                }
            }
            if (!(local_186.GetPVPOverride()))
            {
                return FDataObjectPtr();
            }
            else
            {
                FPVPOverrideMonsterConfig local_212;
                local_110 = local_212.GameAttributeConfig;
                if (!(local_110.IsValid()))
                {
                    return FDataObjectPtr();
                }
                else
                {
                    TDataObjectPtr<FGameAttributeInitConfigBase> local_134_4 = local_110.FindAttributeConfigByLevel(Level);
                    return local_134_4.opImplConv();
                }
            }
        }
    }
}
void ReplaceInitAttribute(const FECSEntity &inout Entity, const int Level)
{
    int local_64 = 0;
    int local_72 = 0;
    FDataObjectPtr local_48 = PVXUtil::GetPVXAttributeDataByLevel(Entity, Level);
    if (!(local_48.IsValid()))
    {
        return;
    }
    ModifyOrAdd local_54;
    local_54.opCall().InitValues = local_48;
    Has local_58;
    bool local_49 = local_58.opCall();
    if (local_49)
    {
        FECSWorldPtr local_66 = ECS::GetECSWorld();
        if (local_72.GetPlayerInfoMap().Contains(local_64))
        {
            local_72.GetModify_PlayerInfoMap()[local_64].SetLastOverrideAttributeData(local_48);
        }
    }
    return;
}
void OverrideGameAttribute(const FECSEntity &inout Entity, const int NewLevel)
{
    int local_64 = 0;
    int local_70 = 0;
    FDataObjectPtr local_48 = PVXUtil::GetPVXAttributeDataByLevel(Entity, NewLevel);
    if (!(local_48.IsValid()))
    {
        return;
    }
    FFPTime local_52 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    FGameAttributeUtils::ApplyAttributeDeltaBySingleDataObject(Entity, local_48, local_52, true);
    Has local_58;
    bool local_49 = local_58.opCall();
    if (local_49)
    {
        FECSWorldPtr local_54 = ECS::GetECSWorld();
        if (local_70.GetPlayerInfoMap().Contains(local_64))
        {
            FPVX_PlayerData& local_72 = local_70.GetModify_PlayerInfoMap()[local_64];
            local_72.SetLastOverrideAttributeData(local_48);
        }
    }
    return;
}
void OverrideGameAttributeByDelta(const FECSEntity &inout Entity, const int NewLevel)
{
    int local_84 = 0;
    int local_92 = 0;
    FDataObjectPtr local_48 = PVXUtil::GetPVXAttributeDataByLevel(Entity, NewLevel);
    if (!(local_48.IsValid()))
    {
        return;
    }
    FDataObjectPtr local_74;
    Has local_78;
    bool local_49 = local_78.opCall();
    if (local_49)
    {
        FECSWorldPtr local_86 = ECS::GetECSWorld();
        if (local_92.GetPlayerInfoMap().Contains(local_84))
        {
            FPVX_PlayerData& local_94 = local_92.GetModify_PlayerInfoMap()[local_84];
            local_74 = local_94.GetLastOverrideAttributeData();
            local_94.SetLastOverrideAttributeData(local_48);
        }
    }
    FFPTime local_96 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    FGameAttributeUtils::ApplyAttributeDeltaByTwoDataObjects(Entity, local_74, local_48, local_96, true);
    return;
}
void ApplyLevelUpBuff(const FECSEntity &inout PlayerPawn, const EFaction Faction, const FBuffConfigRef &inout LevelUpBuff_Player, const FBuffConfigRef &inout LevelUpBuff_Boss)
{
    FBuffConfigRef local_52;
    if (int(Faction) == 6)
    {
        local_52 = LevelUpBuff_Boss;
    }
    else
    {
        local_52 = LevelUpBuff_Player;
    }
    if (local_52.IsValid())
    {
        BlueprintFunctions_Common::AddBuff(FECSEntityAdapter(PlayerPawn), FECSEntityAdapter(PlayerPawn), local_52, -1.0f, 1);
    }
    return;
}
int TryEvolveBoss(const TArray<FUpgradeMonsterData> &inout UpgradeMonsterDatas, const int OldLevel, const int NewLevel, const int CurrentLastEvolveLevel, const FECSEntity &inout PlayerPawn, const FPVXBossEvolveSettings &inout BossEvolveSettings)
{
    int local_1 = 0;
    for (auto& local_18 : UpgradeMonsterDatas)
    {
        if (int(local_18.Level) <= OldLevel && (int(local_18.Level) > local_1))
        {
            local_1 = int(local_18.Level);
        }
    }
    int local_20 = 0;
    FUpgradeMonsterData local_86;
    for (auto& local_18 : UpgradeMonsterDatas)
    {
        if (int(local_18.Level) <= NewLevel && (int(local_18.Level) > local_20))
        {
            local_20 = int(local_18.Level);
        }
    }
    if (local_20 > local_1 && (local_20 > CurrentLastEvolveLevel))
    {
        FDefaultAvatarData local_96 = local_86.AvatarData;
        bool local_19 = local_86.bUseRandomAvatar && (local_86.RandomAvatars.Num() > 0);
        if (local_19)
        {
            local_96 = local_86.RandomAvatars[FMath::RandRange(0, (local_86.RandomAvatars.Num() - 1))];
        }
        local_86.ExtraData.SetbCopySourceBuffs(true);
        local_86.ExtraData.SetbCopySourceCapabilities(true);
        if (BossEvolveSettings.EvolveReadyBuff.IsValid())
        {
            BlueprintFunctions_Common::AddBuff(FECSEntityAdapter(PlayerPawn), FECSEntityAdapter(PlayerPawn), BossEvolveSettings.EvolveReadyBuff, -1.0f, 1);
        }
        if (!(BossEvolveSettings.EvolveReadyHint))
        {
            local_19 = false;
        }
        else
        {
            Has local_120;
            local_19 = local_120.opCall();
        }
        if (local_19)
        {
            Get local_124;
            FECSEntity local_128 = local_124.opCall().GetPlayerEntity();
            BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_128), BossEvolveSettings.EvolveReadyHint, TArray<FTextArgument>());
        }
        if (BossEvolveSettings.EvolveDelayTime > 0.0f)
        {
            __Lambda_Gameplay_Designer_PVX_PVXUtil_284 local_248;
            FGameModeTimerUtils::AddTimerCallback(BossEvolveSettings.EvolveDelayTime, Foundation::MakeClosure(local_248));
        }
        else
        {
            FFakeCharacterUtils::SpawnFakeCharacterAndControl(PlayerPawn, local_96, local_86.ExtraData);
        }
        return local_20;
    }
    return CurrentLastEvolveLevel;
}
}
