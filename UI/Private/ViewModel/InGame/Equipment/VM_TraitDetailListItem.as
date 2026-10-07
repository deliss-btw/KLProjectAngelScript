
namespace FVM_TraitDetailListItem
{
    const int ModelId = 0;

}
struct FVM_TraitDetailListItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_TraitInfo;
    UPROPERTY()
    bool m_bIsCurrentLevel;

    FVM_TraitDetailListItem()
    {
        this.m_bIsCurrentLevel = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TraitDetailListItem' by default constructor.");
        return;
    }
    FVM_TraitDetailListItem(const FVM_TraitDetailListItem &inout Other)
    {
        this.m_bIsCurrentLevel = false;
        this.m_TraitInfo = Other.m_TraitInfo;
        this.m_bIsCurrentLevel = Other.m_bIsCurrentLevel;
        return;
    }
    FVM_TraitDetailListItem(const TEUIModelRef<FM_Trait> &inout InTraitInfo, const bool InbIsCurrentLevel)
    {
        this.m_bIsCurrentLevel = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTraitInfo(InTraitInfo);
        this.SetbIsCurrentLevel(InbIsCurrentLevel);
        return;
    }
    FVM_TraitDetailListItem opAssign(const FVM_TraitDetailListItem &inout Other)
    {
        FVM_TraitDetailListItem __r;
        this.m_TraitInfo = Other.m_TraitInfo;
        this.m_bIsCurrentLevel = Other.m_bIsCurrentLevel;
        return __r;
    }
    FText GetTraitDescription() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTraitInfo();
        FText local_6;
        local_6.GetTraitDescription();
        return local_6;
    }
    FText GetTraitLevelText() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTraitInfo();
        return FText::Format(FText::AsCultureInvariant("Lv.{0}"), GetTraitLevel());
    }
    TEUIModelRef<FM_Trait> GetTraitInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TraitInfo;
    }
    void SetTraitInfo(const TEUIModelRef<FM_Trait> &inout __Value) property
    {
        TEUIModelRef<FM_Trait> local_2;
        local_2 = this.m_TraitInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TraitInfo = __Value;
        return;
    }
    bool GetbIsCurrentLevel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsCurrentLevel;
    }
    void SetbIsCurrentLevel(const bool __Value) property
    {
        if (!(this.m_bIsCurrentLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsCurrentLevel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TraitDetailListItem
{
    UPROPERTY()
    FText TraitDescription;
    UPROPERTY()
    FText TraitLevelText;
    UPROPERTY()
    TEUIModelRef<FVM_TraitDetailListItem> Self;

    __GeneratedProperties_FVM_TraitDetailListItem()
    {
        return;
    }
}

namespace FVM_TraitDetailListItem
{
FVM_TraitDetailListItem& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout TraitInfo, const bool bIsCurrentLevel)
{
    return FVM_TraitDetailListItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), TraitInfo, bIsCurrentLevel);
}
FVM_TraitDetailListItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout TraitInfo, const bool bIsCurrentLevel)
{
    FVM_TraitDetailListItem __r;
    TEUIModelRef<FVM_TraitDetailListItem> local_6 = TEUIModelRef<FVM_TraitDetailListItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TraitDetailListItem::ModelId, 0, TraitInfo, bIsCurrentLevel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsCurrentLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TraitDetailListItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TraitDetailListItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TraitDetailListItem;
}
bool __UIGetter_bIsCurrentLevel(const FVM_TraitDetailListItem &inout Model)
{
    return Model.GetbIsCurrentLevel();
}
FText __UIGetter_TraitDescription(const FVM_TraitDetailListItem &inout Model)
{
    return Model.GetTraitDescription();
}
FText __UIGetter_TraitLevelText(const FVM_TraitDetailListItem &inout Model)
{
    return Model.GetTraitLevelText();
}
TEUIModelRef<FVM_TraitDetailListItem> __UIGetter_Self(const FVM_TraitDetailListItem &inout Model)
{
    return TEUIModelRef<FVM_TraitDetailListItem>(Model);
}
int __IndexOf_TraitInfo()
{
    return 0;
}
int __IndexOf_bIsCurrentLevel()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TraitDetailListItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
