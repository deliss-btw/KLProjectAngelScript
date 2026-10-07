
namespace FVM_MenuBarItem
{
    const int ModelId = 0;

}
struct FVM_MenuBarItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FMenuConfig> m_MenuConfig;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    bool m_bDisplayHasRedDot;

    FVM_MenuBarItem()
    {
        this.m_bDisplayHasRedDot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MenuBarItem' by default constructor.");
        return;
    }
    FVM_MenuBarItem(const FVM_MenuBarItem &inout Other)
    {
        this.m_bDisplayHasRedDot = false;
        this.m_MenuConfig = Other.m_MenuConfig;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        return;
    }
    FVM_MenuBarItem(const TDataObjectPtr<FMenuConfig> &inout InMenuConfig)
    {
        this.m_bDisplayHasRedDot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMenuConfig(InMenuConfig);
        return;
    }
    FVM_MenuBarItem opAssign(const FVM_MenuBarItem &inout Other)
    {
        FVM_MenuBarItem __r;
        this.m_MenuConfig = Other.m_MenuConfig;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        return __r;
    }
    FText GetText() const
    {
        return this.GetMenuConfig().opArrow().MenuName;
    }
    bool HasRedDot() const
    {
        return this.GetbDisplayHasRedDot();
    }
    void PostConstruct()
    {
        if (this.GetMenuConfig())
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, this.GetMenuConfig().opArrow().EntranceRedDot)));
        }
        return;
    }
    void InitializeCustomRedDotVM(const TEUIModelRef<FVM_RedDot> &inout InRedDotVM)
    {
        this.SetRedDotVM(InRedDotVM);
        return;
    }
    void RefreshRedDotDisplayState()
    {
        if (!(this.GetRedDotVM().IsValid()))
        {
            this.SetbDisplayHasRedDot(false);
            return;
        }
        TEUIModelRef<FVM_RedDot> local_2 = this.GetRedDotVM();
        this.SetbDisplayHasRedDot(GetbDisplayHasRedDot());
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
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RedDotVM = __Value;
        return;
    }
    bool GetbDisplayHasRedDot() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bDisplayHasRedDot;
    }
    void SetbDisplayHasRedDot(const bool __Value) property
    {
        if (!(this.m_bDisplayHasRedDot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bDisplayHasRedDot = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MenuBarItem
{
    UPROPERTY()
    FText Text;
    UPROPERTY()
    bool HasRedDot;
    UPROPERTY()
    TEUIModelRef<FVM_MenuBarItem> Self;


}

namespace FVM_MenuBarItem
{
FVM_MenuBarItem& Create(const UObject ContextObject, const TDataObjectPtr<FMenuConfig> &inout MenuConfig)
{
    return FVM_MenuBarItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), MenuConfig);
}
FVM_MenuBarItem CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FMenuConfig> &inout MenuConfig)
{
    FVM_MenuBarItem __r;
    TEUIModelRef<FVM_MenuBarItem> local_6 = TEUIModelRef<FVM_MenuBarItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MenuBarItem::ModelId, 0, MenuConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Text";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRedDot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MenuBarItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MenuBarItem;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshRedDotDisplayState";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MenuBarItem;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_MenuBarItem &inout Model)
{
    return Model.GetRedDotVM();
}
FText __UIGetter_Text(const FVM_MenuBarItem &inout Model)
{
    return Model.GetText();
}
bool __UIGetter_HasRedDot(const FVM_MenuBarItem &inout Model)
{
    return Model.HasRedDot();
}
TEUIModelRef<FVM_MenuBarItem> __UIGetter_Self(const FVM_MenuBarItem &inout Model)
{
    return TEUIModelRef<FVM_MenuBarItem>(Model);
}
int __IndexOf_MenuConfig()
{
    return 0;
}
int __IndexOf_RedDotVM()
{
    return 1;
}
int __IndexOf_bDisplayHasRedDot()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MenuBarItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
