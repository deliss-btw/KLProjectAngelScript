

struct FPVXBossEvolveSettings
{
    UPROPERTY()
    float32 EvolveDelayTime = 0.0f;
    UPROPERTY()
    FBuffConfigRef EvolveReadyBuff;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EvolveReadyHint;


}

struct FUpgradeMonsterData
{
    UPROPERTY()
    int Level;
    UPROPERTY()
    bool bUseRandomAvatar = false;
    UPROPERTY()
    FDefaultAvatarData AvatarData;
    UPROPERTY()
    TArray<FDefaultAvatarData> RandomAvatars;
    UPROPERTY()
    FSpawnFakeCharacterExtractData ExtraData;


}

struct FLevelProgressData
{
    UPROPERTY()
    int Time;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig;
    UPROPERTY()
    FName CustomName;


}

struct FTime_ExpMultiplier_Data
{
    UPROPERTY()
    int Time;
    UPROPERTY()
    float32 ExpMultiplier;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig;
    UPROPERTY()
    FBuffConfigRef BuffConfig;


}

UCLASS(Abstract)
class UAS_GameModeSettingsPVX : UAS_GameModeSettings
{
    UPROPERTY()
    TArray<TSubclassOf<ACharacterPrefab>> BossPrefabs;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> HelpMonsterPrefab;
    UPROPERTY()
    TSubclassOf<APropPrefab> DoomHeartPrefab;
    UPROPERTY()
    UDataTable MonsterKillExpDataTable;
    UPROPERTY()
    UDataTable LevelExpDataTable;
    UPROPERTY()
    UDataTable LevelExpDataTable_Boss;
    UPROPERTY()
    FBuffConfigRef LevelUpBuff_Player;
    UPROPERTY()
    FBuffConfigRef LevelUpBuff_Boss;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig_PlayerKill;
    UPROPERTY()
    TArray<FUpgradeMonsterData> UpgradeMonsterDatas;
    UPROPERTY()
    TArray<FLevelProgressData> LevelProgressDatas;
    UPROPERTY()
    FDataTablePtr DamageCoefficientDataTable;
    UPROPERTY()
    TArray<FTime_ExpMultiplier_Data> Time_ExpMultiplier_Datas;
    UPROPERTY()
    int SelectRoleTime = 30;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> CurrencyItemConfig;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> PhaseTrackingCommissionConfig;
    UPROPERTY()
    bool bEnablePIEQuickTest = false;
    UPROPERTY()
    bool bEnablePIEQuickTestEntryUI = true;
    UPROPERTY()
    TArray<int> PIE_Team1AvatarIndexList;
    UPROPERTY()
    TArray<int> PIE_Team2AvatarIndexList;
    UPROPERTY()
    int PIE_TeamBossPrefabIdx = -1;
    UPROPERTY()
    int PIE_SelectRoleTime = 2;
    UPROPERTY()
    TArray<FPVX_SettlementPhaseConfig> SettlementPhaseConfigs;
    UPROPERTY()
    TArray<FPVX_SettlementFactionPhases> SettlementFactionPhases;


}

