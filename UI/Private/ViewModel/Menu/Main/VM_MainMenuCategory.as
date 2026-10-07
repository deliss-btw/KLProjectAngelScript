
namespace FVM_MainMenuCategory
{
    const int ModelId = 0;

}
struct FVM_MainMenuCategory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_CategoryIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_MainMenuEntry>> m_MenuEntries;

    FVM_MainMenuCategory()
    {
        this.m_CategoryIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MainMenuCategory' by default constructor.");
        return;
    }
    FVM_MainMenuCategory(const FVM_MainMenuCategory &inout Other)
    {
        this.m_CategoryIndex = 0;
        this.m_CategoryIndex = int(Other.m_CategoryIndex);
        this.m_MenuEntries = Other.m_MenuEntries;
        return;
    }
    FVM_MainMenuCategory(const int InCategoryIndex)
    {
        this.m_CategoryIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCategoryIndex(InCategoryIndex);
        return;
    }
    FVM_MainMenuCategory& opAssign(const FVM_MainMenuCategory &inout Other)
    {
        this.m_CategoryIndex = int(Other.m_CategoryIndex);
        return Other.m_MenuEntries;
    }
    FText GetCategoryName() const
    {
        return this.GetMenuCategorySettings().CategoryName;
    }
    void PostConstruct()
    {
        FGameplayTag local_22;
        FMS_SystemControl& local_4 = ::FMS_SystemControl::Get(this.GetManager());
        for (auto& local_20 : this.GetMenuCategorySettings().MenuConfigs)
        {
            local_20.opArrow().GetEntranceWidget();
            if (!(local_4.IsWidgetLocked(local_22)))
            {
                FMenuOperation local_76;
                this.GetModify_MenuEntries().Add(TEUIModelRef<FVM_MainMenuEntry>(::FVM_MainMenuEntry::Create(this.GetContext().Manager, local_20, local_76)));
            }
        }
        for (auto& local_94 : this.GetMenuCategorySettings().MenuOperations)
        {
            this.GetModify_MenuEntries().Add(TEUIModelRef<FVM_MainMenuEntry>(::FVM_MainMenuEntry::Create(this.GetManager(), TDataObjectPtr<FMenuConfig>(nullptr), local_94)));
        }
        return;
    }
    const FMenuCategorySettings GetMenuCategorySettings() const property
    {
        const FMenuCategorySettings __r;
        TArray<FMenuCategorySettings> local_4 = ::MenuSettings::Get().MenuCategories;
        if (local_4.IsValidIndex(this.GetCategoryIndex()))
        {
            return local_4[this.GetCategoryIndex()];
        }
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
    const TArray<TEUIModelRef<FVM_MainMenuEntry>> GetMenuEntries() const property
    {
        const TArray<TEUIModelRef<FVM_MainMenuEntry>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_MainMenuEntry>> GetModify_MenuEntries() property
    {
        TArray<TEUIModelRef<FVM_MainMenuEntry>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMenuEntries(const TArray<TEUIModelRef<FVM_MainMenuEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MenuEntries = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MainMenuCategory
{
    UPROPERTY()
    FText CategoryName;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuCategory> Self;

    __GeneratedProperties_FVM_MainMenuCategory()
    {
        return;
    }
}

namespace FVM_MainMenuCategory
{
FVM_MainMenuCategory& Create(const UObject ContextObject, const int CategoryIndex)
{
    return FVM_MainMenuCategory::CreateByManager(EUIInternal::GetContextManager(ContextObject), CategoryIndex);
}
FVM_MainMenuCategory CreateByManager(const UEUIManagerSubsystem Manager, const int CategoryIndex)
{
    FVM_MainMenuCategory __r;
    TEUIModelRef<FVM_MainMenuCategory> local_6 = TEUIModelRef<FVM_MainMenuCategory>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MainMenuCategory::ModelId, 0, CategoryIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MenuEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_MainMenuEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CategoryName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MainMenuCategory;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MainMenuCategory;
}
TArray<TEUIModelRef<FVM_MainMenuEntry>> __UIGetter_MenuEntries(const FVM_MainMenuCategory &inout Model)
{
    return Model.GetMenuEntries();
}
FText __UIGetter_CategoryName(const FVM_MainMenuCategory &inout Model)
{
    return Model.GetCategoryName();
}
TEUIModelRef<FVM_MainMenuCategory> __UIGetter_Self(const FVM_MainMenuCategory &inout Model)
{
    return TEUIModelRef<FVM_MainMenuCategory>(Model);
}
int __IndexOf_CategoryIndex()
{
    return 0;
}
int __IndexOf_MenuEntries()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_MainMenuCategory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
