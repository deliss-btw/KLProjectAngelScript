
namespace FVM_InventoryMainRootCategory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature Select = FEUIModelCallbackSignature();
}
namespace FVM_InventoryMainCategory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature Select = FEUIModelCallbackSignature();

}
struct FVM_InventoryMainRootCategory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_Icon;
    UPROPERTY()
    TArray<FGameplayTag> m_Categories;
    UPROPERTY()
    TEUIModelWeakRef<FVM_InventoryMain> m_InventoryRef;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    bool m_bSelected;

    FVM_InventoryMainRootCategory()
    {
        this.m_Index = 0;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryMainRootCategory' by default constructor.");
        return;
    }
    FVM_InventoryMainRootCategory(const FVM_InventoryMainRootCategory &inout Other)
    {
        this.m_Index = 0;
        this.m_bSelected = false;
        this.m_Icon = Other.m_Icon;
        this.m_Categories = Other.m_Categories;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
        this.m_bSelected = Other.m_bSelected;
        return;
    }
    FVM_InventoryMainRootCategory(const FSoftBrush &inout InIcon, const TArray<FGameplayTag> &inout InCategories, const TEUIModelWeakRef<FVM_InventoryMain> &inout InInventoryRef, const int InIndex)
    {
        this.m_Index = 0;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIcon(InIcon);
        this.SetCategories(InCategories);
        this.SetInventoryRef(InInventoryRef);
        this.SetIndex(InIndex);
        return;
    }
    FVM_InventoryMainRootCategory opAssign(const FVM_InventoryMainRootCategory &inout Other)
    {
        FVM_InventoryMainRootCategory __r;
        this.m_Icon = Other.m_Icon;
        this.m_Categories = Other.m_Categories;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
        this.m_bSelected = Other.m_bSelected;
        return __r;
    }
    bool IsSelected() const
    {
        return this.GetbSelected();
    }
    void Select()
    {
        FVM_InventoryMain& local_2;
        TEUIModelWeakRef<FVM_InventoryMain> local_4 = this.GetInventoryRef();
        if (local_2)
        {
            local_2.SelectRootCategory(this.GetIndex());
        }
        return;
    }
    FSoftBrush GetIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSoftBrush GetModify_Icon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Icon = __Value;
        return;
    }
    const TArray<FGameplayTag> GetCategories() const property
    {
        const TArray<FGameplayTag> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FGameplayTag> GetModify_Categories() property
    {
        TArray<FGameplayTag> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCategories(const TArray<FGameplayTag> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Categories = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_InventoryMain> GetInventoryRef() const property
    {
        this.TrackPropertyRead(2);
        return this.m_InventoryRef;
    }
    void SetInventoryRef(const TEUIModelWeakRef<FVM_InventoryMain> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_InventoryMain> local_2;
        local_2 = this.m_InventoryRef;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_InventoryRef = __Value;
        return;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Index = __Value;
        return;
    }
    bool GetbSelected() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bSelected;
    }
    void SetbSelected(const bool __Value) property
    {
        if (!(this.m_bSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bSelected = __Value;
        return;
    }
}

struct FVM_InventoryMainCategory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FGameplayTag m_Category;
    UPROPERTY()
    TEUIModelWeakRef<FVM_InventoryMain> m_InventoryRef;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    bool m_bSelected;

    FVM_InventoryMainCategory()
    {
        this.m_Index = 0;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryMainCategory' by default constructor.");
        return;
    }
    FVM_InventoryMainCategory(const FVM_InventoryMainCategory &inout Other)
    {
        this.m_Index = 0;
        this.m_bSelected = false;
        this.m_Category = Other.m_Category;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
        this.m_bSelected = Other.m_bSelected;
        return;
    }
    FVM_InventoryMainCategory(const FGameplayTag &inout InCategory, const TEUIModelWeakRef<FVM_InventoryMain> &inout InInventoryRef, const int InIndex)
    {
        this.m_Index = 0;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCategory(InCategory);
        this.SetInventoryRef(InInventoryRef);
        this.SetIndex(InIndex);
        return;
    }
    FVM_InventoryMainCategory opAssign(const FVM_InventoryMainCategory &inout Other)
    {
        FVM_InventoryMainCategory __r;
        this.m_Category = Other.m_Category;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
        this.m_bSelected = Other.m_bSelected;
        return __r;
    }
    FText GetCategoryName() const
    {
        const UInventorySettings local_2;
        GetGameplaySettings<UInventorySettings> local_4;
        local_2 = local_4;
        return local_2.GetCategoryDisplayName(this.GetCategory());
    }
    bool IsSelected() const
    {
        return this.GetbSelected();
    }
    void Select()
    {
        FVM_InventoryMain& local_2;
        TEUIModelWeakRef<FVM_InventoryMain> local_4 = this.GetInventoryRef();
        if (local_2)
        {
            local_2.SelectCategory(this.GetIndex());
        }
        return;
    }
    FGameplayTag GetCategory() const property
    {
        FGameplayTag __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FGameplayTag GetModify_Category() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCategory(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Category = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_InventoryMain> GetInventoryRef() const property
    {
        this.TrackPropertyRead(1);
        return this.m_InventoryRef;
    }
    void SetInventoryRef(const TEUIModelWeakRef<FVM_InventoryMain> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_InventoryMain> local_2;
        local_2 = this.m_InventoryRef;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InventoryRef = __Value;
        return;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Index = __Value;
        return;
    }
    bool GetbSelected() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bSelected;
    }
    void SetbSelected(const bool __Value) property
    {
        if (!(this.m_bSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bSelected = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_InventoryMainRootCategory
{
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryMainRootCategory> Self;


}

struct __GeneratedProperties_FVM_InventoryMainCategory
{
    UPROPERTY()
    FText CategoryName;
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryMainCategory> Self;


}

namespace FVM_InventoryMainRootCategory
{
FVM_InventoryMainRootCategory& Create(const UObject ContextObject, const FSoftBrush &inout Icon, const TArray<FGameplayTag> &inout Categories, const TEUIModelWeakRef<FVM_InventoryMain> &inout InventoryRef, const int Index)
{
    return FVM_InventoryMainRootCategory::CreateByManager(EUIInternal::GetContextManager(ContextObject), Icon, Categories, InventoryRef, Index);
}
FVM_InventoryMainRootCategory CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout Icon, const TArray<FGameplayTag> &inout Categories, const TEUIModelWeakRef<FVM_InventoryMain> &inout InventoryRef, const int Index)
{
    FVM_InventoryMainRootCategory __r;
    TEUIModelRef<FVM_InventoryMainRootCategory> local_6 = TEUIModelRef<FVM_InventoryMainRootCategory>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryMainRootCategory::ModelId, 0, Icon, Categories, InventoryRef, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryMainRootCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryMainRootCategory;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryMainRootCategory;
}
FSoftBrush __UIGetter_Icon(const FVM_InventoryMainRootCategory &inout Model)
{
    return Model.GetIcon();
}
bool __UIGetter_bSelected(const FVM_InventoryMainRootCategory &inout Model)
{
    return Model.GetbSelected();
}
bool __UIGetter_IsSelected(const FVM_InventoryMainRootCategory &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_InventoryMainRootCategory> __UIGetter_Self(const FVM_InventoryMainRootCategory &inout Model)
{
    return TEUIModelRef<FVM_InventoryMainRootCategory>(Model);
}
int __IndexOf_Icon()
{
    return 0;
}
int __IndexOf_Categories()
{
    return 1;
}
int __IndexOf_InventoryRef()
{
    return 2;
}
int __IndexOf_Index()
{
    return 3;
}
int __IndexOf_bSelected()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_InventoryMainRootCategory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_InventoryMainCategory
{
FVM_InventoryMainCategory& Create(const UObject ContextObject, const FGameplayTag &inout Category, const TEUIModelWeakRef<FVM_InventoryMain> &inout InventoryRef, const int Index)
{
    return FVM_InventoryMainCategory::CreateByManager(EUIInternal::GetContextManager(ContextObject), Category, InventoryRef, Index);
}
FVM_InventoryMainCategory CreateByManager(const UEUIManagerSubsystem Manager, const FGameplayTag &inout Category, const TEUIModelWeakRef<FVM_InventoryMain> &inout InventoryRef, const int Index)
{
    FVM_InventoryMainCategory __r;
    TEUIModelRef<FVM_InventoryMainCategory> local_6 = TEUIModelRef<FVM_InventoryMainCategory>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryMainCategory::ModelId, 0, Category, InventoryRef, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CategoryName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryMainCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryMainCategory;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryMainCategory;
}
bool __UIGetter_bSelected(const FVM_InventoryMainCategory &inout Model)
{
    return Model.GetbSelected();
}
FText __UIGetter_CategoryName(const FVM_InventoryMainCategory &inout Model)
{
    return Model.GetCategoryName();
}
bool __UIGetter_IsSelected(const FVM_InventoryMainCategory &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_InventoryMainCategory> __UIGetter_Self(const FVM_InventoryMainCategory &inout Model)
{
    return TEUIModelRef<FVM_InventoryMainCategory>(Model);
}
int __IndexOf_Category()
{
    return 0;
}
int __IndexOf_InventoryRef()
{
    return 1;
}
int __IndexOf_Index()
{
    return 2;
}
int __IndexOf_bSelected()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_InventoryMainCategory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
