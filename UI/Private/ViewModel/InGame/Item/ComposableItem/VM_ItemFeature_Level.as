
namespace FVM_ItemFeature_Level
{
    const int ModelId = 0;

}
struct FVM_ItemFeature_Level : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    FText m_DisplayLevelText;
    UPROPERTY()
    bool m_bIsShowLevel;

    FVM_ItemFeature_Level()
    {
        this.m_bIsShowLevel = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_Level' by default constructor.");
        return;
    }
    FVM_ItemFeature_Level(const FVM_ItemFeature_Level &inout Other)
    {
        this.m_bIsShowLevel = true;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_DisplayLevelText = Other.m_DisplayLevelText;
        this.m_bIsShowLevel = Other.m_bIsShowLevel;
        return;
    }
    FVM_ItemFeature_Level(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        this.m_bIsShowLevel = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_Level opAssign(const FVM_ItemFeature_Level &inout Other)
    {
        FVM_ItemFeature_Level __r;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_DisplayLevelText = Other.m_DisplayLevelText;
        this.m_bIsShowLevel = Other.m_bIsShowLevel;
        return __r;
    }
    void PostConstruct()
    {
        bool local_3 = this.GetCommonItemVM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_3 = local_6.IsValid();
        }
        if (local_3)
        {
            TEUIModelRef<FVM_Item> local_6;
            FText local_12;
            TEUIModelRef<FVM_CommonItem> local_2_2 = this.GetCommonItemVM();
            local_6.GetItemVM();
            local_12.GetEquipmentLevelText();
            this.SetDisplayLevelText(local_12);
        }
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
    const FText GetDisplayLevelText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_DisplayLevelText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayLevelText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayLevelText = __Value;
        return;
    }
    bool GetbIsShowLevel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsShowLevel;
    }
    void SetbIsShowLevel(const bool __Value) property
    {
        if (!(this.m_bIsShowLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsShowLevel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_Level
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_Level> Self;

    __GeneratedProperties_FVM_ItemFeature_Level()
    {
        return;
    }
}

namespace ItemFeature_Level_Util
{
void SetIsShowLevel(const FEUIModelContainer &inout ItemModelContainer, const bool InIsShowLevel)
{
    FVM_ItemFeature_Level& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetbIsShowLevel(InIsShowLevel);
    }
    return;
}
void SetDisplayLevelText(const FEUIModelContainer &inout ItemModelContainer, const FText &inout InDisplayLevelText)
{
    FVM_ItemFeature_Level& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetDisplayLevelText(InDisplayLevelText);
    }
    return;
}
}
namespace FVM_ItemFeature_Level
{
FVM_ItemFeature_Level& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_Level::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_Level CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_Level __r;
    TEUIModelRef<FVM_ItemFeature_Level> local_6 = TEUIModelRef<FVM_ItemFeature_Level>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_Level::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShowLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_Level>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_Level;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_Level;
}
FText __UIGetter_DisplayLevelText(const FVM_ItemFeature_Level &inout Model)
{
    return Model.GetDisplayLevelText();
}
bool __UIGetter_bIsShowLevel(const FVM_ItemFeature_Level &inout Model)
{
    return Model.GetbIsShowLevel();
}
TEUIModelRef<FVM_ItemFeature_Level> __UIGetter_Self(const FVM_ItemFeature_Level &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_Level>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
int __IndexOf_DisplayLevelText()
{
    return 1;
}
int __IndexOf_bIsShowLevel()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_Level
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
