
enum ECombatSettingPresetType
{
    SingleAvatar,
    DoubleAvatar,
}

namespace FM_AvatarCombatSetting
{
    const int ModelId = 0;
}
namespace FM_PlayerCombatSetting
{
    const int ModelId = 0;
}
namespace FM_CombatSettingPreset
{
    const int ModelId = 0;
}
namespace FMS_CombatSettingData
{
    const int ModelId = 0;

}
struct FM_AvatarCombatSetting : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    bool m_bIsMainAvatar;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;

    FM_AvatarCombatSetting()
    {
        this.m_bIsMainAvatar = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_AvatarCombatSetting(const FM_AvatarCombatSetting &inout Other)
    {
        this.m_bIsMainAvatar = false;
        this.m_bIsMainAvatar = Other.m_bIsMainAvatar;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        return;
    }
    FM_AvatarCombatSetting& opAssign(const FM_AvatarCombatSetting &inout Other)
    {
        this.m_bIsMainAvatar = Other.m_bIsMainAvatar;
        return Other.m_AvatarConfig;
    }
    void SetupFromAvatarID(const uint AvatarID, const bool bIsMain)
    {
        this.SetbIsMainAvatar(bIsMain);
        GetDataObjectByGSDataId<FAvatarPrefabConfig> local_24;
        this.SetAvatarConfig(local_24.opImplConv());
        return;
    }
    void FillChangeAvatarSettingReq(FPbChangeAvatarSettingReq &inout Req)
    {
        if (this.GetbIsMainAvatar())
        {
            Req.SetMainAvatarId(this.GetAvatarConfig().opArrow().DataId);
            return;
        }
        int local_3 = 0;
        if (this.GetAvatarConfig().IsSet())
        {
            local_3 = this.GetAvatarConfig().opArrow().DataId;
        }
        Req.SetAssistAvatarId(local_3);
        return;
    }
    bool GetbIsMainAvatar() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsMainAvatar;
    }
    void SetbIsMainAvatar(const bool __Value) property
    {
        if (!(this.m_bIsMainAvatar) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsMainAvatar = __Value;
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarConfig = __Value;
        return;
    }
}

struct FM_PlayerCombatSetting : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> m_DivineSkillConfig;

    FM_PlayerCombatSetting()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_PlayerCombatSetting(const FM_PlayerCombatSetting &inout Other)
    {
        this.m_DivineSkillConfig = Other.m_DivineSkillConfig;
        return;
    }
    FM_PlayerCombatSetting& opAssign(const FM_PlayerCombatSetting &inout Other)
    {
        return Other.m_DivineSkillConfig;
    }
    void SetupFromServerData(const FPbAvatarSettingListBin &inout ServerData)
    {
        XLog(ELog(28), FString().Append("xxxxxx [SetupFromServerData] DivineSkillId:  ").Append(ServerData.GetDivineSkillId()));
        int local_5 = ServerData.GetDivineSkillId();
        GetDataObjectByGSDataId<FDivineSkillConfig> local_30;
        this.SetDivineSkillConfig(local_30.opImplConv());
        return;
    }
    void FillChangeAvatarSettingReq(FPbChangeAvatarSettingReq &inout Req)
    {
        Req.SetDivineSkillId(this.GetDivineSkillConfig().opArrow().DataId);
        return;
    }
    TDataObjectPtr<FDivineSkillConfig> GetDivineSkillConfig() const property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FDivineSkillConfig> GetModify_DivineSkillConfig() property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDivineSkillConfig(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DivineSkillConfig = __Value;
        return;
    }
}

