
namespace FVM_MenuPage
{
    const int ModelId = 0;

// NOTE: class defaults are not authored in this module: FVM_MenuPage (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

}
struct FVM_MenuPage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FMenuConfig> m_MenuConfig;

    FVM_MenuPage()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
        }
        else
        {
        }
        this.__InitDefaults();
        return;
    }
    FVM_MenuPage(const FVM_MenuPage &inout Other)
    {
        this.m_MenuConfig = Other.m_MenuConfig;
        this.__InitDefaults();
        return;
    }
    FVM_MenuPage& opAssign(const FVM_MenuPage &inout Other)
    {
        return Other.m_MenuConfig;
    }
    void LoadConfig(const FConfigVM_MenuPage &inout InConfig)
    {
        this.SetMenuConfig(InConfig.MenuConfig);
        return;
    }
    void OnOwnerWidgetBind_Implementation()
    {
        ::FVMS_MenuManager::Get(this.GetContext().Manager).OnMenuPageOpen(this.GetMenuConfig());
        return;
    }
    void OnOwnerWidgetUnbind_Implementation()
    {
        ::FVMS_MenuManager::Get(this.GetContext().Manager).OnMenuPageClose(this.GetMenuConfig());
        return;
    }
    const TDataObjectPtr<FMenuConfig> GetMenuConfig() const property
    {
        const TDataObjectPtr<FMenuConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FMenuConfig> GetModify_MenuConfig() property
    {
        TDataObjectPtr<FMenuConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMenuConfig(const TDataObjectPtr<FMenuConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MenuConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MenuPage
{
    UPROPERTY()
    TEUIModelRef<FVM_MenuPage> Self;

    __GeneratedProperties_FVM_MenuPage()
    {
        return;
    }
}

namespace FVM_MenuPage
{
FVM_MenuPage& Create(const UObject ContextObject)
{
    return FVM_MenuPage::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MenuPage CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MenuPage __r;
    TEUIModelRef<FVM_MenuPage> local_6 = TEUIModelRef<FVM_MenuPage>(EUIInternal::MakeModelWithManager(Manager, FVM_MenuPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MenuPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MenuPage;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MenuPage;
}
TEUIModelRef<FVM_MenuPage> __UIGetter_Self(const FVM_MenuPage &inout Model)
{
    return TEUIModelRef<FVM_MenuPage>(Model);
}
int __IndexOf_MenuConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_MenuPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
