
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
        bool local_3 = !(this.GetCommonItemVM().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FVM_CommonItem> local_2 = this.GetCommonItemVM();
            local_3 = !(GetItemConfig().IsSet());
        }
        if (local_3)
        {
            return;
        }
        TEUIModelRef<FVM_CommonItem> local_2_2 = this.GetCommonItemVM();
        TDataObjectPtr<FItemFeatureConfig> local_76 = TDataObjectPtr<FItemFeatureConfig>(::FItemFeatureConfig::FindByKey(GetItemConfig()));
        if (!(local_76.IsSet()))
        {
            return;
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
    bool local_145 = false;
    FSoftBrush __r;
    if (!(ItemConfig.IsSet()))
    {
        return FSoftBrush();
    }
    TDataObjectPtr<FItemFeatureConfig> local_120 = TDataObjectPtr<FItemFeatureConfig>(FItemFeatureConfig::FindByKey(ItemConfig));
    bool local_1 = !(local_120.IsSet());
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        local_145 = !local_145;
        local_1 = local_145;
    }
    if (local_1)
    {
        return FSoftBrush();
    }
    return __r;
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
FVM_ItemFeature_SpecialBg CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_SpecialBg __r;
    TEUIModelRef<FVM_ItemFeature_SpecialBg> local_6 = TEUIModelRef<FVM_ItemFeature_SpecialBg>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_SpecialBg::ModelId, 0, CommonItemVM));
    return __r;
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
    UScriptStruct local_2;
    return local_2;
}
}
