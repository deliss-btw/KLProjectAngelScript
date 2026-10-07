
enum ECommissionPrepareState
{
    Pending,
    Prepared,
    Rejected,
}

enum ECommissionFailReason
{
    Unknown,
    ObjectiveFailed,
    MaxDeathCountReached,
    CommissionTimeout,
    Custom,
}

enum ECommissionFinishScoreType
{
    MainObjective,
    FinishTime,
    TeamDeath,
    TeamNearDeath,
    SubObjective,
}

namespace __INTENRAL_FCS_CommissionDSGlobalInfo_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionDSGlobalInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionDSGlobalInfo>();
    const FCS_CommissionDSGlobalInfo DefaultValue = FCS_CommissionDSGlobalInfo();
}
namespace __INTENRAL_FCS_CommissionDSGlobalInfoView_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionDSGlobalInfoView> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionDSGlobalInfoView>();
    const FCS_CommissionDSGlobalInfoView DefaultValue = FCS_CommissionDSGlobalInfoView();
}
namespace __INTENRAL_FCS_CommissionInfo_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionInfo>();
    const FCS_CommissionInfo DefaultValue = FCS_CommissionInfo();
}
namespace __INTENRAL_FCS_CommissionGuideInfo_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionGuideInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionGuideInfo>();
    const FCS_CommissionGuideInfo DefaultValue = FCS_CommissionGuideInfo();
}
namespace __INTENRAL_FCS_CommissionFinish_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionFinish> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionFinish>();
    const FCS_CommissionFinish DefaultValue = FCS_CommissionFinish();
}
namespace __INTENRAL_FC_CommissionFinishReward_NS
{
    const TECSComponentDerivedPtr<FC_CommissionFinishReward> DerivedPtr = TECSComponentDerivedPtr<FC_CommissionFinishReward>();
    const FC_CommissionFinishReward DefaultValue = FC_CommissionFinishReward();
}
namespace __INTENRAL_FC_CommissionFinishRaceResult_NS
{
    const TECSComponentDerivedPtr<FC_CommissionFinishRaceResult> DerivedPtr = TECSComponentDerivedPtr<FC_CommissionFinishRaceResult>();
    const FC_CommissionFinishRaceResult DefaultValue = FC_CommissionFinishRaceResult();
}
namespace __INTENRAL_FC_PlayerFinishCommissionTag_NS
{
    const TECSComponentDerivedPtr<FC_PlayerFinishCommissionTag> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerFinishCommissionTag>();
    const FC_PlayerFinishCommissionTag DefaultValue = FC_PlayerFinishCommissionTag();
}
namespace __INTENRAL_FCS_CommissionTargetNeedUpdateTag_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionTargetNeedUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionTargetNeedUpdateTag>();
    const FCS_CommissionTargetNeedUpdateTag DefaultValue = FCS_CommissionTargetNeedUpdateTag();
}
namespace __INTENRAL_FC_PlayerCommissionTargetNeedUpdateTag_NS
{
    const TECSComponentDerivedPtr<FC_PlayerCommissionTargetNeedUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerCommissionTargetNeedUpdateTag>();
    const FC_PlayerCommissionTargetNeedUpdateTag DefaultValue = FC_PlayerCommissionTargetNeedUpdateTag();
}
namespace __INTENRAL_FCS_CommissionInfoChangedTag_NS
{
    const TECSComponentDerivedPtr<FCS_CommissionInfoChangedTag> DerivedPtr = TECSComponentDerivedPtr<FCS_CommissionInfoChangedTag>();
    const FCS_CommissionInfoChangedTag DefaultValue = FCS_CommissionInfoChangedTag();
}
namespace __INTENRAL_FC_DifficultyConfigOverride_NS
{
    const TECSComponentDerivedPtr<FC_DifficultyConfigOverride> DerivedPtr = TECSComponentDerivedPtr<FC_DifficultyConfigOverride>();
    const FC_DifficultyConfigOverride DefaultValue = FC_DifficultyConfigOverride();
}
namespace __INTENRAL_FCE_NotifyCommissionConfigChange_NS
{
    const TECSEventDerivedPtr<FCE_NotifyCommissionConfigChange> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyCommissionConfigChange>();
}
namespace __INTENRAL_FCE_OnCommissionFinishRewardRspEvent_NS
{
    const TECSEventDerivedPtr<FCE_OnCommissionFinishRewardRspEvent> DerivedPtr = TECSEventDerivedPtr<FCE_OnCommissionFinishRewardRspEvent>();
}
namespace __INTENRAL_FCE_CommissionObjectiveFinished_NS
{
    const TECSEventDerivedPtr<FCE_CommissionObjectiveFinished> DerivedPtr = TECSEventDerivedPtr<FCE_CommissionObjectiveFinished>();
}
namespace __INTENRAL_FCE_CommissionFinished_NS
{
    const TECSEventDerivedPtr<FCE_CommissionFinished> DerivedPtr = TECSEventDerivedPtr<FCE_CommissionFinished>();
}
namespace __INTENRAL_FCE_RequestCommissionFinishedLikePlayer_NS
{
    const TECSEventDerivedPtr<FCE_RequestCommissionFinishedLikePlayer> DerivedPtr = TECSEventDerivedPtr<FCE_RequestCommissionFinishedLikePlayer>();

}
struct FCommissionFinishRewardItem
{
    UPROPERTY()
    uint m_ItemID;
    UPROPERTY()
    uint m_Count;

    FCommissionFinishRewardItem(const uint inItemID, const uint inCount)
    {
        this.SetItemID(inItemID);
        this.SetCount(inCount);
        return;
    }
    uint GetItemID() const property
    {
        return this.m_ItemID;
    }
    void SetItemID(const uint __Value) property
    {
        this.m_ItemID = __Value;
        return;
    }
    uint GetCount() const property
    {
        return this.m_Count;
    }
    void SetCount(const uint __Value) property
    {
        this.m_Count = __Value;
        return;
    }
}

struct FCommissionEntityInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    FVector m_Position;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> m_PrefabConfig;

    FCommissionEntityInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCommissionEntityInfo(const FCommissionEntityInfo &inout Other)
    {
        this.m_Entity = Other.m_Entity;
        this.m_Position = Other.m_Position;
        this.m_PrefabConfig = Other.m_PrefabConfig;
        return;
    }
    FCommissionEntityInfo(const FECSEntity &inout InEntity, const FVector &inout InPosition, const TDataObjectPtr<FBasePrefabConfig> &inout InPrefabConfig)
    {
        this.SetEntity(InEntity);
        this.SetPosition(InPosition);
        this.SetPrefabConfig(InPrefabConfig);
        return;
    }
    FCommissionEntityInfo opAssign(const FCommissionEntityInfo &inout Other)
    {
        FCommissionEntityInfo __r;
        this.SetEntity(Other.GetEntity());
        this.SetPosition(Other.GetPosition());
        this.SetPrefabConfig(Other.GetPrefabConfig());
        return __r;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Entity = __Value;
        return;
    }
    FVector GetPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Position() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Position = __Value;
        return;
    }
    TDataObjectPtr<FBasePrefabConfig> GetPrefabConfig() const property
    {
        TDataObjectPtr<FBasePrefabConfig> __r;
        return __r;
    }
    TDataObjectPtr<FBasePrefabConfig> GetModify_PrefabConfig() property
    {
        TDataObjectPtr<FBasePrefabConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetPrefabConfig(const TDataObjectPtr<FBasePrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PrefabConfig = __Value;
        return;
    }
}

