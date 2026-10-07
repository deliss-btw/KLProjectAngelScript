
namespace FVM_EquipmentSelectDetail
{
    const int ModelId = 0;

}
struct FVM_EquipmentSelectDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_SelectedEquipment;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_SelectedEquipmentInfo;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_CurrentEquipmentInfo;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentCompare> m_EquipmentCompare;
    UPROPERTY()
    bool m_bShowCompare;

    FVM_EquipmentSelectDetail()
    {
        this.m_bShowCompare = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_EquipmentSelectDetail' by default constructor.");
        return;
    }
    FVM_EquipmentSelectDetail(const FVM_EquipmentSelectDetail &inout Other)
    {
        this.m_bShowCompare = false;
        this.m_SelectedEquipment = Other.m_SelectedEquipment;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_SelectedEquipmentInfo = Other.m_SelectedEquipmentInfo;
        this.m_CurrentEquipmentInfo = Other.m_CurrentEquipmentInfo;
        this.m_EquipmentCompare = Other.m_EquipmentCompare;
        this.m_bShowCompare = Other.m_bShowCompare;
        return;
    }
    FVM_EquipmentSelectDetail(const TEUIModelRef<FM_Equipment> &inout InSelectedEquipment, const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        this.m_bShowCompare = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSelectedEquipment(InSelectedEquipment);
        this.SetAvatarConfig(InAvatarConfig);
        return;
    }
    FVM_EquipmentSelectDetail opAssign(const FVM_EquipmentSelectDetail &inout Other)
    {
        FVM_EquipmentSelectDetail __r;
        this.m_SelectedEquipment = Other.m_SelectedEquipment;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_SelectedEquipmentInfo = Other.m_SelectedEquipmentInfo;
        this.m_CurrentEquipmentInfo = Other.m_CurrentEquipmentInfo;
        this.m_EquipmentCompare = Other.m_EquipmentCompare;
        this.m_bShowCompare = Other.m_bShowCompare;
        return __r;
    }
    void PostConstruct()
    {
        TEUIModelRef<FVM_EquipmentInfo> local_6;
        if (this.GetSelectedEquipment().IsValid())
        {
            local_6 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, this.GetSelectedEquipment()));
            this.SetSelectedEquipmentInfo(local_6);
            return;
        }
        this.SetSelectedEquipmentInfo(local_6);
        return;
    }
    bool ShouldDisplayCompare() const
    {
        return this.GetbShowCompare();
    }
    FSoftBrush GetEquiptingAvatarIcon() const
    {
        if (this.GetAvatarConfig())
        {
            return this.GetAvatarConfig().opArrow().AvatarIcon;
        }
        return FSoftBrush();
    }
    FText GetCompareButtonText() const
    {
        if (this.GetbShowCompare())
        {
            return NSLOCTEXT("HideCompare", "еЏ–ж¶€еЇ№жЇ”");
        }
        return NSLOCTEXT("ShowCompare", "еЇ№жЇ”ж­¦е™Ё");
    }
    void OnShouldUpdateEquipmentSelectList()
    {
        this.OnCurrentEquipmentChange();
        return;
    }
    void OnAvatarEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.OnCurrentEquipmentChange();
        return;
    }
    void OnCurrentEquipmentChange()
    {
        TEUIModelRef<FVM_EquipmentInfo> local_18;
        int64 local_10 = ::FEquipmentUtils::GetAvatarEquipmentUid(this.GetContext().GetLocalPlayer(), EEquipSlotType(1), this.GetAvatarConfig());
        if (local_10 != 0)
        {
            TEUIModelRef<FM_Equipment> local_14 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_10);
            local_18 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_14));
            this.SetCurrentEquipmentInfo(local_18);
            this.SetEquipmentCompare(TEUIModelRef<FVM_EquipmentCompare>(::FVM_EquipmentCompare::Create(this.GetContext().Manager, this.GetSelectedEquipment(), local_14)));
            return;
        }
        this.SetCurrentEquipmentInfo(local_18);
        return;
    }
    TEUIModelRef<FM_Equipment> GetSelectedEquipment() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectedEquipment;
    }
    void SetSelectedEquipment(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_SelectedEquipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectedEquipment = __Value;
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
    TEUIModelRef<FVM_EquipmentInfo> GetSelectedEquipmentInfo() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectedEquipmentInfo;
    }
    void SetSelectedEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_SelectedEquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedEquipmentInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetCurrentEquipmentInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentEquipmentInfo;
    }
    void SetCurrentEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_CurrentEquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentEquipmentInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentCompare> GetEquipmentCompare() const property
    {
        this.TrackPropertyRead(4);
        return this.m_EquipmentCompare;
    }
    void SetEquipmentCompare(const TEUIModelRef<FVM_EquipmentCompare> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentCompare> local_2;
        local_2 = this.m_EquipmentCompare;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EquipmentCompare = __Value;
        return;
    }
    bool GetbShowCompare() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bShowCompare;
    }
    void SetbShowCompare(const bool __Value) property
    {
        if (!(this.m_bShowCompare) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bShowCompare = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EquipmentSelectDetail
{
    UPROPERTY()
    bool ShouldDisplayCompare;
    UPROPERTY()
    FSoftBrush EquiptingAvatarIcon;
    UPROPERTY()
    FText CompareButtonText;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentSelectDetail> Self;


}

namespace FVM_EquipmentSelectDetail
{
FVM_EquipmentSelectDetail& Create(const UObject ContextObject, const TEUIModelRef<FM_Equipment> &inout SelectedEquipment, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_EquipmentSelectDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject), SelectedEquipment, AvatarConfig);
}
FVM_EquipmentSelectDetail CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Equipment> &inout SelectedEquipment, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FVM_EquipmentSelectDetail __r;
    TEUIModelRef<FVM_EquipmentSelectDetail> local_6 = TEUIModelRef<FVM_EquipmentSelectDetail>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EquipmentSelectDetail::ModelId, 0, SelectedEquipment, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectedEquipmentInfo";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentEquipmentInfo";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentCompare";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentCompare>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldDisplayCompare";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquiptingAvatarIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareButtonText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentSelectDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EquipmentSelectDetail;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnShouldUpdateEquipmentSelectList";
    local_24.DirtyFlags.Set(FVM_EquipmentSelectDetail::__IndexOf_AvatarConfig());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMonitorDefine local_34;
    local_34.FunctionName = "__OnAvatarEquipmentChanged";
    local_34.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EquipmentSelectDetail;
}
void __OnShouldUpdateEquipmentSelectList(FVM_EquipmentSelectDetail &inout Model)
{
    Model.OnShouldUpdateEquipmentSelectList();
    return;
}
void __OnAvatarEquipmentChanged(FVM_EquipmentSelectDetail &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnAvatarEquipmentChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_EquipmentInfo> __UIGetter_SelectedEquipmentInfo(const FVM_EquipmentSelectDetail &inout Model)
{
    return Model.GetSelectedEquipmentInfo();
}
TEUIModelRef<FVM_EquipmentInfo> __UIGetter_CurrentEquipmentInfo(const FVM_EquipmentSelectDetail &inout Model)
{
    return Model.GetCurrentEquipmentInfo();
}
TEUIModelRef<FVM_EquipmentCompare> __UIGetter_EquipmentCompare(const FVM_EquipmentSelectDetail &inout Model)
{
    return Model.GetEquipmentCompare();
}
bool __UIGetter_ShouldDisplayCompare(const FVM_EquipmentSelectDetail &inout Model)
{
    return Model.ShouldDisplayCompare();
}
FSoftBrush __UIGetter_EquiptingAvatarIcon(const FVM_EquipmentSelectDetail &inout Model)
{
    return Model.GetEquiptingAvatarIcon();
}
FText __UIGetter_CompareButtonText(const FVM_EquipmentSelectDetail &inout Model)
{
    return Model.GetCompareButtonText();
}
TEUIModelRef<FVM_EquipmentSelectDetail> __UIGetter_Self(const FVM_EquipmentSelectDetail &inout Model)
{
    return TEUIModelRef<FVM_EquipmentSelectDetail>(Model);
}
int __IndexOf_SelectedEquipment()
{
    return 0;
}
int __IndexOf_AvatarConfig()
{
    return 1;
}
int __IndexOf_SelectedEquipmentInfo()
{
    return 2;
}
int __IndexOf_CurrentEquipmentInfo()
{
    return 3;
}
int __IndexOf_EquipmentCompare()
{
    return 4;
}
int __IndexOf_bShowCompare()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_EquipmentSelectDetail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
