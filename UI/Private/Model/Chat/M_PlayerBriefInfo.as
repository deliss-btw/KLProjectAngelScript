
namespace FMS_PlayerBriefInfo
{
    const int ModelId = 0;

}
struct FMS_PlayerBriefInfo : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;

    FMS_PlayerBriefInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerBriefInfo(const FMS_PlayerBriefInfo &inout Other)
    {
        return;
    }
    FMS_PlayerBriefInfo opAssign(const FMS_PlayerBriefInfo &inout Other)
    {
        FMS_PlayerBriefInfo __r;
        return __r;
    }
    void WriteThroughToPlayerData(const FPlayerBriefInfo &inout B)
    {
        int local_1 = B.GetUid();
        if (local_1 == 0)
        {
            return;
        }
        ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(B, EPlayerInfoTrust(1));
        return;
    }
    FPlayerBriefInfo CacheFromProto(const FPbPlayerBriefInfo &inout Pb)
    {
        FPlayerBriefInfo local_18;
        ::PlayerBriefInfoBuild::ApplyFromProto(local_18, Pb);
        if (local_18.GetNickname().IsEmpty())
        {
            return this.CacheFromDSPlayerEntity(local_18.GetUid());
        }
        this.WriteThroughToPlayerData(local_18);
        return local_18;
    }
    FPlayerBriefInfo CacheFromMessageRecord(const FChatMessagePersistRecord &inout Rec)
    {
        FPlayerBriefInfo local_18;
        this.TryGetCachedBrief(int(Rec.SenderUid), local_18);
        ::PlayerBriefInfoBuild::ApplyFromMessageRecord(local_18, Rec);
        this.WriteThroughToPlayerData(local_18);
        return local_18;
    }
    FPlayerBriefInfo CacheFromPlayer(const FM_Player &inout Player)
    {
        return Player.GetBriefInfo();
    }
    FPlayerBriefInfo CacheFromDSPlayerEntity(const uint PlayerUid)
    {
        FPlayerBriefInfo local_18;
        local_18.SetUid(PlayerUid);
        if (PlayerUid == 0)
        {
            return local_18;
        }
        FECSEntity local_24;
        if (::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(PlayerUid).IsValid())
        {
            FECSEntity local_32;
            local_32.GetPlayerEntity();
            local_24 = local_32;
        }
        if (local_24.IsValid())
        {
            ::PlayerBriefInfoBuild::ApplyFromDSPlayerEntity(local_18, local_24, PlayerUid);
            this.WriteThroughToPlayerData(local_18);
        }
        return local_18;
    }
    void UpsertPlayerBrief(const FPlayerBriefInfo &inout B)
    {
        this.WriteThroughToPlayerData(B);
        return;
    }
    void InvalidateAll()
    {
        return;
    }
    bool TryGetCachedBrief(const uint Uid, FPlayerBriefInfo &inout Out)
    {
        if (Uid == 0)
        {
            return false;
        }
        TEUIModelRef<FM_Player> local_4 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(Uid);
        if (!(local_4.IsValid()))
        {
            return false;
        }
        FPlayerBriefInfo local_24;
        local_24.GetBriefInfo();
        Out = local_24;
        return true;
    }
    FPlayerBriefInfo GetPlayerBriefInfo(const uint PlayerId)
    {
        FMS_PlayerData& local_2 = ::FMS_PlayerData::Get(this.GetContext().Manager);
        int local_9 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer());
        if ((local_9 != 0 && (local_9 == PlayerId)))
        {
            FPlayerBriefInfo local_32;
            local_2.GetLocalPlayerData();
            local_32.GetBriefInfo();
            return local_32;
        }
        FPlayerBriefInfo local_50;
        if (this.TryGetCachedBrief(PlayerId, local_50))
        {
            return local_50;
        }
        return this.CacheFromDSPlayerEntity(PlayerId);
    }
}

namespace PlayerBriefInfoBuild
{
void ApplyFromProto(FPlayerBriefInfo &inout Out, const FPbPlayerBriefInfo &inout Brief)
{
    Out.SetUid(Brief.GetUid());
    Out.SetNickname(Brief.GetNickname());
    Out.SetLevel(Brief.GetLevel());
    Out.SetCurAvatarId(Brief.GetCurAvatarId());
    Out.SetbIsOnline(Brief.GetIsOnline());
    Out.SetDivineSkillId(Brief.GetDivineSkillId());
    return;
}
void ApplyFromMessageRecord(FPlayerBriefInfo &inout Out, const FChatMessagePersistRecord &inout Rec)
{
    Out.SetUid(int(Rec.SenderUid));
    Out.SetNickname(Rec.SenderNickname);
    Out.SetLevel(int(Rec.SenderLevel));
    Out.SetCurAvatarId(int(Rec.SenderCurAvatarId));
    return;
}
void ApplyFromDSPlayerEntity(FPlayerBriefInfo &inout Out, const FECSEntity &inout PlayerEntity, const uint PlayerUid)
{
    ChatSystemUtil::ApplyFromDSPlayerEntity(Out, PlayerEntity, PlayerUid);
    return;
}
void ApplyFromPlayer(FPlayerBriefInfo &inout Out, const FM_Player &inout Player)
{
    bool local_9 = false;
    int local_1 = Player.GetPlayerUid();
    Out.SetUid(local_1);
    Out.SetNickname(Player.GetNickName());
    Out.SetLevel(Player.GetLevel());
    if (Player.GetCurrentAvatarAttr().HasValue() && local_9)
    {
        Out.SetCurAvatarId(local_1);
    }
    if (Player.GetDivineSkillAttr().HasValue() && local_9)
    {
        Out.SetDivineSkillId(local_1);
    }
    if (Player.GetIsOnlineAttr().HasValue())
    {
        Out.SetbIsOnline(local_9);
    }
    return;
}
}
namespace FMS_PlayerBriefInfo
{
FMS_PlayerBriefInfo& Get(const UObject ContextObject)
{
    return FMS_PlayerBriefInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerBriefInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PlayerBriefInfo __r;
    TEUIModelRef<FMS_PlayerBriefInfo> local_6 = TEUIModelRef<FMS_PlayerBriefInfo>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerBriefInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerBriefInfo;
}
}