struct FCommissionTargetProgress
{
    UPROPERTY()
    int m_SuccessProgressValue;
    UPROPERTY()
    int m_FailedProgressValue;


    int GetSuccessProgressValue() const property
    {
        return this.m_SuccessProgressValue;
    }
    void SetSuccessProgressValue(const int __Value) property
    {
        this.m_SuccessProgressValue = __Value;
        return;
    }
    int GetFailedProgressValue() const property
    {
        return this.m_FailedProgressValue;
    }
    void SetFailedProgressValue(const int __Value) property
    {
        this.m_FailedProgressValue = __Value;
        return;
    }
}

struct FCS_CommissionDSGlobalInfo : FECSSingleton
{
    UPROPERTY()
    uint64 CommissionInstId;
    UPROPERTY()
    int CommissionProgress;
    UPROPERTY()
    float32 StartTimeInHoursOverride = -1.0f;
    UPROPERTY()
    float32 TimeSpeedOverride = -1.0f;
    UPROPERTY()
    TDataObjectPtr<FCommissionTimeConfig> SelectedCommissionTimeConfig;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> SubTargetConfig;
    UPROPERTY()
    TDataObjectPtr<FIntrusionPolicyConfig> IntrusionPolicyConfig;
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> SpawnAreaConfig;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> StartWeatherConfig;
    UPROPERTY()
    TMap<TDataObjectPtr<FWorldAreaConfig>, TDataObjectPtr<FWeatherGenerateTemplate>> WeatherTemplateMap;
    UPROPERTY()
    TDataObjectPtr<FCommissionEntryRuleConfig> EntryRuleConfig;


}

