
enum ECommissionFinishScoreTier
{
    TierNone,
    TierC,
    TierB,
    TierA,
    TierS,
    TierSPlus,
    TierSPlusPlus,
}


struct FCommissionRating
{
    UPROPERTY()
    float32 RatingScorePercentRequst;
    UPROPERTY()
    FText RatingText;
    UPROPERTY()
    int RatingImageIndex;


}

struct FCommissionScoreToTier
{
    UPROPERTY()
    int Score;
    UPROPERTY()
    ECommissionFinishScoreTier TierLevel;
    UPROPERTY()
    FText TierText;
    UPROPERTY()
    int RatingImageIndex;


}

struct FCommissionFinishScoreRulePair
{
    UPROPERTY()
    int Metric;
    UPROPERTY()
    int Score;


}

struct FCommissionFinishScoreRule
{
    UPROPERTY()
    int MainObjectFinish;
    UPROPERTY()
    int SubObjectFinish;
    UPROPERTY()
    TArray<FCommissionFinishScoreRulePair> FinishTimeMinutes;
    UPROPERTY()
    TArray<FCommissionFinishScoreRulePair> TeamTotalDeathCount;
    UPROPERTY()
    TArray<FCommissionFinishScoreRulePair> TeamTotalNearDeathCount;


}

class UCommissionSettings : UGameplaySettingsBase
{
    UPROPERTY()
    float32 DelaySettlementTime = 5.0f;
    UPROPERTY()
    float32 CommissionFinishScoringLifetime = 3.0f;
    UPROPERTY()
    float32 RaceCommissionFinishLifetime = 1.0f;
    UPROPERTY()
    float32 CommissionFinishRweardLifetime = 3.0f;
    UPROPERTY()
    float32 CommissionFiniSocialPageLifetime = 3.0f;
    UPROPERTY()
    float32 CommissionFailKickPlayerTime = 10.0f;
    UPROPERTY()
    float32 CommissionFinishKickPlayerTime = 300.0f;
    UPROPERTY()
    float32 MissionFailKickPlayerTime = 10.0f;
    UPROPERTY()
    float32 MissionFinishKickPlayerTime = 300.0f;
    UPROPERTY()
    bool bSetGuidingPathToTarget;
    UPROPERTY()
    FBuffConfigRef CommissionEndBuffConfig;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommissionFinishSettlementMain;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CommissionFinishSettlementPerformance;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> CommissionStartPopup;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> CommissionSuccessPopup;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> CommissionFailPopup;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> CommissionOnPlayerDeathPopup;
    UPROPERTY()
    FText RaceCommissionLeaderboardHoverTitle;
    UPROPERTY()
    FText RaceCommissionLeaderboardHoverDesc;
    UPROPERTY()
    int MainObjectiveScore = 8;
    UPROPERTY()
    int SubObjectiveScore = 2;
    UPROPERTY()
    int RandomAndEnvironmentObjScore = 2;
    UPROPERTY()
    int ChallengeObjectiveScore = 4;
    UPROPERTY()
    int Special_EnvironmentEndingScore = 2;
    UPROPERTY()
    int Special_TeamHaveFriendsScore = 1;
    UPROPERTY()
    TArray<ECommissionType> HiddenCommissionTypes;
    UPROPERTY()
    TArray<UDataTable> HiddenCommissionTables;
    UPROPERTY()
    TArray<FCommissionRating> Rating_Normal;
    UPROPERTY()
    TArray<FCommissionRating> Rating_Hard;
    UPROPERTY()
    TArray<FCommissionRating> Rating_Extreme;
    UPROPERTY()
    TMap<ECommissionTier, int> RaceCommissionTierToImageIndex;
    UPROPERTY()
    TArray<FCommissionScoreToTier> Score2Tier_Normal;
    UPROPERTY()
    TArray<FCommissionScoreToTier> Score2Tier_Hard;
    UPROPERTY()
    TArray<FCommissionScoreToTier> Score2Tier_Extreme;
    UPROPERTY()
    FCommissionFinishScoreRule ScoreRule_Normal;
    UPROPERTY()
    FCommissionFinishScoreRule ScoreRule_Hard;
    UPROPERTY()
    FCommissionFinishScoreRule ScoreRule_Extreme;
    UPROPERTY()
    TMap<ECommissionFinishScoreTier, int> ScoreTier2MedalRewardPercentage;
    UPROPERTY()
    TDataObjectPtr<FPresentationRuleConfig> CommissionTargetPresentationRule;
    UPROPERTY()
    float32 LeaderboardCacheDurationSec = 30.0f;
    UPROPERTY()
    float32 CommissionLowTimeWarningMinutes = 5.0f;
    UPROPERTY()
    FBuffConfigRef CommissionDeathBuffConfig;
    UPROPERTY()
    TMap<ECommissionType, TDataObjectPtr<FPveCommissionMatchConfig>> DefaultMatchConfigs;


}

