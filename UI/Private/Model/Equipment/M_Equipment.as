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
        if (ItemUid == 0)
        {
            return false;
        }
        TEUIModelRef<FM_Equipment> local_6;
        if (this.GetCachedEquipments().Find(ItemUid, local_6))
        {
            if (!(local_6.Get().GetEquiptingAvatar().IsSet()))
            {
                local_3 = 0;
            }
            else
            {
                bool local_7 = local_6.Get().GetEquiptingAvatar().Get().bAlwaysHidden;
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
            for (auto& local_18 : Config.Get().DefaultTrait)
            {
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
            for (auto& local_20 : Config.Get().DefaultTrait)
            {
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
        bool local_54;
        CastTo local_82;
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
            const TDataObjectPtr<FEquipmentConfig>& local_50 = local_48.GetValue().Get().GetEquipmentConfig();
            if (!(local_50.IsSet()) || (int(local_50.Get().ItemType) != 2))
            {
                continue;
            }
            TDataObjectPtr<FWeaponConfig> local_106 = local_82.opCall();
            if (local_106)
            {
                int local_108 = local_30.FindOrAdd(local_106.Get().WeaponType);
                int local_52 = local_50.Get().Level;
                local_108 = FMath::Max(int(local_108), local_52);
            }
        }
        TSet<uint> local_130;
        for (auto& local_144 : ::FVMS_PlayerOwnedAvatarInfo::Get(this.GetContext().Manager).GetUnLockAvatarList())
        {
            if (local_144.IsValid() && local_144.Get().GetAvatarConfig().IsSet())
            {
                local_130.Add(local_144.Get().GetAvatarConfig().Get().DataId);
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
                TDataObjectPtr<FWeaponConfig> local_78 = local_82.opCall();
                if (local_78)
                {
                    EWeaponType local_202;
                    local_202 = local_78.Get().WeaponType;
                    local_170 = AffectedWeaponTypes.Contains(local_202);
                    int local_204 = 0;
                    if (local_30.Find(local_202, local_204) && (local_200.GetEquipmentData().GetEquipmentConfig().Get().Level < local_204))
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
        int local_39;
        int local_46;
        FDSAvatarEquipmentInfo local_100;
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
        bool local_1 = false;
        if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(9), local_1)))
        {
            return;
        }
        int local_13 = 0;
        for (auto& local_32 : this.GetCachedEquipments())
        {
            const TDataObjectPtr<FEquipmentConfig>& local_34 = local_32.GetValue().Get().GetEquipmentConfig();
            if (local_34.IsSet() && (int(local_34.Get().ItemType) == 7) && !(local_32.GetValue().Get().GetEquiptingAvatar().IsSet()))
            {
                ++local_13;
            }
        }
        if (local_13 > 0)
        {
            return;
        }
        FMS_RedDotSystem& local_38 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        local_39 = ::FMS_Talisman::Get(this.GetContext().Manager).GetUnlockSlotCount();
        FECSEntity local_6_2 = this.GetContext().GetLocalPlayer();
        bool local_47 = false;
        for (auto& local_62 : local_46.GetAvatarList())
        {
            int64 local_64 = 2;
            for (; local_64 <= 5; ++local_64)
            {
                int64 local_70 = local_39;
                if ((local_64 - 2) >= local_70)
                {
                    continue;
                }
                if (!(!(local_62.GetEquipmentInfos().Find(EEquipSlotType(local_64), local_100)) || !(local_100.GetEquipmentData().GetEquipmentConfig().IsSet())))
                {
                    continue;
                }
                int local_40 = 32;
                local_70 = local_64 << local_40;
                local_70 = local_70 | local_62.GetAvatarId();
                if (local_38.HasRedDotByEvent(ERedPointEvent(11), local_70))
                {
                    local_38.ConsumeRedDotByEvent(ERedPointEvent(11), local_70);
                    local_38.ConsumeRedDotByEvent(ERedPointEvent(23), local_70);
                    local_47 = true;
                }
            }
        }
        if (local_47)
        {
            ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
        }
        return;
    }
    void GS_OnInventoryItemUpdate(const FPbInventoryItemNotify &inout Notify)
    {
        bool local_32;
        TArray<uint64> local_4;
        TArray<uint64> local_8;
        TSet<EWeaponType> local_28;
        int local_29 = 0;
        for (; local_29 < Notify.GetItemList_Num(); ++local_29)
        {
            FPbItem local_42 = Notify.GetItemList_Index(local_29);
            ::FItemConfig::GetByDataId(local_42.GetItemId());
            CastTo local_128;
            TDataObjectPtr<FEquipmentConfig> local_152 = local_128.opCall();
            if (local_152)
            {
                if (!(this.GetCachedEquipments().Contains(local_42.GetGuid())) && !(local_42.HasStackableItem()))
                {
                    if (int(local_152.Get().ItemType) == 2)
                    {
                        local_4.Add(local_42.GetGuid());
                    }
                    else
                    {
                        if (int(local_152.Get().ItemType) == 7)
                        {
                            local_8.Add(local_42.GetGuid());
                        }
                    }
                }
                this.CacheEquipmentData(local_152, local_42);
                if (int(local_152.Get().ItemType) == 2)
                {
                    CastTo local_186;
                    TDataObjectPtr<FWeaponConfig> local_210 = local_186.opCall();
                    if (local_210)
                    {
                        local_28.Add(local_210.Get().WeaponType);
                    }
                }
            }
        }
        if (!(local_4.IsEmpty()))
        {
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(13), local_4);
        }
        if (!(!(local_8.IsEmpty())))
        {
            local_32 = false;
        }
        else
        {
            local_32 = false;
            local_32 = ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(9), local_32);
        }
        if (local_32)
        {
            int local_264;
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(12), local_8);
            TArray<uint64> local_218;
            local_29 = ::FMS_Talisman::Get(this.GetContext().Manager).GetUnlockSlotCount();
            TSet<uint> local_238;
            for (auto& local_254 : ::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager()).GetUnLockAvatarList())
            {
                if (local_254.IsValid() && local_254.Get().GetAvatarConfig().IsSet())
                {
                    local_238.Add(local_254.Get().GetAvatarConfig().Get().DataId);
                }
            }
            FECSEntity local_258 = this.GetContext().GetLocalPlayer();
            for (auto& local_278 : local_264.GetAvatarList())
            {
                if (local_238.Contains(local_278.GetAvatarId()))
                {
                    int64 local_280 = 2;
                    for (; local_280 <= 5; ++local_280)
                    {
                        int64 local_284 = local_29;
                        if ((local_280 - 2) < local_284)
                        {
                            FDSAvatarEquipmentInfo local_314;
                            if (!(local_278.GetEquipmentInfos().Find(EEquipSlotType(local_280), local_314)) || !(local_314.GetEquipmentData().GetEquipmentConfig().IsSet()))
                            {
                                local_284 = local_280 << 32;
                                local_284 = local_284 | local_278.GetAvatarId();
                                if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).HasRedDotByEvent(ERedPointEvent(11), local_284)))
                                {
                                    local_218.Add(local_284);
                                }
                            }
                        }
                    }
                }
            }
            if (!(local_218.IsEmpty()))
            {
                ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(23), local_218);
            }
        }
        if (!(local_28.IsEmpty()))
        {
            this.RefreshWeaponCanChangeRedDot(true, true, local_28);
        }
        return;
    }
    void GS_OnInventoryItemRemoved(const FPbInventoryDelItemNotify &inout Notify)
    {
        int local_25;
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
            const TDataObjectPtr<FEquipmentConfig>& local_36 = local_34.Get().GetEquipmentConfig();
            if (local_36.IsSet())
            {
                if (int(local_36.Get().ItemType) == 2)
                {
                    CastTo local_68;
                    TDataObjectPtr<FWeaponConfig> local_92 = local_68.opCall();
                    if (local_92)
                    {
                        local_22.Add(local_92.Get().WeaponType);
                    }
                    if (local_2.HasRedDotByEvent(ERedPointEvent(13), local_32))
                    {
                        local_2.ConsumeRedDotByEvent(ERedPointEvent(13), local_32);
                    }
                }
                else
                {
                    if (int(local_36.Get().ItemType) == 7)
                    {
                        local_23 = true;
                        if (local_2.HasRedDotByEvent(ERedPointEvent(12), local_32))
                        {
                            local_2.ConsumeRedDotByEvent(ERedPointEvent(12), local_32);
                        }
                    }
                }
            }
            this.GetModify_EquipmentToItemUid().Remove(local_34);
            this.GetModify_CachedEquipments().Remove(local_32);
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
                    int local_79 = local_36.GetAvatarId();
                    GetDataObjectByGSDataId<FAvatarPrefabConfig> local_78;
                    this.GetEquipment(local_54.GetValue().GetGuid()).Get().SetEquiptingAvatar(local_78.opImplConv());
                    local_20.Add(local_54.GetValue().GetGuid());
                }
            }
        }
        for (auto& local_126 : this.GetCachedEquipments())
        {
            if (!(local_20.Contains(local_126.GetKey())))
            {
                local_126.GetValue().Get().SetEquiptingAvatar(TDataObjectPtr<FAvatarPrefabConfig>(nullptr));
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
        FDataObjectPtr local_108;
        const FEquipmentConfig& local_2 = Equipment.Get().GetEquipmentConfig().Get();
        TArray<TEUIModelRef<FM_Trait>>& local_4 = Equipment.Get().GetModify_EquipmentTraits();
        for (auto& local_20 : local_4)
        {
            FM_Trait& local_22 = local_20.Get();
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
        __Lambda_UI_Private_Model_Equipment_M_Equipment_585 local_110;
        local_4.Sort(local_110);
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
        TArray<uint64> local_4;
        if (NewSlotCount > OldSlotCount)
        {
            FVMS_PlayerOwnedAvatarInfo& local_10 = ::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager());
            for (auto& local_24 : local_10.GetUnLockAvatarList())
            {
                if (local_24.IsValid() && local_24.Get().GetAvatar().IsValid() && local_24.Get().GetAvatar().Get().GetAvatarConfig().IsSet())
                {
                    int64 local_30 = OldSlotCount;
                    for (; local_30 < NewSlotCount; ++local_30)
                    {
                        int64 local_34 = (local_30 + 2) << 32;
                        TEUIModelRef<FM_Avatar> local_26 = local_24.Get().GetAvatar();
                        local_34 = local_34 | local_26.Get().GetAvatarConfig().Get().DataId;
                        if (!(::FMS_RedDotSystem::Get(this.GetContext().Manager).HasRedDotByEvent(ERedPointEvent(11), local_34)))
                        {
                            local_4.Add(local_34);
                        }
                    }
                }
            }
        }
        if (!(local_4.IsEmpty()))
        {
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(11), local_4);
        }
        ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
        return;
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
        return A.Get().GetbIsRandomTrait()) == !(B.Get().GetbIsRandomTrait() && B.Get().GetbIsRandomTrait();
    }
}

