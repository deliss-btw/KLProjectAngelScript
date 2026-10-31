namespace FVMS_MenuManager
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnMenuBarItemSelected = FEUIModelCallbackSignature();

}
struct FVMS_MenuManager : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_CurrentMenuIndex;
    UPROPERTY()
    bool m_bRefreshMenuBar;
    UPROPERTY()
    FEUIWidgetRef m_OpenedMenuPage;
    UPROPERTY()
    FEUIWidgetRef m_OpenedMenuBarPage;
    UPROPERTY()
    int m_CurrentCategoryIndex;
    UPROPERTY()
    TArray<FEUIModelContainer> m_MenuBarEntries;
    UPROPERTY()
    TArray<TDataObjectPtr<FMenuConfig>> m_MenuEntries;

    FVMS_MenuManager()
    {
        this.m_CurrentMenuIndex = INDEX_NONE;
        this.m_bRefreshMenuBar = false;
        this.m_CurrentCategoryIndex = INDEX_NONE;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_MenuManager(const FVMS_MenuManager &inout Other)
    {
        this.m_CurrentMenuIndex = INDEX_NONE;
        this.m_bRefreshMenuBar = false;
        this.m_CurrentCategoryIndex = INDEX_NONE;
        this.m_CurrentMenuIndex = int(Other.m_CurrentMenuIndex);
        this.m_bRefreshMenuBar = Other.m_bRefreshMenuBar;
        this.m_OpenedMenuPage = Other.m_OpenedMenuPage;
        this.m_OpenedMenuBarPage = Other.m_OpenedMenuBarPage;
        this.m_CurrentCategoryIndex = int(Other.m_CurrentCategoryIndex);
        this.m_MenuBarEntries = Other.m_MenuBarEntries;
        this.m_MenuEntries = Other.m_MenuEntries;
        return;
    }
    FVMS_MenuManager& opAssign(const FVMS_MenuManager &inout Other)
    {
        this.m_CurrentMenuIndex = int(Other.m_CurrentMenuIndex);
        this.m_bRefreshMenuBar = Other.m_bRefreshMenuBar;
        this.m_OpenedMenuPage = Other.m_OpenedMenuPage;
        this.m_OpenedMenuBarPage = Other.m_OpenedMenuBarPage;
        this.m_CurrentCategoryIndex = int(Other.m_CurrentCategoryIndex);
        this.m_MenuBarEntries = Other.m_MenuBarEntries;
        return Other.m_MenuEntries;
    }
    FEUIModelContainer GetSelectedMenuBarItem() const
    {
        if (this.GetMenuBarEntries().IsValidIndex(this.GetCurrentMenuIndex()))
        {
            return this.GetMenuBarEntries()[this.GetCurrentMenuIndex()];
        }
        return FEUIModelContainer();
    }
    void OnMenuBarItemSelected(const FEUIModelContainer &inout MenuBarItem)
    {
        int local_1 = this.GetMenuBarEntries().IndexOfByKey(MenuBarItem);
        if (local_1 == INDEX_NONE || (local_1 == this.GetCurrentMenuIndex()))
        {
            return;
        }
        if (this.GetMenuEntries().IsValidIndex(this.GetCurrentMenuIndex()))
        {
            if ((this.GetMenuEntries()[this.GetCurrentMenuIndex()].GetDataName() == n"Settings") && FEUIWidgetRef::GetViewModel(this.GetOpenedMenuPage()).opCall(NAME_None).RequireSwitchMenuPage(this.GetMenuBarEntries()[this.GetCurrentMenuIndex()], this.GetMenuEntries()[local_1].opArrow().GetEntranceWidget()))
            {
                this.SetbRefreshMenuBar(!(this.GetbRefreshMenuBar()));
                return;
            }
            this.SetCurrentMenuIndex(local_1);
            if (this.GetMenuEntries().IsValidIndex(this.GetCurrentMenuIndex()))
            {
                FEUIWidgetTag local_12 = this.GetMenuEntries()[this.GetCurrentMenuIndex()].opArrow().GetEntranceWidget();
            }
        }
        return;
    }
    void OnMenuPageOpen(const TDataObjectPtr<FMenuConfig> &inout MenuConfig)
    {
        ULocalPlayer local_2;
        this.UpdateMenuBarEntries(MenuConfig);
        if (local_2 == nullptr)
        {
            return;
        }
        if (!(this.GetOpenedMenuBarPage().IsValid()))
        {
            UMenuSettings local_6 = ::MenuSettings::Get();
            FEUIWidgetRef local_8;
            this.SetOpenedMenuBarPage(local_8);
        }
        else
        {
            FEUIWidget::MoveTop(this.GetOpenedMenuBarPage());
        }
        if (this.GetOpenedMenuPage())
        {
            FEUIWidgetRef local_8;
            FVM_MenuPage& local_14 = FEUIWidgetRef::GetViewModel(this.GetOpenedMenuPage()).opCall(NAME_None);
            if (local_14)
            {
                TDataObjectPtr<FMenuConfig> local_38;
                local_38 = local_14.GetMenuConfig();
                if ((!(!((local_38 == MenuConfig.opImplConv())))))
                {
                    return;
                }
            }
            FEUIWidget::RemoveWidgetUntilTop(this.GetOpenedMenuPage());
            this.SetOpenedMenuPage(local_8);
        }
        if (!(!(MenuConfig)))
        {
            MenuConfig.opArrow().GetEntranceWidget();
            FGameplayTag local_88;
            this.SetOpenedMenuPage(FEUIWidget::FindWidget(local_2, local_88));
        }
        this.SetCurrentMenuIndex(this.GetMenuEntries().IndexOfByKey(MenuConfig));
        return;
    }
    void OnMenuPageClose(const TDataObjectPtr<FMenuConfig> &inout MenuConfig)
    {
        if (!(!(MenuConfig)))
        {
            if (this.GetMenuEntries().IndexOfByKey(MenuConfig) == this.GetCurrentMenuIndex())
            {
                FEUIWidget::RemoveWidget(this.GetOpenedMenuBarPage());
                this.SetOpenedMenuBarPage(FEUIWidgetRef());
                this.SetCurrentMenuIndex(INDEX_NONE);
            }
        }
        return;
    }
    void UpdateMenuBarEntries(const TDataObjectPtr<FMenuConfig> &inout MenuConfig)
    {
        FGameplayTag local_46;
        int local_3 = ::MenuSettings::Get().GetBelongingCategoryIndex(MenuConfig);
        if (local_3 == INDEX_NONE)
        {
            this.GetModify_MenuBarEntries().Empty(0);
            FEUIModelContainer local_20;
            local_20.AddModel(FEUIModelRef(::FVM_MenuBarItem::Create(this.GetContext().Manager, MenuConfig)), false);
            local_20.AddModel(FEUIModelRef(::FVM_Text::Create(this.GetContext().Manager, MenuConfig.opArrow().MenuName)), false);
            this.GetModify_MenuBarEntries().Add(FEUIModelContainer());
            this.SetCurrentCategoryIndex(INDEX_NONE);
            this.SetCurrentMenuIndex(INDEX_NONE);
            return;
        }
        if (local_3 == this.GetCurrentCategoryIndex())
        {
            return;
        }
        this.SetCurrentCategoryIndex(local_3);
        this.GetModify_MenuEntries().Empty(0);
        this.GetModify_MenuBarEntries().Empty(0);
        FMS_SystemControl& local_26 = ::FMS_SystemControl::Get(this.GetManager());
        for (auto& local_44 : this.GetAllMenuConfigs())
        {
            local_44.opArrow().GetEntranceWidget();
            if (!(local_26.IsWidgetLocked(local_46)))
            {
                FEUIModelContainer local_20;
                local_20.AddModel(FEUIModelRef(::FVM_MenuBarItem::Create(this.GetContext().Manager, local_44)), false);
                local_20.AddModel(FEUIModelRef(::FVM_Text::Create(this.GetContext().Manager, local_44.opArrow().MenuName)), false);
                this.GetModify_MenuBarEntries().Add(local_20);
                this.GetModify_MenuEntries().Add(local_44);
            }
        }
        return;
    }
    TArray<TDataObjectPtr<FMenuConfig>> GetAllMenuConfigs() const property
    {
        if (this.GetCurrentCategoryIndex() == INDEX_NONE)
        {
            return TArray<TDataObjectPtr<FMenuConfig>>();
        }
        return ::MenuSettings::Get().MenuCategories[this.GetCurrentCategoryIndex()].MenuConfigs;
    }
    int GetCurrentMenuIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurrentMenuIndex;
    }
    void SetCurrentMenuIndex(const int __Value) property
    {
        if (this.m_CurrentMenuIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentMenuIndex = __Value;
        return;
    }
    bool GetbRefreshMenuBar() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bRefreshMenuBar;
    }
    void SetbRefreshMenuBar(const bool __Value) property
    {
        if (!(this.m_bRefreshMenuBar) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bRefreshMenuBar = __Value;
        return;
    }
    const FEUIWidgetRef GetOpenedMenuPage() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIWidgetRef GetModify_OpenedMenuPage() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOpenedMenuPage(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OpenedMenuPage = __Value;
        return;
    }
    const FEUIWidgetRef GetOpenedMenuBarPage() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIWidgetRef GetModify_OpenedMenuBarPage() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetOpenedMenuBarPage(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_OpenedMenuBarPage = __Value;
        return;
    }
    int GetCurrentCategoryIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CurrentCategoryIndex;
    }
    void SetCurrentCategoryIndex(const int __Value) property
    {
        if (this.m_CurrentCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrentCategoryIndex = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetMenuBarEntries() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_MenuBarEntries() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetMenuBarEntries(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MenuBarEntries = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FMenuConfig>> GetMenuEntries() const property
    {
        const TArray<TDataObjectPtr<FMenuConfig>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TDataObjectPtr<FMenuConfig>> GetModify_MenuEntries() property
    {
        TArray<TDataObjectPtr<FMenuConfig>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMenuEntries(const TArray<TDataObjectPtr<FMenuConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MenuEntries = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_MenuManager
{
    UPROPERTY()
    FEUIModelContainer SelectedMenuBarItem;
    UPROPERTY()
    TEUIModelRef<FVMS_MenuManager> Self;

    __GeneratedProperties_FVMS_MenuManager()
    {
        return;
    }
}

namespace FVMS_MenuManager
{
FVMS_MenuManager& Get(const UObject ContextObject)
{
    return FVMS_MenuManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_MenuManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_MenuManager __r;
    TEUIModelRef<FVMS_MenuManager> local_6 = TEUIModelRef<FVMS_MenuManager>(EUIInternal::MakeModelWithManager(Manager, FVMS_MenuManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MenuBarEntries";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMenuBarItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_MenuManager>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_MenuManager;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_MenuManager;
}
TArray<FEUIModelContainer> __UIGetter_MenuBarEntries(const FVMS_MenuManager &inout Model)
{
    return Model.GetMenuBarEntries();
}
FEUIModelContainer __UIGetter_SelectedMenuBarItem(const FVMS_MenuManager &inout Model)
{
    return Model.GetSelectedMenuBarItem();
}
TEUIModelRef<FVMS_MenuManager> __UIGetter_Self(const FVMS_MenuManager &inout Model)
{
    return TEUIModelRef<FVMS_MenuManager>(Model);
}
int __IndexOf_CurrentMenuIndex()
{
    return 0;
}
int __IndexOf_bRefreshMenuBar()
{
    return 1;
}
int __IndexOf_OpenedMenuPage()
{
    return 2;
}
int __IndexOf_OpenedMenuBarPage()
{
    return 3;
}
int __IndexOf_CurrentCategoryIndex()
{
    return 4;
}
int __IndexOf_MenuBarEntries()
{
    return 5;
}
int __IndexOf_MenuEntries()
{
    return 6;
}
}
namespace __GeneratedProperties_FVMS_MenuManager
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
