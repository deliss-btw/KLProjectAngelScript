
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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
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
            TEUIModelRef<FM_Avatar> local_2 = this.GetAvatar();
            local_5 = GetbIsUnlocked();
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
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void UpdateTalisman()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
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
    return FVM_EquipmentSlotInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), bIsLocked, bIsEmpty, bIsAvatarUnLocked);
}
FVM_EquipmentSlotInfo CreateByManager(const UEUIManagerSubsystem Manager, const EEquipSlotType EquipSlot, const bool bIsLocked, const bool bIsEmpty, const bool bIsAvatarUnLocked)
{
    FVM_EquipmentSlotInfo __r;
    TEUIModelRef<FVM_EquipmentSlotInfo> local_6 = TEUIModelRef<FVM_EquipmentSlotInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EquipmentSlotInfo::ModelId, 0, EquipSlot, bIsLocked, bIsEmpty, bIsAvatarUnLocked));
    return __r;
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
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarEquipment
{
FVM_AvatarEquipment Create(const UObject ContextObject, const EEquipSlotType EquipSlot, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVM_AvatarEquipment __r; return __r;
}
FVM_AvatarEquipment CreateByManager(const UEUIManagerSubsystem Manager, const EEquipSlotType EquipSlot, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    FVM_AvatarEquipment __r;
    TEUIModelRef<FVM_AvatarEquipment> local_6 = TEUIModelRef<FVM_AvatarEquipment>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipment::ModelId, 0, EquipSlot, Avatar));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
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
    // body not fully recovered вЂ” stub [argmismatch:argtype]
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
    UScriptStruct local_2;
    return local_2;
}
}
