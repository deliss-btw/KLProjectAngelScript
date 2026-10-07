
namespace FVM_ItemFeature_SpecialProps
{
    const int ModelId = 0;

}
struct FVM_ItemFeature_SpecialProps : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;

    FVM_ItemFeature_SpecialProps()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_SpecialProps' by default constructor.");
        return;
    }
    FVM_ItemFeature_SpecialProps(const FVM_ItemFeature_SpecialProps &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        return;
    }
    FVM_ItemFeature_SpecialProps(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_SpecialProps& opAssign(const FVM_ItemFeature_SpecialProps &inout Other)
    {
        return Other.m_CommonItemVM;
    }
    void PostConstruct()
    {
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
}

class UItemFeatureCondition_SpecialProps : UItemFeatureConditionBase
{
    UItemFeatureCondition_SpecialProps()
    {
        super();
        return;
    }
    bool IsConditionMet(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        if (!(ItemData.IsValid()))
        {
            return false;
        }
        TDataObjectPtr<FItemConfig> local_26 = GetConfig();
        if (!(local_26.IsSet()))
        {
            return false;
        }
        TDataObjectPtr<FItemFeatureConfig> local_122 = TDataObjectPtr<FItemFeatureConfig>(::FItemFeatureConfig::FindByKey(local_26));
        bool local_1 = !(local_122.IsSet());
        if (local_1)
        {
            return false;
        }
        return local_1;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_SpecialProps
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_SpecialProps> Self;

    __GeneratedProperties_FVM_ItemFeature_SpecialProps()
    {
        return;
    }
}

namespace FVM_ItemFeature_SpecialProps
{
FVM_ItemFeature_SpecialProps& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_SpecialProps::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_SpecialProps CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_SpecialProps __r;
    TEUIModelRef<FVM_ItemFeature_SpecialProps> local_6 = TEUIModelRef<FVM_ItemFeature_SpecialProps>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_SpecialProps::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_SpecialProps>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_SpecialProps;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_SpecialProps;
}
TEUIModelRef<FVM_ItemFeature_SpecialProps> __UIGetter_Self(const FVM_ItemFeature_SpecialProps &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_SpecialProps>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_SpecialProps
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