struct FM_CombatSettingPreset : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_PlayerCombatSetting> m_PlayerCombatSetting;
    UPROPERTY()
    uint m_MainAvatarID;
    UPROPERTY()
    uint m_AssistAvatarID;
    UPROPERTY()
    TEUIModelRef<FM_AvatarCombatSetting> m_MainAvatarCombatSetting;
    UPROPERTY()
    TEUIModelRef<FM_AvatarCombatSetting> m_AssistAvatarCombatSetting;

    FM_CombatSettingPreset()
    {
        this.m_MainAvatarID = 0;
        this.m_AssistAvatarID = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_CombatSettingPreset(const FM_CombatSettingPreset &inout Other)
    {
        this.m_MainAvatarID = 0;
        this.m_AssistAvatarID = 0;
        this.m_PlayerCombatSetting = Other.m_PlayerCombatSetting;
        this.m_MainAvatarID = int(Other.m_MainAvatarID);
        this.m_AssistAvatarID = int(Other.m_AssistAvatarID);
        this.m_MainAvatarCombatSetting = Other.m_MainAvatarCombatSetting;
        this.m_AssistAvatarCombatSetting = Other.m_AssistAvatarCombatSetting;
        return;
    }
    FM_CombatSettingPreset& opAssign(const FM_CombatSettingPreset &inout Other)
    {
        this.m_PlayerCombatSetting = Other.m_PlayerCombatSetting;
        this.m_MainAvatarID = int(Other.m_MainAvatarID);
        this.m_AssistAvatarID = int(Other.m_AssistAvatarID);
        this.m_MainAvatarCombatSetting = Other.m_MainAvatarCombatSetting;
        return Other.m_AssistAvatarCombatSetting;
    }
    void SetupFromServerData(const FPbAvatarSettingListBin &inout ServerData, const bool bUnLockTwoAvatar)
    {
        int local_8;
        if (!(this.GetPlayerCombatSetting()))
        {
            this.SetPlayerCombatSetting(TEUIModelRef<FM_PlayerCombatSetting>(::FM_PlayerCombatSetting::Create(this.GetManager())));
        }
        this.GetPlayerCombatSetting().opArrow().SetupFromServerData(ServerData);
        if (bUnLockTwoAvatar)
        {
            local_8 = ServerData.GetAssistAvatarId();
        }
        else
        {
            local_8 = 0;
        }
        this.SetupFromAvatarID(ServerData.GetMainAvatarId(), local_8);
        return;
    }
    void SetupFromAvatarID(const uint MainID, const uint AssistID)
    {
        this.SetMainAvatarID(MainID);
        this.SetAssistAvatarID(AssistID);
        if (!(this.GetMainAvatarCombatSetting()))
        {
            this.SetMainAvatarCombatSetting(TEUIModelRef<FM_AvatarCombatSetting>(::FM_AvatarCombatSetting::Create(this.GetManager())));
        }
        this.GetMainAvatarCombatSetting().opArrow().SetupFromAvatarID(this.GetMainAvatarID(), true);
        if (AssistID != 0)
        {
            if (!(this.GetAssistAvatarCombatSetting()))
            {
                this.SetAssistAvatarCombatSetting(TEUIModelRef<FM_AvatarCombatSetting>(::FM_AvatarCombatSetting::Create(this.GetManager())));
            }
            this.GetAssistAvatarCombatSetting().opArrow().SetupFromAvatarID(this.GetAssistAvatarID(), false);
        }
        else
        {
            this.SetAssistAvatarCombatSetting(TEUIModelRef<FM_AvatarCombatSetting>(nullptr));
        }
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_14);
        return;
    }
    void FillChangeAvatarSettingReq(FPbChangeAvatarSettingReq &inout Req)
    {
        this.GetPlayerCombatSetting().opArrow().FillChangeAvatarSettingReq(Req);
        this.GetMainAvatarCombatSetting().opArrow().FillChangeAvatarSettingReq(Req);
        if (this.GetAssistAvatarCombatSetting().IsValid())
        {
            this.GetAssistAvatarCombatSetting().opArrow().FillChangeAvatarSettingReq(Req);
        }
        return;
    }
    TEUIModelRef<FM_PlayerCombatSetting> GetPlayerCombatSetting() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerCombatSetting;
    }
    void SetPlayerCombatSetting(const TEUIModelRef<FM_PlayerCombatSetting> &inout __Value) property
    {
        TEUIModelRef<FM_PlayerCombatSetting> local_2;
        local_2 = this.m_PlayerCombatSetting;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerCombatSetting = __Value;
        return;
    }
    uint GetMainAvatarID() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MainAvatarID;
    }
    void SetMainAvatarID(const uint __Value) property
    {
        if (this.m_MainAvatarID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MainAvatarID = __Value;
        return;
    }
    uint GetAssistAvatarID() const property
    {
        this.TrackPropertyRead(2);
        return this.m_AssistAvatarID;
    }
    void SetAssistAvatarID(const uint __Value) property
    {
        if (this.m_AssistAvatarID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AssistAvatarID = __Value;
        return;
    }
    TEUIModelRef<FM_AvatarCombatSetting> GetMainAvatarCombatSetting() const property
    {
        this.TrackPropertyRead(3);
        return this.m_MainAvatarCombatSetting;
    }
    void SetMainAvatarCombatSetting(const TEUIModelRef<FM_AvatarCombatSetting> &inout __Value) property
    {
        TEUIModelRef<FM_AvatarCombatSetting> local_2;
        local_2 = this.m_MainAvatarCombatSetting;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MainAvatarCombatSetting = __Value;
        return;
    }
    TEUIModelRef<FM_AvatarCombatSetting> GetAssistAvatarCombatSetting() const property
    {
        this.TrackPropertyRead(4);
        return this.m_AssistAvatarCombatSetting;
    }
    void SetAssistAvatarCombatSetting(const TEUIModelRef<FM_AvatarCombatSetting> &inout __Value) property
    {
        TEUIModelRef<FM_AvatarCombatSetting> local_2;
        local_2 = this.m_AssistAvatarCombatSetting;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AssistAvatarCombatSetting = __Value;
        return;
    }
}

struct FMsg_EditingCombatSettingPresetTypeChanged : FEUIMessage
{
    FMsg_EditingCombatSettingPresetTypeChanged()
    {
        return;
    }
}

struct FMsg_CombatSettingPresetUpdated : FEUIMessage
{
    FMsg_CombatSettingPresetUpdated()
    {
        return;
    }
}

struct FMsg_SpeicaltyChanged : FEUIMessage
{
    UPROPERTY()
    uint FromSpecialtyID;
    UPROPERTY()
    uint ToSpecialtyID;


}

struct FMS_CombatSettingData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_CombatSettingPreset> m_CombatSettingPreset;
    UPROPERTY()
    bool m_bUnLockTwoAvatar;
    UPROPERTY()
    uint m_CurrentUsedIndex;
    UPROPERTY()
    bool m_bIsEditingPresetTypeSet;
    UPROPERTY()
    ECombatSettingPresetType m_EditingPresetTypePrivate;

    FMS_CombatSettingData()
    {
        this.m_EditingPresetTypePrivate = ECombatSettingPresetType(0);
        this.m_bUnLockTwoAvatar = false;
        this.m_CurrentUsedIndex = 0;
        this.m_bIsEditingPresetTypeSet = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CombatSettingData(const FMS_CombatSettingData &inout Other)
    {
        this.m_EditingPresetTypePrivate = ECombatSettingPresetType(0);
        this.m_bUnLockTwoAvatar = false;
        this.m_CurrentUsedIndex = 0;
        this.m_bIsEditingPresetTypeSet = false;
        this.m_CombatSettingPreset = Other.m_CombatSettingPreset;
        this.m_bUnLockTwoAvatar = Other.m_bUnLockTwoAvatar;
        this.m_CurrentUsedIndex = int(Other.m_CurrentUsedIndex);
        this.m_bIsEditingPresetTypeSet = Other.m_bIsEditingPresetTypeSet;
        this.m_EditingPresetTypePrivate = Other.m_EditingPresetTypePrivate;
        return;
    }
    FMS_CombatSettingData opAssign(const FMS_CombatSettingData &inout Other)
    {
        FMS_CombatSettingData __r;
        this.m_CombatSettingPreset = Other.m_CombatSettingPreset;
        this.m_bUnLockTwoAvatar = Other.m_bUnLockTwoAvatar;
        this.m_CurrentUsedIndex = int(Other.m_CurrentUsedIndex);
        this.m_bIsEditingPresetTypeSet = Other.m_bIsEditingPresetTypeSet;
        this.m_EditingPresetTypePrivate = Other.m_EditingPresetTypePrivate;
        return __r;
    }
    ECombatSettingPresetType GetEditingPresetType() const property
    {
        int local_4 = this.GetbIsEditingPresetTypeSet() ? int(this.GetEditingPresetTypePrivate()) : int(this.GetCurrentLevelPresetType());
        return ECombatSettingPresetType(local_4);
    }
    void SetEditingPresetType(const ECombatSettingPresetType PresetType) property
    {
        this.SetbIsEditingPresetTypeSet(true);
        this.SetEditingPresetTypePrivate(ECombatSettingPresetType(PresetType));
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_8);
        return;
    }
    void ResetEditingPresetType()
    {
        this.SetbIsEditingPresetTypeSet(false);
        return;
    }
    bool IsMainAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        if (this.GetCombatSettingPreset().IsValid())
        {
            TEUIModelRef<FM_AvatarCombatSetting> local_6 = this.GetCombatSettingPreset().opArrow().GetMainAvatarCombatSetting();
            return (0 == 0);
        }
        return false;
    }
    bool IsAssistAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig) const
    {
        if (this.GetCombatSettingPreset().IsValid() && this.GetbUnLockTwoAvatar())
        {
            if (this.GetCombatSettingPreset().opArrow().GetAssistAvatarCombatSetting().IsValid())
            {
                TEUIModelRef<FM_AvatarCombatSetting> local_6 = this.GetCombatSettingPreset().opArrow().GetAssistAvatarCombatSetting();
                return (0 == 0);
            }
        }
        return false;
    }
    ECombatSettingPresetType GetCurrentLevelPresetType() const property
    {
        int local_101;
        TDataObjectPtr<FLevelInfoConfig> local_24 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        if (local_24)
        {
            TDataObjectPtr<FGameRuleConfig> local_74 = local_24.opArrow().GetGameRuleConfig();
            if (local_74)
            {
                if (local_74.opArrow().SquadNum == 1)
                {
                    local_101 = 0;
                }
                else
                {
                    local_101 = 1;
                }
                return ECombatSettingPresetType(local_101);
            }
        }
        return ECombatSettingPresetType(1);
    }
    TEUIModelRef<FM_CombatSettingPreset> GetEditingCombatSettingPreset()
    {
        return this.GetCombatSettingPreset();
    }
    void SaveEditingDivineSkillSetting(const TDataObjectPtr<FDivineSkillConfig> &inout DivineSkillConfig)
    {
        FString local_4 = FString();
        this.GetCombatSettingPreset().opArrow().GetPlayerCombatSetting().opArrow().SetDivineSkillConfig(DivineSkillConfig);
        return;
    }
    void SaveEditingAvatarSetting(const TDataObjectPtr<FAvatarPrefabConfig> &inout MainAvatarConfig, const TDataObjectPtr<FAvatarPrefabConfig> &inout AssistAvatarConfig)
    {
        int local_4;
        if (!(this.GetCombatSettingPreset().IsValid()))
        {
            return;
        }
        if (AssistAvatarConfig.IsSet())
        {
            local_4 = AssistAvatarConfig.opArrow().DataId;
        }
        else
        {
            local_4 = 0;
        }
        int local_5 = MainAvatarConfig.opArrow().DataId;
        this.GetCombatSettingPreset().opArrow().SetupFromAvatarID(local_5, local_4);
        return;
    }
    void GS_RequestSaveCurrentEditingCombatSettingPreset()
    {
        if (this.GetCombatSettingPreset().IsValid())
        {
            FPbChangeAvatarSettingReq local_8;
            local_8.SetIndex(this.GetCurrentUsedIndex());
            this.GetCombatSettingPreset().opArrow().FillChangeAvatarSettingReq(local_8);
            this.SendProto(local_8.ToWrapper());
        }
        return;
    }
    void GS_RequestSaveChangeMainAvatarSpecialty(const uint SpecialtyFrom, const uint SpecialtyTo)
    {
        FPbChangeMainAvatarSpecialtyReq local_4;
        local_4.SetFromAvatarId(SpecialtyFrom);
        local_4.SetToAvatarId(SpecialtyTo);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void PostConstruct()
    {
        this.SetEditingPresetTypePrivate(this.GetCurrentLevelPresetType());
        return;
    }
    void GS_OnPlayerAvatarDataNotify(const FPbPlayerAvatarDataNotify &inout Notify)
    {
        FPbAvatarSettingGroupBin local_10 = Notify.GetAvatarSettingGroup();
        this.SetbUnLockTwoAvatar(local_10.GetUnlockTwoAvatarSetting());
        this.SetCurrentUsedIndex(local_10.GetCurUsedIndex());
        int local_22 = local_10.GetAvatarSettingList_Num();
        XLog(ELog(27), FString().Append("[GS_OnPlayerAvatarDataNotify] Count:  ").Append(local_22));
        if ((!((local_22 > 0))))
        {
            return;
        }
        this.SetCombatSettingPreset(TEUIModelRef<FM_CombatSettingPreset>(::FM_CombatSettingPreset::Create(this.GetManager())));
        this.GetCombatSettingPreset().opArrow().SetupFromServerData(local_10.GetAvatarSettingList_Index(this.GetCurrentUsedIndex()), this.GetbUnLockTwoAvatar());
        return;
    }
    void GS_OnChangeAvatarSettingRsp(const FPbChangeAvatarSettingRsp &inout Rsp)
    {
        int local_57;
        if (Rsp.GetRetcode() == 0)
        {
            this.SetCurrentUsedIndex(Rsp.GetIndex());
            int local_4 = Rsp.GetDivineSkillId();
            GetDataObjectByGSDataId<FDivineSkillConfig> local_28;
            this.GetCombatSettingPreset().opArrow().GetPlayerCombatSetting().opArrow().SetDivineSkillConfig(local_28.opImplConv());
            if (this.GetbUnLockTwoAvatar())
            {
                local_57 = Rsp.GetAssistAvatarId();
            }
            else
            {
                local_57 = 0;
            }
            this.GetCombatSettingPreset().opArrow().SetupFromAvatarID(Rsp.GetMainAvatarId(), local_57);
            FEUIModelRef local_64 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus).opCall(local_64);
        }
        return;
    }
    void GS_OnChangeMainAvatarSpecialtyRsp(const FPbChangeMainAvatarSpecialtyRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() == 0)
        {
            FMsg_SpeicaltyChanged local_22;
            if (this.GetCombatSettingPreset().IsValid())
            {
                TEUIModelRef<FM_CombatSettingPreset> local_6 = this.GetCombatSettingPreset();
                int local_7;
                local_7 = GetMainAvatarID();
                TEUIModelRef<FM_CombatSettingPreset> local_6_2 = this.GetCombatSettingPreset();
                int local_9;
                local_9 = GetAssistAvatarID();
                if (Rsp.GetFromAvatarId() == local_7)
                {
                    int local_8 = Rsp.GetToAvatarId();
                    TEUIModelRef<FM_CombatSettingPreset> local_6_3 = this.GetCombatSettingPreset();
                    local_8.SetupFromAvatarID(local_9);
                }
                else
                {
                    if (local_9 != 0 && (Rsp.GetFromAvatarId() == local_9))
                    {
                        int local_8_2 = Rsp.GetToAvatarId();
                        TEUIModelRef<FM_CombatSettingPreset> local_6_4 = this.GetCombatSettingPreset();
                        local_7.SetupFromAvatarID(local_8_2);
                    }
                }
                FEUIModelRef local_16 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus).opCall(local_16);
            }
            FEUIModelRef local_16_2 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_22.FromSpecialtyID = Rsp.GetFromAvatarId();
            local_22.ToSpecialtyID = Rsp.GetToAvatarId();
        }
        return;
    }
    TEUIModelRef<FM_CombatSettingPreset> GetCombatSettingPreset() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CombatSettingPreset;
    }
    void SetCombatSettingPreset(const TEUIModelRef<FM_CombatSettingPreset> &inout __Value) property
    {
        TEUIModelRef<FM_CombatSettingPreset> local_2;
        local_2 = this.m_CombatSettingPreset;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CombatSettingPreset = __Value;
        return;
    }
    bool GetbUnLockTwoAvatar() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bUnLockTwoAvatar;
    }
    void SetbUnLockTwoAvatar(const bool __Value) property
    {
        if (!(this.m_bUnLockTwoAvatar) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bUnLockTwoAvatar = __Value;
        return;
    }
    uint GetCurrentUsedIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CurrentUsedIndex;
    }
    void SetCurrentUsedIndex(const uint __Value) property
    {
        if (this.m_CurrentUsedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentUsedIndex = __Value;
        return;
    }
    bool GetbIsEditingPresetTypeSet() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsEditingPresetTypeSet;
    }
    void SetbIsEditingPresetTypeSet(const bool __Value) property
    {
        if (!(this.m_bIsEditingPresetTypeSet) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsEditingPresetTypeSet = __Value;
        return;
    }
    ECombatSettingPresetType GetEditingPresetTypePrivate() const property
    {
        this.TrackPropertyRead(4);
        return this.m_EditingPresetTypePrivate;
    }
    void SetEditingPresetTypePrivate(const ECombatSettingPresetType __Value) property
    {
        if (int(this.m_EditingPresetTypePrivate) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EditingPresetTypePrivate = __Value;
        return;
    }
}

namespace FM_AvatarCombatSetting
{
FM_AvatarCombatSetting& Create(const UObject ContextObject)
{
    return FM_AvatarCombatSetting::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_AvatarCombatSetting CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_AvatarCombatSetting __r;
    TEUIModelRef<FM_AvatarCombatSetting> local_6 = TEUIModelRef<FM_AvatarCombatSetting>(EUIInternal::MakeModelWithManager(Manager, FM_AvatarCombatSetting::ModelId));
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
    return FM_AvatarCombatSetting;
}
int __IndexOf_bIsMainAvatar()
{
    return 0;
}
int __IndexOf_AvatarConfig()
{
    return 1;
}
}
namespace FM_PlayerCombatSetting
{
FM_PlayerCombatSetting& Create(const UObject ContextObject)
{
    return FM_PlayerCombatSetting::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_PlayerCombatSetting CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_PlayerCombatSetting __r;
    TEUIModelRef<FM_PlayerCombatSetting> local_6 = TEUIModelRef<FM_PlayerCombatSetting>(EUIInternal::MakeModelWithManager(Manager, FM_PlayerCombatSetting::ModelId));
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
    return FM_PlayerCombatSetting;
}
int __IndexOf_DivineSkillConfig()
{
    return 0;
}
}
namespace FM_CombatSettingPreset
{
FM_CombatSettingPreset& Create(const UObject ContextObject)
{
    return FM_CombatSettingPreset::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_CombatSettingPreset CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_CombatSettingPreset __r;
    TEUIModelRef<FM_CombatSettingPreset> local_6 = TEUIModelRef<FM_CombatSettingPreset>(EUIInternal::MakeModelWithManager(Manager, FM_CombatSettingPreset::ModelId));
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
    return FM_CombatSettingPreset;
}
int __IndexOf_PlayerCombatSetting()
{
    return 0;
}
int __IndexOf_MainAvatarID()
{
    return 1;
}
int __IndexOf_AssistAvatarID()
{
    return 2;
}
int __IndexOf_MainAvatarCombatSetting()
{
    return 3;
}
int __IndexOf_AssistAvatarCombatSetting()
{
    return 4;
}
}
namespace FMS_CombatSettingData
{
FMS_CombatSettingData& Get(const UObject ContextObject)
{
    return FMS_CombatSettingData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CombatSettingData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CombatSettingData __r;
    TEUIModelRef<FMS_CombatSettingData> local_6 = TEUIModelRef<FMS_CombatSettingData>(EUIInternal::MakeModelWithManager(Manager, FMS_CombatSettingData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerAvatarDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnChangeAvatarSettingRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnChangeMainAvatarSpecialtyRsp";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CombatSettingData;
}
void __GS_OnPlayerAvatarDataNotify(FMS_CombatSettingData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerAvatarDataNotify(FPbPlayerAvatarDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnChangeAvatarSettingRsp(FMS_CombatSettingData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnChangeAvatarSettingRsp(FPbChangeAvatarSettingRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnChangeMainAvatarSpecialtyRsp(FMS_CombatSettingData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnChangeMainAvatarSpecialtyRsp(FPbChangeMainAvatarSpecialtyRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_CombatSettingPreset()
{
    return 0;
}
int __IndexOf_bUnLockTwoAvatar()
{
    return 1;
}
int __IndexOf_CurrentUsedIndex()
{
    return 2;
}
int __IndexOf_bIsEditingPresetTypeSet()
{
    return 3;
}
int __IndexOf_EditingPresetTypePrivate()
{
    return 4;
}
}
