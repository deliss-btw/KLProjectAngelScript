
namespace FVM_InventoryCategory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelect = FEUIModelCallbackSignature();
}
namespace FVM_InventoryRootCategory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelect = FEUIModelCallbackSignature();

}
struct FVM_InventoryCategory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FGameplayTag m_Category;
    UPROPERTY()
    TEUIModelWeakRef<FVM_Inventory> m_InventoryRef;
    UPROPERTY()
    int m_Index;

    FVM_InventoryCategory()
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryCategory' by default constructor.");
        return;
    }
    FVM_InventoryCategory(const FVM_InventoryCategory &inout Other)
    {
        this.m_Index = 0;
        this.m_Category = Other.m_Category;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
        return;
    }
    FVM_InventoryCategory(const FGameplayTag &inout InCategory, const TEUIModelWeakRef<FVM_Inventory> &inout InInventoryRef, const int InIndex)
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCategory(InCategory);
        this.SetInventoryRef(InInventoryRef);
        this.SetIndex(InIndex);
        return;
    }
    FVM_InventoryCategory opAssign(const FVM_InventoryCategory &inout Other)
    {
        FVM_InventoryCategory __r;
        this.m_Category = Other.m_Category;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
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
        FVM_Inventory& local_2;
        TEUIModelWeakRef<FVM_Inventory> local_4 = this.GetInventoryRef();
        if (local_2)
        {
            return (local_2.GetCurrentCategoryIndex() == this.GetIndex());
        }
        return false;
    }
    void OnSelect()
    {
        FVM_Inventory& local_2;
        TEUIModelWeakRef<FVM_Inventory> local_4 = this.GetInventoryRef();
        if (local_2)
        {
            local_2.SetCurrentCategoryIndex(this.GetIndex());
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
    TEUIModelWeakRef<FVM_Inventory> GetInventoryRef() const property
    {
        this.TrackPropertyRead(1);
        return this.m_InventoryRef;
    }
    void SetInventoryRef(const TEUIModelWeakRef<FVM_Inventory> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_Inventory> local_2;
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
}

struct FVM_InventoryRootCategory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_Icon;
    UPROPERTY()
    TArray<FGameplayTag> m_Categories;
    UPROPERTY()
    TEUIModelWeakRef<FVM_Inventory> m_InventoryRef;
    UPROPERTY()
    int m_Index;

    FVM_InventoryRootCategory()
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_InventoryRootCategory' by default constructor.");
        return;
    }
    FVM_InventoryRootCategory(const FVM_InventoryRootCategory &inout Other)
    {
        this.m_Index = 0;
        this.m_Icon = Other.m_Icon;
        this.m_Categories = Other.m_Categories;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
        return;
    }
    FVM_InventoryRootCategory(const FSoftBrush &inout InIcon, const TArray<FGameplayTag> &inout InCategories, const TEUIModelWeakRef<FVM_Inventory> &inout InInventoryRef, const int InIndex)
    {
        this.m_Index = 0;
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
    FVM_InventoryRootCategory opAssign(const FVM_InventoryRootCategory &inout Other)
    {
        FVM_InventoryRootCategory __r;
        this.m_Icon = Other.m_Icon;
        this.m_Categories = Other.m_Categories;
        this.m_InventoryRef = Other.m_InventoryRef;
        this.m_Index = int(Other.m_Index);
        return __r;
    }
    bool IsSelected() const
    {
        FVM_Inventory& local_2;
        TEUIModelWeakRef<FVM_Inventory> local_4 = this.GetInventoryRef();
        if (local_2)
        {
            return (local_2.GetRootCategoryIndex() == this.GetIndex());
        }
        return false;
    }
    void OnSelect()
    {
        FVM_Inventory& local_2;
        TEUIModelWeakRef<FVM_Inventory> local_4 = this.GetInventoryRef();
        if (local_2)
        {
            local_2.SetRootCategoryIndex(this.GetIndex());
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
    TEUIModelWeakRef<FVM_Inventory> GetInventoryRef() const property
    {
        this.TrackPropertyRead(2);
        return this.m_InventoryRef;
    }
    void SetInventoryRef(const TEUIModelWeakRef<FVM_Inventory> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_Inventory> local_2;
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
}

struct __GeneratedProperties_FVM_InventoryCategory
{
    UPROPERTY()
    FText CategoryName;
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryCategory> Self;


}

struct __GeneratedProperties_FVM_InventoryRootCategory
{
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryRootCategory> Self;


}

namespace FVM_InventoryCategory
{
FVM_InventoryCategory& Create(const UObject ContextObject, const FGameplayTag &inout Category, const TEUIModelWeakRef<FVM_Inventory> &inout InventoryRef, const int Index)
{
    return FVM_InventoryCategory::CreateByManager(EUIInternal::GetContextManager(ContextObject), Category, InventoryRef, Index);
}
FVM_InventoryCategory CreateByManager(const UEUIManagerSubsystem Manager, const FGameplayTag &inout Category, const TEUIModelWeakRef<FVM_Inventory> &inout InventoryRef, const int Index)
{
    FVM_InventoryCategory __r;
    TEUIModelRef<FVM_InventoryCategory> local_6 = TEUIModelRef<FVM_InventoryCategory>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryCategory::ModelId, 0, Category, InventoryRef, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
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
    local_14.TypeName = "TEUIModelRef<FVM_InventoryCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryCategory;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryCategory;
}
FText __UIGetter_CategoryName(const FVM_InventoryCategory &inout Model)
{
    return Model.GetCategoryName();
}
bool __UIGetter_IsSelected(const FVM_InventoryCategory &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_InventoryCategory> __UIGetter_Self(const FVM_InventoryCategory &inout Model)
{
    return TEUIModelRef<FVM_InventoryCategory>(Model);
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
}
namespace __GeneratedProperties_FVM_InventoryCategory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_InventoryRootCategory
{
FVM_InventoryRootCategory& Create(const UObject ContextObject, const FSoftBrush &inout Icon, const TArray<FGameplayTag> &inout Categories, const TEUIModelWeakRef<FVM_Inventory> &inout InventoryRef, const int Index)
{
    return FVM_InventoryRootCategory::CreateByManager(EUIInternal::GetContextManager(ContextObject), Icon, Categories, InventoryRef, Index);
}
FVM_InventoryRootCategory CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout Icon, const TArray<FGameplayTag> &inout Categories, const TEUIModelWeakRef<FVM_Inventory> &inout InventoryRef, const int Index)
{
    FVM_InventoryRootCategory __r;
    TEUIModelRef<FVM_InventoryRootCategory> local_6 = TEUIModelRef<FVM_InventoryRootCategory>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_InventoryRootCategory::ModelId, 0, Icon, Categories, InventoryRef, Index));
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
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryRootCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_InventoryRootCategory;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_InventoryRootCategory;
}
FSoftBrush __UIGetter_Icon(const FVM_InventoryRootCategory &inout Model)
{
    return Model.GetIcon();
}
bool __UIGetter_IsSelected(const FVM_InventoryRootCategory &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_InventoryRootCategory> __UIGetter_Self(const FVM_InventoryRootCategory &inout Model)
{
    return TEUIModelRef<FVM_InventoryRootCategory>(Model);
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
}
namespace __GeneratedProperties_FVM_InventoryRootCategory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
