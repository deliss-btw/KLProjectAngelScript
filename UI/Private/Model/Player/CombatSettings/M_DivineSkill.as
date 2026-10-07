
namespace FMS_PvpModeState
{
    const int ModelId = 0;
}
namespace FM_DivineSkill
{
    const int ModelId = 0;
}
namespace FMS_DivineSkillData
{
    const int ModelId = 0;

}
struct FMS_PvpModeState : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    bool m_bIsPvpMode;
    UPROPERTY()
    uint m_CurrentPvpAvatarId;

    FMS_PvpModeState()
    {
        this.m_bIsPvpMode = false;
        this.m_CurrentPvpAvatarId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PvpModeState(const FMS_PvpModeState &inout Other)
    {
        this.m_bIsPvpMode = false;
        this.m_CurrentPvpAvatarId = 0;
        this.m_bIsPvpMode = Other.m_bIsPvpMode;
        this.m_CurrentPvpAvatarId = int(Other.m_CurrentPvpAvatarId);
        return;
    }
    FMS_PvpModeState opAssign(const FMS_PvpModeState &inout Other)
    {
        FMS_PvpModeState __r;
        this.m_bIsPvpMode = Other.m_bIsPvpMode;
        this.m_CurrentPvpAvatarId = int(Other.m_CurrentPvpAvatarId);
        return __r;
    }
    bool GetbIsPvpMode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsPvpMode;
    }
    void SetbIsPvpMode(const bool __Value) property
    {
        if (!(this.m_bIsPvpMode) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsPvpMode = __Value;
        return;
    }
    uint GetCurrentPvpAvatarId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentPvpAvatarId;
    }
    void SetCurrentPvpAvatarId(const uint __Value) property
    {
        if (this.m_CurrentPvpAvatarId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentPvpAvatarId = __Value;
        return;
    }
}

struct FMsg_DivineSkillUnlockUpdate : FEUIMessage
{
    FMsg_DivineSkillUnlockUpdate()
    {
        return;
    }
}

struct FM_DivineSkill : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> m_Config;
    UPROPERTY()
    int m_Level;

    FM_DivineSkill()
    {
        this.m_Level = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_DivineSkill' by default constructor.");
        return;
    }
    FM_DivineSkill(const FM_DivineSkill &inout Other)
    {
        this.m_Level = 0;
        this.m_Config = Other.m_Config;
        this.m_Level = int(Other.m_Level);
        return;
    }
    FM_DivineSkill(const TDataObjectPtr<FDivineSkillConfig> &inout InConfig)
    {
        this.m_Level = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetConfig(InConfig);
        return;
    }
    FM_DivineSkill opAssign(const FM_DivineSkill &inout Other)
    {
        FM_DivineSkill __r;
        this.m_Config = Other.m_Config;
        this.m_Level = int(Other.m_Level);
        return __r;
    }
    TDataObjectPtr<FDivineSkillConfig> GetConfig() const property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FDivineSkillConfig> GetModify_Config() property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Config = __Value;
        return;
    }
    int GetLevel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Level;
    }
    void SetLevel(const int __Value) property
    {
        if (this.m_Level == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Level = __Value;
        return;
    }
}

