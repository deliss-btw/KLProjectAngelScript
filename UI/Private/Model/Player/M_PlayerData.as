namespace PlayerDataIsOnlineDbg
{
    const FConsoleVariable CVar_LogIsOnlineWrite = FConsoleVariable();
}
namespace FMS_PlayerDSData
{
    const int ModelId = 0;
}
namespace FMS_PlayerData
{
    const int ModelId = 0;

}
struct FMS_PlayerDSData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_PlayerDSInfo>> m_PlayerDSInfoMap;

    FMS_PlayerDSData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerDSData(const FMS_PlayerDSData &inout Other)
    {
        this.m_PlayerDSInfoMap = Other.m_PlayerDSInfoMap;
        return;
    }
    FMS_PlayerDSData& opAssign(const FMS_PlayerDSData &inout Other)
    {
        return Other.m_PlayerDSInfoMap;
    }
    void CachePlayerDSInfo(const FECSEntity &inout PlayerEntity)
    {
        if (!(PlayerEntity.IsValid()))
        {
            return;
        }
        int local_2 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
        if ((!((local_2 > 0))))
        {
            return;
        }
        if (!(this.GetPlayerDSInfoMap().Contains(local_2)))
        {
            this.CachePlayerDSInfoIfNeed(local_2, PlayerEntity);
        }
        return;
    }
    void TryCachePlayerDSInfoByPlayerId(const uint PlayerId)
    {
        if (!(this.GetContext().World))
        {
            return;
        }
        if (this.GetPlayerDSInfoMap().Contains(PlayerId))
        {
            return;
        }
        Get local_6;
        const FCS_PlayerEntitySummary& local_8 = local_6.opCall();
        if (local_8)
        {
            TConstRawPtr<FECSEntity> local_10 = local_8.GetPlayerEntities().Find(PlayerId);
            if (local_10)
            {
                this.CachePlayerDSInfo(local_10.Get());
            }
        }
        return;
    }
    void PostConstruct()
    {
        if (!(this.GetContext().World))
        {
            return;
        }
        Get local_6;
        const FCS_PlayerEntitySummary& local_8 = local_6.opCall();
        if (local_8)
        {
            for (auto& local_26 : local_8.GetPlayerEntities())
            {
                this.CachePlayerDSInfoIfNeed(local_26.GetKey(), local_26.GetValue());
            }
        }
        return;
    }
    void OnPlayerEntitySummaryChanged(const FCS_PlayerEntitySummary &inout C_PlayerEntitySummary)
    {
        if (!(C_PlayerEntitySummary))
        {
            for (auto& local_20 : this.GetPlayerDSInfoMap())
            {
                TEUIModelRef<FM_Player> local_24 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_20.GetKey());
                if (local_24)
                {
                    local_24.Get().InvalidateRealtimePlayerInfo(::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerInfo(local_20.GetKey()));
                }
            }
            this.GetModify_PlayerDSInfoMap().Reset();
            return;
        }
        TArray<uint> local_68;
        for (auto& local_20_2 : this.GetPlayerDSInfoMap())
        {
            if (!(C_PlayerEntitySummary.GetPlayerEntities().Contains(local_20_2.GetKey())))
            {
                local_68.Add(local_20_2.GetKey());
            }
        }
        for (auto local_83 : local_68)
        {
            TEUIModelRef<FM_Player> local_26 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_83);
            if (local_26)
            {
                local_26.Get().InvalidateRealtimePlayerInfo(::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerInfo(local_83));
            }
            this.GetModify_PlayerDSInfoMap().Remove(local_83);
        }
        for (auto& local_102 : C_PlayerEntitySummary.GetPlayerEntities())
        {
            TConstRawPtr<TEUIModelRef<FM_PlayerDSInfo>> local_104 = this.GetPlayerDSInfoMap().Find(local_102.GetKey());
            if (local_104)
            {
                if ((FECSEntity(local_104.Get().opArrow().GetPlayerEntity()) == local_102.GetValue()))
                {
                    continue;
                }
            }
            this.CachePlayerDSInfoIfNeed(local_102.GetKey(), local_102.GetValue());
        }
        return;
    }
    void InvalidateEntityCache()
    {
        for (auto& local_20 : this.GetPlayerDSInfoMap())
        {
            TEUIModelRef<FM_Player> local_24 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_20.GetKey());
            if (local_24)
            {
                local_24.Get().InvalidateRealtimePlayerInfo(::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerInfo(local_20.GetKey()));
            }
        }
        this.GetModify_PlayerDSInfoMap().Empty(0);
        return;
    }
    void CachePlayerDSInfoIfNeed(const uint PlayerId, const FECSEntity &inout PlayerEntity)
    {
        TEUIModelRef<FM_Player> local_2 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(PlayerId);
        if (local_2)
        {
            FM_PlayerDSInfo& local_8 = ::FM_PlayerDSInfo::Create(this.GetContext().Manager, PlayerEntity);
            local_8.SetOwnerPlayer(TEUIModelWeakRef<FM_Player>(local_2.Get()));
            this.GetModify_PlayerDSInfoMap().Add(PlayerId, TEUIModelRef<FM_PlayerDSInfo>(local_8));
            bool local_5 = true;
            local_2.Get().GetModify_IsOnlineAttr().Set(EPlayerInfoTrust(3), local_5);
        }
        return;
    }
    const TMap<uint, TEUIModelRef<FM_PlayerDSInfo>> GetPlayerDSInfoMap() const property
    {
        const TMap<uint, TEUIModelRef<FM_PlayerDSInfo>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_PlayerDSInfo>> GetModify_PlayerDSInfoMap() property
    {
        TMap<uint, TEUIModelRef<FM_PlayerDSInfo>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerDSInfoMap(const TMap<uint, TEUIModelRef<FM_PlayerDSInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerDSInfoMap = __Value;
        return;
    }
}

struct FMS_PlayerData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_Player>> m_PlayerDataMap;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Player>, uint> m_PlayerIdMap;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_LocalPlayerDataPrivate;
    UPROPERTY()
    TMap<uint, FPlayerFullInfo> m_PlayerGSInfoCache;

    FMS_PlayerData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerData(const FMS_PlayerData &inout Other)
    {
        this.m_PlayerDataMap = Other.m_PlayerDataMap;
        this.m_PlayerIdMap = Other.m_PlayerIdMap;
        this.m_LocalPlayerDataPrivate = Other.m_LocalPlayerDataPrivate;
        this.m_PlayerGSInfoCache = Other.m_PlayerGSInfoCache;
        return;
    }
    FMS_PlayerData& opAssign(const FMS_PlayerData &inout Other)
    {
        this.m_PlayerDataMap = Other.m_PlayerDataMap;
        this.m_PlayerIdMap = Other.m_PlayerIdMap;
        this.m_LocalPlayerDataPrivate = Other.m_LocalPlayerDataPrivate;
        return Other.m_PlayerGSInfoCache;
    }
    bool HasCachedPlayerData(const uint PlayerId)
    {
        return this.GetPlayerDataMap().Contains(PlayerId);
    }
    TEUIModelRef<FM_Player> GetCachedPlayerData(const uint PlayerId)
    {
        if ((!((PlayerId > 0))))
        {
            return TEUIModelRef<FM_Player>();
        }
        TEUIModelRef<FM_Player> local_6;
        if (this.GetPlayerDataMap().Find(PlayerId, local_6))
        {
            return local_6;
        }
        return local_6;
    }
    TEUIModelRef<FM_Player> GetLocalPlayerData()
    {
        if (!(this.GetLocalPlayerDataPrivate()))
        {
            int local_4 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLocalPlayerUid();
            if (local_4 > 0)
            {
                this.SetLocalPlayerDataPrivate(this.GetOrCreatePlayerData(local_4));
            }
            else
            {
                if (this.GetContext().GetLocalPlayer())
                {
                    this.SetLocalPlayerDataPrivate(this.GetOrCreatePlayerByEntity(this.GetContext().GetLocalPlayer()));
                }
                else
                {
                    this.SetLocalPlayerDataPrivate(TEUIModelRef<FM_Player>(::FM_Player::Create(this.GetContext().Manager)));
                }
            }
        }
        return this.GetLocalPlayerDataPrivate();
    }
    TEUIModelRef<FM_Player> UpdateOrCreatePlayerByGSData(const FPbOnlinePlayerInfo &inout OnlinePlayerInfo)
    {
        TEUIModelRef<FM_Player> local_4 = this.GetOrCreatePlayerData(OnlinePlayerInfo.GetUid());
        FM_Player& local_8 = local_4.Get();
        local_8.GetModify_NickNameAttr().Set(EPlayerInfoTrust(2), OnlinePlayerInfo.GetNickname());
        local_8.GetModify_GenderAttr().Set(EPlayerInfoTrust(2), EGenderType(1));
        int local_1 = OnlinePlayerInfo.GetCurAvatarId();
        GetDataObjectByGSDataId<FAvatarPrefabConfig> local_40;
        local_8.GetModify_CurrentAvatarAttr().Set(EPlayerInfoTrust(2), local_40.opImplConv());
        if (::PlayerDataIsOnlineDbg::Enabled())
        {
            ::PlayerDataIsOnlineDbg::Emit(FString().Append("Source=GSData Uid=").Append(OnlinePlayerInfo.GetUid()).Append(" Trust=Reliable IsOnline=").Append(OnlinePlayerInfo.GetIsOnline()));
        }
        local_8.GetModify_IsOnlineAttr().Set(EPlayerInfoTrust(2), OnlinePlayerInfo.GetIsOnline());
        int local_1_2 = OnlinePlayerInfo.GetDivineSkillId();
        GetDataObjectByGSDataId<FDivineSkillConfig> local_90;
        local_8.GetModify_DivineSkillAttr().Set(EPlayerInfoTrust(2), local_90.opImplConv());
        if (OnlinePlayerInfo.GetLevel() > 0)
        {
            local_8.GetModify_LevelAttr().Set(EPlayerInfoTrust(2), OnlinePlayerInfo.GetLevel());
        }
        this.UpdateGSInfoCache(OnlinePlayerInfo.GetUid(), OnlinePlayerInfo.GetNickname(), EGenderType(1), OnlinePlayerInfo.GetCurAvatarId(), OnlinePlayerInfo.GetDivineSkillId(), OnlinePlayerInfo.GetLevel(), OnlinePlayerInfo.GetIsOnline());
        if (::FriendUtil::IsFriend(OnlinePlayerInfo.GetUid()))
        {
            ::FMS_FriendDataModel::Get(this.GetContext().Manager).ModifyFriendOnlineState(OnlinePlayerInfo.GetUid(), OnlinePlayerInfo.GetIsOnline());
        }
        return local_4;
    }
    TEUIModelRef<FM_Player> UpdateOrCreateByBriefInfo(const FPbPlayerBriefInfo &inout PbPlayerInfo)
    {
        int local_2 = 2;
        int local_1 = local_2;
        TEUIModelRef<FM_Player> local_6 = this.GetOrCreatePlayerData(PbPlayerInfo.GetUid());
        FM_Player& local_10 = local_6.Get();
        if (!(PbPlayerInfo.GetNickname().IsEmpty()))
        {
            local_10.GetModify_NickNameAttr().Set(EPlayerInfoTrust(2), PbPlayerInfo.GetNickname());
        }
        int local_3 = PbPlayerInfo.GetCurAvatarId();
        GetDataObjectByGSDataId<FAvatarPrefabConfig> local_40;
        local_10.GetModify_CurrentAvatarAttr().Set(EPlayerInfoTrust(2), local_40.opImplConv());
        if (::PlayerDataIsOnlineDbg::Enabled())
        {
            int local_2_2 = 2;
            int local_3_2 = PbPlayerInfo.GetUid();
            ::PlayerDataIsOnlineDbg::Emit(FString().Append("Source=Brief-Pb(unconditional) Uid=").Append(local_3_2).Append(" Trust=").Append(local_2_2).Append(" IsOnline=").Append(PbPlayerInfo.GetIsOnline()).Append(" Nickname=").Append(PbPlayerInfo.GetNickname()));
        }
        local_10.GetModify_IsOnlineAttr().Set(EPlayerInfoTrust(2), PbPlayerInfo.GetIsOnline());
        int local_3_3 = PbPlayerInfo.GetDivineSkillId();
        GetDataObjectByGSDataId<FDivineSkillConfig> local_94;
        local_10.GetModify_DivineSkillAttr().Set(EPlayerInfoTrust(2), local_94.opImplConv());
        if (PbPlayerInfo.GetLevel() > 0)
        {
            local_10.GetModify_LevelAttr().Set(EPlayerInfoTrust(2), PbPlayerInfo.GetLevel());
        }
        this.UpdateGSInfoCacheFromBriefInfo(PbPlayerInfo);
        return local_6;
    }
    TEUIModelRef<FM_Player> UpdateOrCreateByBriefInfo(const FPlayerBriefInfo &inout BriefInfo, const EPlayerInfoTrust Trust = EPlayerInfoTrust::Reliable)
    {
        TEUIModelRef<FM_Player> local_4 = this.GetOrCreatePlayerData(BriefInfo.GetUid());
        FM_Player& local_8 = local_4.Get();
        if (BriefInfo.IsNicknameSet())
        {
            local_8.GetModify_NickNameAttr().Set(EPlayerInfoTrust(Trust), BriefInfo.GetNickname());
        }
        if (BriefInfo.IsCurAvatarIdSet())
        {
            int local_1 = BriefInfo.GetCurAvatarId();
            GetDataObjectByGSDataId<FAvatarPrefabConfig> local_38;
            local_8.GetModify_CurrentAvatarAttr().Set(EPlayerInfoTrust(Trust), local_38.opImplConv());
        }
        if (BriefInfo.IsLevelSet())
        {
            local_8.GetModify_LevelAttr().Set(EPlayerInfoTrust(Trust), BriefInfo.GetLevel());
        }
        if (BriefInfo.IsOnlineStateSet())
        {
            if (::PlayerDataIsOnlineDbg::Enabled())
            {
                ::PlayerDataIsOnlineDbg::Emit(FString().Append("Source=Brief Uid=").Append(BriefInfo.GetUid()).Append(" Trust=").Append(Trust).Append(" IsOnline=").Append(BriefInfo.GetbIsOnline()));
            }
            local_8.GetModify_IsOnlineAttr().Set(EPlayerInfoTrust(Trust), BriefInfo.GetbIsOnline());
        }
        if (BriefInfo.IsDivineSkillIdSet())
        {
            int local_1_2 = BriefInfo.GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_88;
            local_8.GetModify_DivineSkillAttr().Set(EPlayerInfoTrust(Trust), local_88.opImplConv());
        }
        this.UpdateGSInfoCacheFromBrief(BriefInfo);
        return local_4;
    }
    FPlayerFullInfo GetCachedPlayerInfo(const uint Uid) const
    {
        TConstRawPtr<FPlayerFullInfo> local_2 = this.GetPlayerGSInfoCache().Find(Uid);
        if (local_2)
        {
            return local_2.Get();
        }
        return ::FMS_PlayerLocalCache::Get(this.GetManager()).LoadPlayerFromCache(Uid);
    }
    void UpdateGSInfoCache(const uint Uid, const FString &inout InNickName, const EGenderType InGender, const uint InAvatarId, const uint InDivineSkillId, const int InLevel, const bool InIsOnline)
    {
        FPlayerFullInfo& local_2 = this.GetModify_PlayerGSInfoCache().FindOrAdd(Uid);
        local_2.SetUid(Uid);
        local_2.SetNickName(InNickName);
        local_2.SetbHasNickName(!(InNickName.IsEmpty()));
        local_2.SetGender(EGenderType(InGender));
        local_2.SetbHasGender(true);
        if (InAvatarId != 0)
        {
            local_2.SetAvatarConfigId(InAvatarId);
            local_2.SetbHasAvatar(true);
        }
        if (InDivineSkillId != 0)
        {
            local_2.SetDivineSkillId(InDivineSkillId);
            local_2.SetbHasDivineSkill(true);
        }
        if (InLevel != 0)
        {
            local_2.SetLevel(InLevel);
            local_2.SetbHasLevel(true);
        }
        local_2.SetbIsOnline(InIsOnline);
        local_2.SetbHasIsOnline(true);
        return;
    }
    void UpdateGSInfoCacheFromBriefInfo(const FPbPlayerBriefInfo &inout PbPlayerInfo)
    {
        FPlayerFullInfo& local_4 = this.GetModify_PlayerGSInfoCache().FindOrAdd(PbPlayerInfo.GetUid());
        local_4.SetUid(PbPlayerInfo.GetUid());
        if (!(PbPlayerInfo.GetNickname().IsEmpty()))
        {
            local_4.SetNickName(PbPlayerInfo.GetNickname());
        }
        local_4.SetGender(EGenderType(1));
        local_4.SetAvatarConfigId(PbPlayerInfo.GetCurAvatarId());
        local_4.SetDivineSkillId(PbPlayerInfo.GetDivineSkillId());
        if (PbPlayerInfo.GetLevel() > 0)
        {
            local_4.SetLevel(PbPlayerInfo.GetLevel());
            local_4.SetbHasLevel(true);
        }
        return;
    }
    void UpdateGSInfoCacheFromBrief(const FPlayerBriefInfo &inout BriefInfo)
    {
        FPlayerFullInfo& local_2 = this.GetModify_PlayerGSInfoCache().FindOrAdd(BriefInfo.GetUid());
        local_2.SetUid(BriefInfo.GetUid());
        if (BriefInfo.IsNicknameSet())
        {
            local_2.SetNickName(BriefInfo.GetNickname());
            local_2.SetbHasNickName(true);
        }
        if (BriefInfo.IsCurAvatarIdSet())
        {
            local_2.SetAvatarConfigId(BriefInfo.GetCurAvatarId());
            local_2.SetbHasAvatar(true);
        }
        if (BriefInfo.IsLevelSet())
        {
            local_2.SetLevel(BriefInfo.GetLevel());
            local_2.SetbHasLevel(true);
        }
        if (BriefInfo.IsOnlineStateSet())
        {
            local_2.SetbIsOnline(BriefInfo.GetbIsOnline());
            local_2.SetbHasIsOnline(true);
        }
        if (BriefInfo.IsDivineSkillIdSet())
        {
            local_2.SetDivineSkillId(BriefInfo.GetDivineSkillId());
            local_2.SetbHasDivineSkill(true);
        }
        return;
    }
    TEUIModelRef<FM_Player> GetOrCreatePlayerByEntity(const FECSEntity &inout PlayerEntity)
    {
        int local_1 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
        TEUIModelRef<FM_Player> local_6;
        if ((!((local_1 > 0))))
        {
            return local_6;
        }
        local_6 = this.GetOrCreatePlayerData(local_1);
        ::FMS_PlayerDSData::Get(this.GetContext().Manager).CachePlayerDSInfo(PlayerEntity);
        return local_6;
    }
    uint GetPlayerId(const TEUIModelRef<FM_Player> &inout Player)
    {
        int local_3;
        if (!(Player.IsValid()))
        {
            return 0;
        }
        if (this.GetPlayerIdMap().Find(Player, local_3))
        {
            return local_3;
        }
        return 0;
    }
    void OnLocalPlayerEntityChanged(const FC_PlayerController &inout PlayerController)
    {
        if (PlayerController)
        {
            this.GetOrCreatePlayerByEntity(this.GetContext().GetLocalPlayer());
        }
        return;
    }
    TEUIModelRef<FM_Player> GetOrCreatePlayerData(const uint PlayerId)
    {
        if (this.GetPlayerDataMap().Contains(PlayerId))
        {
            return this.GetPlayerDataMap()[PlayerId];
        }
        TEUIModelRef<FM_Player> local_4;
        if (this.GetLocalPlayerDataPrivate())
        {
            if (PlayerId == ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLocalPlayerUid())
            {
                local_4 = this.GetLocalPlayerDataPrivate();
            }
            else
            {
                if (PlayerId == ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer()))
                {
                    local_4 = this.GetLocalPlayerDataPrivate();
                }
            }
        }
        if (!(local_4))
        {
            local_4 = TEUIModelRef<FM_Player>(::FM_Player::Create(this.GetContext().Manager));
        }
        this.GetModify_PlayerDataMap().Add(PlayerId, local_4);
        this.GetModify_PlayerIdMap().Add(local_4, PlayerId);
        ::FMS_PlayerDSData::Get(this.GetContext().Manager).TryCachePlayerDSInfoByPlayerId(PlayerId);
        return local_4;
    }
    TArray<uint> DebugGetCachedPlayerUids() const
    {
        TArray<uint> local_4;
        for (auto& local_24 : this.GetPlayerDataMap())
        {
            local_4.Add(local_24.GetKey());
        }
        return local_4;
    }
    const TMap<uint, TEUIModelRef<FM_Player>> GetPlayerDataMap() const property
    {
        const TMap<uint, TEUIModelRef<FM_Player>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_Player>> GetModify_PlayerDataMap() property
    {
        TMap<uint, TEUIModelRef<FM_Player>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerDataMap(const TMap<uint, TEUIModelRef<FM_Player>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerDataMap = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Player>, uint> GetPlayerIdMap() const property
    {
        const TMap<TEUIModelRef<FM_Player>, uint> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<TEUIModelRef<FM_Player>, uint> GetModify_PlayerIdMap() property
    {
        TMap<TEUIModelRef<FM_Player>, uint> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerIdMap(const TMap<TEUIModelRef<FM_Player>, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerIdMap = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetLocalPlayerDataPrivate() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LocalPlayerDataPrivate;
    }
    void SetLocalPlayerDataPrivate(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_LocalPlayerDataPrivate;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LocalPlayerDataPrivate = __Value;
        return;
    }
    const TMap<uint, FPlayerFullInfo> GetPlayerGSInfoCache() const property
    {
        const TMap<uint, FPlayerFullInfo> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<uint, FPlayerFullInfo> GetModify_PlayerGSInfoCache() property
    {
        TMap<uint, FPlayerFullInfo> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPlayerGSInfoCache(const TMap<uint, FPlayerFullInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerGSInfoCache = __Value;
        return;
    }
}

namespace PlayerDataIsOnlineDbg
{
bool Enabled()
{
    return PlayerDataIsOnlineDbg::CVar_LogIsOnlineWrite.GetBool();
}
void Emit(const FString &inout Detail)
{
    XLog(ELog(66), FString().Append("[IsOnlineDbg] ").Append(Detail).Append("\nCallstack:\n").Append(FBreakpointHelper::GetScriptStackString()));
    return;
}
}
namespace FMS_PlayerDSData
{
FMS_PlayerDSData& Get(const UObject ContextObject)
{
    return FMS_PlayerDSData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerDSData& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_PlayerDSData>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerDSData::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnPlayerEntitySummaryChanged";
    local_14.ComponentType = FCS_PlayerEntitySummary;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerDSData;
}
void __OnPlayerEntitySummaryChanged(FMS_PlayerDSData &inout Model, const FECSEntity &inout Entity, const FCS_PlayerEntitySummary &inout Component)
{
    Get local_4;
    Model.OnPlayerEntitySummaryChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    __MonitorPlayerEntitySummaryLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorPlayerEntitySummaryModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
}
int __IndexOf_PlayerDSInfoMap()
{
    return 0;
}
}
namespace FMS_PlayerData
{
FMS_PlayerData& Get(const UObject ContextObject)
{
    return FMS_PlayerData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerData& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_PlayerData>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerData::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnLocalPlayerEntityChanged";
    local_14.ComponentType = FC_PlayerController;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerData;
}
void __OnLocalPlayerEntityChanged(FMS_PlayerData &inout Model, const FECSEntity &inout Entity, const FC_PlayerController &inout Component)
{
    Model.OnLocalPlayerEntityChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    ECSWorld.__MonitorPlayerControllerLifetime(EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    ECSWorld.__MonitorPlayerControllerModification(EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
}
int __IndexOf_PlayerDataMap()
{
    return 0;
}
int __IndexOf_PlayerIdMap()
{
    return 1;
}
int __IndexOf_LocalPlayerDataPrivate()
{
    return 2;
}
int __IndexOf_PlayerGSInfoCache()
{
    return 3;
}
}
