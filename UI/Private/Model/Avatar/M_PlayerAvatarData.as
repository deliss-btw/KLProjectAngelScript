
namespace FMS_PlayerAvatarData
{
    const int ModelId = 0;

}
struct FMsg_PlayerAvatarDataInitialized : FEUIMessage
{
    FMsg_PlayerAvatarDataInitialized()
    {
        return;
    }
}

struct FMsg_UnlockAvatar : FEUIMessage
{
    UPROPERTY()
    uint AvatarDataId;


}

struct FMS_PlayerAvatarData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Avatar>> m_CurrentAvatars;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_Avatar>> m_OwnedAvatars;
    UPROPERTY()
    bool m_bHasInit;

    FMS_PlayerAvatarData()
    {
        this.m_bHasInit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerAvatarData(const FMS_PlayerAvatarData &inout Other)
    {
        this.m_bHasInit = false;
        this.m_CurrentAvatars = Other.m_CurrentAvatars;
        this.m_OwnedAvatars = Other.m_OwnedAvatars;
        this.m_bHasInit = Other.m_bHasInit;
        return;
    }
    FMS_PlayerAvatarData opAssign(const FMS_PlayerAvatarData &inout Other)
    {
        FMS_PlayerAvatarData __r;
        this.m_CurrentAvatars = Other.m_CurrentAvatars;
        this.m_OwnedAvatars = Other.m_OwnedAvatars;
        this.m_bHasInit = Other.m_bHasInit;
        return __r;
    }
    TEUIModelRef<FM_Avatar> FindAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        TEUIModelRef<FM_Avatar> __return;
        if (this.GetOwnedAvatars().Find(AvatarConfig.opArrow().DataId))
        {
        }
        else
        {
            for (auto& local_20 : this.GetCurrentAvatars())
            {
                TDataObjectPtr<FAvatarPrefabConfig> local_44;
                local_44 = local_20.opArrow().GetAvatarConfig();
                if ((local_44 == AvatarConfig.opImplConv()))
                {
                    return local_20;
                }
            }
            __return = TEUIModelRef<FM_Avatar>(nullptr);
        }
        return __return;
    }
    void OnDSPlayerAvatarInfoChanged(const FC_DSPlayerAvatarInfo &inout PlayerAvatarInfo)
    {
        TArray<uint> local_4;
        this.GetOwnedAvatars().GetKeys(local_4);
        UGameClientConnectionSubsystem local_8 = ::UGameClientConnectionSubsystem::Get();
        if (local_8 != nullptr && local_8.IsConnectedToGameServer())
        {
            if (PlayerAvatarInfo)
            {
                for (auto& local_24 : PlayerAvatarInfo.GetAvatarList())
                {
                    if (!(this.GetOwnedAvatars().Contains(local_24.GetAvatarId())))
                    {
                        int local_25 = local_24.GetAvatarId();
                        GetDataObjectByGSDataId<FAvatarPrefabConfig> local_50;
                        TDataObjectPtr<FAvatarPrefabConfig> local_74 = local_50.opImplConv();
                        if (!(!(local_74)))
                        {
                            FM_Avatar& local_102 = ::FM_Avatar::Create(this.GetManager(), local_74);
                            local_102.SetbIsUnlocked(true);
                            this.GetModify_OwnedAvatars().Add(local_74.opArrow().DataId, TEUIModelRef<FM_Avatar>(local_102));
                        }
                        continue;
                    }
                    int local_25_2 = local_24.GetAvatarId();
                }
            }
        }
        else
        {
            const UAS_GameModeSettings local_108 = ::GameModeSettings::GetGameModeSettings(this.GetContext().Manager.GetWorld());
            if (local_108 != nullptr)
            {
                for (auto& local_126 : local_108.ChangeRoleDataObjects)
                {
                    if (!(this.GetOwnedAvatars().Contains(local_126.opArrow().DataId)))
                    {
                        FM_Avatar& local_102_2 = ::FM_Avatar::Create(this.GetManager(), local_126);
                        local_102_2.SetbIsUnlocked(true);
                        this.GetModify_OwnedAvatars().Add(local_126.opArrow().DataId, TEUIModelRef<FM_Avatar>(local_102_2));
                        continue;
                    }
                }
            }
        }
        auto local_132 = local_4.Iterator();
        for (; local_132.CanProceed;)
        {
            int local_25_3 = local_132.Proceed();
        }
        if (!(this.GetbHasInit()))
        {
            this.SetbHasInit(true);
            FEUIModelRef local_146 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus).opCall(local_146);
        }
        return;
    }
    void OnLocalPlayerChanged(const FC_PlayerController &inout PlayerController)
    {
        TArray<TEUIModelRef<FM_Avatar>> local_4;
        if (PlayerController)
        {
            for (auto& local_20 : PlayerController.GetAllPlayerPawnEntities())
            {
                TDataObjectPtr<FAvatarPrefabConfig> local_68 = TDataObjectPtr<FAvatarPrefabConfig>(::GetPrefabConfigPtr(local_20).opImplConv());
                if (local_68)
                {
                    TEUIModelRef<FM_Avatar> local_120 = this.FindAvatar(local_68);
                    if (!(local_120))
                    {
                        local_120 = TEUIModelRef<FM_Avatar>(::FM_Avatar::Create(this.GetManager(), local_68));
                    }
                    local_4.Add(local_120);
                }
            }
        }
        TArray<TEUIModelRef<FM_Avatar>> local_128;
        local_128 = this.GetCurrentAvatars();
        if ((!((local_128 == local_4))))
        {
            this.SetCurrentAvatars(local_4);
        }
        return;
    }
    void GS_OnUnlockAvatarNotify(const FPbUnlockAvatarNotify &inout Notify)
    {
        TArray<uint64> local_4;
        bool local_8 = false;
        int local_5 = 0;
        for (; local_5 < Notify.GetAvatarList_Num(); ++local_5)
        {
            XLog(ELog(74), FString().Append("xxxxxx [GS_OnUnlockAvatarNotify] Unlock Avatar: ").Append(Notify.GetAvatarList_Index(local_5).GetAvatarId()));
            FPbAvatar local_22 = Notify.GetAvatarList_Index(local_5);
            if (::FAvatarPrefabConfig::GetByDataId(local_22.GetAvatarId()))
            {
                if (local_8)
                {
                    continue;
                }
            }
            local_4.AddUnique(local_22.GetAvatarId());
        }
        if (local_4.Num() > 0)
        {
            ::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager());
            FEUIModelRef local_94 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            FMsg_UnlockAvatar local_96;
            local_96.AvatarDataId = local_4[(local_4.Num() - 1)];
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(2), local_4);
        }
        return;
    }
    bool IsAvatarUnlocked(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        bool local_7;
        if (this.FindAvatar(AvatarConfig))
        {
            local_7 = GetbIsUnlocked();
        }
        else
        {
            local_7 = false;
        }
        return local_7;
    }
    void RefreshAvatarListEntryRedDot()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    const TArray<TEUIModelRef<FM_Avatar>> GetCurrentAvatars() const property
    {
        const TArray<TEUIModelRef<FM_Avatar>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FM_Avatar>> GetModify_CurrentAvatars() property
    {
        TArray<TEUIModelRef<FM_Avatar>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentAvatars(const TArray<TEUIModelRef<FM_Avatar>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentAvatars = __Value;
        return;
    }
    const TMap<uint, TEUIModelRef<FM_Avatar>> GetOwnedAvatars() const property
    {
        const TMap<uint, TEUIModelRef<FM_Avatar>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_Avatar>> GetModify_OwnedAvatars() property
    {
        TMap<uint, TEUIModelRef<FM_Avatar>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetOwnedAvatars(const TMap<uint, TEUIModelRef<FM_Avatar>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OwnedAvatars = __Value;
        return;
    }
    bool GetbHasInit() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHasInit;
    }
    void SetbHasInit(const bool __Value) property
    {
        if (!(this.m_bHasInit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHasInit = __Value;
        return;
    }
}

namespace FMS_PlayerAvatarData
{
FMS_PlayerAvatarData& Get(const UObject ContextObject)
{
    return FMS_PlayerAvatarData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerAvatarData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PlayerAvatarData __r;
    TEUIModelRef<FMS_PlayerAvatarData> local_6 = TEUIModelRef<FMS_PlayerAvatarData>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerAvatarData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnDSPlayerAvatarInfoChanged";
    local_14.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnLocalPlayerChanged";
    local_14.ComponentType = FC_PlayerController;
    Result.MonitorFunctions.Add(local_14);
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnUnlockAvatarNotify";
    Result.ProtoRspDefines.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerAvatarData;
}
void __OnDSPlayerAvatarInfoChanged(FMS_PlayerAvatarData &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnDSPlayerAvatarInfoChanged(Component);
    return;
}
void __OnLocalPlayerChanged(FMS_PlayerAvatarData &inout Model, const FECSEntity &inout Entity, const FC_PlayerController &inout Component)
{
    Model.OnLocalPlayerChanged(Component);
    return;
}
void __GS_OnUnlockAvatarNotify(FMS_PlayerAvatarData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnUnlockAvatarNotify(FPbUnlockAvatarNotify::FromWrapper(ProtoWrapper));
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_CurrentAvatars()
{
    return 0;
}
int __IndexOf_OwnedAvatars()
{
    return 1;
}
int __IndexOf_bHasInit()
{
    return 2;
}
}
