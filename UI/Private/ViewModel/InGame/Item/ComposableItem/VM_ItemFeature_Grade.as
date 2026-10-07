
namespace FVM_ItemFeature_Grade
{
    const int ModelId = 0;

}
struct FVM_ItemFeature_Grade : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    FSoftBrush m_ItemRarityImage;

    FVM_ItemFeature_Grade()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_Grade' by default constructor.");
        return;
    }
    FVM_ItemFeature_Grade(const FVM_ItemFeature_Grade &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_ItemRarityImage = Other.m_ItemRarityImage;
        return;
    }
    FVM_ItemFeature_Grade(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_Grade& opAssign(const FVM_ItemFeature_Grade &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        return Other.m_ItemRarityImage;
    }
    void PostConstruct()
    {
        int local_31 = 0;
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
        if (::UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_31)).IsSet())
        {
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
    const FSoftBrush GetItemRarityImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_ItemRarityImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemRarityImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemRarityImage = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_Grade
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_Grade> Self;

    __GeneratedProperties_FVM_ItemFeature_Grade()
    {
        return;
    }
}

namespace ItemFeature_Grade_Util
{
void SetItemRarityImage(const FEUIModelContainer &inout ItemModelContainer, const FSoftBrush &inout InItemRarityImage)
{
    FVM_ItemFeature_Grade& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetItemRarityImage(InItemRarityImage);
    }
    return;
}
}
namespace FVM_ItemFeature_Grade
{
FVM_ItemFeature_Grade& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_Grade::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_Grade CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_Grade __r;
    TEUIModelRef<FVM_ItemFeature_Grade> local_6 = TEUIModelRef<FVM_ItemFeature_Grade>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_Grade::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemRarityImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_Grade>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_Grade;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_Grade;
}
FSoftBrush __UIGetter_ItemRarityImage(const FVM_ItemFeature_Grade &inout Model)
{
    return Model.GetItemRarityImage();
}
TEUIModelRef<FVM_ItemFeature_Grade> __UIGetter_Self(const FVM_ItemFeature_Grade &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_Grade>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
int __IndexOf_ItemRarityImage()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_Grade
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
