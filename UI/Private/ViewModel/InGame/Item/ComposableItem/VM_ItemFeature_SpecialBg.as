namespace FVM_ItemFeature_SpecialBg
{
    const int ModelId = 0;

}
struct FVM_ItemFeature_SpecialBg : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    FSoftBrush m_SpecialBgImage;

    FVM_ItemFeature_SpecialBg()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_SpecialBg' by default constructor.");
        return;
    }
    FVM_ItemFeature_SpecialBg(const FVM_ItemFeature_SpecialBg &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_SpecialBgImage = Other.m_SpecialBgImage;
        return;
    }
    FVM_ItemFeature_SpecialBg(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_SpecialBg& opAssign(const FVM_ItemFeature_SpecialBg &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        return Other.m_SpecialBgImage;
    }
    void PostConstruct()
    {
        if (!(this.GetCommonItemVM().IsValid()) || !(this.GetCommonItemVM().Get().GetItemConfig().IsSet()))
        {
            return;
        }
        TDataObjectPtr<FItemFeatureConfig> local_28 = TDataObjectPtr<FItemFeatureConfig>(::FItemFeatureConfig::FindByKey(this.GetCommonItemVM().Get().GetItemConfig()));
        if (!(local_28.IsSet()))
        {
            return;
        }
        this.SetSpecialBgImage(local_28.Get().SpecialBgImage);
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
    const FSoftBrush GetSpecialBgImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_SpecialBgImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSpecialBgImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpecialBgImage = __Value;
        return;
    }
}

class UItemFeatureCondition_SpecialBg : UItemFeatureConditionBase
{
    UItemFeatureCondition_SpecialBg()
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
        TDataObjectPtr<FItemConfig> local_26 = ItemData.Get().GetConfig();
        if (!(local_26.IsSet()))
        {
            return false;
        }
        TDataObjectPtr<FItemFeatureConfig> local_74 = TDataObjectPtr<FItemFeatureConfig>(::FItemFeatureConfig::FindByKey(local_26));
        if (!(local_74.IsSet()))
        {
            return false;
        }
        return local_74.Get().bSpecialBg;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_SpecialBg
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_SpecialBg> Self;

    __GeneratedProperties_FVM_ItemFeature_SpecialBg()
    {
        return;
    }
}

namespace ItemFeature_SpecialBg_Util
{
FSoftBrush GetSpecialBgImage(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig.IsSet()))
    {
        return FSoftBrush();
    }
    TDataObjectPtr<FItemFeatureConfig> local_72 = TDataObjectPtr<FItemFeatureConfig>(FItemFeatureConfig::FindByKey(ItemConfig));
    if (!(local_72.IsSet()) || !(local_72.Get().bSpecialBg))
    {
        return FSoftBrush();
    }
    return local_72.Get().SpecialBgImage;
}
void SetSpecialBgImage(const FEUIModelContainer &inout ItemModelContainer, const FSoftBrush &inout InSpecialBgImage)
{
    FVM_ItemFeature_SpecialBg& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetSpecialBgImage(InSpecialBgImage);
    }
    return;
}
}
namespace FVM_ItemFeature_SpecialBg
{
FVM_ItemFeature_SpecialBg& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_SpecialBg::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_SpecialBg& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return TEUIModelRef<FVM_ItemFeature_SpecialBg>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_SpecialBg::ModelId, 0, CommonItemVM)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SpecialBgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_SpecialBg>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_SpecialBg;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_SpecialBg;
}
FSoftBrush __UIGetter_SpecialBgImage(const FVM_ItemFeature_SpecialBg &inout Model)
{
    return Model.GetSpecialBgImage();
}
TEUIModelRef<FVM_ItemFeature_SpecialBg> __UIGetter_Self(const FVM_ItemFeature_SpecialBg &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_SpecialBg>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
int __IndexOf_SpecialBgImage()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_SpecialBg
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_ItemFeature_SpecialBg.Get();
}
}