namespace FM_Equipment
{
FM_Equipment& Create(const UObject ContextObject)
{
    return FM_Equipment::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_Equipment& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FM_Equipment>(EUIInternal::MakeModelWithManager(Manager, FM_Equipment::ModelId)).Get();
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
FMS_EquipmentDataCache& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_EquipmentDataCache>(EUIInternal::MakeModelWithManager(Manager, FMS_EquipmentDataCache::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerInventoryInit";
    local_10.ProtoCmdId = uint16(701);
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnInventoryItemUpdate";
    local_10.ProtoCmdId = uint16(702);
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnInventoryItemRemoved";
    local_10.ProtoCmdId = uint16(703);
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelMonitorDefine local_22;
    local_22.FunctionName = "__OnAvatarEquipmentChanged";
    local_22.MonitorTarget = EEUIModelMonitorTarget(3);
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
    __MonitorDSPlayerAvatarInfoLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorDSPlayerAvatarInfoModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
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
FMS_Talisman& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_Talisman>(EUIInternal::MakeModelWithManager(Manager, FMS_Talisman::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerAvatarDataNotify";
    local_10.ProtoCmdId = uint16(1101);
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnTalismanSlotUnlockNotify";
    local_10.ProtoCmdId = uint16(1115);
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnManageTalismanRsp";
    local_10.ProtoCmdId = uint16(1114);
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
