
namespace FVM_ChatMainTab
{
    const int ModelId = 0;

}
struct FVM_ChatMainTab : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FChatTabInfoConfig m_TabInfoConfig;
    UPROPERTY()
    bool m_bIsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_ChatMainTab()
    {
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ChatMainTab' by default constructor.");
        return;
    }
    FVM_ChatMainTab(const FVM_ChatMainTab &inout Other)
    {
        this.m_bIsSelected = false;
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_ChatMainTab(const FChatTabInfoConfig &inout InTabInfoConfig)
    {
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTabInfoConfig(InTabInfoConfig);
        return;
    }
    FVM_ChatMainTab& opAssign(const FVM_ChatMainTab &inout Other)
    {
        this.m_bIsSelected = Other.m_bIsSelected;
        return Other.m_RedDotVM;
    }
    void PostConstruct()
    {
        if (this.GetTabInfoConfig().RedDotTabTag.IsValid())
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(this.GetTabInfoConfig().RedDotTabTag, 0))));
        }
        return;
    }
    FText GetTabName() const
    {
        return ::ChatSystemUtil::ResolveKLTextData(this.GetTabInfoConfig().TabNameTextData);
    }
    EChatMainTab GetTabType() const
    {
        return this.GetTabInfoConfig().ChatMainTabType;
    }
    void SetSelectedVisualState(const bool bSelected)
    {
        if (!(bSelected) != !(this.GetbIsSelected()))
        {
            this.SetbIsSelected(bSelected);
        }
        return;
    }
    const FChatTabInfoConfig GetTabInfoConfig() const property
    {
        const FChatTabInfoConfig __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FChatTabInfoConfig GetModify_TabInfoConfig() property
    {
        FChatTabInfoConfig __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTabInfoConfig(const FChatTabInfoConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    bool GetbIsSelected() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsSelected;
    }
    void SetbIsSelected(const bool __Value) property
    {
        if (!(this.m_bIsSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsSelected = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(2);
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
        this.MarkPropertyDirty(2);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatMainTab
{
    UPROPERTY()
    FText TabName;
    UPROPERTY()
    TEUIModelRef<FVM_ChatMainTab> Self;

    __GeneratedProperties_FVM_ChatMainTab()
    {
        return;
    }
}

namespace FVM_ChatMainTab
{
FVM_ChatMainTab& Create(const UObject ContextObject, const FChatTabInfoConfig &inout TabInfoConfig)
{
    return FVM_ChatMainTab::CreateByManager(EUIInternal::GetContextManager(ContextObject), TabInfoConfig);
}
FVM_ChatMainTab CreateByManager(const UEUIManagerSubsystem Manager, const FChatTabInfoConfig &inout TabInfoConfig)
{
    FVM_ChatMainTab __r;
    TEUIModelRef<FVM_ChatMainTab> local_6 = TEUIModelRef<FVM_ChatMainTab>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ChatMainTab::ModelId, 0, TabInfoConfig));
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
    local_14.PropertyName = "TabName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChatMainTab>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChatMainTab;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatMainTab;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_ChatMainTab &inout Model)
{
    return Model.GetRedDotVM();
}
FText __UIGetter_TabName(const FVM_ChatMainTab &inout Model)
{
    return Model.GetTabName();
}
TEUIModelRef<FVM_ChatMainTab> __UIGetter_Self(const FVM_ChatMainTab &inout Model)
{
    return TEUIModelRef<FVM_ChatMainTab>(Model);
}
int __IndexOf_TabInfoConfig()
{
    return 0;
}
int __IndexOf_bIsSelected()
{
    return 1;
}
int __IndexOf_RedDotVM()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_ChatMainTab
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
