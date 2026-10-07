
namespace FVM_FastEquipPage
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SwitchShowCompare = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConfirmEquip = FEUIModelCallbackSignature();
}
namespace FVM_FastEquipPageItem
{
    const int ModelId = 0;

}
struct FVM_FastEquipPage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_Equipment;
    UPROPERTY()
    FEUIModelRef m_EquipmentSelectDetail;
    UPROPERTY()
    TArray<FEUIModelRef> m_AvatarList;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_SelectedAvatarConfig;

    FVM_FastEquipPage()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_FastEquipPage' by default constructor.");
        return;
    }
    FVM_FastEquipPage(const FVM_FastEquipPage &inout Other)
    {
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentSelectDetail = Other.m_EquipmentSelectDetail;
        this.m_AvatarList = Other.m_AvatarList;
        this.m_SelectedAvatarConfig = Other.m_SelectedAvatarConfig;
        return;
    }
    FVM_FastEquipPage(const TEUIModelRef<FM_Equipment> &inout InEquipment)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipment(InEquipment);
        return;
    }
    FVM_FastEquipPage& opAssign(const FVM_FastEquipPage &inout Other)
    {
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentSelectDetail = Other.m_EquipmentSelectDetail;
        this.m_AvatarList = Other.m_AvatarList;
        return Other.m_SelectedAvatarConfig;
    }
    void PostConstruct()
    {
        this.UpdateEquipmentSelectDetail();
        for (auto& local_22 : ::GameModeSettings::GetGameModeSettings(this.GetContext().Manager.GetWorld()).ChangeRoleDataObjects)
        {
            TEUIModelRef<FM_Equipment> local_24 = this.GetEquipment();
            if (::FEquipmentUtils::AvatarCanEquip(local_22, GetEquipmentConfig()))
            {
                FEUIModelRef local_26;
                this.GetModify_AvatarList().Add(local_26);
            }
        }
        return;
    }
    void SwitchShowCompare()
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbShowCompare(!(local_6.GetbShowCompare()));
        }
        return;
    }
    bool IsComparing() const
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.ShouldDisplayCompare();
        }
        return false;
    }
    FText GetCompareButtonText() const
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.GetCompareButtonText();
        }
        return FText();
    }
    void OnSelectedAvatarConfigChange()
    {
        ::FMS_EditingAvatar::Get(this.GetContext().Manager).SetAvatarConfig(this.GetSelectedAvatarConfig());
        this.UpdateEquipmentSelectDetail();
        this.CancelCompare();
        return;
    }
    void OnPlayerEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.UpdateEquipmentSelectDetail();
        return;
    }
    bool CanEquip() const
    {
        bool local_3;
        if (!(this.GetEquipment()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = this.GetSelectedAvatarConfig();
        }
        local_3 = local_3 && !((this.GetEquipment() == this.GetCurrentEquipment().opImplConv()));
        return local_3;
    }
    TEUIModelRef<FM_Equipment> GetCurrentEquipment() const
    {
        return ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), EEquipSlotType(1), this.GetSelectedAvatarConfig()));
    }
    void ConfirmEquip()
    {
        ::FEquipmentUtils::GS_RequestChangeEquipment(this.GetContext().GetLocalPlayer(), this.GetSelectedAvatarConfig(), ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetItemUid(this.GetEquipment()));
        return;
    }
    void UpdateEquipmentSelectDetail()
    {
        TEUIModelRef<FM_Equipment> local_2 = this.GetEquipment();
        this.SetEquipmentSelectDetail(FEUIModelRef());
        return;
    }
    void CancelCompare()
    {
        Get local_4;
        FVM_EquipmentSelectDetail& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbShowCompare(false);
        }
        return;
    }
    TEUIModelRef<FM_Equipment> GetEquipment() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Equipment;
    }
    void SetEquipment(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_Equipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Equipment = __Value;
        return;
    }
    const FEUIModelRef GetEquipmentSelectDetail() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_EquipmentSelectDetail() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEquipmentSelectDetail(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EquipmentSelectDetail = __Value;
        return;
    }
    TArray<FEUIModelRef> GetAvatarList() const property
    {
        TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_AvatarList() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAvatarList(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AvatarList = __Value;
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetSelectedAvatarConfig() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_SelectedAvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSelectedAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedAvatarConfig = __Value;
        return;
    }
}

