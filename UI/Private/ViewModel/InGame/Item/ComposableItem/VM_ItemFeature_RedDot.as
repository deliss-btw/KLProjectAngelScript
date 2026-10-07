
namespace FVM_ItemFeature_RedDot
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnRedDotClicked = FEUIModelCallbackSignature();

}
struct FVM_ItemFeature_RedDot : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    bool m_bDisplayHasRedDot;
    UPROPERTY()
    bool m_bAutoConsumeOnClick;

    FVM_ItemFeature_RedDot()
    {
        this.m_bDisplayHasRedDot = false;
        this.m_bAutoConsumeOnClick = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_RedDot' by default constructor.");
        return;
    }
    FVM_ItemFeature_RedDot(const FVM_ItemFeature_RedDot &inout Other)
    {
        this.m_bDisplayHasRedDot = false;
        this.m_bAutoConsumeOnClick = true;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        this.m_bAutoConsumeOnClick = Other.m_bAutoConsumeOnClick;
        return;
    }
    FVM_ItemFeature_RedDot(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        this.m_bDisplayHasRedDot = false;
        this.m_bAutoConsumeOnClick = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_RedDot opAssign(const FVM_ItemFeature_RedDot &inout Other)
    {
        FVM_ItemFeature_RedDot __r;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        this.m_bAutoConsumeOnClick = Other.m_bAutoConsumeOnClick;
        return __r;
    }
    void PostConstruct()
    {
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
            GetOnCommonItemClicked().AddUnique(this, FVM_ItemFeature_RedDot::OnRedDotClicked);
        }
        return;
    }
    void BeginDestroy()
    {
        if (this.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
        }
        return;
    }
    bool HasRedDot() const
    {
        return this.GetbDisplayHasRedDot();
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
    void OnRedDotClicked()
    {
        if (!(this.GetRedDotVM().IsValid()))
        {
            return;
        }
        if (!(this.GetbAutoConsumeOnClick()))
        {
            return;
        }
        TEUIModelRef<FVM_RedDot> local_2 = this.GetRedDotVM();
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GetNodeData());
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
    bool GetbAutoConsumeOnClick() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bAutoConsumeOnClick;
    }
    void SetbAutoConsumeOnClick(const bool __Value) property
    {
        if (!(this.m_bAutoConsumeOnClick) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bAutoConsumeOnClick = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_RedDot
{
    UPROPERTY()
    bool HasRedDot;
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_RedDot> Self;


}

namespace ItemFeature_RedDot_Util
{
bool HasRedDot(const FEUIModelContainer &inout ItemModelContainer)
{
    FVM_ItemFeature_RedDot& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        return local_2.HasRedDot();
    }
    return false;
}
void SetCurRedDotVM(const FEUIModelContainer &inout ItemModelContainer, const TEUIModelRef<FVM_RedDot> &inout RedDotVM)
{
    FVM_ItemFeature_RedDot& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetRedDotVM(RedDotVM);
    }
    return;
}
void SetAutoConsumeOnClick(const FEUIModelContainer &inout ItemModelContainer, const bool bAutoConsumeOnClick)
{
    FVM_ItemFeature_RedDot& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetbAutoConsumeOnClick(bAutoConsumeOnClick);
    }
    return;
}
}
namespace FVM_ItemFeature_RedDot
{
FVM_ItemFeature_RedDot& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_RedDot::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_RedDot CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_RedDot __r;
    TEUIModelRef<FVM_ItemFeature_RedDot> local_6 = TEUIModelRef<FVM_ItemFeature_RedDot>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_RedDot::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRedDot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_RedDot;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshRedDotDisplayState";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_RedDot;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_ItemFeature_RedDot &inout Model)
{
    return Model.GetRedDotVM();
}
bool __UIGetter_HasRedDot(const FVM_ItemFeature_RedDot &inout Model)
{
    return Model.HasRedDot();
}
TEUIModelRef<FVM_ItemFeature_RedDot> __UIGetter_Self(const FVM_ItemFeature_RedDot &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_RedDot>(Model);
}
int __IndexOf_CommonItemVM()
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
int __IndexOf_bAutoConsumeOnClick()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_RedDot
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
