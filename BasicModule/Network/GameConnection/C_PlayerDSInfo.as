
namespace __INTENRAL_FC_DSPlayerInfo_NS
{
    const TECSComponentDerivedPtr<FC_DSPlayerInfo> DerivedPtr = TECSComponentDerivedPtr<FC_DSPlayerInfo>();
    const FC_DSPlayerInfo DefaultValue = FC_DSPlayerInfo();
}
namespace __INTENRAL_FC_DSPlayerAvatarInfo_NS
{
    const TECSComponentDerivedPtr<FC_DSPlayerAvatarInfo> DerivedPtr = TECSComponentDerivedPtr<FC_DSPlayerAvatarInfo>();
    const FC_DSPlayerAvatarInfo DefaultValue = FC_DSPlayerAvatarInfo();
}
namespace __INTENRAL_FC_PlayerLevelObjectStat_NS
{
    const TECSComponentDerivedPtr<FC_PlayerLevelObjectStat> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerLevelObjectStat>();
    const FC_PlayerLevelObjectStat DefaultValue = FC_PlayerLevelObjectStat();
}
namespace __INTENRAL_FCE_NofityTeleporterActivated_NS
{
    const TECSEventDerivedPtr<FCE_NofityTeleporterActivated> DerivedPtr = TECSEventDerivedPtr<FCE_NofityTeleporterActivated>();

}
struct FC_DSPlayerInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FString m_NickName;
    UPROPERTY()
    uint64 m_SocialTeamId;
    UPROPERTY()
    int m_SocialTeamSize;
    UPROPERTY()
    EGenderType m_Gender;
    UPROPERTY()
    uint m_PlayerSpecialtyID;

    FC_DSPlayerInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DSPlayerInfo(const FC_DSPlayerInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DSPlayerInfo opAssign(const FC_DSPlayerInfo &inout Other)
    {
        FC_DSPlayerInfo __r;
        this.SetNickName(Other.GetNickName());
        this.SetSocialTeamId(Other.GetSocialTeamId());
        this.SetSocialTeamSize(Other.GetSocialTeamSize());
        this.SetGender(Other.GetGender());
        this.SetPlayerSpecialtyID(Other.GetPlayerSpecialtyID());
        return __r;
    }
    FString GetNickName() const property
    {
        return this.m_NickName;
    }
    void SetNickName(const FString &inout __Value) property
    {
        if ((this.m_NickName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NickName = __Value;
        return;
    }
    uint64 GetSocialTeamId() const property
    {
        return this.m_SocialTeamId;
    }
    void SetSocialTeamId(const uint64 __Value) property
    {
        if (this.m_SocialTeamId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SocialTeamId = __Value;
        return;
    }
    int GetSocialTeamSize() const property
    {
        return this.m_SocialTeamSize;
    }
    void SetSocialTeamSize(const int __Value) property
    {
        if (this.m_SocialTeamSize == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SocialTeamSize = __Value;
        return;
    }
    EGenderType GetGender() const property
    {
        return this.m_Gender;
    }
    void SetGender(const EGenderType __Value) property
    {
        if (int(this.m_Gender) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Gender = __Value;
        return;
    }
    uint GetPlayerSpecialtyID() const property
    {
        return this.m_PlayerSpecialtyID;
    }
    void SetPlayerSpecialtyID(const uint __Value) property
    {
        if (this.m_PlayerSpecialtyID == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_PlayerSpecialtyID = __Value;
        return;
    }
}

struct FDSAvatarEquipmentInfo
{
    UPROPERTY()
    uint64 m_Guid = 0;
    UPROPERTY()
    FEquipmentData m_EquipmentData;


    uint64 GetGuid() const property
    {
        return this.m_Guid;
    }
    void SetGuid(const uint64 __Value) property
    {
        this.m_Guid = __Value;
        return;
    }
    const FEquipmentData GetEquipmentData() const property
    {
        const FEquipmentData __r;
        return __r;
    }
    FEquipmentData GetEquipmentData() property
    {
        FEquipmentData __r;
        return __r;
    }
    void SetEquipmentData(const FEquipmentData &inout __Value) property
    {
        return;
    }
}

struct FDSAvatarTalentEquipInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_AvatarId;
    UPROPERTY()
    uint m_OnEquipFoundationId;
    UPROPERTY()
    TArray<uint> m_OnEquipChooseTalentIdList;
    UPROPERTY()
    TMap<ESkillSlot, uint> m_TalentIdBySkillSlot;

    FDSAvatarTalentEquipInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDSAvatarTalentEquipInfo(const FDSAvatarTalentEquipInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDSAvatarTalentEquipInfo opAssign(const FDSAvatarTalentEquipInfo &inout Other)
    {
        FDSAvatarTalentEquipInfo __r;
        this.SetAvatarId(Other.GetAvatarId());
        this.SetOnEquipFoundationId(Other.GetOnEquipFoundationId());
        this.SetOnEquipChooseTalentIdList(Other.GetOnEquipChooseTalentIdList());
        this.SetTalentIdBySkillSlot(Other.GetTalentIdBySkillSlot());
        return __r;
    }
    uint GetAvatarId() const property
    {
        return this.m_AvatarId;
    }
    void SetAvatarId(const uint __Value) property
    {
        if (this.m_AvatarId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AvatarId = __Value;
        return;
    }
    uint GetOnEquipFoundationId() const property
    {
        return this.m_OnEquipFoundationId;
    }
    void SetOnEquipFoundationId(const uint __Value) property
    {
        if (this.m_OnEquipFoundationId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_OnEquipFoundationId = __Value;
        return;
    }
    const TArray<uint> GetOnEquipChooseTalentIdList() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_OnEquipChooseTalentIdList() property
    {
        TArray<uint> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetOnEquipChooseTalentIdList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_OnEquipChooseTalentIdList = __Value;
        return;
    }
    const TMap<ESkillSlot, uint> GetTalentIdBySkillSlot() const property
    {
        const TMap<ESkillSlot, uint> __r;
        return __r;
    }
    TMap<ESkillSlot, uint> GetModify_TalentIdBySkillSlot() property
    {
        TMap<ESkillSlot, uint> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetTalentIdBySkillSlot(const TMap<ESkillSlot, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TalentIdBySkillSlot = __Value;
        return;
    }
}

struct FDSAvatarInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_AvatarId;
    UPROPERTY()
    TMap<EEquipSlotType, FDSAvatarEquipmentInfo> m_EquipmentInfos;
    UPROPERTY()
    FDSAvatarTalentEquipInfo m_AvatarTalentEquipList;

    FDSAvatarInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDSAvatarInfo(const FDSAvatarInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FDSAvatarInfo opAssign(const FDSAvatarInfo &inout Other)
    {
        FDSAvatarInfo __r;
        this.SetAvatarId(Other.GetAvatarId());
        this.SetEquipmentInfos(Other.GetEquipmentInfos());
        this.SetAvatarTalentEquipList(Other.GetAvatarTalentEquipList());
        return __r;
    }
    uint GetAvatarId() const property
    {
        return this.m_AvatarId;
    }
    void SetAvatarId(const uint __Value) property
    {
        if (this.m_AvatarId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AvatarId = __Value;
        return;
    }
    const TMap<EEquipSlotType, FDSAvatarEquipmentInfo> GetEquipmentInfos() const property
    {
        const TMap<EEquipSlotType, FDSAvatarEquipmentInfo> __r;
        return __r;
    }
    TMap<EEquipSlotType, FDSAvatarEquipmentInfo> GetModify_EquipmentInfos() property
    {
        TMap<EEquipSlotType, FDSAvatarEquipmentInfo> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetEquipmentInfos(const TMap<EEquipSlotType, FDSAvatarEquipmentInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EquipmentInfos = __Value;
        return;
    }
    const FDSAvatarTalentEquipInfo GetAvatarTalentEquipList() const property
    {
        const FDSAvatarTalentEquipInfo __r;
        return __r;
    }
    FDSAvatarTalentEquipInfo GetAvatarTalentEquipList() property
    {
        FDSAvatarTalentEquipInfo __r;
        return __r;
    }
    void SetAvatarTalentEquipList(const FDSAvatarTalentEquipInfo &inout __Value) property
    {
        this.m_AvatarTalentEquipList = __Value;
        return;
    }
}

struct FC_DSPlayerAvatarInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FDSAvatarInfo> m_AvatarList;
    UPROPERTY()
    bool m_bUseGameModeOverrideEquipment;
    UPROPERTY()
    bool m_bDisableTalent;
    UPROPERTY()
    bool m_bDisableLevelGrowth;

    FC_DSPlayerAvatarInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DSPlayerAvatarInfo(const FC_DSPlayerAvatarInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DSPlayerAvatarInfo opAssign(const FC_DSPlayerAvatarInfo &inout Other)
    {
        FC_DSPlayerAvatarInfo __r;
        this.SetAvatarList(Other.GetAvatarList());
        this.SetbUseGameModeOverrideEquipment(Other.GetbUseGameModeOverrideEquipment());
        this.SetbDisableTalent(Other.GetbDisableTalent());
        this.SetbDisableLevelGrowth(Other.GetbDisableLevelGrowth());
        return __r;
    }
    void InitByGameMode()
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_GameMode& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.GetbPVPGame() || local_8.GetbPVXGame())
            {
                this.SetbUseGameModeOverrideEquipment(true);
                this.SetbDisableTalent(true);
                this.SetbDisableLevelGrowth(true);
            }
        }
        return;
    }
    void AddAvatarByPbAvatar(const FPbAvatar &inout PbAvatar)
    {
        for (auto& local_16 : this.GetAvatarList())
        {
            if (local_16.GetAvatarId() == PbAvatar.GetAvatarId())
            {
                XWarning(ELog(42), FString().Append("FC_DSPlayerAvatarInfo AddAvatarByPbAvatar AvatarId=").Append(PbAvatar.GetAvatarId()).Append(" already exists"));
                return;
            }
        }
        FDSAvatarInfo local_74;
        local_74.SetAvatarId(PbAvatar.GetAvatarId());
        if (!(::FGameModeUtils::ShouldUseModeWeapon(this.GetbUseGameModeOverrideEquipment())))
        {
            FDSAvatarEquipmentInfo local_106;
            local_106.SetGuid(PbAvatar.GetCurWeaponGuid());
            local_106.SetEquipmentData(::FEquipmentUtils::MakeEquipmentDataByPbEquip(PbAvatar.GetCurWeapon().GetItemId(), PbAvatar.GetCurWeapon().GetEquip()));
            local_74.GetModify_EquipmentInfos().Add(EEquipSlotType(1), local_106);
            XLog(ELog(0), FString().Append("WeaponDebug FC_DSPlayerAvatarInfo AddAvatarByPbAvatar AddEquipment AvatarId ").Append(PbAvatar.GetAvatarId()).Append(", WeaponItemId ").Append(PbAvatar.GetCurWeapon().GetItemId()));
            TArray<FPbTalismanEquipInfo> local_172;
            PbAvatar.GetCurTalismanInfo(local_172);
            for (auto& local_186 : local_172)
            {
                FDSAvatarEquipmentInfo local_216;
                local_216.SetGuid(local_186.GetTalismanGuid());
                local_216.SetEquipmentData(::FEquipmentUtils::MakeEquipmentDataByPbEquip(local_186.GetTalisman().GetItemId(), local_186.GetTalisman().GetEquip()));
                local_74.GetModify_EquipmentInfos().Add(EEquipSlotType((local_186.GetSlot() + 2)), local_216);
            }
        }
        if (!(::FGameModeUtils::ShouldDisableTalent(this.GetbDisableTalent())))
        {
            FPbAvatarEquippedTalentBin local_228 = PbAvatar.GetAvatarEquippedTalent();
            FDSAvatarTalentEquipInfo& local_240 = local_74.GetAvatarTalentEquipList();
            local_240.SetAvatarId(PbAvatar.GetAvatarId());
            local_240.SetOnEquipFoundationId(local_228.GetFoundationId());
            TArray<uint> local_244;
            local_228.GetChooseIdList(local_244);
            local_240.SetOnEquipChooseTalentIdList(local_244);
            TArray<FPbAvatarReplaceSkillBin> local_248;
            local_228.GetReplaceSkillList(local_248);
            for (auto& local_262 : local_248)
            {
                int local_263 = local_262.GetSlot();
                local_240.GetModify_TalentIdBySkillSlot().Add(ESkillSlot(local_263), local_262.GetTalentId());
            }
        }
        this.GetModify_AvatarList().Add(local_74);
        return;
    }
    TArray<FDSAvatarInfo> GetAvatarList() const property
    {
        TArray<FDSAvatarInfo> __r;
        return __r;
    }
    TArray<FDSAvatarInfo> GetModify_AvatarList() property
    {
        TArray<FDSAvatarInfo> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAvatarList(const TArray<FDSAvatarInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AvatarList = __Value;
        return;
    }
    bool GetbUseGameModeOverrideEquipment() const property
    {
        return this.m_bUseGameModeOverrideEquipment;
    }
    void SetbUseGameModeOverrideEquipment(const bool __Value) property
    {
        if (!(this.m_bUseGameModeOverrideEquipment) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bUseGameModeOverrideEquipment = __Value;
        return;
    }
    bool GetbDisableTalent() const property
    {
        return this.m_bDisableTalent;
    }
    void SetbDisableTalent(const bool __Value) property
    {
        if (!(this.m_bDisableTalent) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bDisableTalent = __Value;
        return;
    }
    bool GetbDisableLevelGrowth() const property
    {
        return this.m_bDisableLevelGrowth;
    }
    void SetbDisableLevelGrowth(const bool __Value) property
    {
        if (!(this.m_bDisableLevelGrowth) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bDisableLevelGrowth = __Value;
        return;
    }
}

struct FTreasureBoxInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_TreasureBoxId;
    UPROPERTY()
    uint m_TreasureBoxTime;
    UPROPERTY()
    uint m_TreasureBoxState;

    FTreasureBoxInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTreasureBoxInfo(const FTreasureBoxInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTreasureBoxInfo opAssign(const FTreasureBoxInfo &inout Other)
    {
        FTreasureBoxInfo __r;
        this.SetTreasureBoxId(Other.GetTreasureBoxId());
        this.SetTreasureBoxTime(Other.GetTreasureBoxTime());
        this.SetTreasureBoxState(Other.GetTreasureBoxState());
        return __r;
    }
    uint GetTreasureBoxId() const property
    {
        return this.m_TreasureBoxId;
    }
    void SetTreasureBoxId(const uint __Value) property
    {
        if (this.m_TreasureBoxId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TreasureBoxId = __Value;
        return;
    }
    uint GetTreasureBoxTime() const property
    {
        return this.m_TreasureBoxTime;
    }
    void SetTreasureBoxTime(const uint __Value) property
    {
        if (this.m_TreasureBoxTime == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TreasureBoxTime = __Value;
        return;
    }
    uint GetTreasureBoxState() const property
    {
        return this.m_TreasureBoxState;
    }
    void SetTreasureBoxState(const uint __Value) property
    {
        if (this.m_TreasureBoxState == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TreasureBoxState = __Value;
        return;
    }
}

struct FLevelObjectStatInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_MapConfigId;
    UPROPERTY()
    TArray<uint> m_PortalIdList;
    UPROPERTY()
    TArray<uint> m_OculusIdList;
    UPROPERTY()
    TArray<uint> m_CollectionPrefabList;
    UPROPERTY()
    TArray<FTreasureBoxInfo> m_TreasureBoxList;

    FLevelObjectStatInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLevelObjectStatInfo(const FLevelObjectStatInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FLevelObjectStatInfo opAssign(const FLevelObjectStatInfo &inout Other)
    {
        FLevelObjectStatInfo __r;
        this.SetMapConfigId(Other.GetMapConfigId());
        this.SetPortalIdList(Other.GetPortalIdList());
        this.SetOculusIdList(Other.GetOculusIdList());
        this.SetCollectionPrefabList(Other.GetCollectionPrefabList());
        this.SetTreasureBoxList(Other.GetTreasureBoxList());
        return __r;
    }
    uint GetMapConfigId() const property
    {
        return this.m_MapConfigId;
    }
    void SetMapConfigId(const uint __Value) property
    {
        if (this.m_MapConfigId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MapConfigId = __Value;
        return;
    }
    TArray<uint> GetPortalIdList() const property
    {
        TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_PortalIdList() property
    {
        TArray<uint> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPortalIdList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_PortalIdList = __Value;
        return;
    }
    TArray<uint> GetOculusIdList() const property
    {
        TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_OculusIdList() property
    {
        TArray<uint> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetOculusIdList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_OculusIdList = __Value;
        return;
    }
    TArray<uint> GetCollectionPrefabList() const property
    {
        TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_CollectionPrefabList() property
    {
        TArray<uint> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetCollectionPrefabList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CollectionPrefabList = __Value;
        return;
    }
    const TArray<FTreasureBoxInfo> GetTreasureBoxList() const property
    {
        const TArray<FTreasureBoxInfo> __r;
        return __r;
    }
    TArray<FTreasureBoxInfo> GetModify_TreasureBoxList() property
    {
        TArray<FTreasureBoxInfo> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTreasureBoxList(const TArray<FTreasureBoxInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TreasureBoxList = __Value;
        return;
    }
}

struct FC_PlayerLevelObjectStat : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<uint> m_TeleporterDataIds;
    UPROPERTY()
    TArray<uint> m_UnlockedTeleporterDataIds;
    UPROPERTY()
    TArray<FLevelObjectStatInfo> m_LevelObjectStatInfoList;

    FC_PlayerLevelObjectStat()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerLevelObjectStat(const FC_PlayerLevelObjectStat &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TeleporterDataIds = Other.m_TeleporterDataIds;
        this.m_UnlockedTeleporterDataIds = Other.m_UnlockedTeleporterDataIds;
        this.m_LevelObjectStatInfoList = Other.m_LevelObjectStatInfoList;
        return;
    }
    FC_PlayerLevelObjectStat opAssign(const FC_PlayerLevelObjectStat &inout Other)
    {
        FC_PlayerLevelObjectStat __r;
        this.SetTeleporterDataIds(Other.GetTeleporterDataIds());
        this.SetUnlockedTeleporterDataIds(Other.GetUnlockedTeleporterDataIds());
        this.SetLevelObjectStatInfoList(Other.GetLevelObjectStatInfoList());
        return __r;
    }
    const TArray<uint> GetTeleporterDataIds() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_TeleporterDataIds() property
    {
        TArray<uint> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTeleporterDataIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TeleporterDataIds = __Value;
        return;
    }
    const TArray<uint> GetUnlockedTeleporterDataIds() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_UnlockedTeleporterDataIds() property
    {
        TArray<uint> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetUnlockedTeleporterDataIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_UnlockedTeleporterDataIds = __Value;
        return;
    }
    const TArray<FLevelObjectStatInfo> GetLevelObjectStatInfoList() const property
    {
        const TArray<FLevelObjectStatInfo> __r;
        return __r;
    }
    TArray<FLevelObjectStatInfo> GetModify_LevelObjectStatInfoList() property
    {
        TArray<FLevelObjectStatInfo> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLevelObjectStatInfoList(const TArray<FLevelObjectStatInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LevelObjectStatInfoList = __Value;
        return;
    }
}

struct FCE_NofityTeleporterActivated : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint TeleporterDataId;


}

namespace ECSFunc_FC_DSPlayerInfo
{
UFUNCTION()
bool HasDSPlayerInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerInfo);
}
FC_DSPlayerInfo& AssignDSPlayerInfo(const FECSEntity &inout Entity, const FC_DSPlayerInfo &inout DefaultValue = FC_DSPlayerInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDSPlayerInfo_BP(const FECSEntity &inout Entity, const FC_DSPlayerInfo &inout DefaultValue = FC_DSPlayerInfo())
{
    ECSFunc_FC_DSPlayerInfo::AssignDSPlayerInfo(Entity, DefaultValue);
    return;
}
FC_DSPlayerInfo& ModifyDSPlayerInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerInfo));
    return local_12.GetComp();
}
FC_DSPlayerInfo& ModifyOrAddDSPlayerInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerInfo));
    return local_12.GetComp();
}
const FC_DSPlayerInfo& GetDSPlayerInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_DSPlayerInfo GetDSPlayerInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DSPlayerInfo& local_4 = ECSFunc_FC_DSPlayerInfo::GetDSPlayerInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DSPlayerInfo();
}
const FC_DSPlayerInfo GetDefaultedDSPlayerInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DSPlayerInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerInfo);
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
FC_DSPlayerInfo GetDefaultedDSPlayerInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DSPlayerInfo::GetDefaultedDSPlayerInfo(Entity);
}
UFUNCTION()
bool RemoveDSPlayerInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerInfo);
}
}
FECSMonitorRuntimeView __GetMonitorDSPlayerInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DSPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DSPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DSPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DSPlayerInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DSPlayerInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorDSPlayerInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DSPlayerInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDSPlayerInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DSPlayerInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDSPlayerInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DSPlayerInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DSPlayerAvatarInfo
{
UFUNCTION()
bool HasDSPlayerAvatarInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerAvatarInfo);
}
FC_DSPlayerAvatarInfo& AssignDSPlayerAvatarInfo(const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout DefaultValue = FC_DSPlayerAvatarInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerAvatarInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDSPlayerAvatarInfo_BP(const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout DefaultValue = FC_DSPlayerAvatarInfo())
{
    ECSFunc_FC_DSPlayerAvatarInfo::AssignDSPlayerAvatarInfo(Entity, DefaultValue);
    return;
}
FC_DSPlayerAvatarInfo& ModifyDSPlayerAvatarInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerAvatarInfo));
    return local_12.GetComp();
}
FC_DSPlayerAvatarInfo& ModifyOrAddDSPlayerAvatarInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerAvatarInfo));
    return local_12.GetComp();
}
const FC_DSPlayerAvatarInfo& GetDSPlayerAvatarInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerAvatarInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_DSPlayerAvatarInfo GetDSPlayerAvatarInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DSPlayerAvatarInfo& local_4 = ECSFunc_FC_DSPlayerAvatarInfo::GetDSPlayerAvatarInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DSPlayerAvatarInfo();
}
const FC_DSPlayerAvatarInfo GetDefaultedDSPlayerAvatarInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DSPlayerAvatarInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerAvatarInfo);
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
FC_DSPlayerAvatarInfo GetDefaultedDSPlayerAvatarInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DSPlayerAvatarInfo::GetDefaultedDSPlayerAvatarInfo(Entity);
}
UFUNCTION()
bool RemoveDSPlayerAvatarInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DSPlayerAvatarInfo);
}
}
FECSMonitorRuntimeView __GetMonitorDSPlayerAvatarInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DSPlayerAvatarInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerAvatarInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DSPlayerAvatarInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerAvatarInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DSPlayerAvatarInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerAvatarInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DSPlayerAvatarInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDSPlayerAvatarInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DSPlayerAvatarInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorDSPlayerAvatarInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DSPlayerAvatarInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDSPlayerAvatarInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DSPlayerAvatarInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDSPlayerAvatarInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DSPlayerAvatarInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerLevelObjectStat
{
UFUNCTION()
bool HasPlayerLevelObjectStat(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelObjectStat);
}
FC_PlayerLevelObjectStat& AssignPlayerLevelObjectStat(const FECSEntity &inout Entity, const FC_PlayerLevelObjectStat &inout DefaultValue = FC_PlayerLevelObjectStat())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelObjectStat, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerLevelObjectStat_BP(const FECSEntity &inout Entity, const FC_PlayerLevelObjectStat &inout DefaultValue = FC_PlayerLevelObjectStat())
{
    ECSFunc_FC_PlayerLevelObjectStat::AssignPlayerLevelObjectStat(Entity, DefaultValue);
    return;
}
FC_PlayerLevelObjectStat& ModifyPlayerLevelObjectStat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelObjectStat));
    return local_12.GetComp();
}
FC_PlayerLevelObjectStat& ModifyOrAddPlayerLevelObjectStat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelObjectStat));
    return local_12.GetComp();
}
const FC_PlayerLevelObjectStat& GetPlayerLevelObjectStat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelObjectStat));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerLevelObjectStat GetPlayerLevelObjectStat_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerLevelObjectStat& local_4 = ECSFunc_FC_PlayerLevelObjectStat::GetPlayerLevelObjectStat(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerLevelObjectStat();
}
const FC_PlayerLevelObjectStat GetDefaultedPlayerLevelObjectStat(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerLevelObjectStat __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelObjectStat);
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
FC_PlayerLevelObjectStat GetDefaultedPlayerLevelObjectStat_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerLevelObjectStat::GetDefaultedPlayerLevelObjectStat(Entity);
}
UFUNCTION()
bool RemovePlayerLevelObjectStat(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerLevelObjectStat);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelObjectStatOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerLevelObjectStat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelObjectStatOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerLevelObjectStat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelObjectStatOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerLevelObjectStat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelObjectStatOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerLevelObjectStat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerLevelObjectStatOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerLevelObjectStat, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerLevelObjectStatLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerLevelObjectStat, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerLevelObjectStatActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerLevelObjectStat, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerLevelObjectStatModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerLevelObjectStat, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DSPlayerInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DSPlayerInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DSPlayerInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DSPlayerInfo
{
int __IndexOf_NickName()
{
    return 0;
}
int __IndexOf_SocialTeamId()
{
    return 1;
}
int __IndexOf_SocialTeamSize()
{
    return 2;
}
int __IndexOf_Gender()
{
    return 3;
}
int __IndexOf_PlayerSpecialtyID()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDSAvatarTalentEquipInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDSAvatarTalentEquipInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDSAvatarTalentEquipInfo
{
int __IndexOf_AvatarId()
{
    return 0;
}
int __IndexOf_OnEquipFoundationId()
{
    return 1;
}
int __IndexOf_OnEquipChooseTalentIdList()
{
    return 2;
}
int __IndexOf_TalentIdBySkillSlot()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FDSAvatarInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FDSAvatarInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FDSAvatarInfo
{
int __IndexOf_AvatarId()
{
    return 0;
}
int __IndexOf_EquipmentInfos()
{
    return 1;
}
int __IndexOf_AvatarTalentEquipList()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DSPlayerAvatarInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DSPlayerAvatarInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DSPlayerAvatarInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DSPlayerAvatarInfo
{
int __IndexOf_AvatarList()
{
    return 0;
}
int __IndexOf_bUseGameModeOverrideEquipment()
{
    return 1;
}
int __IndexOf_bDisableTalent()
{
    return 2;
}
int __IndexOf_bDisableLevelGrowth()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FTreasureBoxInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FTreasureBoxInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTreasureBoxInfo
{
int __IndexOf_TreasureBoxId()
{
    return 0;
}
int __IndexOf_TreasureBoxTime()
{
    return 1;
}
int __IndexOf_TreasureBoxState()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FLevelObjectStatInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FLevelObjectStatInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FLevelObjectStatInfo
{
int __IndexOf_MapConfigId()
{
    return 0;
}
int __IndexOf_PortalIdList()
{
    return 1;
}
int __IndexOf_OculusIdList()
{
    return 2;
}
int __IndexOf_CollectionPrefabList()
{
    return 3;
}
int __IndexOf_TreasureBoxList()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerLevelObjectStat &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerLevelObjectStat &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerLevelObjectStat &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerLevelObjectStat
{
int __IndexOf_TeleporterDataIds()
{
    return 0;
}
int __IndexOf_UnlockedTeleporterDataIds()
{
    return 1;
}
int __IndexOf_LevelObjectStatInfoList()
{
    return 2;
}
}