struct FVM_FastEquipPageItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;

    FVM_FastEquipPageItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_FastEquipPageItem' by default constructor.");
        return;
    }
    FVM_FastEquipPageItem(const FVM_FastEquipPageItem &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        return;
    }
    FVM_FastEquipPageItem(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        return;
    }
    FVM_FastEquipPageItem& opAssign(const FVM_FastEquipPageItem &inout Other)
    {
        return Other.m_AvatarConfig;
    }
    FSoftBrush GetAvatarIcon() const
    {
        return this.GetAvatarConfig().opArrow().AvatarIcon;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_FastEquipPage
{
    UPROPERTY()
    bool IsComparing;
    UPROPERTY()
    FText CompareButtonText;
    UPROPERTY()
    bool CanEquip;
    UPROPERTY()
    TEUIModelRef<FVM_FastEquipPage> Self;


}

struct __GeneratedProperties_FVM_FastEquipPageItem
{
    UPROPERTY()
    FSoftBrush AvatarIcon;
    UPROPERTY()
    TEUIModelRef<FVM_FastEquipPageItem> Self;

    __GeneratedProperties_FVM_FastEquipPageItem()
    {
        return;
    }
}

namespace FVM_FastEquipPage
{
FVM_FastEquipPage& Create(const UObject ContextObject, const TEUIModelRef<FM_Equipment> &inout Equipment)
{
    return FVM_FastEquipPage::CreateByManager(EUIInternal::GetContextManager(ContextObject), Equipment);
}
FVM_FastEquipPage CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Equipment> &inout Equipment)
{
    FVM_FastEquipPage __r;
    TEUIModelRef<FVM_FastEquipPage> local_6 = TEUIModelRef<FVM_FastEquipPage>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_FastEquipPage::ModelId, 0, Equipment));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EquipmentSelectDetail";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarList";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsComparing";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareButtonText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanEquip";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_FastEquipPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_FastEquipPage;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnSelectedAvatarConfigChange";
    local_24.DirtyFlags.Set(FVM_FastEquipPage::__IndexOf_SelectedAvatarConfig());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMonitorDefine local_34;
    local_34.FunctionName = "__OnPlayerEquipmentChanged";
    local_34.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_FastEquipPage;
}
void __OnSelectedAvatarConfigChange(FVM_FastEquipPage &inout Model)
{
    Model.OnSelectedAvatarConfigChange();
    return;
}
void __OnPlayerEquipmentChanged(FVM_FastEquipPage &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnPlayerEquipmentChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FEUIModelRef __UIGetter_EquipmentSelectDetail(const FVM_FastEquipPage &inout Model)
{
    return Model.GetEquipmentSelectDetail();
}
TArray<FEUIModelRef> __UIGetter_AvatarList(const FVM_FastEquipPage &inout Model)
{
    return Model.GetAvatarList();
}
bool __UIGetter_IsComparing(const FVM_FastEquipPage &inout Model)
{
    return Model.IsComparing();
}
FText __UIGetter_CompareButtonText(const FVM_FastEquipPage &inout Model)
{
    return Model.GetCompareButtonText();
}
bool __UIGetter_CanEquip(const FVM_FastEquipPage &inout Model)
{
    return Model.CanEquip();
}
TEUIModelRef<FVM_FastEquipPage> __UIGetter_Self(const FVM_FastEquipPage &inout Model)
{
    return TEUIModelRef<FVM_FastEquipPage>(Model);
}
int __IndexOf_Equipment()
{
    return 0;
}
int __IndexOf_EquipmentSelectDetail()
{
    return 1;
}
int __IndexOf_AvatarList()
{
    return 2;
}
int __IndexOf_SelectedAvatarConfig()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_FastEquipPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_FastEquipPageItem
{
FVM_FastEquipPageItem& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_FastEquipPageItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FVM_FastEquipPageItem CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FVM_FastEquipPageItem __r;
    TEUIModelRef<FVM_FastEquipPageItem> local_6 = TEUIModelRef<FVM_FastEquipPageItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_FastEquipPageItem::ModelId, 0, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_FastEquipPageItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_FastEquipPageItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_FastEquipPageItem;
}
FSoftBrush __UIGetter_AvatarIcon(const FVM_FastEquipPageItem &inout Model)
{
    return Model.GetAvatarIcon();
}
TEUIModelRef<FVM_FastEquipPageItem> __UIGetter_Self(const FVM_FastEquipPageItem &inout Model)
{
    return TEUIModelRef<FVM_FastEquipPageItem>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_FastEquipPageItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
