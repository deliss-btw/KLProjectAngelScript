
namespace ItemFeature_Mask_Util
{
    const int COMMON_ITEM_MASK_TYPE_NORMAL = 0;
    const int COMMON_ITEM_MASK_TYPE_LOCKED = 1;
    const int COMMON_ITEM_MASK_TYPE_UNLOCKED = 2;
    const int COMMON_ITEM_MASK_TYPE_CHECKED = 3;
    const int COMMON_ITEM_MASK_TYPE_HIDDEN = 4;
}
namespace FVM_ItemFeature_Mask
{
    const int ModelId = 0;

}
struct FVM_ItemFeature_Mask : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    bool m_bEnableMask;
    UPROPERTY()
    int m_ItemMaskType;

    FVM_ItemFeature_Mask()
    {
        this.m_bEnableMask = false;
        this.m_ItemMaskType = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_Mask' by default constructor.");
        return;
    }
    FVM_ItemFeature_Mask(const FVM_ItemFeature_Mask &inout Other)
    {
        this.m_bEnableMask = false;
        this.m_ItemMaskType = 0;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_bEnableMask = Other.m_bEnableMask;
        this.m_ItemMaskType = int(Other.m_ItemMaskType);
        return;
    }
    FVM_ItemFeature_Mask(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        this.m_bEnableMask = false;
        this.m_ItemMaskType = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_Mask opAssign(const FVM_ItemFeature_Mask &inout Other)
    {
        FVM_ItemFeature_Mask __r;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_bEnableMask = Other.m_bEnableMask;
        this.m_ItemMaskType = int(Other.m_ItemMaskType);
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItemVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommonItemVM;
    }
    void SetCommonItemVM(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CommonItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommonItemVM = __Value;
        return;
    }
    bool GetbEnableMask() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bEnableMask;
    }
    void SetbEnableMask(const bool __Value) property
    {
        if (!(this.m_bEnableMask) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bEnableMask = __Value;
        return;
    }
    int GetItemMaskType() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemMaskType;
    }
    void SetItemMaskType(const int __Value) property
    {
        if (this.m_ItemMaskType == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemMaskType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_Mask
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_Mask> Self;

    __GeneratedProperties_FVM_ItemFeature_Mask()
    {
        return;
    }
}

namespace ItemFeature_Mask_Util
{
void SetEnableMask(const FEUIModelContainer &inout ItemModelContainer, const bool bEnableMask)
{
    FVM_ItemFeature_Mask& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetbEnableMask(bEnableMask);
    }
    return;
}
int GetItemMaskType(const FEUIModelContainer &inout ItemModelContainer)
{
    FVM_ItemFeature_Mask& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        return local_2.GetItemMaskType();
    }
    return 0;
}
void SetItemMaskType(const FEUIModelContainer &inout ItemModelContainer, const int ItemMaskType)
{
    FVM_ItemFeature_Mask& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetItemMaskType(ItemMaskType);
    }
    return;
}
}
namespace FVM_ItemFeature_Mask
{
FVM_ItemFeature_Mask& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_Mask::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_Mask CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_Mask __r;
    TEUIModelRef<FVM_ItemFeature_Mask> local_6 = TEUIModelRef<FVM_ItemFeature_Mask>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_Mask::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bEnableMask";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemMaskType";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_Mask>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_Mask;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_Mask;
}
bool __UIGetter_bEnableMask(const FVM_ItemFeature_Mask &inout Model)
{
    return Model.GetbEnableMask();
}
int __UIGetter_ItemMaskType(const FVM_ItemFeature_Mask &inout Model)
{
    return Model.GetItemMaskType();
}
TEUIModelRef<FVM_ItemFeature_Mask> __UIGetter_Self(const FVM_ItemFeature_Mask &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_Mask>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
int __IndexOf_bEnableMask()
{
    return 1;
}
int __IndexOf_ItemMaskType()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_Mask
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
