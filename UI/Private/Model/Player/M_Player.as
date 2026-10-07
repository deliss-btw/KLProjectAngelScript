
namespace FM_Player
{
    const int ModelId = 0;

}
struct FMsg_PlayerEntityChanged : FEUIMessage
{
    UPROPERTY()
    FECSEntity PlayerEntity;

    FMsg_PlayerEntityChanged()
    {
        return;
    }
}

struct FMsg_PlayerPawnEntityChanged : FEUIMessage
{
    UPROPERTY()
    FECSEntity PlayerPawnEntity;

    FMsg_PlayerPawnEntityChanged()
    {
        return;
    }
}

struct FM_Player : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TPlayerInfoAttr<FString> m_NickNameAttr;
    UPROPERTY()
    TPlayerInfoAttr<EGenderType> m_GenderAttr;
    UPROPERTY()
    TPlayerInfoAttr<TDataObjectPtr<FAvatarPrefabConfig>> m_CurrentAvatarAttr;
    UPROPERTY()
    TPlayerInfoAttr<TDataObjectPtr<FMapConfig>> m_CurrentWorldAttr;
    UPROPERTY()
    TPlayerInfoAttr<TDataObjectPtr<FDivineSkillConfig>> m_DivineSkillAttr;
    UPROPERTY()
    TPlayerInfoAttr<int> m_LevelAttr;
    UPROPERTY()
    TPlayerInfoAttr<bool> m_IsOnlineAttr;

    FM_Player()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_Player(const FM_Player &inout Other)
    {
        this.m_NickNameAttr = Other.m_NickNameAttr;
        this.m_GenderAttr = Other.m_GenderAttr;
        this.m_CurrentAvatarAttr = Other.m_CurrentAvatarAttr;
        this.m_CurrentWorldAttr = Other.m_CurrentWorldAttr;
        this.m_DivineSkillAttr = Other.m_DivineSkillAttr;
        this.m_LevelAttr = Other.m_LevelAttr;
        this.m_IsOnlineAttr = Other.m_IsOnlineAttr;
        return;
    }
    FM_Player& opAssign(const FM_Player &inout Other)
    {
        this.m_NickNameAttr = Other.m_NickNameAttr;
        this.m_GenderAttr = Other.m_GenderAttr;
        this.m_CurrentAvatarAttr = Other.m_CurrentAvatarAttr;
        this.m_CurrentWorldAttr = Other.m_CurrentWorldAttr;
        this.m_DivineSkillAttr = Other.m_DivineSkillAttr;
        this.m_LevelAttr = Other.m_LevelAttr;
        return Other.m_IsOnlineAttr;
    }
    void PostConstruct()
    {
        this.GetModify_IsOnlineAttr().SetMinTrust(EPlayerInfoTrust(2));
        this.GetModify_CurrentWorldAttr().SetMinTrust(EPlayerInfoTrust(2));
        return;
    }
    uint GetPlayerUid() const property
    {
        return ::FMS_PlayerData::Get(this.GetContext().Manager).GetPlayerId((TEUIModelRef<FM_Player>(this)));
    }
    void InvalidateRealtimePlayerInfo(const FPlayerFullInfo &inout Fallback)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void InvalidateRealtimePlayerInfo()
    {
        FPlayerFullInfo local_18;
        this.InvalidateRealtimePlayerInfo(local_18);
        return;
    }
    void NotifyPlayerEntitiesUpdatedFromDS(const FECSEntity &inout InPlayerEntity, const FECSEntity &inout InPawnEntity)
    {
        int local_8 = 0;
        int local_14 = 0;
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_8.PlayerEntity = InPlayerEntity;
        FEUIModelRef local_6_2 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus);
        local_14.PlayerPawnEntity = InPawnEntity;
        return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        if (!(this.GetContext().World.IsValid()))
        {
            return ENTITY_NULL;
        }
        int local_3 = this.GetPlayerUid();
        if (local_3 == 0)
        {
            return ENTITY_NULL;
        }
        Get local_8;
        const FCS_PlayerEntitySummary& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetPlayerEntities().Find(local_3))
            {
            }
            else
            {
            }
        }
        return ENTITY_NULL;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity local_4 = this.GetPlayerEntity();
        if (!(local_4.IsValid()))
        {
            return ENTITY_NULL;
        }
        return ::FASCommonUtils::GetUniqueAvatarPawnEntity(local_4);
    }
    FString GetNickName() const property
    {
        FString __r;
        return __r;
    }
    EGenderType GetGender() const property
    {
        EGenderType local_2;
        if (this.GetGenderAttr().HasValue())
        {
            EGenderType local_3;
            local_2 = local_3;
        }
        else
        {
            local_2 = EGenderType(0);
        }
        return local_2;
    }
    uint GetPlayerSpecialtyID() const property
    {
        if (this.GetPlayerEntity())
        {
            Get local_14;
            const FC_DSPlayerInfo& local_16 = local_14.opCall();
            if (local_16)
            {
                int local_17;
                local_17 = local_16.GetPlayerSpecialtyID();
                if (local_17 != 0)
                {
                    return local_17;
                }
            }
        }
        EGenderType local_19;
        local_19 = this.GetGender();
        if ((int(local_19)) == 0)
        {
            return 6;
        }
        else
        {
            return 1;
        }
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetCurrentAvatar() const property
    {
        bool local_2 = false;
        if (this.GetCurrentAvatarAttr().HasValue() && local_2)
        {
            return TDataObjectPtr<FAvatarPrefabConfig>();
        }
        return (TDataObjectPtr<FAvatarPrefabConfig>(nullptr));
    }
    TDataObjectPtr<FMapConfig> GetCurrentWorld() const property
    {
        return TDataObjectPtr<FMapConfig>();
    }
    bool IsInSameMapWithLocalPlayer() const
    {
        if (this.GetPlayerEntity().IsValid())
        {
            return true;
        }
        if (this.GetCurrentWorldAttr().HasValue())
        {
            if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
            {
                FDataObjectPtr local_126;
                local_126;
                TDataObjectPtr<FMapConfig> local_102;
                return (local_102 == local_126);
            }
        }
        return false;
    }
    TDataObjectPtr<FDivineSkillConfig> GetDivineSkill() const property
    {
        FECSEntity local_4 = this.GetPlayerEntity();
        if (local_4)
        {
            TDataObjectPtr<FDivineSkillConfig> local_34 = ::DivineSkillUtils::GetDivineSkill(local_4);
            if (local_34)
            {
                return local_34;
            }
        }
        if (this.GetDivineSkillAttr().HasValue())
        {
            return TDataObjectPtr<FDivineSkillConfig>();
        }
        return (TDataObjectPtr<FDivineSkillConfig>(nullptr));
    }
    bool GetIsOnline() const property
    {
        int local_1;
        int local_2 = 0;
        if (!(this.GetIsOnlineAttr().HasValue()))
        {
            local_1 = 0;
        }
        else
        {
            local_1 = local_2;
        }
        return (local_1 != 0);
    }
    bool IsFriendWithLocalPlayer() const
    {
        int local_3 = this.GetPlayerUid();
        return ::FMS_FriendDataModel::Get(this.GetManager()).GetFriendUidToIndex().Contains(local_3);
    }
    int GetLevel() const property
    {
        int local_3 = 0;
        if (this.IsLocalPlayer())
        {
            return ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
        }
        return this.GetLevelAttr().HasValue() ? local_3 : 0;
    }
    int GetCurrentExp() const property
    {
        if (this.IsLocalPlayer())
        {
            return ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetCurrentExp();
        }
        return 0;
    }
    FPlayerBriefInfo GetBriefInfo() const property
    {
        FPlayerBriefInfo local_18;
        local_18.SetUid(this.GetPlayerUid());
        local_18.SetNickname(this.GetNickName());
        local_18.SetLevel(this.GetLevel());
        TDataObjectPtr<FAvatarPrefabConfig> local_50 = this.GetCurrentAvatar();
        if (local_50)
        {
            local_18.SetCurAvatarId(local_50.opArrow().DataId);
        }
        TDataObjectPtr<FDivineSkillConfig> local_100 = this.GetDivineSkill();
        if (local_100)
        {
            local_18.SetDivineSkillId(local_100.opArrow().DataId);
        }
        local_18.SetbIsOnline(this.GetIsOnline());
        return local_18;
    }
    bool IsLocalPlayer() const
    {
        TEUIModelRef<FM_Player> local_4 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        TEUIModelRef<FM_Player> local_6 = TEUIModelRef<FM_Player>(this);
        return (local_4 == local_6.opImplConv());
    }
    FString DebugDump() const
    {
        FString local_4 = FString().Append("[FM_Player] UID=").Append(this.GetPlayerUid()).Append("\n");
        local_4 += FString().Append("  NickName        = ").Append(this.GetNickNameAttr().ToString()).Append("\n");
        FString local_8_2 = FString();
        local_4 += local_8_2.Append("  Gender          = ").Append(this.GetGenderAttr().ToString()).Append("\n");
        FString local_8_3 = FString();
        local_4 += local_8_3.Append("  CurrentAvatar   = ").Append(this.GetCurrentAvatarAttr().ToString()).Append("\n");
        FString local_8_4 = FString();
        local_4 += local_8_4.Append("  CurrentWorld    = ").Append(this.GetCurrentWorldAttr().ToString()).Append("\n");
        FString local_8_5 = FString();
        local_4 += local_8_5.Append("  DivineSkill     = ").Append(this.GetDivineSkillAttr().ToString()).Append("\n");
        FString local_8_6 = FString();
        local_4 += local_8_6.Append("  Level           = ").Append(this.GetLevelAttr().ToString()).Append("\n");
        FString local_8_7 = FString();
        local_4 += local_8_7.Append("  bIsOnline       = ").Append(this.GetIsOnlineAttr().ToString()).Append("\n");
        return local_4;
    }
    FString DebugAttrStats() const
    {
        EPlayerInfoTrust local_16;
        int local_1 = 0;
        if (this.GetNickNameAttr().HasValue())
        {
            ++local_1;
        }
        if (this.GetGenderAttr().HasValue())
        {
            ++local_1;
        }
        if (this.GetCurrentAvatarAttr().HasValue())
        {
            ++local_1;
        }
        if (this.GetCurrentWorldAttr().HasValue())
        {
            ++local_1;
        }
        if (this.GetDivineSkillAttr().HasValue())
        {
            ++local_1;
        }
        if (this.GetLevelAttr().HasValue())
        {
            ++local_1;
        }
        if (this.GetIsOnlineAttr().HasValue())
        {
            ++local_1;
        }
        int local_4 = 0;
        int local_5 = 0;
        int local_6 = 0;
        int local_7 = 0;
        TArray<EPlayerInfoTrust> local_12;
        local_12.Add(this.GetNickNameAttr().GetTrust());
        local_12.Add(this.GetGenderAttr().GetTrust());
        local_12.Add(this.GetCurrentAvatarAttr().GetTrust());
        local_12.Add(this.GetCurrentWorldAttr().GetTrust());
        local_12.Add(this.GetDivineSkillAttr().GetTrust());
        local_12.Add(this.GetLevelAttr().GetTrust());
        local_12.Add(this.GetIsOnlineAttr().GetTrust());
        int local_14 = 0;
        for (; local_14 < local_12.Num(); ++local_14)
        {
            local_16 = local_12[local_14];
            if (int(local_16) == 0)
            {
                ++local_4;
                continue;
            }
            if (int(local_16) == 1)
            {
                ++local_5;
                continue;
            }
            if (int(local_16) == 2)
            {
                ++local_6;
                continue;
            }
            ++local_7;
        }
        return ((((((((String::Conv_IntToString(local_1) + FString("/7 attrs | Trust: None=")) + String::Conv_IntToString(local_4)) + FString(" Cached=")) + String::Conv_IntToString(local_5)) + FString(" Reliable=")) + String::Conv_IntToString(local_6)) + FString(" Realtime=")) + String::Conv_IntToString(local_7));
    }
    const TPlayerInfoAttr<FString> GetNickNameAttr() const property
    {
        const TPlayerInfoAttr<FString> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TPlayerInfoAttr<FString> GetModify_NickNameAttr() property
    {
        TPlayerInfoAttr<FString> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetNickNameAttr(const TPlayerInfoAttr<FString> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_NickNameAttr = __Value;
        return;
    }
    const TPlayerInfoAttr<EGenderType> GetGenderAttr() const property
    {
        const TPlayerInfoAttr<EGenderType> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TPlayerInfoAttr<EGenderType> GetModify_GenderAttr() property
    {
        TPlayerInfoAttr<EGenderType> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGenderAttr(const TPlayerInfoAttr<EGenderType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GenderAttr = __Value;
        return;
    }
    const TPlayerInfoAttr<TDataObjectPtr<FAvatarPrefabConfig>> GetCurrentAvatarAttr() const property
    {
        const TPlayerInfoAttr<TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TPlayerInfoAttr<TDataObjectPtr<FAvatarPrefabConfig>> GetModify_CurrentAvatarAttr() property
    {
        TPlayerInfoAttr<TDataObjectPtr<FAvatarPrefabConfig>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentAvatarAttr(const TPlayerInfoAttr<TDataObjectPtr<FAvatarPrefabConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentAvatarAttr = __Value;
        return;
    }
    const TPlayerInfoAttr<TDataObjectPtr<FMapConfig>> GetCurrentWorldAttr() const property
    {
        const TPlayerInfoAttr<TDataObjectPtr<FMapConfig>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TPlayerInfoAttr<TDataObjectPtr<FMapConfig>> GetModify_CurrentWorldAttr() property
    {
        TPlayerInfoAttr<TDataObjectPtr<FMapConfig>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrentWorldAttr(const TPlayerInfoAttr<TDataObjectPtr<FMapConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentWorldAttr = __Value;
        return;
    }
    const TPlayerInfoAttr<TDataObjectPtr<FDivineSkillConfig>> GetDivineSkillAttr() const property
    {
        const TPlayerInfoAttr<TDataObjectPtr<FDivineSkillConfig>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TPlayerInfoAttr<TDataObjectPtr<FDivineSkillConfig>> GetModify_DivineSkillAttr() property
    {
        TPlayerInfoAttr<TDataObjectPtr<FDivineSkillConfig>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDivineSkillAttr(const TPlayerInfoAttr<TDataObjectPtr<FDivineSkillConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DivineSkillAttr = __Value;
        return;
    }
    const TPlayerInfoAttr<int> GetLevelAttr() const property
    {
        const TPlayerInfoAttr<int> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TPlayerInfoAttr<int> GetModify_LevelAttr() property
    {
        TPlayerInfoAttr<int> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetLevelAttr(const TPlayerInfoAttr<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LevelAttr = __Value;
        return;
    }
    const TPlayerInfoAttr<bool> GetIsOnlineAttr() const property
    {
        const TPlayerInfoAttr<bool> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TPlayerInfoAttr<bool> GetModify_IsOnlineAttr() property
    {
        TPlayerInfoAttr<bool> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetIsOnlineAttr(const TPlayerInfoAttr<bool> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_IsOnlineAttr = __Value;
        return;
    }
}

namespace FM_Player
{
FM_Player& Create(const UObject ContextObject)
{
    return FM_Player::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_Player CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_Player __r;
    TEUIModelRef<FM_Player> local_6 = TEUIModelRef<FM_Player>(EUIInternal::MakeModelWithManager(Manager, FM_Player::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Player;
}
int __IndexOf_NickNameAttr()
{
    return 0;
}
int __IndexOf_GenderAttr()
{
    return 1;
}
int __IndexOf_CurrentAvatarAttr()
{
    return 2;
}
int __IndexOf_CurrentWorldAttr()
{
    return 3;
}
int __IndexOf_DivineSkillAttr()
{
    return 4;
}
int __IndexOf_LevelAttr()
{
    return 5;
}
int __IndexOf_IsOnlineAttr()
{
    return 6;
}
}