struct FCS_CommissionDSGlobalInfoView : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_StartTimeInHoursOverride;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_SubTargetConfig;
    UPROPERTY()
    TDataObjectPtr<FIntrusionPolicyConfig> m_IntrusionPolicyConfig;
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> m_SpawnAreaConfig;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> m_StartWeatherConfig;
    UPROPERTY()
    TDataObjectPtr<FCommissionEntryRuleConfig> m_EntryRuleConfig;

    FCS_CommissionDSGlobalInfoView()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_CommissionDSGlobalInfoView(const FCS_CommissionDSGlobalInfoView &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCS_CommissionDSGlobalInfoView opAssign(const FCS_CommissionDSGlobalInfoView &inout Other)
    {
        FCS_CommissionDSGlobalInfoView __r;
        this.SetStartTimeInHoursOverride(Other.GetStartTimeInHoursOverride());
        this.SetSubTargetConfig(Other.GetSubTargetConfig());
        this.SetIntrusionPolicyConfig(Other.GetIntrusionPolicyConfig());
        this.SetSpawnAreaConfig(Other.GetSpawnAreaConfig());
        this.SetStartWeatherConfig(Other.GetStartWeatherConfig());
        this.SetEntryRuleConfig(Other.GetEntryRuleConfig());
        return __r;
    }
    float32 GetStartTimeInHoursOverride() const property
    {
        return this.m_StartTimeInHoursOverride;
    }
    void SetStartTimeInHoursOverride(const float32 __Value) property
    {
        if (this.m_StartTimeInHoursOverride == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StartTimeInHoursOverride = __Value;
        return;
    }
    TDataObjectPtr<FObjectiveConfig> GetSubTargetConfig() const property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_SubTargetConfig() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetSubTargetConfig(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SubTargetConfig = __Value;
        return;
    }
    TDataObjectPtr<FIntrusionPolicyConfig> GetIntrusionPolicyConfig() const property
    {
        TDataObjectPtr<FIntrusionPolicyConfig> __r;
        return __r;
    }
    TDataObjectPtr<FIntrusionPolicyConfig> GetModify_IntrusionPolicyConfig() property
    {
        TDataObjectPtr<FIntrusionPolicyConfig> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetIntrusionPolicyConfig(const TDataObjectPtr<FIntrusionPolicyConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_IntrusionPolicyConfig = __Value;
        return;
    }
    const TDataObjectPtr<FWorldAreaConfig> GetSpawnAreaConfig() const property
    {
        const TDataObjectPtr<FWorldAreaConfig> __r;
        return __r;
    }
    TDataObjectPtr<FWorldAreaConfig> GetModify_SpawnAreaConfig() property
    {
        TDataObjectPtr<FWorldAreaConfig> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetSpawnAreaConfig(const TDataObjectPtr<FWorldAreaConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_SpawnAreaConfig = __Value;
        return;
    }
    const TDataObjectPtr<FWeatherConfig> GetStartWeatherConfig() const property
    {
        const TDataObjectPtr<FWeatherConfig> __r;
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetModify_StartWeatherConfig() property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetStartWeatherConfig(const TDataObjectPtr<FWeatherConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_StartWeatherConfig = __Value;
        return;
    }
    TDataObjectPtr<FCommissionEntryRuleConfig> GetEntryRuleConfig() const property
    {
        TDataObjectPtr<FCommissionEntryRuleConfig> __r;
        return __r;
    }
    TDataObjectPtr<FCommissionEntryRuleConfig> GetModify_EntryRuleConfig() property
    {
        TDataObjectPtr<FCommissionEntryRuleConfig> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetEntryRuleConfig(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_EntryRuleConfig = __Value;
        return;
    }
}

struct FCS_CommissionInfo : FECSSingleton
{
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;
    UPROPERTY()
    FFPTime CommissionTimeoutTime;
    UPROPERTY()
    FFPTime CommissionStartTime;
    UPROPERTY()
    bool bRaceCommissionStarted;
    UPROPERTY()
    FFPTime RaceCommissionStartTime;
    UPROPERTY()
    uint CommissionTargetObjectiveInstanceId;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> CommissionTargetObjective;
    UPROPERTY()
    FCommissionTargetProgress Progress;
    UPROPERTY()
    TMap<uint, FCommissionTargetProgress> ChildProgress;
    UPROPERTY()
    TArray<FCommissionEntityInfo> CommissionTargetEntityInfos;
    UPROPERTY()
    TArray<FECSEntity> CommissionTargetEntities;
    UPROPERTY()
    int TotalDeathCount;
    UPROPERTY()
    int bHasFinishChallengeFactor;
    UPROPERTY()
    int RandomEventSuccessNum;
    UPROPERTY()
    bool bSkipRewardUI;
    UPROPERTY()
    bool bMonsterHPBar;


}

struct FCS_CommissionGuideInfo : FECSSingleton
{
    UPROPERTY()
    uint CommissionTargetObjectiveInstanceId;
    UPROPERTY()
    EGuideStyleType GuideStyleType;


}

struct FFinishTeamMemberInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_PlayerID;
    UPROPERTY()
    FECSEntityId m_PlayerEntityId;
    UPROPERTY()
    FString m_PlayerNameCached;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarPrefabConfig;
    UPROPERTY()
    int m_LikeCount;
    UPROPERTY()
    uint8 m_PlayerIndex;
    UPROPERTY()
    TArray<FCommissionBadgeRewardResurlt> m_RewardBadge;

    FFinishTeamMemberInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFinishTeamMemberInfo(const FFinishTeamMemberInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFinishTeamMemberInfo opAssign(const FFinishTeamMemberInfo &inout Other)
    {
        FFinishTeamMemberInfo __r;
        this.SetPlayerID(Other.GetPlayerID());
        this.SetPlayerEntityId(Other.GetPlayerEntityId());
        this.SetPlayerNameCached(Other.GetPlayerNameCached());
        this.SetAvatarPrefabConfig(Other.GetAvatarPrefabConfig());
        this.SetLikeCount(Other.GetLikeCount());
        this.SetPlayerIndex(uint8(Other.GetPlayerIndex()));
        this.SetRewardBadge(Other.GetRewardBadge());
        return __r;
    }
    uint GetPlayerID() const property
    {
        return this.m_PlayerID;
    }
    void SetPlayerID(const uint __Value) property
    {
        if (this.m_PlayerID == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerID = __Value;
        return;
    }
    const FECSEntityId GetPlayerEntityId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_PlayerEntityId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPlayerEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PlayerEntityId = __Value;
        return;
    }
    FString GetPlayerNameCached() const property
    {
        return this.m_PlayerNameCached;
    }
    void SetPlayerNameCached(const FString &inout __Value) property
    {
        if ((this.m_PlayerNameCached == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PlayerNameCached = __Value;
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetAvatarPrefabConfig() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarPrefabConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetAvatarPrefabConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_AvatarPrefabConfig = __Value;
        return;
    }
    int GetLikeCount() const property
    {
        return this.m_LikeCount;
    }
    void SetLikeCount(const int __Value) property
    {
        if (this.m_LikeCount == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_LikeCount = __Value;
        return;
    }
    uint8 GetPlayerIndex() const property
    {
        return this.m_PlayerIndex;
    }
    void SetPlayerIndex(const uint8 __Value) property
    {
        if (this.m_PlayerIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_PlayerIndex = (__Value != 0);
        return;
    }
    const TArray<FCommissionBadgeRewardResurlt> GetRewardBadge() const property
    {
        const TArray<FCommissionBadgeRewardResurlt> __r;
        return __r;
    }
    TArray<FCommissionBadgeRewardResurlt> GetModify_RewardBadge() property
    {
        TArray<FCommissionBadgeRewardResurlt> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetRewardBadge(const TArray<FCommissionBadgeRewardResurlt> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_RewardBadge = __Value;
        return;
    }
}

struct FCommissionFinishScoreItem
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ECommissionFinishScoreType m_Type;
    UPROPERTY()
    int m_Num;
    UPROPERTY()
    int m_Score;

    FCommissionFinishScoreItem()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCommissionFinishScoreItem(const FCommissionFinishScoreItem &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCommissionFinishScoreItem opAssign(const FCommissionFinishScoreItem &inout Other)
    {
        FCommissionFinishScoreItem __r;
        this.SetType(Other.GetType());
        this.SetNum(Other.GetNum());
        this.SetScore(Other.GetScore());
        return __r;
    }
    ECommissionFinishScoreType GetType() const property
    {
        return this.m_Type;
    }
    void SetType(const ECommissionFinishScoreType __Value) property
    {
        if (int(this.m_Type) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Type = __Value;
        return;
    }
    int GetNum() const property
    {
        return this.m_Num;
    }
    void SetNum(const int __Value) property
    {
        if (this.m_Num == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Num = __Value;
        return;
    }
    int GetScore() const property
    {
        return this.m_Score;
    }
    void SetScore(const int __Value) property
    {
        if (this.m_Score == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Score = __Value;
        return;
    }
}

struct FCS_CommissionFinish : FECSSingleton
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bSuccess;
    UPROPERTY()
    ECommissionFailReason m_FailReason;
    UPROPERTY()
    bool m_bKickedPlayer;
    UPROPERTY()
    FFPTime m_FinishTime;
    UPROPERTY()
    FFPTime m_KickPlayerTime;
    UPROPERTY()
    bool m_MainObjectiveIsFinish;
    UPROPERTY()
    bool m_SubObjectiveIsFinish;
    UPROPERTY()
    int m_RandomEventFinishNum;
    UPROPERTY()
    bool m_ChallengeObjectiveIsFinish;
    UPROPERTY()
    uint m_RewardScore;
    UPROPERTY()
    uint m_TotalScore;
    UPROPERTY()
    uint m_FinishTier;
    UPROPERTY()
    bool m_Special_EnvironmentEndingFinish;
    UPROPERTY()
    TArray<FFinishTeamMemberInfo> m_FinishTeamers;
    UPROPERTY()
    TArray<FCommissionFinishScoreItem> m_ScoreItems;

    FCS_CommissionFinish()
    {
        this.m_bSuccess = false;
        this.m_FailReason = ECommissionFailReason(0);
        this.m_bKickedPlayer = false;
        this.m_MainObjectiveIsFinish = false;
        this.m_SubObjectiveIsFinish = false;
        this.m_RandomEventFinishNum = 0;
        this.m_ChallengeObjectiveIsFinish = false;
        this.m_RewardScore = 0;
        this.m_TotalScore = 0;
        this.m_FinishTier = 0;
        this.m_Special_EnvironmentEndingFinish = false;
        this.__InitDirtyFlags();
        return;
    }
    FCS_CommissionFinish(const FCS_CommissionFinish &inout Other)
    {
        this.m_bSuccess = false;
        this.m_FailReason = ECommissionFailReason(0);
        this.m_bKickedPlayer = false;
        this.m_MainObjectiveIsFinish = false;
        this.m_SubObjectiveIsFinish = false;
        this.m_RandomEventFinishNum = 0;
        this.m_ChallengeObjectiveIsFinish = false;
        this.m_RewardScore = 0;
        this.m_TotalScore = 0;
        this.m_FinishTier = 0;
        this.m_Special_EnvironmentEndingFinish = false;
        this.__InitDirtyFlags();
        this.m_bSuccess = Other.m_bSuccess;
        this.m_FailReason = Other.m_FailReason;
        this.m_bKickedPlayer = Other.m_bKickedPlayer;
        this.m_FinishTime = Other.m_FinishTime;
        this.m_KickPlayerTime = Other.m_KickPlayerTime;
        this.m_MainObjectiveIsFinish = Other.m_MainObjectiveIsFinish;
        this.m_SubObjectiveIsFinish = Other.m_SubObjectiveIsFinish;
        this.m_RandomEventFinishNum = int(Other.m_RandomEventFinishNum);
        this.m_ChallengeObjectiveIsFinish = Other.m_ChallengeObjectiveIsFinish;
        this.m_RewardScore = int(Other.m_RewardScore);
        this.m_TotalScore = int(Other.m_TotalScore);
        this.m_FinishTier = int(Other.m_FinishTier);
        this.m_Special_EnvironmentEndingFinish = Other.m_Special_EnvironmentEndingFinish;
        this.m_FinishTeamers = Other.m_FinishTeamers;
        this.m_ScoreItems = Other.m_ScoreItems;
        return;
    }
    FCS_CommissionFinish opAssign(const FCS_CommissionFinish &inout Other)
    {
        FCS_CommissionFinish __r;
        this.SetbSuccess(Other.GetbSuccess());
        this.SetFailReason(Other.GetFailReason());
        this.SetbKickedPlayer(Other.GetbKickedPlayer());
        this.SetFinishTime(Other.GetFinishTime());
        this.SetKickPlayerTime(Other.GetKickPlayerTime());
        this.SetMainObjectiveIsFinish(Other.GetMainObjectiveIsFinish());
        this.SetSubObjectiveIsFinish(Other.GetSubObjectiveIsFinish());
        this.SetRandomEventFinishNum(Other.GetRandomEventFinishNum());
        this.SetChallengeObjectiveIsFinish(Other.GetChallengeObjectiveIsFinish());
        this.SetRewardScore(Other.GetRewardScore());
        this.SetTotalScore(Other.GetTotalScore());
        this.SetFinishTier(Other.GetFinishTier());
        this.SetSpecial_EnvironmentEndingFinish(Other.GetSpecial_EnvironmentEndingFinish());
        this.SetFinishTeamers(Other.GetFinishTeamers());
        this.SetScoreItems(Other.GetScoreItems());
        return __r;
    }
    bool GetbSuccess() const property
    {
        return this.m_bSuccess;
    }
    void SetbSuccess(const bool __Value) property
    {
        if (!(this.m_bSuccess) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bSuccess = __Value;
        return;
    }
    ECommissionFailReason GetFailReason() const property
    {
        return this.m_FailReason;
    }
    void SetFailReason(const ECommissionFailReason __Value) property
    {
        if (int(this.m_FailReason) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FailReason = __Value;
        return;
    }
    bool GetbKickedPlayer() const property
    {
        return this.m_bKickedPlayer;
    }
    void SetbKickedPlayer(const bool __Value) property
    {
        if (!(this.m_bKickedPlayer) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bKickedPlayer = __Value;
        return;
    }
    FFPTime GetFinishTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_FinishTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetFinishTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FinishTime = __Value;
        return;
    }
    const FFPTime GetKickPlayerTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_KickPlayerTime() property
    {
        FFPTime __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetKickPlayerTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_KickPlayerTime = __Value;
        return;
    }
    bool GetMainObjectiveIsFinish() const property
    {
        return this.m_MainObjectiveIsFinish;
    }
    void SetMainObjectiveIsFinish(const bool __Value) property
    {
        if (!(this.m_MainObjectiveIsFinish) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_MainObjectiveIsFinish = __Value;
        return;
    }
    bool GetSubObjectiveIsFinish() const property
    {
        return this.m_SubObjectiveIsFinish;
    }
    void SetSubObjectiveIsFinish(const bool __Value) property
    {
        if (!(this.m_SubObjectiveIsFinish) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_SubObjectiveIsFinish = __Value;
        return;
    }
    int GetRandomEventFinishNum() const property
    {
        return this.m_RandomEventFinishNum;
    }
    void SetRandomEventFinishNum(const int __Value) property
    {
        if (this.m_RandomEventFinishNum == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_RandomEventFinishNum = __Value;
        return;
    }
    bool GetChallengeObjectiveIsFinish() const property
    {
        return this.m_ChallengeObjectiveIsFinish;
    }
    void SetChallengeObjectiveIsFinish(const bool __Value) property
    {
        if (!(this.m_ChallengeObjectiveIsFinish) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_ChallengeObjectiveIsFinish = __Value;
        return;
    }
    uint GetRewardScore() const property
    {
        return this.m_RewardScore;
    }
    void SetRewardScore(const uint __Value) property
    {
        if (this.m_RewardScore == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_RewardScore = __Value;
        return;
    }
    uint GetTotalScore() const property
    {
        return this.m_TotalScore;
    }
    void SetTotalScore(const uint __Value) property
    {
        if (this.m_TotalScore == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_TotalScore = __Value;
        return;
    }
    uint GetFinishTier() const property
    {
        return this.m_FinishTier;
    }
    void SetFinishTier(const uint __Value) property
    {
        if (this.m_FinishTier == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_FinishTier = __Value;
        return;
    }
    bool GetSpecial_EnvironmentEndingFinish() const property
    {
        return this.m_Special_EnvironmentEndingFinish;
    }
    void SetSpecial_EnvironmentEndingFinish(const bool __Value) property
    {
        if (!(this.m_Special_EnvironmentEndingFinish) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_Special_EnvironmentEndingFinish = __Value;
        return;
    }
    const TArray<FFinishTeamMemberInfo> GetFinishTeamers() const property
    {
        const TArray<FFinishTeamMemberInfo> __r;
        return __r;
    }
    TArray<FFinishTeamMemberInfo> GetModify_FinishTeamers() property
    {
        TArray<FFinishTeamMemberInfo> __r;
        this.__MarkDirty(13);
        return __r;
    }
    void SetFinishTeamers(const TArray<FFinishTeamMemberInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_FinishTeamers = __Value;
        return;
    }
    const TArray<FCommissionFinishScoreItem> GetScoreItems() const property
    {
        const TArray<FCommissionFinishScoreItem> __r;
        return __r;
    }
    TArray<FCommissionFinishScoreItem> GetModify_ScoreItems() property
    {
        TArray<FCommissionFinishScoreItem> __r;
        this.__MarkDirty(14);
        return __r;
    }
    void SetScoreItems(const TArray<FCommissionFinishScoreItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_ScoreItems = __Value;
        return;
    }
}

struct FC_CommissionFinishReward : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FCommissionFinishRewardItem> m_CommissionReward;
    UPROPERTY()
    TArray<FCommissionFinishRewardItem> m_CommissionFirstReward;

    FC_CommissionFinishReward()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CommissionFinishReward(const FC_CommissionFinishReward &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_CommissionReward = Other.m_CommissionReward;
        this.m_CommissionFirstReward = Other.m_CommissionFirstReward;
        return;
    }
    FC_CommissionFinishReward opAssign(const FC_CommissionFinishReward &inout Other)
    {
        FC_CommissionFinishReward __r;
        this.SetCommissionReward(Other.GetCommissionReward());
        this.SetCommissionFirstReward(Other.GetCommissionFirstReward());
        return __r;
    }
    const TArray<FCommissionFinishRewardItem> GetCommissionReward() const property
    {
        const TArray<FCommissionFinishRewardItem> __r;
        return __r;
    }
    TArray<FCommissionFinishRewardItem> GetModify_CommissionReward() property
    {
        TArray<FCommissionFinishRewardItem> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetCommissionReward(const TArray<FCommissionFinishRewardItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CommissionReward = __Value;
        return;
    }
    const TArray<FCommissionFinishRewardItem> GetCommissionFirstReward() const property
    {
        const TArray<FCommissionFinishRewardItem> __r;
        return __r;
    }
    TArray<FCommissionFinishRewardItem> GetModify_CommissionFirstReward() property
    {
        TArray<FCommissionFinishRewardItem> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCommissionFirstReward(const TArray<FCommissionFinishRewardItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CommissionFirstReward = __Value;
        return;
    }
}

struct FC_CommissionFinishRaceResult : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<ECommissionTier> m_AchievedTierList;
    UPROPERTY()
    int m_CostTimeSec;
    UPROPERTY()
    int m_OldBestCostTimeSec;
    UPROPERTY()
    bool m_bIsNewBest;

    FC_CommissionFinishRaceResult()
    {
        this.m_CostTimeSec = 0;
        this.m_OldBestCostTimeSec = 0;
        this.m_bIsNewBest = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_CommissionFinishRaceResult(const FC_CommissionFinishRaceResult &inout Other)
    {
        this.m_CostTimeSec = 0;
        this.m_OldBestCostTimeSec = 0;
        this.m_bIsNewBest = false;
        this.__InitDirtyFlags();
        this.m_AchievedTierList = Other.m_AchievedTierList;
        this.m_CostTimeSec = int(Other.m_CostTimeSec);
        this.m_OldBestCostTimeSec = int(Other.m_OldBestCostTimeSec);
        this.m_bIsNewBest = Other.m_bIsNewBest;
        return;
    }
    FC_CommissionFinishRaceResult opAssign(const FC_CommissionFinishRaceResult &inout Other)
    {
        FC_CommissionFinishRaceResult __r;
        this.SetAchievedTierList(Other.GetAchievedTierList());
        this.SetCostTimeSec(Other.GetCostTimeSec());
        this.SetOldBestCostTimeSec(Other.GetOldBestCostTimeSec());
        this.SetbIsNewBest(Other.GetbIsNewBest());
        return __r;
    }
    TArray<ECommissionTier> GetAchievedTierList() const property
    {
        TArray<ECommissionTier> __r;
        return __r;
    }
    TArray<ECommissionTier> GetModify_AchievedTierList() property
    {
        TArray<ECommissionTier> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAchievedTierList(const TArray<ECommissionTier> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AchievedTierList = __Value;
        return;
    }
    int GetCostTimeSec() const property
    {
        return this.m_CostTimeSec;
    }
    void SetCostTimeSec(const int __Value) property
    {
        if (this.m_CostTimeSec == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CostTimeSec = __Value;
        return;
    }
    int GetOldBestCostTimeSec() const property
    {
        return this.m_OldBestCostTimeSec;
    }
    void SetOldBestCostTimeSec(const int __Value) property
    {
        if (this.m_OldBestCostTimeSec == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_OldBestCostTimeSec = __Value;
        return;
    }
    bool GetbIsNewBest() const property
    {
        return this.m_bIsNewBest;
    }
    void SetbIsNewBest(const bool __Value) property
    {
        if (!(this.m_bIsNewBest) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bIsNewBest = __Value;
        return;
    }
}

struct FC_PlayerFinishCommissionTag : FECSComponent
{
    FC_PlayerFinishCommissionTag()
    {
        return;
    }
}

struct FCS_CommissionTargetNeedUpdateTag : FECSSingleton
{
    FCS_CommissionTargetNeedUpdateTag()
    {
        return;
    }
}

struct FC_PlayerCommissionTargetNeedUpdateTag : FECSComponent
{
    FC_PlayerCommissionTargetNeedUpdateTag()
    {
        return;
    }
}

struct FCS_CommissionInfoChangedTag : FECSSingleton
{
    FCS_CommissionInfoChangedTag()
    {
        return;
    }
}

struct FCE_NotifyCommissionConfigChange : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_NotifyCommissionConfigChange()
    {
        return;
    }
}

struct FCE_OnCommissionFinishRewardRspEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_OnCommissionFinishRewardRspEvent()
    {
        return;
    }
}

struct FCE_CommissionObjectiveFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> ObjectiveConfig;
    UPROPERTY()
    bool bSuccess;


}

struct FCE_CommissionFinished : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bSuccess;
    UPROPERTY()
    ECommissionFailReason FailReason;


}

struct FCE_RequestCommissionFinishedLikePlayer : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity FromPlayer;
    UPROPERTY()
    uint TargetPlayerID;


}

struct FC_DifficultyConfigOverride : FECSComponent
{
    UPROPERTY()
    UDataTable DifficultyLevelConfig;

    FC_DifficultyConfigOverride()
    {
        return;
    }
}

namespace ECSFunc_FCS_CommissionDSGlobalInfo
{
UFUNCTION()
bool HasCommissionDSGlobalInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionDSGlobalInfo);
}
FCS_CommissionDSGlobalInfo& AssignCommissionDSGlobalInfo(const FECSWorldPtr &inout World, const FCS_CommissionDSGlobalInfo &inout DefaultValue = FCS_CommissionDSGlobalInfo())
{
    UScriptStruct local_6 = FCS_CommissionDSGlobalInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionDSGlobalInfo_BP(const FECSWorldPtr &inout World, const FCS_CommissionDSGlobalInfo &inout DefaultValue = FCS_CommissionDSGlobalInfo())
{
    ECSFunc_FCS_CommissionDSGlobalInfo::AssignCommissionDSGlobalInfo(World, DefaultValue);
    return;
}
FCS_CommissionDSGlobalInfo& ModifyCommissionDSGlobalInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionDSGlobalInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionDSGlobalInfo& ModifyOrAddCommissionDSGlobalInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionDSGlobalInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionDSGlobalInfo& GetCommissionDSGlobalInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionDSGlobalInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionDSGlobalInfo GetCommissionDSGlobalInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommissionDSGlobalInfo __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommissionDSGlobalInfo::GetCommissionDSGlobalInfo(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommissionDSGlobalInfo GetDefaultedCommissionDSGlobalInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionDSGlobalInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionDSGlobalInfo);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CommissionDSGlobalInfo GetDefaultedCommissionDSGlobalInfo_BP(const FECSWorldPtr &inout World)
{
    FCS_CommissionDSGlobalInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveCommissionDSGlobalInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionDSGlobalInfo);
}
}
void __MonitorCommissionDSGlobalInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionDSGlobalInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionDSGlobalInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionDSGlobalInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionDSGlobalInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionDSGlobalInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CommissionDSGlobalInfoView
{
UFUNCTION()
bool HasCommissionDSGlobalInfoView(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionDSGlobalInfoView);
}
FCS_CommissionDSGlobalInfoView& AssignCommissionDSGlobalInfoView(const FECSWorldPtr &inout World, const FCS_CommissionDSGlobalInfoView &inout DefaultValue = FCS_CommissionDSGlobalInfoView())
{
    UScriptStruct local_6 = FCS_CommissionDSGlobalInfoView;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionDSGlobalInfoView_BP(const FECSWorldPtr &inout World, const FCS_CommissionDSGlobalInfoView &inout DefaultValue = FCS_CommissionDSGlobalInfoView())
{
    ECSFunc_FCS_CommissionDSGlobalInfoView::AssignCommissionDSGlobalInfoView(World, DefaultValue);
    return;
}
FCS_CommissionDSGlobalInfoView& ModifyCommissionDSGlobalInfoView(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionDSGlobalInfoView;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionDSGlobalInfoView& ModifyOrAddCommissionDSGlobalInfoView(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionDSGlobalInfoView;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionDSGlobalInfoView& GetCommissionDSGlobalInfoView(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionDSGlobalInfoView;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionDSGlobalInfoView GetCommissionDSGlobalInfoView_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CommissionDSGlobalInfoView& local_4 = ECSFunc_FCS_CommissionDSGlobalInfoView::GetCommissionDSGlobalInfoView(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CommissionDSGlobalInfoView();
}
const FCS_CommissionDSGlobalInfoView GetDefaultedCommissionDSGlobalInfoView(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionDSGlobalInfoView __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionDSGlobalInfoView);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CommissionDSGlobalInfoView GetDefaultedCommissionDSGlobalInfoView_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CommissionDSGlobalInfoView::GetDefaultedCommissionDSGlobalInfoView(World);
}
UFUNCTION()
bool RemoveCommissionDSGlobalInfoView(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionDSGlobalInfoView);
}
}
void __MonitorCommissionDSGlobalInfoViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionDSGlobalInfoView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionDSGlobalInfoViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionDSGlobalInfoView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionDSGlobalInfoViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionDSGlobalInfoView, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CommissionInfo
{
UFUNCTION()
bool HasCommissionInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionInfo);
}
FCS_CommissionInfo& AssignCommissionInfo(const FECSWorldPtr &inout World, const FCS_CommissionInfo &inout DefaultValue = FCS_CommissionInfo())
{
    UScriptStruct local_6 = FCS_CommissionInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionInfo_BP(const FECSWorldPtr &inout World, const FCS_CommissionInfo &inout DefaultValue = FCS_CommissionInfo())
{
    ECSFunc_FCS_CommissionInfo::AssignCommissionInfo(World, DefaultValue);
    return;
}
FCS_CommissionInfo& ModifyCommissionInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionInfo& ModifyOrAddCommissionInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionInfo& GetCommissionInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionInfo GetCommissionInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_CommissionInfo __r;
    bValid = false;
    bValid = ECSFunc_FCS_CommissionInfo::GetCommissionInfo(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_CommissionInfo GetDefaultedCommissionInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionInfo);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CommissionInfo GetDefaultedCommissionInfo_BP(const FECSWorldPtr &inout World)
{
    FCS_CommissionInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveCommissionInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionInfo);
}
}
void __MonitorCommissionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CommissionGuideInfo
{
UFUNCTION()
bool HasCommissionGuideInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionGuideInfo);
}
FCS_CommissionGuideInfo& AssignCommissionGuideInfo(const FECSWorldPtr &inout World, const FCS_CommissionGuideInfo &inout DefaultValue = FCS_CommissionGuideInfo())
{
    UScriptStruct local_6 = FCS_CommissionGuideInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionGuideInfo_BP(const FECSWorldPtr &inout World, const FCS_CommissionGuideInfo &inout DefaultValue = FCS_CommissionGuideInfo())
{
    ECSFunc_FCS_CommissionGuideInfo::AssignCommissionGuideInfo(World, DefaultValue);
    return;
}
FCS_CommissionGuideInfo& ModifyCommissionGuideInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionGuideInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionGuideInfo& ModifyOrAddCommissionGuideInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionGuideInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionGuideInfo& GetCommissionGuideInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionGuideInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionGuideInfo GetCommissionGuideInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CommissionGuideInfo& local_4 = ECSFunc_FCS_CommissionGuideInfo::GetCommissionGuideInfo(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CommissionGuideInfo();
}
const FCS_CommissionGuideInfo GetDefaultedCommissionGuideInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionGuideInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionGuideInfo);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CommissionGuideInfo GetDefaultedCommissionGuideInfo_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CommissionGuideInfo::GetDefaultedCommissionGuideInfo(World);
}
UFUNCTION()
bool RemoveCommissionGuideInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionGuideInfo);
}
}
void __MonitorCommissionGuideInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionGuideInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionGuideInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionGuideInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionGuideInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionGuideInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CommissionFinish
{
UFUNCTION()
bool HasCommissionFinish(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionFinish);
}
FCS_CommissionFinish& AssignCommissionFinish(const FECSWorldPtr &inout World, const FCS_CommissionFinish &inout DefaultValue = FCS_CommissionFinish())
{
    UScriptStruct local_6 = FCS_CommissionFinish;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionFinish_BP(const FECSWorldPtr &inout World, const FCS_CommissionFinish &inout DefaultValue = FCS_CommissionFinish())
{
    ECSFunc_FCS_CommissionFinish::AssignCommissionFinish(World, DefaultValue);
    return;
}
FCS_CommissionFinish& ModifyCommissionFinish(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionFinish;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionFinish& ModifyOrAddCommissionFinish(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionFinish;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionFinish& GetCommissionFinish(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionFinish;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionFinish GetCommissionFinish_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CommissionFinish& local_4 = ECSFunc_FCS_CommissionFinish::GetCommissionFinish(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CommissionFinish();
}
const FCS_CommissionFinish GetDefaultedCommissionFinish(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionFinish __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionFinish);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CommissionFinish GetDefaultedCommissionFinish_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CommissionFinish::GetDefaultedCommissionFinish(World);
}
UFUNCTION()
bool RemoveCommissionFinish(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionFinish);
}
}
void __MonitorCommissionFinishLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionFinish, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionFinishActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionFinish, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionFinishModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionFinish, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CommissionFinishReward
{
UFUNCTION()
bool HasCommissionFinishReward(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishReward);
}
FC_CommissionFinishReward& AssignCommissionFinishReward(const FECSEntity &inout Entity, const FC_CommissionFinishReward &inout DefaultValue = FC_CommissionFinishReward())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishReward, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCommissionFinishReward_BP(const FECSEntity &inout Entity, const FC_CommissionFinishReward &inout DefaultValue = FC_CommissionFinishReward())
{
    ECSFunc_FC_CommissionFinishReward::AssignCommissionFinishReward(Entity, DefaultValue);
    return;
}
FC_CommissionFinishReward& ModifyCommissionFinishReward(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishReward));
    return local_12.GetComp();
}
FC_CommissionFinishReward& ModifyOrAddCommissionFinishReward(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishReward));
    return local_12.GetComp();
}
const FC_CommissionFinishReward& GetCommissionFinishReward(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishReward));
    return local_12.GetComp();
}
UFUNCTION()
FC_CommissionFinishReward GetCommissionFinishReward_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CommissionFinishReward& local_4 = ECSFunc_FC_CommissionFinishReward::GetCommissionFinishReward(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CommissionFinishReward();
}
const FC_CommissionFinishReward GetDefaultedCommissionFinishReward(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CommissionFinishReward __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishReward);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CommissionFinishReward GetDefaultedCommissionFinishReward_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CommissionFinishReward::GetDefaultedCommissionFinishReward(Entity);
}
UFUNCTION()
bool RemoveCommissionFinishReward(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishReward);
}
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRewardOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CommissionFinishReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRewardOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CommissionFinishReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRewardOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CommissionFinishReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRewardOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CommissionFinishReward, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRewardOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CommissionFinishReward, bFixedFrame, bMustHandleAll);
}
void __MonitorCommissionFinishRewardLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CommissionFinishReward, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionFinishRewardActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CommissionFinishReward, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionFinishRewardModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CommissionFinishReward, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CommissionFinishRaceResult
{
UFUNCTION()
bool HasCommissionFinishRaceResult(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishRaceResult);
}
FC_CommissionFinishRaceResult& AssignCommissionFinishRaceResult(const FECSEntity &inout Entity, const FC_CommissionFinishRaceResult &inout DefaultValue = FC_CommissionFinishRaceResult())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishRaceResult, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCommissionFinishRaceResult_BP(const FECSEntity &inout Entity, const FC_CommissionFinishRaceResult &inout DefaultValue = FC_CommissionFinishRaceResult())
{
    ECSFunc_FC_CommissionFinishRaceResult::AssignCommissionFinishRaceResult(Entity, DefaultValue);
    return;
}
FC_CommissionFinishRaceResult& ModifyCommissionFinishRaceResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishRaceResult));
    return local_12.GetComp();
}
FC_CommissionFinishRaceResult& ModifyOrAddCommissionFinishRaceResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishRaceResult));
    return local_12.GetComp();
}
const FC_CommissionFinishRaceResult& GetCommissionFinishRaceResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishRaceResult));
    return local_12.GetComp();
}
UFUNCTION()
FC_CommissionFinishRaceResult GetCommissionFinishRaceResult_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CommissionFinishRaceResult& local_4 = ECSFunc_FC_CommissionFinishRaceResult::GetCommissionFinishRaceResult(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CommissionFinishRaceResult();
}
const FC_CommissionFinishRaceResult GetDefaultedCommissionFinishRaceResult(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CommissionFinishRaceResult __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishRaceResult);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CommissionFinishRaceResult GetDefaultedCommissionFinishRaceResult_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CommissionFinishRaceResult::GetDefaultedCommissionFinishRaceResult(Entity);
}
UFUNCTION()
bool RemoveCommissionFinishRaceResult(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CommissionFinishRaceResult);
}
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRaceResultOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CommissionFinishRaceResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRaceResultOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CommissionFinishRaceResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRaceResultOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CommissionFinishRaceResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRaceResultOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CommissionFinishRaceResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCommissionFinishRaceResultOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CommissionFinishRaceResult, bFixedFrame, bMustHandleAll);
}
void __MonitorCommissionFinishRaceResultLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CommissionFinishRaceResult, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionFinishRaceResultActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CommissionFinishRaceResult, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionFinishRaceResultModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CommissionFinishRaceResult, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerFinishCommissionTag
{
UFUNCTION()
bool HasPlayerFinishCommissionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerFinishCommissionTag);
}
FC_PlayerFinishCommissionTag& AssignPlayerFinishCommissionTag(const FECSEntity &inout Entity, const FC_PlayerFinishCommissionTag &inout DefaultValue = FC_PlayerFinishCommissionTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerFinishCommissionTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerFinishCommissionTag_BP(const FECSEntity &inout Entity, const FC_PlayerFinishCommissionTag &inout DefaultValue = FC_PlayerFinishCommissionTag())
{
    ECSFunc_FC_PlayerFinishCommissionTag::AssignPlayerFinishCommissionTag(Entity, DefaultValue);
    return;
}
FC_PlayerFinishCommissionTag& ModifyPlayerFinishCommissionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerFinishCommissionTag));
    return local_12.GetComp();
}
FC_PlayerFinishCommissionTag& ModifyOrAddPlayerFinishCommissionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerFinishCommissionTag));
    return local_12.GetComp();
}
const FC_PlayerFinishCommissionTag& GetPlayerFinishCommissionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerFinishCommissionTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerFinishCommissionTag GetPlayerFinishCommissionTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerFinishCommissionTag& local_4 = ECSFunc_FC_PlayerFinishCommissionTag::GetPlayerFinishCommissionTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerFinishCommissionTag();
}
const FC_PlayerFinishCommissionTag GetDefaultedPlayerFinishCommissionTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerFinishCommissionTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerFinishCommissionTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PlayerFinishCommissionTag GetDefaultedPlayerFinishCommissionTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerFinishCommissionTag::GetDefaultedPlayerFinishCommissionTag(Entity);
}
UFUNCTION()
bool RemovePlayerFinishCommissionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerFinishCommissionTag);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerFinishCommissionTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerFinishCommissionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFinishCommissionTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerFinishCommissionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFinishCommissionTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerFinishCommissionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFinishCommissionTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerFinishCommissionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFinishCommissionTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerFinishCommissionTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerFinishCommissionTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerFinishCommissionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerFinishCommissionTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerFinishCommissionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerFinishCommissionTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerFinishCommissionTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CommissionTargetNeedUpdateTag
{
UFUNCTION()
bool HasCommissionTargetNeedUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionTargetNeedUpdateTag);
}
FCS_CommissionTargetNeedUpdateTag& AssignCommissionTargetNeedUpdateTag(const FECSWorldPtr &inout World, const FCS_CommissionTargetNeedUpdateTag &inout DefaultValue = FCS_CommissionTargetNeedUpdateTag())
{
    UScriptStruct local_6 = FCS_CommissionTargetNeedUpdateTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionTargetNeedUpdateTag_BP(const FECSWorldPtr &inout World, const FCS_CommissionTargetNeedUpdateTag &inout DefaultValue = FCS_CommissionTargetNeedUpdateTag())
{
    ECSFunc_FCS_CommissionTargetNeedUpdateTag::AssignCommissionTargetNeedUpdateTag(World, DefaultValue);
    return;
}
FCS_CommissionTargetNeedUpdateTag& ModifyCommissionTargetNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionTargetNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionTargetNeedUpdateTag& ModifyOrAddCommissionTargetNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionTargetNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionTargetNeedUpdateTag& GetCommissionTargetNeedUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionTargetNeedUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionTargetNeedUpdateTag GetCommissionTargetNeedUpdateTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CommissionTargetNeedUpdateTag& local_4 = ECSFunc_FCS_CommissionTargetNeedUpdateTag::GetCommissionTargetNeedUpdateTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CommissionTargetNeedUpdateTag();
}
const FCS_CommissionTargetNeedUpdateTag GetDefaultedCommissionTargetNeedUpdateTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionTargetNeedUpdateTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionTargetNeedUpdateTag);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CommissionTargetNeedUpdateTag GetDefaultedCommissionTargetNeedUpdateTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CommissionTargetNeedUpdateTag::GetDefaultedCommissionTargetNeedUpdateTag(World);
}
UFUNCTION()
bool RemoveCommissionTargetNeedUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionTargetNeedUpdateTag);
}
}
void __MonitorCommissionTargetNeedUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionTargetNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionTargetNeedUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionTargetNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionTargetNeedUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionTargetNeedUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerCommissionTargetNeedUpdateTag
{
UFUNCTION()
bool HasPlayerCommissionTargetNeedUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerCommissionTargetNeedUpdateTag);
}
FC_PlayerCommissionTargetNeedUpdateTag& AssignPlayerCommissionTargetNeedUpdateTag(const FECSEntity &inout Entity, const FC_PlayerCommissionTargetNeedUpdateTag &inout DefaultValue = FC_PlayerCommissionTargetNeedUpdateTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerCommissionTargetNeedUpdateTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerCommissionTargetNeedUpdateTag_BP(const FECSEntity &inout Entity, const FC_PlayerCommissionTargetNeedUpdateTag &inout DefaultValue = FC_PlayerCommissionTargetNeedUpdateTag())
{
    ECSFunc_FC_PlayerCommissionTargetNeedUpdateTag::AssignPlayerCommissionTargetNeedUpdateTag(Entity, DefaultValue);
    return;
}
FC_PlayerCommissionTargetNeedUpdateTag& ModifyPlayerCommissionTargetNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerCommissionTargetNeedUpdateTag));
    return local_12.GetComp();
}
FC_PlayerCommissionTargetNeedUpdateTag& ModifyOrAddPlayerCommissionTargetNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerCommissionTargetNeedUpdateTag));
    return local_12.GetComp();
}
const FC_PlayerCommissionTargetNeedUpdateTag& GetPlayerCommissionTargetNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerCommissionTargetNeedUpdateTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerCommissionTargetNeedUpdateTag GetPlayerCommissionTargetNeedUpdateTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerCommissionTargetNeedUpdateTag& local_4 = ECSFunc_FC_PlayerCommissionTargetNeedUpdateTag::GetPlayerCommissionTargetNeedUpdateTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerCommissionTargetNeedUpdateTag();
}
const FC_PlayerCommissionTargetNeedUpdateTag GetDefaultedPlayerCommissionTargetNeedUpdateTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerCommissionTargetNeedUpdateTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerCommissionTargetNeedUpdateTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PlayerCommissionTargetNeedUpdateTag GetDefaultedPlayerCommissionTargetNeedUpdateTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerCommissionTargetNeedUpdateTag::GetDefaultedPlayerCommissionTargetNeedUpdateTag(Entity);
}
UFUNCTION()
bool RemovePlayerCommissionTargetNeedUpdateTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerCommissionTargetNeedUpdateTag);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerCommissionTargetNeedUpdateTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCommissionTargetNeedUpdateTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCommissionTargetNeedUpdateTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCommissionTargetNeedUpdateTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerCommissionTargetNeedUpdateTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerCommissionTargetNeedUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerCommissionTargetNeedUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerCommissionTargetNeedUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerCommissionTargetNeedUpdateTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_CommissionInfoChangedTag
{
UFUNCTION()
bool HasCommissionInfoChangedTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_CommissionInfoChangedTag);
}
FCS_CommissionInfoChangedTag& AssignCommissionInfoChangedTag(const FECSWorldPtr &inout World, const FCS_CommissionInfoChangedTag &inout DefaultValue = FCS_CommissionInfoChangedTag())
{
    UScriptStruct local_6 = FCS_CommissionInfoChangedTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignCommissionInfoChangedTag_BP(const FECSWorldPtr &inout World, const FCS_CommissionInfoChangedTag &inout DefaultValue = FCS_CommissionInfoChangedTag())
{
    ECSFunc_FCS_CommissionInfoChangedTag::AssignCommissionInfoChangedTag(World, DefaultValue);
    return;
}
FCS_CommissionInfoChangedTag& ModifyCommissionInfoChangedTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionInfoChangedTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_CommissionInfoChangedTag& ModifyOrAddCommissionInfoChangedTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionInfoChangedTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_CommissionInfoChangedTag& GetCommissionInfoChangedTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_CommissionInfoChangedTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_CommissionInfoChangedTag GetCommissionInfoChangedTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_CommissionInfoChangedTag& local_4 = ECSFunc_FCS_CommissionInfoChangedTag::GetCommissionInfoChangedTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_CommissionInfoChangedTag();
}
const FCS_CommissionInfoChangedTag GetDefaultedCommissionInfoChangedTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_CommissionInfoChangedTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_CommissionInfoChangedTag);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_CommissionInfoChangedTag GetDefaultedCommissionInfoChangedTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_CommissionInfoChangedTag::GetDefaultedCommissionInfoChangedTag(World);
}
UFUNCTION()
bool RemoveCommissionInfoChangedTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_CommissionInfoChangedTag);
}
}
void __MonitorCommissionInfoChangedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_CommissionInfoChangedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionInfoChangedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_CommissionInfoChangedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCommissionInfoChangedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_CommissionInfoChangedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DifficultyConfigOverride
{
UFUNCTION()
bool HasDifficultyConfigOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DifficultyConfigOverride);
}
FC_DifficultyConfigOverride& AssignDifficultyConfigOverride(const FECSEntity &inout Entity, const FC_DifficultyConfigOverride &inout DefaultValue = FC_DifficultyConfigOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DifficultyConfigOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDifficultyConfigOverride_BP(const FECSEntity &inout Entity, const FC_DifficultyConfigOverride &inout DefaultValue = FC_DifficultyConfigOverride())
{
    ECSFunc_FC_DifficultyConfigOverride::AssignDifficultyConfigOverride(Entity, DefaultValue);
    return;
}
FC_DifficultyConfigOverride& ModifyDifficultyConfigOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DifficultyConfigOverride));
    return local_12.GetComp();
}
FC_DifficultyConfigOverride& ModifyOrAddDifficultyConfigOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DifficultyConfigOverride));
    return local_12.GetComp();
}
const FC_DifficultyConfigOverride& GetDifficultyConfigOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DifficultyConfigOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_DifficultyConfigOverride GetDifficultyConfigOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DifficultyConfigOverride& local_4 = ECSFunc_FC_DifficultyConfigOverride::GetDifficultyConfigOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DifficultyConfigOverride();
}
const FC_DifficultyConfigOverride GetDefaultedDifficultyConfigOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DifficultyConfigOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DifficultyConfigOverride);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DifficultyConfigOverride GetDefaultedDifficultyConfigOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DifficultyConfigOverride::GetDefaultedDifficultyConfigOverride(Entity);
}
UFUNCTION()
bool RemoveDifficultyConfigOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DifficultyConfigOverride);
}
}
FECSMonitorRuntimeView __GetMonitorDifficultyConfigOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DifficultyConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDifficultyConfigOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DifficultyConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDifficultyConfigOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DifficultyConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDifficultyConfigOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DifficultyConfigOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDifficultyConfigOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DifficultyConfigOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorDifficultyConfigOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DifficultyConfigOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDifficultyConfigOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DifficultyConfigOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDifficultyConfigOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DifficultyConfigOverride, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCommissionEntityInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCommissionEntityInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCommissionEntityInfo
{
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_Position()
{
    return 1;
}
int __IndexOf_PrefabConfig()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_CommissionDSGlobalInfoView &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_CommissionDSGlobalInfoView &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_CommissionDSGlobalInfoView &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_CommissionDSGlobalInfoView
{
int __IndexOf_StartTimeInHoursOverride()
{
    return 0;
}
int __IndexOf_SubTargetConfig()
{
    return 1;
}
int __IndexOf_IntrusionPolicyConfig()
{
    return 2;
}
int __IndexOf_SpawnAreaConfig()
{
    return 3;
}
int __IndexOf_StartWeatherConfig()
{
    return 4;
}
int __IndexOf_EntryRuleConfig()
{
    return 5;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FFinishTeamMemberInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FFinishTeamMemberInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FFinishTeamMemberInfo
{
int __IndexOf_PlayerID()
{
    return 0;
}
int __IndexOf_PlayerEntityId()
{
    return 1;
}
int __IndexOf_PlayerNameCached()
{
    return 2;
}
int __IndexOf_AvatarPrefabConfig()
{
    return 3;
}
int __IndexOf_LikeCount()
{
    return 4;
}
int __IndexOf_PlayerIndex()
{
    return 5;
}
int __IndexOf_RewardBadge()
{
    return 6;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCommissionFinishScoreItem &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCommissionFinishScoreItem &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCommissionFinishScoreItem
{
int __IndexOf_Type()
{
    return 0;
}
int __IndexOf_Num()
{
    return 1;
}
int __IndexOf_Score()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FCS_CommissionFinish &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FCS_CommissionFinish &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_CommissionFinish &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_CommissionFinish
{
int __IndexOf_bSuccess()
{
    return 0;
}
int __IndexOf_FailReason()
{
    return 1;
}
int __IndexOf_bKickedPlayer()
{
    return 2;
}
int __IndexOf_FinishTime()
{
    return 3;
}
int __IndexOf_KickPlayerTime()
{
    return 4;
}
int __IndexOf_MainObjectiveIsFinish()
{
    return 5;
}
int __IndexOf_SubObjectiveIsFinish()
{
    return 6;
}
int __IndexOf_RandomEventFinishNum()
{
    return 7;
}
int __IndexOf_ChallengeObjectiveIsFinish()
{
    return 8;
}
int __IndexOf_RewardScore()
{
    return 9;
}
int __IndexOf_TotalScore()
{
    return 10;
}
int __IndexOf_FinishTier()
{
    return 11;
}
int __IndexOf_Special_EnvironmentEndingFinish()
{
    return 12;
}
int __IndexOf_FinishTeamers()
{
    return 13;
}
int __IndexOf_ScoreItems()
{
    return 14;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CommissionFinishReward &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CommissionFinishReward &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CommissionFinishReward &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CommissionFinishReward
{
int __IndexOf_CommissionReward()
{
    return 0;
}
int __IndexOf_CommissionFirstReward()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CommissionFinishRaceResult &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CommissionFinishRaceResult &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CommissionFinishRaceResult &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CommissionFinishRaceResult
{
int __IndexOf_AchievedTierList()
{
    return 0;
}
int __IndexOf_CostTimeSec()
{
    return 1;
}
int __IndexOf_OldBestCostTimeSec()
{
    return 2;
}
int __IndexOf_bIsNewBest()
{
    return 3;
}
}
