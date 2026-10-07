

UCLASS(Abstract)
class UAS_GameModeSettingsPVP : UAS_GameModeSettings
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig_PlayerKill;
    UPROPERTY()
    EPVPGameRuleType GameRuleType = EPVPGameRuleType(0);
    UPROPERTY()
    FDataTablePtr DamageCoefficientDataTable;
    UPROPERTY()
    FRuntimeFloatCurve TDMKillTargetByPlayerCount = FRuntimeCurveUtils::CreateLinear(0.0f, 30.0f, 32.0f, 30.0f);
    UPROPERTY()
    int TDMKillScoreLimit = 30;
    UPROPERTY()
    int TDMMaxMatchDurationSeconds = 1800;
    UPROPERTY()
    int BrawlPrepDurationSeconds = 30;
    UPROPERTY()
    int TDMRoundPrepDurationSeconds = 30;
    UPROPERTY()
    int TDMRoundCombatDurationSeconds = 180;
    UPROPERTY()
    int TDMRoundsToWin = 3;
    UPROPERTY()
    int TDMRoundIntermissionSeconds = 10;
    UPROPERTY()
    int TDMRespawnDurationSeconds = 5;
    UPROPERTY()
    int FinishDisconnectDelaySeconds = 25;
    UPROPERTY()
    int PotionMaxCount = 1;
    UPROPERTY()
    TDataObjectPtr<FNPCMainConfig> BotNPCConfig;
    UPROPERTY()
    bool bEnablePIEQuickTest = false;
    UPROPERTY()
    TArray<int> PIE_Team1AvatarIndexList;
    UPROPERTY()
    TArray<int> PIE_Team2AvatarIndexList;
    UPROPERTY()
    int PIE_TeamBossPrefabIdx = -1;


}

