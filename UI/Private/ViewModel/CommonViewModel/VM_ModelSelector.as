
namespace FVM_DynamicWidgetSelector
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectPreviousModel = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectNextModel = FEUIModelCallbackSignature();

}
struct FVM_DynamicWidgetSelector : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_ModelList;
    UPROPERTY()
    int m_SelectedIndex;
    UPROPERTY()
    bool m_bWrapSelection;

    FVM_DynamicWidgetSelector()
    {
        this.m_SelectedIndex = 0;
        this.m_bWrapSelection = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DynamicWidgetSelector' by default constructor.");
        return;
    }
    FVM_DynamicWidgetSelector(const FVM_DynamicWidgetSelector &inout Other)
    {
        this.m_SelectedIndex = 0;
        this.m_bWrapSelection = false;
        this.m_ModelList = Other.m_ModelList;
        this.m_SelectedIndex = int(Other.m_SelectedIndex);
        this.m_bWrapSelection = Other.m_bWrapSelection;
        return;
    }
    FVM_DynamicWidgetSelector(const TArray<FEUIDynamicWidgetData> &inout InModelList)
    {
        this.m_SelectedIndex = 0;
        this.m_bWrapSelection = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetModelList(InModelList);
        return;
    }
    FVM_DynamicWidgetSelector opAssign(const FVM_DynamicWidgetSelector &inout Other)
    {
        FVM_DynamicWidgetSelector __r;
        this.m_ModelList = Other.m_ModelList;
        this.m_SelectedIndex = int(Other.m_SelectedIndex);
        this.m_bWrapSelection = Other.m_bWrapSelection;
        return __r;
    }
    FEUIModelContainer GetSelectedModel() const
    {
        if (this.GetModelList().IsValidIndex(this.GetSelectedIndex()))
        {
            return this.GetModelList()[this.GetSelectedIndex()].ModelContainer;
        }
        return FEUIModelContainer();
    }
    TSoftClassPtr<UEUIUserWidget> GetSelectedWidgetSoftClass() const
    {
        if (this.GetModelList().IsValidIndex(this.GetSelectedIndex()))
        {
            return this.GetModelList()[this.GetSelectedIndex()].WidgetClass;
        }
        return TSoftClassPtr<UEUIUserWidget>();
    }
    TSubclassOf<UEUIUserWidget> GetSelectedWidgetClass() const
    {
        TSoftClassPtr<UObject> local_10 = this.GetSelectedWidgetSoftClass();
        if (local_10.IsValid())
        {
            return TSubclassOf<UEUIUserWidget>(System::LoadClassAsset_Blocking(local_10));
        }
        return TSubclassOf<UEUIUserWidget>();
    }
    bool HasPreviousModel() const
    {
        if (this.GetModelList().IsEmpty())
        {
            return false;
        }
        return this.GetbWrapSelection() || (this.GetSelectedIndex() > 0);
    }
    bool HasNextModel() const
    {
        if (this.GetModelList().IsEmpty())
        {
            return false;
        }
        return this.GetbWrapSelection() || (this.GetSelectedIndex() < (this.GetModelList().Num() - 1));
    }
    void SelectPreviousModel()
    {
        if (this.HasPreviousModel())
        {
            this.SetSelectedIndex(FMath::WrapIndex((this.GetSelectedIndex() - 1), 0, this.GetModelList().Num()));
        }
        return;
    }
    void SelectNextModel()
    {
        if (this.HasNextModel())
        {
            this.SetSelectedIndex(FMath::WrapIndex((this.GetSelectedIndex() + 1), 0, this.GetModelList().Num()));
        }
        return;
    }
    const TArray<FEUIDynamicWidgetData> GetModelList() const property
    {
        const TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_ModelList() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetModelList(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ModelList = __Value;
        return;
    }
    int GetSelectedIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedIndex;
    }
    void SetSelectedIndex(const int __Value) property
    {
        if (this.m_SelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedIndex = __Value;
        return;
    }
    bool GetbWrapSelection() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bWrapSelection;
    }
    void SetbWrapSelection(const bool __Value) property
    {
        if (!(this.m_bWrapSelection) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bWrapSelection = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DynamicWidgetSelector
{
    UPROPERTY()
    FEUIModelContainer SelectedModel;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SelectedWidgetSoftClass;
    UPROPERTY()
    TSubclassOf<UEUIUserWidget> SelectedWidgetClass;
    UPROPERTY()
    bool HasPreviousModel;
    UPROPERTY()
    bool HasNextModel;
    UPROPERTY()
    TEUIModelRef<FVM_DynamicWidgetSelector> Self;


}

namespace FVM_DynamicWidgetSelector
{
FVM_DynamicWidgetSelector& Create(const UObject ContextObject, const TArray<FEUIDynamicWidgetData> &inout ModelList)
{
    return FVM_DynamicWidgetSelector::CreateByManager(EUIInternal::GetContextManager(ContextObject), ModelList);
}
FVM_DynamicWidgetSelector CreateByManager(const UEUIManagerSubsystem Manager, const TArray<FEUIDynamicWidgetData> &inout ModelList)
{
    FVM_DynamicWidgetSelector __r;
    TEUIModelRef<FVM_DynamicWidgetSelector> local_6 = TEUIModelRef<FVM_DynamicWidgetSelector>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DynamicWidgetSelector::ModelId, 0, ModelList));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectedModel";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedWidgetSoftClass";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedWidgetClass";
    local_14.TypeName = "TSubclassOf<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasPreviousModel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasNextModel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DynamicWidgetSelector>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DynamicWidgetSelector;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DynamicWidgetSelector;
}
FEUIModelContainer __UIGetter_SelectedModel(const FVM_DynamicWidgetSelector &inout Model)
{
    return Model.GetSelectedModel();
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_SelectedWidgetSoftClass(const FVM_DynamicWidgetSelector &inout Model)
{
    return Model.GetSelectedWidgetSoftClass();
}
TSubclassOf<UEUIUserWidget> __UIGetter_SelectedWidgetClass(const FVM_DynamicWidgetSelector &inout Model)
{
    return Model.GetSelectedWidgetClass();
}
bool __UIGetter_HasPreviousModel(const FVM_DynamicWidgetSelector &inout Model)
{
    return Model.HasPreviousModel();
}
bool __UIGetter_HasNextModel(const FVM_DynamicWidgetSelector &inout Model)
{
    return Model.HasNextModel();
}
TEUIModelRef<FVM_DynamicWidgetSelector> __UIGetter_Self(const FVM_DynamicWidgetSelector &inout Model)
{
    return TEUIModelRef<FVM_DynamicWidgetSelector>(Model);
}
int __IndexOf_ModelList()
{
    return 0;
}
int __IndexOf_SelectedIndex()
{
    return 1;
}
int __IndexOf_bWrapSelection()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_DynamicWidgetSelector
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
