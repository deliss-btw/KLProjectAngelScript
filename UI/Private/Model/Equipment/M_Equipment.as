
namespace FM_Equipment
{
    const int ModelId = 0;
}
namespace FMS_EquipmentDataCache
{
    const int ModelId = 0;
}
namespace FMS_Talisman
{
    const int ModelId = 0;

}
struct FM_Equipment : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FEquipmentConfig> m_EquipmentConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Trait>> m_EquipmentTraits;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_EquiptingAvatar;

    FM_Equipment()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_Equipment(const FM_Equipment &inout Other)
    {
        this.m_EquipmentConfig = Other.m_EquipmentConfig;
        this.m_EquipmentTraits = Other.m_EquipmentTraits;
        this.m_EquiptingAvatar = Other.m_EquiptingAvatar;
        return;
    }
    FM_Equipment& opAssign(const FM_Equipment &inout Other)
    {
        this.m_EquipmentConfig = Other.m_EquipmentConfig;
        this.m_EquipmentTraits = Other.m_EquipmentTraits;
        return Other.m_EquiptingAvatar;
    }
    TDataObjectPtr<FEquipmentConfig> GetEquipmentConfig() const property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FEquipmentConfig> GetModify_EquipmentConfig() property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEquipmentConfig(const TDataObjectPtr<FEquipmentConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipmentConfig = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_Trait>> GetEquipmentTraits() const property
    {
        const TArray<TEUIModelRef<FM_Trait>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FM_Trait>> GetModify_EquipmentTraits() property
    {
        TArray<TEUIModelRef<FM_Trait>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEquipmentTraits(const TArray<TEUIModelRef<FM_Trait>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EquipmentTraits = __Value;
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetEquiptingAvatar() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_EquiptingAvatar() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEquiptingAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EquiptingAvatar = __Value;
        return;
    }
}

struct FMsg_AvatarEquipmentChanged : FEUIMessage
{
    FMsg_AvatarEquipmentChanged()
    {
        return;
    }
}

struct FMS_EquipmentDataCache : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint64, TEUIModelRef<FM_Equipment>> m_CachedEquipments;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Equipment>, uint64> m_EquipmentToItemUid;
    UPROPERTY()
    bool m_bInventoryInited;
    UPROPERTY()
    bool m_bWeaponRedDotBaselineInited;

    FMS_EquipmentDataCache()
    {
        this.m_bInventoryInited = false;
        this.m_bWeaponRedDotBaselineInited = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_EquipmentDataCache(const FMS_EquipmentDataCache &inout Other)
    {
        this.m_bInventoryInited = false;
        this.m_bWeaponRedDotBaselineInited = false;
        this.m_CachedEquipments = Other.m_CachedEquipments;
        this.m_EquipmentToItemUid = Other.m_EquipmentToItemUid;
        this.m_bInventoryInited = Other.m_bInventoryInited;
        this.m_bWeaponRedDotBaselineInited = Other.m_bWeaponRedDotBaselineInited;
        return;
    }
    FMS_EquipmentDataCache opAssign(const FMS_EquipmentDataCache &inout Other)
    {
        FMS_EquipmentDataCache __r;
        this.m_CachedEquipments = Other.m_CachedEquipments;
        this.m_EquipmentToItemUid = Other.m_EquipmentToItemUid;
        this.m_bInventoryInited = Other.m_bInventoryInited;
        this.m_bWeaponRedDotBaselineInited = Other.m_bWeaponRedDotBaselineInited;
        return __r;
    }
    bool IsEquipByHiddenAvatar(const uint64 ItemUid)
    {
        int local_3;
        bool local_7 = false;
        if (ItemUid == 0)
        {
            return false;
        }
        TEUIModelRef<FM_Equipment> local_6;
        if (this.GetCachedEquipments().Find(ItemUid, local_6))
        {
            if (!(GetEquiptingAvatar().IsSet()))
            {
                local_3 = 0;
            }
            else
            {
                local_3 = local_7;
            }
            return (local_3 != 0);
        }
        return false;
    }
    bool HasEquipment(const uint64 ItemUid)
    {
        return this.GetCachedEquipments().Contains(ItemUid);
    }
    TEUIModelRef<FM_Equipment> GetEquipment(const uint64 ItemUid)
    {
        TEUIModelRef<FM_Equipment> local_2;
        if (this.GetCachedEquipments().Find(ItemUid, local_2))
        {
            return local_2;
        }
        return this.CreateEmptyEquipment(ItemUid);
    }
    uint64 GetItemUid(const TEUIModelRef<FM_Equipment> &inout Equipment)
    {
        int local_2;
        if (this.GetEquipmentToItemUid().Find(Equipment, local_2))
        {
            return local_2;
        }
        return 0;
    }
    TEUIModelRef<FM_Equipment> CreateFromConfig(const TDataObjectPtr<FEquipmentConfig> &inout Config)
    {
        FM_Equipment& local_2 = ::FM_Equipment::Create(this.GetContext().Manager);
        local_2.SetEquipmentConfig(Config);
        if (Config)
        {
            TArrayConstIterator<FTraitParam> local_10;
            for (; local_10.CanProceed;)
            {
                const FTraitParam& local_18 = local_10.Proceed();
                local_2.GetModify_EquipmentTraits().Add(TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_18.GetTrait(), local_18.GetLevel())));
            }
        }
        return TEUIModelRef<FM_Equipment>(local_2);
    }
    TEUIModelRef<FM_Equipment> CreateAndCacheFromConfig(const TDataObjectPtr<FEquipmentConfig> &inout Config, const uint64 ItemUid)
    {
        int local_4 = 0;
        TEUIModelRef<FM_Equipment> local_2 = this.GetEquipment(ItemUid);
        local_4.SetEquipmentConfig(Config);
        if (Config)
        {
            TArrayConstIterator<FTraitParam> local_12;
            for (; local_12.CanProceed;)
            {
                const FTraitParam& local_20 = local_12.Proceed();
                local_4.GetModify_EquipmentTraits().Add(TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_20.GetTrait(), local_20.GetLevel())));
            }
        }
        return (TEUIModelRef<FM_Equipment>(local_4));
    }
    void GS_OnPlayerInventoryInit(const FPbPlayerInventoryNotify &inout Notify)
    {
        int local_1 = 0;
        for (; local_1 < Notify.GetItemList_Num(); ++local_1)
        {
            FPbItem local_14 = Notify.GetItemList_Index(local_1);
            ::FItemConfig::GetByDataId(local_14.GetItemId());
            CastTo local_100;
            TDataObjectPtr<FEquipmentConfig> local_124 = local_100.opCall();
            if (local_124)
            {
                this.CacheEquipmentData(local_124, local_14);
            }
        }
        this.SetbInventoryInited(true);
        FECSEntity local_128 = this.GetContext().GetLocalPlayer();
        Has local_132;
        if (local_132.opCall())
        {
            this.SetbWeaponRedDotBaselineInited(true);
        }
        TSet<EWeaponType> local_152;
        this.RefreshWeaponCanChangeRedDot(true, false, local_152);
        this.ConsumeTalismanSlotRedDotIfNoEquippable();
        return;
    }
    void RefreshWeaponCanChangeRedDot(const bool bAllowGenerate, const bool bFilterByWeaponType, const TSet<EWeaponType> &inout AffectedWeaponTypes)
    {
        int local_52 = 0;
        bool local_54;
        CastTo local_82;
        int local_108 = 0;
        int local_152;
        bool local_169;
        bool local_170;
        FDSAvatarEquipmentInfo local_200;
        if (!(this.GetbInventoryInited()))
        {
            return;
        }
        FECSEntity local_6 = this.GetContext().GetLocalPlayer();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        TMap<EWeaponType, int> local_30;
        for (auto& local_48 : this.GetCachedEquipments())
        {
            local_48;
            if (!(GetEquipmentConfig().IsSet()) || ((0 != 2)))
            {
                continue;
            }
            if (local_82.opCall())
            {
                local_108 = FMath::Max(int(local_108), local_52);
            }
        }
        TSet<uint> local_130;
        for (auto& local_144 : ::FVMS_PlayerOwnedAvatarInfo::Get(this.GetContext().Manager).GetUnLockAvatarList())
        {
            if (local_144.IsValid() && GetAvatarConfig().IsSet())
            {
            }
        }
        FMS_RedDotSystem& local_146 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        FECSEntity local_6_2 = this.GetContext().GetLocalPlayer();
        bool local_153 = false;
        for (auto& local_168 : local_152.GetAvatarList())
        {
            local_169 = false;
            local_170 = false;
            if (local_168.GetEquipmentInfos().Find(EEquipSlotType(1), local_200))
            {
                if (local_82.opCall())
                {
                    EWeaponType local_202;
                    EWeaponType local_203;
                    local_202 = local_203;
                    local_170 = AffectedWeaponTypes.Contains(local_202);
                    int local_204 = 0;
                    if (local_30.Find(local_202, local_204) && (local_52 < local_204))
                    {
                        local_169 = true;
                    }
                }
            }
            if (bFilterByWeaponType && !(local_170))
            {
                continue;
            }
            int64 local_210 = local_168.GetAvatarId();
            local_54 = local_130.Contains(local_168.GetAvatarId());
            bool local_1 = local_146.HasRedDotByEvent(ERedPointEvent(14), local_210);
            bool local_211 = bAllowGenerate && local_169;
            if (local_211 && local_54 && !(local_1))
            {
                TArray<uint64> local_218;
                local_218.Add(local_210);
                local_146.GenerateRedDot(ERedPointEvent(14), local_218);
                bool local_153_2 = true;
            }
            else
            {
                local_211 = !(local_169) || !(local_54);
                if (local_211 && local_1)
                {
                    local_146.ConsumeRedDotByEvent(ERedPointEvent(14), local_210);
                    bool local_153_3 = true;
                }
            }
        }
        return;
    }
    void ConsumeTalismanSlotRedDotIfNoEquippable()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void GS_OnInventoryItemUpdate(const FPbInventoryItemNotify &inout Notify)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void GS_OnInventoryItemRemoved(const FPbInventoryDelItemNotify &inout Notify)
    {
        int local_25;
        int local_37 = 0;
        FMS_RedDotSystem& local_2 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        TSet<EWeaponType> local_22;
        bool local_23 = false;
        local_25 = Notify.GetGuidList_Num();
        int local_27 = 0;
        for (; local_27 < local_25; ++local_27)
        {
            int local_32 = Notify.GetGuidList_Index(local_27);
            TEUIModelRef<FM_Equipment> local_34;
            if (!(this.GetCachedEquipments().Find(local_32, local_34)))
            {
                continue;
            }
            const TDataObjectPtr<FEquipmentConfig>& local_36 = GetEquipmentConfig();
            if (local_36.IsSet())
            {
                if (local_37 == 2)
                {
                    CastTo local_68;
                    if (local_68.opCall())
                    {
                    }
                    if (local_2.HasRedDotByEvent(ERedPointEvent(13), local_32))
                    {
                        local_2.ConsumeRedDotByEvent(ERedPointEvent(13), local_32);
                    }
                }
                else
                {
                    if (local_37 == 7)
                    {
                        local_23 = true;
                        if (local_2.HasRedDotByEvent(ERedPointEvent(12), local_32))
                        {
                            local_2.ConsumeRedDotByEvent(ERedPointEvent(12), local_32);
                        }
                    }
                }
            }
        }
        if (!(local_22.IsEmpty()))
        {
            this.RefreshWeaponCanChangeRedDot(false, true, local_22);
        }
        if (local_23)
        {
            this.ConsumeTalismanSlotRedDotIfNoEquippable();
        }
        return;
    }
    void OnAvatarEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        TSet<uint64> local_20;
        if (C_PlayerAvatarInfo)
        {
            for (auto& local_36 : C_PlayerAvatarInfo.GetAvatarList())
            {
                for (auto& local_54 : local_36.GetEquipmentInfos())
                {
                    local_54;
                    int local_79 = local_36.GetAvatarId();
                    GetDataObjectByGSDataId<FAvatarPrefabConfig> local_78;
                    TEUIModelRef<FM_Equipment> local_84 = this.GetEquipment(GetGuid());
                    local_78.opImplConv().SetEquiptingAvatar();
                    local_20.Add(GetGuid());
                }
            }
        }
        for (auto& local_126 : this.GetCachedEquipments())
        {
            if (!(local_20.Contains(local_126.GetKey())))
            {
                TDataObjectPtr<FAvatarPrefabConfig>(nullptr).SetEquiptingAvatar();
            }
        }
        FEUIModelRef local_132 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_132);
        if (C_PlayerAvatarInfo)
        {
            TSet<EWeaponType> local_152;
            if (this.GetbInventoryInited() && !(this.GetbWeaponRedDotBaselineInited()))
            {
                this.SetbWeaponRedDotBaselineInited(true);
                this.RefreshWeaponCanChangeRedDot(true, false, local_152);
            }
            else
            {
                this.RefreshWeaponCanChangeRedDot(false, false, local_152);
            }
        }
        this.ConsumeTalismanSlotRedDotIfNoEquippable();
        return;
    }
    void CacheEquipmentData(const TDataObjectPtr<FEquipmentConfig> &inout EquipmentConfig, const FPbItem &inout ItemData)
    {
        int local_8 = 0;
        if (!(!(!(EquipmentConfig))))
        {
            return;
        }
        if (!(ItemData.HasEquip()))
        {
            return;
        }
        TEUIModelRef<FM_Equipment> local_6 = this.GetEquipment(ItemData.GetGuid());
        local_8.SetEquipmentConfig(EquipmentConfig);
        local_8.GetModify_EquipmentTraits().Empty(0);
        TArray<FPbUint32Pair> local_14;
        ItemData.GetEquip().GetTraitLevelList(local_14);
        for (auto& local_38 : local_14)
        {
            int local_63 = local_38.GetFirst();
            TDataObjectPtr<FTraitConfig> local_114;
            TDataObjectPtr<FTraitConfig> local_62 = local_114;
            if (local_62)
            {
                local_8.GetModify_EquipmentTraits().Add(TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_62, ::NumericUtils::AsInt32(local_38.GetSecond()))));
            }
            else
            {
                XError(ELog(59), FString().Append("Can't find trait config by id ").Append(local_38.GetFirst()));
            }
        }
        this.ProcessEquipmentTraits(TEUIModelRef<FM_Equipment>(local_8));
        return;
    }
    TEUIModelRef<FM_Equipment> CreateEmptyEquipment(const uint64 ItemUid)
    {
        FM_Equipment& local_2 = ::FM_Equipment::Create(this.GetContext().Manager);
        this.GetModify_CachedEquipments().Add(ItemUid, TEUIModelRef<FM_Equipment>(local_2));
        this.GetModify_EquipmentToItemUid().Add(TEUIModelRef<FM_Equipment>(local_2), ItemUid);
        return (TEUIModelRef<FM_Equipment>(local_2));
    }
    void ProcessEquipmentTraits(const TEUIModelRef<FM_Equipment> &inout Equipment)
    {
        const FEquipmentConfig& local_2;
        FM_Trait& local_22;
        FDataObjectPtr local_108;
        TArray<TEUIModelRef<FM_Trait>>& local_4 = GetModify_EquipmentTraits();
        for (auto& local_20 : local_4)
        {
            local_20;
            local_22.SetbIsRandomTrait(true);
            for (auto& local_36 : local_2.DefaultTrait)
            {
                TDataObjectPtr<FTraitConfig> local_60;
                local_60 = local_36.GetTrait();
                local_108;
                if ((local_60 == local_108))
                {
                    local_22.SetbIsRandomTrait(false);
                    break;
                }
            }
        }
        return;
    }
    const TMap<uint64, TEUIModelRef<FM_Equipment>> GetCachedEquipments() const property
    {
        const TMap<uint64, TEUIModelRef<FM_Equipment>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint64, TEUIModelRef<FM_Equipment>> GetModify_CachedEquipments() property
    {
        TMap<uint64, TEUIModelRef<FM_Equipment>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCachedEquipments(const TMap<uint64, TEUIModelRef<FM_Equipment>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CachedEquipments = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Equipment>, uint64> GetEquipmentToItemUid() const property
    {
        const TMap<TEUIModelRef<FM_Equipment>, uint64> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<TEUIModelRef<FM_Equipment>, uint64> GetModify_EquipmentToItemUid() property
    {
        TMap<TEUIModelRef<FM_Equipment>, uint64> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEquipmentToItemUid(const TMap<TEUIModelRef<FM_Equipment>, uint64> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EquipmentToItemUid = __Value;
        return;
    }
    bool GetbInventoryInited() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bInventoryInited;
    }
    void SetbInventoryInited(const bool __Value) property
    {
        if (!(this.m_bInventoryInited) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bInventoryInited = __Value;
        return;
    }
    bool GetbWeaponRedDotBaselineInited() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bWeaponRedDotBaselineInited;
    }
    void SetbWeaponRedDotBaselineInited(const bool __Value) property
    {
        if (!(this.m_bWeaponRedDotBaselineInited) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bWeaponRedDotBaselineInited = __Value;
        return;
    }
}

struct FMS_Talisman : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    uint m_UnlockSlotCount;
    UPROPERTY()
    bool bSlotCountInitialized;

    FMS_Talisman()
    {
        this.m_UnlockSlotCount = 0;
        this.bSlotCountInitialized = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Talisman(const FMS_Talisman &inout Other)
    {
        this.m_UnlockSlotCount = 0;
        this.bSlotCountInitialized = false;
        this.m_UnlockSlotCount = int(Other.m_UnlockSlotCount);
        return;
    }
    FMS_Talisman opAssign(const FMS_Talisman &inout Other)
    {
        FMS_Talisman __r;
        this.m_UnlockSlotCount = int(Other.m_UnlockSlotCount);
        return __r;
    }
    void GS_OnPlayerAvatarDataNotify(const FPbPlayerAvatarDataNotify &inout Notify)
    {
        int local_2 = Notify.GetTalismanSlotCount();
        if (this.bSlotCountInitialized)
        {
            this.GenerateNewTalismanSlotRedDots(this.GetUnlockSlotCount(), local_2);
        }
        this.SetUnlockSlotCount(local_2);
        this.bSlotCountInitialized = true;
        FEUIModelRef local_10 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_10);
        return;
    }
    void GS_OnTalismanSlotUnlockNotify(const FPbUnlockTalismanSlotNotify &inout Notify)
    {
        int local_7;
        XLog(ELog(60), FString().Append("[M_Talisman]GS_OnTalismanSlotUnlockNotify. UnlockSlotCount:[").Append(Notify.GetSlotCount()).Append("]."));
        local_7 = Notify.GetSlotCount();
        this.GenerateNewTalismanSlotRedDots(this.GetUnlockSlotCount(), local_7);
        this.SetUnlockSlotCount(local_7);
        FEUIModelRef local_14 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_14);
        return;
    }
    void GenerateNewTalismanSlotRedDots(const uint OldSlotCount, const uint NewSlotCount)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void GS_RequestManageTalisman(const uint AvatarId, const uint64 TalismanGuid, const uint SlotId) const
    {
        XLog(ELog(60), FString().Append("[M_Talisman]GS_RequestManageTalisman. AvatarId:[").Append(AvatarId).Append("], TalismanGuid:[").Append(TalismanGuid).Append("], SlotId:[").Append(SlotId).Append("]."));
        if (::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(9), true))
        {
            FPbManageTalismanReq local_12;
            FPbManageTalismanInfo local_32 = local_12.GetCurAvatarInfo();
            local_32.SetAvatarId(AvatarId);
            local_32.SetTalismanGuid(TalismanGuid);
            local_32.SetSlot(SlotId);
            this.SendProto(local_12.ToWrapper());
        }
        return;
    }
    void GS_OnManageTalismanRsp(const FPbManageTalismanRsp &inout ManageTalismanRsp)
    {
        XLog(ELog(60), FString().Append("[M_Talisman]GS_OnManageTalismanRsp. Retcode:[").Append(ManageTalismanRsp.GetRetcode()).Append("]"));
        if (ManageTalismanRsp.GetRetcode() == 0)
        {
        }
        return;
    }
    uint GetUnlockSlotCount() const property
    {
        this.TrackPropertyRead(0);
        return this.m_UnlockSlotCount;
    }
    void SetUnlockSlotCount(const uint __Value) property
    {
        if (this.m_UnlockSlotCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_UnlockSlotCount = __Value;
        return;
    }
}

struct FMsg_TalismanSlotUnlockCountChange : FEUIMessage
{
    FMsg_TalismanSlotUnlockCountChange()
    {
        return;
    }
}

struct __Lambda_UI_Private_Model_Equipment_M_Equipment_585
{
    __Lambda_UI_Private_Model_Equipment_M_Equipment_585()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_Trait> &inout A, const TEUIModelRef<FM_Trait> &inout B)
    {
        return GetbIsRandomTrait()) == !(GetbIsRandomTrait() && GetbIsRandomTrait();
    }
}

namespace FM_Equipment
{
FM_Equipment& Create(const UObject ContextObject)
{
    return FM_Equipment::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_Equipment CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_Equipment __r;
    TEUIModelRef<FM_Equipment> local_6 = TEUIModelRef<FM_Equipment>(EUIInternal::MakeModelWithManager(Manager, FM_Equipment::ModelId));
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
    return FM_Equipment;
}
int __IndexOf_EquipmentConfig()
{
    return 0;
}
int __IndexOf_EquipmentTraits()
{
    return 1;
}
int __IndexOf_EquiptingAvatar()
{
    return 2;
}
}
namespace FMS_EquipmentDataCache
{
FMS_EquipmentDataCache& Get(const UObject ContextObject)
{
    return FMS_EquipmentDataCache::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_EquipmentDataCache GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_EquipmentDataCache __r;
    TEUIModelRef<FMS_EquipmentDataCache> local_6 = TEUIModelRef<FMS_EquipmentDataCache>(EUIInternal::MakeModelWithManager(Manager, FMS_EquipmentDataCache::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerInventoryInit";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnInventoryItemUpdate";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnInventoryItemRemoved";
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelMonitorDefine local_22;
    local_22.FunctionName = "__OnAvatarEquipmentChanged";
    local_22.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_EquipmentDataCache;
}
void __GS_OnPlayerInventoryInit(FMS_EquipmentDataCache &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerInventoryInit(FPbPlayerInventoryNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnInventoryItemUpdate(FMS_EquipmentDataCache &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnInventoryItemUpdate(FPbInventoryItemNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnInventoryItemRemoved(FMS_EquipmentDataCache &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnInventoryItemRemoved(FPbInventoryDelItemNotify::FromWrapper(ProtoWrapper));
    return;
}
void __OnAvatarEquipmentChanged(FMS_EquipmentDataCache &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnAvatarEquipmentChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_CachedEquipments()
{
    return 0;
}
int __IndexOf_EquipmentToItemUid()
{
    return 1;
}
int __IndexOf_bInventoryInited()
{
    return 2;
}
int __IndexOf_bWeaponRedDotBaselineInited()
{
    return 3;
}
}
namespace FMS_Talisman
{
FMS_Talisman& Get(const UObject ContextObject)
{
    return FMS_Talisman::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Talisman GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Talisman __r;
    TEUIModelRef<FMS_Talisman> local_6 = TEUIModelRef<FMS_Talisman>(EUIInternal::MakeModelWithManager(Manager, FMS_Talisman::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerAvatarDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTalismanSlotUnlockNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnManageTalismanRsp";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Talisman;
}
void __GS_OnPlayerAvatarDataNotify(FMS_Talisman &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerAvatarDataNotify(FPbPlayerAvatarDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTalismanSlotUnlockNotify(FMS_Talisman &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTalismanSlotUnlockNotify(FPbUnlockTalismanSlotNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnManageTalismanRsp(FMS_Talisman &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnManageTalismanRsp(FPbManageTalismanRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_UnlockSlotCount()
{
    return 0;
}
}
