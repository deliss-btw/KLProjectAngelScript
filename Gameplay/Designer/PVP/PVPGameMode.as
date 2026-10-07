

// NOTE: class defaults are not authored in this module: FPVPGameModeFlowSettings (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FPVPGameModeFlowSettings : FGameModeFlowSettings
{
    FGameModeFlowSettings _base_FGameModeFlowSettings;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig_PlayerKill;
    UPROPERTY()
    EPVPGameRuleType GameRuleType;
    UPROPERTY()
    FRuntimeFloatCurve TDMKillTargetByPlayerCount;
    UPROPERTY()
    int TDMKillScoreLimit;
    UPROPERTY()
    int TDMMaxMatchDurationSeconds;
    UPROPERTY()
    int BrawlPrepDurationSeconds;
    UPROPERTY()
    int TDMRoundPrepDurationSeconds;
    UPROPERTY()
    int TDMRoundCombatDurationSeconds;
    UPROPERTY()
    int TDMRoundsToWin;
    UPROPERTY()
    int TDMRoundIntermissionSeconds;
    UPROPERTY()
    int TDMRespawnDurationSeconds;
    UPROPERTY()
    int FinishDisconnectDelaySeconds;
    UPROPERTY()
    int PotionMaxCount;
    UPROPERTY()
    TDataObjectPtr<FNPCMainConfig> BotNPCConfig;

    FPVPGameModeFlowSettings()
    {
        super();
        this.GameRuleType = EPVPGameRuleType(0);
        this.TDMKillTargetByPlayerCount = FRuntimeCurveUtils::CreateLinear(0.0f, 30.0f, 32.0f, 30.0f);
        this.TDMKillScoreLimit = 30;
        this.TDMMaxMatchDurationSeconds = 1800;
        this.BrawlPrepDurationSeconds = 30;
        this.TDMRoundPrepDurationSeconds = 30;
        this.TDMRoundCombatDurationSeconds = 180;
        this.TDMRoundsToWin = 3;
        this.TDMRoundIntermissionSeconds = 10;
        this.TDMRespawnDurationSeconds = 5;
        this.FinishDisconnectDelaySeconds = 25;
        this.PotionMaxCount = 1;
        this.__InitDefaults();
        return;
    }
}

class UPVPGameModeFlow : UPVPGameModeFlowBase
{
    UPVPGameModeFlow()
    {
        super();
        return;
    }
    void OnTickPreparing(const FCS_GameModeProfile &inout Profile) const
    {
        Super::TickPreparingShared();
        return;
    }
    void OnTickStarting(const FCS_GameModeProfile &inout Profile) const
    {
        this.GetActiveRuleFlow().OnTickStarting(Profile);
        return;
    }
    void OnTickPlaying(const FCS_GameModeProfile &inout Profile) const
    {
        this.GetActiveRuleFlow().OnTickPlaying(Profile);
        return;
    }
    void OnTickFinishing(const FCS_GameModeProfile &inout Profile) const
    {
        this.GetActiveRuleFlow().OnTickFinishing(Profile);
        return;
    }
    void OnHandleDeath(const FCS_GameModeProfile &inout Profile, FCE_DeathEvent &inout Event) const
    {
        this.GetActiveRuleFlow().OnHandleDeath(Profile, Event);
        return;
    }
    void OnHandleReborn(const FCS_GameModeProfile &inout Profile, FCE_Reborn &inout Event) const
    {
        this.GetActiveRuleFlow().OnHandleReborn(Profile, Event);
        return;
    }
    void OnHandleReviveTeleport(const FCS_GameModeProfile &inout Profile, FCE_Event_ReviveTeleport &inout Event) const
    {
        this.GetActiveRuleFlow().OnHandleReviveTeleport(Profile, Event);
        return;
    }
    UPVPGameModeFlowBase GetActiveRuleFlow() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if ((int(0.GetSelectedGameRuleType())) == 2)
        {
            return UPVPTDMGameModeFlow.GetDefaultObject();
        }
        UPVPBrawlGameModeFlow local_16 = UPVPBrawlGameModeFlow.GetDefaultObject();
        return local_16;
    }
}

