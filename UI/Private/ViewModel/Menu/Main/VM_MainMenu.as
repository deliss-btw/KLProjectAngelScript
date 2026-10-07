
namespace FMS_MainMenuCache
{
    const int ModelId = 0;
}
namespace FVM_MainMenu
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnMenuCategorySelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnMenuCategoryIndexSelected = FEUIModelCallbackSignature();

}
struct FMS_MainMenuCache : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    int m_CategoryIndex;

    FMS_MainMenuCache()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_MainMenuCache(const FMS_MainMenuCache &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_MainMenuCache opAssign(const FMS_MainMenuCache &inout Other)
    {
        FMS_MainMenuCache __r;
        this.m_CategoryIndex = int(Other.m_CategoryIndex);
        return __r;
    }
    int GetCategoryIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CategoryIndex;
    }
    void SetCategoryIndex(const int __Value) property
    {
        if (this.m_CategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CategoryIndex = __Value;
        return;
    }
}

struct FVM_MainMenu : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MainMenuCategory>> m_MenuCategories;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuCategory> m_SelectedMenuCategory;

    FVM_MainMenu()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MainMenu(const FVM_MainMenu &inout Other)
    {
        this.m_MenuCategories = Other.m_MenuCategories;
        this.m_SelectedMenuCategory = Other.m_SelectedMenuCategory;
        return;
    }
    FVM_MainMenu& opAssign(const FVM_MainMenu &inout Other)
    {
        this.m_MenuCategories = Other.m_MenuCategories;
        return Other.m_SelectedMenuCategory;
    }
    void PostConstruct()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnMenuCategorySelected(const FEUIModelContainer &inout MenuCategory)
    {
        this.SetSelectedMenuCategory(TEUIModelRef<FVM_MainMenuCategory>(FEUIModelContainer::GetModel(MenuCategory).opCall()));
        return;
    }
    void OnMenuCategoryIndexSelected(const int Index)
    {
        if (this.GetMenuCategories().IsValidIndex(Index))
        {
            ::FMS_MainMenuCache::Get(this.GetManager()).SetCategoryIndex(this.GetMenuCategories()[Index].opArrow().GetCategoryIndex());
        }
        return;
    }
    const TArray<TEUIModelRef<FVM_MainMenuCategory>> GetMenuCategories() const property
    {
        const TArray<TEUIModelRef<FVM_MainMenuCategory>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MainMenuCategory>> GetModify_MenuCategories() property
    {
        TArray<TEUIModelRef<FVM_MainMenuCategory>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMenuCategories(const TArray<TEUIModelRef<FVM_MainMenuCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MenuCategories = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuCategory> GetSelectedMenuCategory() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedMenuCategory;
    }
    void SetSelectedMenuCategory(const TEUIModelRef<FVM_MainMenuCategory> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuCategory> local_2;
        local_2 = this.m_SelectedMenuCategory;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedMenuCategory = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MainMenu
{
    UPROPERTY()
    TEUIModelRef<FVM_MainMenu> Self;

    __GeneratedProperties_FVM_MainMenu()
    {
        return;
    }
}

namespace FMS_MainMenuCache
{
FMS_MainMenuCache& Get(const UObject ContextObject)
{
    return FMS_MainMenuCache::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_MainMenuCache GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_MainMenuCache __r;
    TEUIModelRef<FMS_MainMenuCache> local_6 = TEUIModelRef<FMS_MainMenuCache>(EUIInternal::MakeModelWithManager(Manager, FMS_MainMenuCache::ModelId));
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
    return FMS_MainMenuCache;
}
int __IndexOf_CategoryIndex()
{
    return 0;
}
}
namespace FVM_MainMenu
{
FVM_MainMenu& Create(const UObject ContextObject)
{
    return FVM_MainMenu::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MainMenu CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MainMenu __r;
    TEUIModelRef<FVM_MainMenu> local_6 = TEUIModelRef<FVM_MainMenu>(EUIInternal::MakeModelWithManager(Manager, FVM_MainMenu::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MenuCategories";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_MainMenuCategory>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMenuCategory";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenu>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MainMenu;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MainMenu;
}
TArray<TEUIModelRef<FVM_MainMenuCategory>> __UIGetter_MenuCategories(const FVM_MainMenu &inout Model)
{
    return Model.GetMenuCategories();
}
TEUIModelRef<FVM_MainMenuCategory> __UIGetter_SelectedMenuCategory(const FVM_MainMenu &inout Model)
{
    return Model.GetSelectedMenuCategory();
}
TEUIModelRef<FVM_MainMenu> __UIGetter_Self(const FVM_MainMenu &inout Model)
{
    return TEUIModelRef<FVM_MainMenu>(Model);
}
int __IndexOf_MenuCategories()
{
    return 0;
}
int __IndexOf_SelectedMenuCategory()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_MainMenu
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
