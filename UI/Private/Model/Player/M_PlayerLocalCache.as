enum EPlayerCacheUser
{
    Chat,
    FriendList,
    Team,
    RecentPlay,
}

namespace FMS_PlayerLocalCache
{
    const int ModelId = 0;

}
class UPlayerInfoCacheSaveAll : UKLSaveGameScriptBase
{
    UPROPERTY()
    TMap<uint, FPlayerFullInfo> PlayerInfoMap;
    UPROPERTY()
    FBitSet32 CacheUsers;

    UPlayerInfoCacheSaveAll()
    {
        return;
    }
}

struct FMS_PlayerLocalCache : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;

    FMS_PlayerLocalCache()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerLocalCache(const FMS_PlayerLocalCache &inout Other)
    {
        return;
    }
    FMS_PlayerLocalCache opAssign(const FMS_PlayerLocalCache &inout Other)
    {
        FMS_PlayerLocalCache __r;
        return __r;
    }
    UPlayerInfoCacheSaveAll GetOrCreateSave()
    {
        return Cast<UPlayerInfoCacheSaveAll>(KLSaveGame::GetOrLoadSaveGame(__GetWorldContext(), UPlayerInfoCacheSaveAll, FName("PlayerInfoCache")));
    }
    void SavePlayerToCache(const uint Uid, const FPlayerFullInfo &inout Info)
    {
        if (Uid == 0)
        {
            return;
        }
        UPlayerInfoCacheSaveAll local_4 = this.GetOrCreateSave();
        if (local_4 == nullptr)
        {
            return;
        }
        TRawPtr<FPlayerFullInfo> local_8 = local_4.PlayerInfoMap.Find(Uid);
        if (local_8)
        {
            FPlayerFullInfo& local_12 = local_8.Get();
            if (Info.GetbHasNickName())
            {
                local_12.SetNickName(Info.GetNickName());
                local_12.SetbHasNickName(true);
            }
            if (Info.GetbHasGender())
            {
                local_12.SetGender(Info.GetGender());
                local_12.SetbHasGender(true);
            }
            if (Info.GetbHasAvatar())
            {
                local_12.SetAvatarConfigId(Info.GetAvatarConfigId());
                local_12.SetbHasAvatar(true);
            }
            if (Info.GetbHasCurrentWorld())
            {
                local_12.SetCurrentWorldId(Info.GetCurrentWorldId());
                local_12.SetbHasCurrentWorld(true);
            }
            if (Info.GetbHasDivineSkill())
            {
                local_12.SetDivineSkillId(Info.GetDivineSkillId());
                local_12.SetbHasDivineSkill(true);
            }
            if (Info.GetbHasLevel())
            {
                local_12.SetLevel(Info.GetLevel());
                local_12.SetbHasLevel(true);
            }
            if (Info.GetbHasIsOnline())
            {
                local_12.SetbIsOnline(Info.GetbIsOnline());
                local_12.SetbHasIsOnline(true);
            }
        }
        else
        {
            FPlayerFullInfo local_36 = Info;
            local_36.SetUid(Uid);
            local_4.PlayerInfoMap.Add(Uid, local_36);
        }
        local_4.MarkDirty();
        return;
    }
    FPlayerFullInfo LoadPlayerFromCache(const uint Uid)
    {
        FPlayerFullInfo local_20;
        if (Uid == 0)
        {
            return local_20;
        }
        UPlayerInfoCacheSaveAll local_22 = this.GetOrCreateSave();
        if (local_22 == nullptr)
        {
            return local_20;
        }
        TRawPtr<FPlayerFullInfo> local_26 = local_22.PlayerInfoMap.Find(Uid);
        if (local_26)
        {
            return local_26.Get();
        }
        return local_20;
    }
    void RetainPlayerCache(const EPlayerCacheUser User)
    {
        UPlayerInfoCacheSaveAll local_2 = this.GetOrCreateSave();
        if (local_2 == nullptr)
        {
            return;
        }
        local_2.CacheUsers.SetBit(int(User), true);
        local_2.MarkDirty();
        return;
    }
    void ReleasePlayerCache(const EPlayerCacheUser User)
    {
        UPlayerInfoCacheSaveAll local_2 = this.GetOrCreateSave();
        if (local_2 == nullptr)
        {
            return;
        }
        local_2.CacheUsers.SetBit(int(User), false);
        if (local_2.CacheUsers.IsEmpty())
        {
            KLSaveGame::DeleteSaveGame(__GetWorldContext(), UPlayerInfoCacheSaveAll, FName("PlayerInfoCache"));
            return;
        }
        local_2.MarkDirty();
        return;
    }
}

namespace FMS_PlayerLocalCache
{
FMS_PlayerLocalCache& Get(const UObject ContextObject)
{
    return FMS_PlayerLocalCache::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerLocalCache& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_PlayerLocalCache>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerLocalCache::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerLocalCache;
}
}