struct FMS_DivineSkillData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TSet<TDataObjectPtr<FDivineSkillConfig>> m_UnlockedDivineSkills;
    UPROPERTY()
    TMap<uint, TDataObjectPtr<FDivineSkillConfig>> m_PvpAvatarEquipedDivineSkills;

    FMS_DivineSkillData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_DivineSkillData(const FMS_DivineSkillData &inout Other)
    {
        this.m_UnlockedDivineSkills = Other.m_UnlockedDivineSkills;
        this.m_PvpAvatarEquipedDivineSkills = Other.m_PvpAvatarEquipedDivineSkills;
        return;
    }
    FMS_DivineSkillData& opAssign(const FMS_DivineSkillData &inout Other)
    {
        this.m_UnlockedDivineSkills = Other.m_UnlockedDivineSkills;
        return Other.m_PvpAvatarEquipedDivineSkills;
    }
    bool IsUnlocked(const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkillConfig) const
    {
        return DivineSkillConfig && (DivineSkillConfig.opArrow().bDefaultUnlock || this.GetUnlockedDivineSkills().Contains(DivineSkillConfig));
    }
    TDataObjectPtr<FDivineSkillConfig> GetPvpAvatarEquipedDivineSkill(const uint AvatarId) const
    {
        TDataObjectPtr<FDivineSkillConfig> local_24;
        if (this.GetPvpAvatarEquipedDivineSkills().Find(AvatarId, local_24))
        {
            return local_24;
        }
        return TDataObjectPtr<FDivineSkillConfig>(nullptr);
    }
    TEUIModelRef<FM_DivineSkill> GetLocalPlayerDivineSkillModel(const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkillConfig) const
    {
        return TEUIModelRef<FM_DivineSkill>(::FM_DivineSkill::Create(this.GetContext().Manager, DivineSkillConfig));
    }
    TEUIModelRef<FM_DivineSkill> GetLocalPlayerDivineSkill() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        const FC_DivineSkill& local_10 = local_8.opCall();
        if (local_10)
        {
            return this.GetLocalPlayerDivineSkillModel(local_10.GetDivineSkillData().GetSkillConfig());
        }
        return TEUIModelRef<FM_DivineSkill>(nullptr);
    }
    TEUIModelRef<FM_DivineSkill> GetEditingDivineSkill() const
    {
        FMS_CombatSettingData& local_2 = ::FMS_CombatSettingData::Get(this.GetContext().Manager);
        TEUIModelRef<FM_CombatSettingPreset> local_4 = local_2.GetEditingCombatSettingPreset();
        if (local_4)
        {
            if (local_4.opArrow().GetPlayerCombatSetting())
            {
                return this.GetLocalPlayerDivineSkillModel(local_4.opArrow().GetPlayerCombatSetting().opArrow().GetDivineSkillConfig());
            }
        }
        return TEUIModelRef<FM_DivineSkill>(nullptr);
    }
    void GS_RequestChangeDivineSkill(const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkillConfig)
    {
        int local_22 = 0;
        if (!((::UGameClientConnectionSubsystem::Get() != nullptr)) || !(::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            FFPTime local_18 = FFPTime(-1);
            FECSEntity local_12 = this.GetContext().GetLocalPlayer();
            local_22.DivineSkillConfig = DivineSkillConfig;
            return;
        }
        if (DivineSkillConfig && this.IsUnlocked(DivineSkillConfig))
        {
            FMS_CombatSettingData& local_48 = ::FMS_CombatSettingData::Get(this.GetContext().Manager);
            local_48.SaveEditingDivineSkillSetting(DivineSkillConfig);
            FPbChangeDivineSkillReq local_52;
            local_52.SetDivineSkillId(DivineSkillConfig.opArrow().DataId);
            this.SendProto(local_52.ToWrapper());
        }
        return;
    }
    void GS_OnChangeDivineSkillRsp(const FPbChangeDivineSkillRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() == 0)
        {
            int local_53 = Rsp.GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_52;
            TDataObjectPtr<FDivineSkillConfig> local_78 = local_52.opImplConv();
            FMS_CombatSettingData& local_104 = ::FMS_CombatSettingData::Get(this.GetContext().Manager);
            local_104.SaveEditingDivineSkillSetting(local_78);
            FEUIModelRef local_110 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_110);
        }
        return;
    }
    void GS_RequestChangePvpDivineSkill(const uint AvatarId, const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkillConfig)
    {
        if (!((::UGameClientConnectionSubsystem::Get() != nullptr)) || !(::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            return;
        }
        if (DivineSkillConfig && this.IsUnlocked(DivineSkillConfig))
        {
            FPbChangePvpDivineSkillReq local_12;
            local_12.SetAvatarId(AvatarId);
            local_12.SetDivineSkillId(DivineSkillConfig.opArrow().DataId);
            this.SendProto(local_12.ToWrapper());
        }
        return;
    }
    void GS_OnChangePvpDivineSkillRsp(const FPbChangePvpDivineSkillRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() == 0)
        {
            int local_53 = Rsp.GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_52;
            TDataObjectPtr<FDivineSkillConfig> local_28 = local_52.opImplConv();
            if (local_28)
            {
                this.GetModify_PvpAvatarEquipedDivineSkills().Add(Rsp.GetAvatarId(), local_28);
            }
            FEUIModelRef local_108 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_108);
        }
        return;
    }
    void GS_OnPlayerAvatarDataNotify(const FPbPlayerAvatarDataNotify &inout Notify)
    {
        this.GetModify_UnlockedDivineSkills().Empty(Notify.GetUnlockDivineSkillList_Num());
        int local_2 = 0;
        for (; local_2 < Notify.GetUnlockDivineSkillList_Num(); ++local_2)
        {
            FPbDivineSkillBin local_14 = Notify.GetUnlockDivineSkillList_Index(local_2);
            TDataObjectPtr<FDivineSkillConfig> local_48 = this.GetDivineSkillConfig(local_14);
            if (local_48)
            {
                this.GetModify_UnlockedDivineSkills().Add(local_48);
                continue;
            }
            XError(ELog(66), FString().Append("Failed to unlock divine skill, divine skill config not found. DivineSkillId: ").Append(local_14.GetDivineSkillId()));
        }
        this.GetModify_PvpAvatarEquipedDivineSkills().Empty(0);
        int local_2_2 = 0;
        for (; local_2_2 < Notify.GetPvpAvatarConfigList_Num(); ++local_2_2)
        {
            FPbPvpAvatarConfigBin local_88 = Notify.GetPvpAvatarConfigList_Index(local_2_2);
            int local_1 = local_88.GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_122;
            TDataObjectPtr<FDivineSkillConfig> local_48_2 = local_122.opImplConv();
            if (local_48_2)
            {
                this.GetModify_PvpAvatarEquipedDivineSkills().Add(local_88.GetAvatarId(), local_48_2);
                continue;
            }
            XError(ELog(66), FString().Append("Failed to load pvp divine skill config. AvatarId: ").Append(local_88.GetAvatarId()).Append(", DivineSkillId: ").Append(local_88.GetDivineSkillId()));
        }
        FEUIModelRef local_154 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_154);
        return;
    }
    void GS_OnDivineSkillUnlock(const FPbDivineSkillUnlockNotify &inout Notify)
    {
        const UUtilitySettings local_68;
        TDataObjectPtr<FDivineSkillConfig> local_34 = this.GetDivineSkillConfig(Notify.GetUnlockDivineSkill());
        if (local_34)
        {
            this.GetModify_UnlockedDivineSkills().Add(local_34);
            FEUIModelRef local_66 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_66);
            GetGameplaySettings<UUtilitySettings> local_70;
            local_68 = local_70;
            if (local_68.DivineSkillUnlockHint)
            {
                TArray<FTextArgument> local_76;
                Make local_82;
                local_76.Add(local_82.opImplConv());
                ::MessageHintUtils::ShowMessageHint(this.GetContext().GetLocalPlayer(), local_68.DivineSkillUnlockHint, local_76);
            }
            TArray<uint64> local_98;
            int64 local_102 = local_34.opArrow().DataId;
            local_98.Add(local_102);
            ::FMS_RedDotSystem::Get(this.GetManager()).GenerateRedDot(ERedPointEvent(8), local_98);
        }
        else
        {
            XError(ELog(66), FString().Append("Failed to unlock divine skill, divine skill config not found. DivineSkillId: ").Append(Notify.GetUnlockDivineSkill().GetDivineSkillId()));
        }
        return;
    }
    TDataObjectPtr<FDivineSkillConfig> GetDivineSkillConfig(const FPbDivineSkillBin &inout GSData) const
    {
        int local_25 = GSData.GetDivineSkillId();
        GetDataObjectByGSDataId<FDivineSkillConfig> local_24;
        return local_24.opImplConv();
    }
    const TSet<TDataObjectPtr<FDivineSkillConfig>> GetUnlockedDivineSkills() const property
    {
        const TSet<TDataObjectPtr<FDivineSkillConfig>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TSet<TDataObjectPtr<FDivineSkillConfig>> GetModify_UnlockedDivineSkills() property
    {
        TSet<TDataObjectPtr<FDivineSkillConfig>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetUnlockedDivineSkills(const TSet<TDataObjectPtr<FDivineSkillConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_UnlockedDivineSkills = __Value;
        return;
    }
    const TMap<uint, TDataObjectPtr<FDivineSkillConfig>> GetPvpAvatarEquipedDivineSkills() const property
    {
        const TMap<uint, TDataObjectPtr<FDivineSkillConfig>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<uint, TDataObjectPtr<FDivineSkillConfig>> GetModify_PvpAvatarEquipedDivineSkills() property
    {
        TMap<uint, TDataObjectPtr<FDivineSkillConfig>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPvpAvatarEquipedDivineSkills(const TMap<uint, TDataObjectPtr<FDivineSkillConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PvpAvatarEquipedDivineSkills = __Value;
        return;
    }
}

namespace FMS_PvpModeState
{
FMS_PvpModeState& Get(const UObject ContextObject)
{
    return FMS_PvpModeState::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PvpModeState GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PvpModeState __r;
    TEUIModelRef<FMS_PvpModeState> local_6 = TEUIModelRef<FMS_PvpModeState>(EUIInternal::MakeModelWithManager(Manager, FMS_PvpModeState::ModelId));
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
    return FMS_PvpModeState;
}
int __IndexOf_bIsPvpMode()
{
    return 0;
}
int __IndexOf_CurrentPvpAvatarId()
{
    return 1;
}
}
namespace FM_DivineSkill
{
FM_DivineSkill& Create(const UObject ContextObject, const TDataObjectPtr<FDivineSkillConfig> &inout Config)
{
    return FM_DivineSkill::CreateByManager(EUIInternal::GetContextManager(ContextObject), Config);
}
FM_DivineSkill CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FDivineSkillConfig> &inout Config)
{
    FM_DivineSkill __r;
    TEUIModelRef<FM_DivineSkill> local_6 = TEUIModelRef<FM_DivineSkill>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_DivineSkill::ModelId, 0, Config));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_DivineSkill;
}
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_Level()
{
    return 1;
}
}
namespace FMS_DivineSkillData
{
FMS_DivineSkillData& Get(const UObject ContextObject)
{
    return FMS_DivineSkillData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_DivineSkillData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_DivineSkillData __r;
    TEUIModelRef<FMS_DivineSkillData> local_6 = TEUIModelRef<FMS_DivineSkillData>(EUIInternal::MakeModelWithManager(Manager, FMS_DivineSkillData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnChangeDivineSkillRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnChangePvpDivineSkillRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnPlayerAvatarDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnDivineSkillUnlock";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_DivineSkillData;
}
void __GS_OnChangeDivineSkillRsp(FMS_DivineSkillData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnChangeDivineSkillRsp(FPbChangeDivineSkillRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnChangePvpDivineSkillRsp(FMS_DivineSkillData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnChangePvpDivineSkillRsp(FPbChangePvpDivineSkillRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnPlayerAvatarDataNotify(FMS_DivineSkillData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerAvatarDataNotify(FPbPlayerAvatarDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDivineSkillUnlock(FMS_DivineSkillData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDivineSkillUnlock(FPbDivineSkillUnlockNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_UnlockedDivineSkills()
{
    return 0;
}
int __IndexOf_PvpAvatarEquipedDivineSkills()
{
    return 1;
}
}
