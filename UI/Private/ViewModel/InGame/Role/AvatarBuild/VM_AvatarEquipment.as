namespace FVM_EquipmentSlotInfo
{
    const int ModelId = 0;
}
namespace FVM_AvatarEquipment
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GotoChangeEquipment = FEUIModelCallbackSignature();

}
struct FVM_EquipmentSlotInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EEquipSlotType m_EquipSlot;
    UPROPERTY()
    bool m_bIsLocked;
    UPROPERTY()
    bool m_bIsEmpty;
    UPROPERTY()
    bool m_bIsAvatarUnLocked;

    FVM_EquipmentSlotInfo()
    {
        this.m_EquipSlot = EEquipSlotType(0);
        this.m_bIsLocked = false;
        this.m_bIsEmpty = false;
        this.m_bIsAvatarUnLocked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_EquipmentSlotInfo' by default constructor.");
        return;
    }
    FVM_EquipmentSlotInfo(const FVM_EquipmentSlotInfo &inout Other)
    {
        this.m_EquipSlot = EEquipSlotType(0);
        this.m_bIsLocked = false;
        this.m_bIsEmpty = false;
        this.m_bIsAvatarUnLocked = false;
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_bIsLocked = Other.m_bIsLocked;
        this.m_bIsEmpty = Other.m_bIsEmpty;
        this.m_bIsAvatarUnLocked = Other.m_bIsAvatarUnLocked;
        return;
    }
    FVM_EquipmentSlotInfo(const EEquipSlotType InEquipSlot, const bool InbIsLocked, const bool InbIsEmpty, const bool InbIsAvatarUnLocked)
    {
        this.m_EquipSlot = EEquipSlotType(0);
        this.m_bIsLocked = false;
        this.m_bIsEmpty = false;
        this.m_bIsAvatarUnLocked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipSlot(EEquipSlotType(InEquipSlot));
        this.SetbIsLocked(InbIsLocked);
        this.SetbIsEmpty(InbIsEmpty);
        this.SetbIsAvatarUnLocked(InbIsAvatarUnLocked);
        return;
    }
    FVM_EquipmentSlotInfo opAssign(const FVM_EquipmentSlotInfo &inout Other)
    {
        FVM_EquipmentSlotInfo __r;
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_bIsLocked = Other.m_bIsLocked;
        this.m_bIsEmpty = Other.m_bIsEmpty;
        this.m_bIsAvatarUnLocked = Other.m_bIsAvatarUnLocked;
        return __r;
    }
    EEquipSlotType GetEquipSlot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipSlot;
    }
    void SetEquipSlot(const EEquipSlotType __Value) property
    {
        if (int(this.m_EquipSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipSlot = __Value;
        return;
    }
    bool GetbIsLocked() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsLocked;
    }
    void SetbIsLocked(const bool __Value) property
    {
        if (!(this.m_bIsLocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsLocked = __Value;
        return;
    }
    bool GetbIsEmpty() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsEmpty;
    }
    void SetbIsEmpty(const bool __Value) property
    {
        if (!(this.m_bIsEmpty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsEmpty = __Value;
        return;
    }
    bool GetbIsAvatarUnLocked() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsAvatarUnLocked;
    }
    void SetbIsAvatarUnLocked(const bool __Value) property
    {
        if (!(this.m_bIsAvatarUnLocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsAvatarUnLocked = __Value;
        return;
    }
}

struct FVM_AvatarEquipment : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EEquipSlotType m_EquipSlot;
    UPROPERTY()
    TEUIModelRef<FM_Avatar> m_Avatar;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentSlotInfo> m_EquipmentSlotInfo;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_Equipment;
    UPROPERTY()
    TEUIModelRef<FMS_EquipmentDataCache> m_EquipmentCache;

    FVM_AvatarEquipment()
    {
        this.m_EquipSlot = EEquipSlotType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipment' by default constructor.");
        return;
    }
    FVM_AvatarEquipment(const FVM_AvatarEquipment &inout Other)
    {
        this.m_EquipSlot = EEquipSlotType(0);
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_Avatar = Other.m_Avatar;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_EquipmentSlotInfo = Other.m_EquipmentSlotInfo;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentCache = Other.m_EquipmentCache;
        return;
    }
    FVM_AvatarEquipment(const EEquipSlotType InEquipSlot, const TEUIModelRef<FM_Avatar> &inout InAvatar)
    {
        this.m_EquipSlot = EEquipSlotType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipSlot(EEquipSlotType(InEquipSlot));
        this.SetAvatar(InAvatar);
        return;
    }
    FVM_AvatarEquipment& opAssign(const FVM_AvatarEquipment &inout Other)
    {
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_Avatar = Other.m_Avatar;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_EquipmentSlotInfo = Other.m_EquipmentSlotInfo;
        this.m_Equipment = Other.m_Equipment;
        return Other.m_EquipmentCache;
    }
    void PostConstruct()
    {
        this.SetEquipmentCache(TEUIModelRef<FMS_EquipmentDataCache>(::FMS_EquipmentDataCache::Get(this.GetContext().Manager)));
        this.SyncAvatarConfigFromAvatar();
        return;
    }
    void OnAvatarEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.UpdateEquipment();
        return;
    }
    void HandleTalismanSlotUnlockCountChange(const FMsg_TalismanSlotUnlockCountChange &inout Msg)
    {
        this.UpdateTalisman();
        return;
    }
    void OnEditingAvatarChanged()
    {
        this.SyncAvatarConfigFromAvatar();
        this.UpdateEquipment();
        return;
    }
    void GotoChangeEquipment()
    {
        ::FVM_EquipmentEditPage::GotoPage(this.GetContext().UELocalPlayer, this.GetEquipSlot(), this.GetAvatarConfig());
        return;
    }
    void SyncAvatarConfigFromAvatar()
    {
        if (this.GetAvatar())
        {
            this.SetAvatarConfig(this.GetAvatar().opArrow().GetAvatarConfig());
            return;
        }
        this.SetAvatarConfig(TDataObjectPtr<FAvatarPrefabConfig>());
        return;
    }
    bool GetIsAvatarUnlocked() const
    {
        bool local_5;
        if (this.GetAvatar())
        {
            local_5 = this.GetAvatar().Get().GetbIsUnlocked();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    void UpdateEquipment()
    {
        this.SyncAvatarConfigFromAvatar();
        if ((int(this.GetEquipSlot())) == 0 || (int(this.GetEquipSlot()) == 6))
        {
            return;
        }
        if (int(this.GetEquipSlot()) == 1)
        {
            this.UpdateWeapon();
            return;
        }
        this.UpdateTalisman();
        return;
    }
    void UpdateWeapon()
    {
        if (int(this.GetEquipSlot()) != 1)
        {
            return;
        }
        int64 local_12 = ::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), this.GetEquipSlot(), this.GetAvatarConfig());
        if (local_12 != 0)
        {
            TEUIModelRef<FVM_EquipmentInfo> local_16 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_12)));
            this.SetEquipment(local_16);
        }
        else
        {
            TEUIModelRef<FVM_EquipmentInfo> local_16;
            this.SetEquipment(local_16);
            TDataObjectPtr<FEquipmentConfig> local_42 = TDataObjectPtr<FEquipmentConfig>(nullptr);
            if (!(int(this.GetEquipSlot()) != 1) && this.GetAvatarConfig())
            {
                local_42 = TDataObjectPtr<FEquipmentConfig>(this.GetAvatarConfig().Get().GetDefaultWeapon().Get());
            }
            if (local_42)
            {
                TEUIModelRef<FM_Equipment> local_14 = this.GetEquipmentCache().Get().CreateFromConfig(local_42);
                local_14.Get().SetEquiptingAvatar(this.GetAvatarConfig());
                local_16 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_14));
                this.SetEquipment(local_16);
            }
            else
            {
                this.SetEquipment(local_16);
            }
        }
        this.SetEquipmentSlotInfo(TEUIModelRef<FVM_EquipmentSlotInfo>(::FVM_EquipmentSlotInfo::Create(this.GetContext().Manager, EEquipSlotType(this.GetEquipSlot()), false, false, this.GetIsAvatarUnlocked())));
        return;
    }
    void UpdateTalisman()
    {
        int local_3;
        TEUIModelRef<FVM_EquipmentInfo> local_24;
        if (!(::FEquipmentUtils::IsTalismanSlot(this.GetEquipSlot())))
        {
            return;
        }
        local_3 = ::FMS_Talisman::Get(this.GetManager()).GetUnlockSlotCount();
        bool local_2 = ((int(this.GetEquipSlot()) - 2) >= local_3);
        bool local_12 = false;
        if (!(local_2))
        {
            int64 local_20 = ::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), this.GetEquipSlot(), this.GetAvatarConfig());
            if (local_20 != 0)
            {
                local_24 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_20)));
                this.SetEquipment(local_24);
            }
            else
            {
                local_12 = true;
                this.SetEquipment(local_24);
            }
        }
        this.SetEquipmentSlotInfo(TEUIModelRef<FVM_EquipmentSlotInfo>(::FVM_EquipmentSlotInfo::Create(this.GetContext().Manager, EEquipSlotType(this.GetEquipSlot()), local_2, local_12, this.GetIsAvatarUnlocked())));
        return;
    }
    EEquipSlotType GetEquipSlot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipSlot;
    }
    void SetEquipSlot(const EEquipSlotType __Value) property
    {
        if (int(this.m_EquipSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipSlot = __Value;
        return;
    }
    TEUIModelRef<FM_Avatar> GetAvatar() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Avatar;
    }
    void SetAvatar(const TEUIModelRef<FM_Avatar> &inout __Value) property
    {
        TEUIModelRef<FM_Avatar> local_2;
        local_2 = this.m_Avatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Avatar = __Value;
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AvatarConfig = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentSlotInfo> GetEquipmentSlotInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_EquipmentSlotInfo;
    }
    void SetEquipmentSlotInfo(const TEUIModelRef<FVM_EquipmentSlotInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentSlotInfo> local_2;
        local_2 = this.m_EquipmentSlotInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentSlotInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetEquipment() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Equipment;
    }
    void SetEquipment(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_Equipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Equipment = __Value;
        return;
    }
    TEUIModelRef<FMS_EquipmentDataCache> GetEquipmentCache() const property
    {
        this.TrackPropertyRead(5);
        return this.m_EquipmentCache;
    }
    void SetEquipmentCache(const TEUIModelRef<FMS_EquipmentDataCache> &inout __Value) property
    {
        TEUIModelRef<FMS_EquipmentDataCache> local_2;
        local_2 = this.m_EquipmentCache;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_EquipmentCache = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EquipmentSlotInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentSlotInfo> Self;

    __GeneratedProperties_FVM_EquipmentSlotInfo()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipment
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipment> Self;

    __GeneratedProperties_FVM_AvatarEquipment()
    {
        return;
    }
}

namespace FVM_EquipmentSlotInfo
{
FVM_EquipmentSlotInfo& Create(const UObject ContextObject, const EEquipSlotType EquipSlot, const bool bIsLocked, const bool bIsEmpty, const bool bIsAvatarUnLocked)
{
    return FVM_EquipmentSlotInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), EEquipSlotType(EquipSlot), bIsLocked, bIsEmpty, bIsAvatarUnLocked);
}
FVM_EquipmentSlotInfo& CreateByManager(const UEUIManagerSubsystem Manager, const EEquipSlotType EquipSlot, const bool bIsLocked, const bool bIsEmpty, const bool bIsAvatarUnLocked)
{
    return TEUIModelRef<FVM_EquipmentSlotInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EquipmentSlotInfo::ModelId, 0, EquipSlot, bIsLocked, bIsEmpty, bIsAvatarUnLocked)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentSlotInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EquipmentSlotInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EquipmentSlotInfo;
}
TEUIModelRef<FVM_EquipmentSlotInfo> __UIGetter_Self(const FVM_EquipmentSlotInfo &inout Model)
{
    return TEUIModelRef<FVM_EquipmentSlotInfo>(Model);
}
int __IndexOf_EquipSlot()
{
    return 0;
}
int __IndexOf_bIsLocked()
{
    return 1;
}
int __IndexOf_bIsEmpty()
{
    return 2;
}
int __IndexOf_bIsAvatarUnLocked()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_EquipmentSlotInfo
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_EquipmentSlotInfo.Get();
}
}
namespace FVM_AvatarEquipment
{
FVM_AvatarEquipment& Create(const UObject ContextObject, const EEquipSlotType EquipSlot, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    return FVM_AvatarEquipment::CreateByManager(EUIInternal::GetContextManager(ContextObject), EEquipSlotType(EquipSlot), Avatar);
}
FVM_AvatarEquipment& CreateByManager(const UEUIManagerSubsystem Manager, const EEquipSlotType EquipSlot, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    return TEUIModelRef<FVM_AvatarEquipment>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipment::ModelId, 0, EquipSlot, Avatar)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Equipment";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipment>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipment;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(6);
    local_22.AddRefPropertyDirty(0, 3, FMS_EquipmentDataCache::__IndexOf_CachedEquipments());
    local_22.AddRefPropertyDirty(1, 0, FM_Avatar::__IndexOf_AvatarConfig());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("EquipmentCache");
    int local_2_2 = FMS_EquipmentDataCache::ModelId;
    int local_2_3 = local_22.GetMappingDirtyOffset(3);
    local_30.RelatedDirtyMask.SetBit(FMS_EquipmentDataCache::__IndexOf_CachedEquipments(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    local_30.PropertyName = FName("Avatar");
    int local_23 = FM_Avatar::ModelId;
    int local_23_2 = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FM_Avatar::__IndexOf_AvatarConfig(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelMonitorDefine local_42;
    local_42.FunctionName = "__OnAvatarEquipmentChanged";
    local_42.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_42);
    FEUIModelMsgHandleDefine local_54;
    local_54.FunctionName = "__HandleTalismanSlotUnlockCountChange";
    local_54.MessageTypeName = "Msg_TalismanSlotUnlockCountChange";
    local_54.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_54);
    FEUIModelDirtyDefine local_66;
    local_66.FunctionName = "__OnEditingAvatarChanged";
    local_66.DirtyFlags.Set(FVM_AvatarEquipment::__IndexOf_EquipSlot());
    local_66.DirtyFlags.Set(FVM_AvatarEquipment::__IndexOf_EquipmentCache());
    local_66.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    local_66.DirtyFlags.Set(FVM_AvatarEquipment::__IndexOf_Avatar());
    local_66.DirtyFlags.Set(local_22.GetMappingDirtyIndex(1));
    local_66.DirtyFlags.Set(FVM_AvatarEquipment::__IndexOf_Avatar());
    Result.DirtyFunctions.Add(local_66);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipment;
}
void __OnAvatarEquipmentChanged(FVM_AvatarEquipment &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnAvatarEquipmentChanged(Component);
    return;
}
void __HandleTalismanSlotUnlockCountChange(FVM_AvatarEquipment &inout Model, const FMsg_TalismanSlotUnlockCountChange &inout Message)
{
    Model.HandleTalismanSlotUnlockCountChange(Message);
    return;
}
void __OnEditingAvatarChanged(FVM_AvatarEquipment &inout Model)
{
    Model.OnEditingAvatarChanged();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    __MonitorDSPlayerAvatarInfoLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorDSPlayerAvatarInfoModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
}
TEUIModelRef<FVM_EquipmentInfo> __UIGetter_Equipment(const FVM_AvatarEquipment &inout Model)
{
    return Model.GetEquipment();
}
TEUIModelRef<FVM_AvatarEquipment> __UIGetter_Self(const FVM_AvatarEquipment &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipment>(Model);
}
int __IndexOf_EquipSlot()
{
    return 0;
}
int __IndexOf_Avatar()
{
    return 1;
}
int __IndexOf_AvatarConfig()
{
    return 2;
}
int __IndexOf_EquipmentSlotInfo()
{
    return 3;
}
int __IndexOf_Equipment()
{
    return 4;
}
int __IndexOf_EquipmentCache()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipment
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_AvatarEquipment.Get();
}
}
