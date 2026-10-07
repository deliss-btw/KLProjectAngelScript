
namespace FVM_EquipmentSelectListItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectEquipment = FEUIModelCallbackSignature();

}
struct FVM_EquipmentSelectListItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint64 m_EquipmentUid;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_Equipment;
    UPROPERTY()
    TEUIModelWeakRef<FVM_EquipmentEditPage> m_EquipmentEditPage;
    UPROPERTY()
    FEUIModelRef m_EquipmentInfo;

    FVM_EquipmentSelectListItem()
    {
        this.m_EquipmentUid = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_EquipmentSelectListItem' by default constructor.");
        return;
    }
    FVM_EquipmentSelectListItem(const FVM_EquipmentSelectListItem &inout Other)
    {
        this.m_EquipmentUid = 0;
        this.m_EquipmentUid = Other.m_EquipmentUid;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentEditPage = Other.m_EquipmentEditPage;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        return;
    }
    FVM_EquipmentSelectListItem(const uint64 InEquipmentUid)
    {
        this.m_EquipmentUid = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipmentUid(InEquipmentUid);
        return;
    }
    FVM_EquipmentSelectListItem& opAssign(const FVM_EquipmentSelectListItem &inout Other)
    {
        this.m_EquipmentUid = Other.m_EquipmentUid;
        this.m_Equipment = Other.m_Equipment;
        this.m_EquipmentEditPage = Other.m_EquipmentEditPage;
        return Other.m_EquipmentInfo;
    }
    void PostConstruct()
    {
        this.SetEquipment(::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(this.GetEquipmentUid()));
        TEUIModelRef<FM_Equipment> local_4 = this.GetEquipment();
        this.SetEquipmentInfo(FEUIModelRef());
        return;
    }
    void SelectEquipment()
    {
        Get local_4;
        TEUIModelWeakRef<FVM_EquipmentEditPage> local_6 = this.GetEquipmentEditPage();
        local_4.opCall().GetEquipment().SetEquipment();
        return;
    }
    uint64 GetEquipmentUid() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipmentUid;
    }
    void SetEquipmentUid(const uint64 __Value) property
    {
        if (this.m_EquipmentUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipmentUid = __Value;
        return;
    }
    TEUIModelRef<FM_Equipment> GetEquipment() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_Equipment = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_EquipmentEditPage> GetEquipmentEditPage() const property
    {
        this.TrackPropertyRead(2);
        return this.m_EquipmentEditPage;
    }
    void SetEquipmentEditPage(const TEUIModelWeakRef<FVM_EquipmentEditPage> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_EquipmentEditPage> local_2;
        local_2 = this.m_EquipmentEditPage;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EquipmentEditPage = __Value;
        return;
    }
    FEUIModelRef GetEquipmentInfo() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelRef GetModify_EquipmentInfo() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipmentInfo(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EquipmentSelectListItem
{
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentSelectListItem> Self;

    __GeneratedProperties_FVM_EquipmentSelectListItem()
    {
        return;
    }
}

namespace FVM_EquipmentSelectListItem
{
FVM_EquipmentSelectListItem& Create(const UObject ContextObject, const uint64 EquipmentUid)
{
    return FVM_EquipmentSelectListItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), EquipmentUid);
}
FVM_EquipmentSelectListItem CreateByManager(const UEUIManagerSubsystem Manager, const uint64 EquipmentUid)
{
    FVM_EquipmentSelectListItem __r;
    TEUIModelRef<FVM_EquipmentSelectListItem> local_6 = TEUIModelRef<FVM_EquipmentSelectListItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EquipmentSelectListItem::ModelId, 0, EquipmentUid));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EquipmentInfo";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EquipmentSelectListItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EquipmentSelectListItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EquipmentSelectListItem;
}
FEUIModelRef __UIGetter_EquipmentInfo(const FVM_EquipmentSelectListItem &inout Model)
{
    return Model.GetEquipmentInfo();
}
TEUIModelRef<FVM_EquipmentSelectListItem> __UIGetter_Self(const FVM_EquipmentSelectListItem &inout Model)
{
    return TEUIModelRef<FVM_EquipmentSelectListItem>(Model);
}
int __IndexOf_EquipmentUid()
{
    return 0;
}
int __IndexOf_Equipment()
{
    return 1;
}
int __IndexOf_EquipmentEditPage()
{
    return 2;
}
int __IndexOf_EquipmentInfo()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_EquipmentSelectListItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
