
namespace FVM_TraitDetailList
{
    const int ModelId = 0;

}
struct FVM_TraitDetailList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_Trait;
    UPROPERTY()
    TArray<FEUIModelRef> m_ListItems;

    FVM_TraitDetailList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TraitDetailList' by default constructor.");
        return;
    }
    FVM_TraitDetailList(const FVM_TraitDetailList &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        this.m_ListItems = Other.m_ListItems;
        return;
    }
    FVM_TraitDetailList(const TEUIModelRef<FM_Trait> &inout InTrait)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTrait(InTrait);
        return;
    }
    FVM_TraitDetailList& opAssign(const FVM_TraitDetailList &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        return Other.m_ListItems;
    }
    void PostConstruct()
    {
        bool local_57 = false;
        bool local_58 = false;
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        TDataObjectPtr<FTraitConfig> local_26 = GetTraitConfig();
        TEUIModelRef<FM_Trait> local_2_2 = this.GetTrait();
        int local_51;
        local_51 = GetTraitLevel();
        int local_52 = ::NumericUtils::AsInt32(local_26.opArrow().LevelLimit);
        int local_55 = 1;
        for (; local_55 < (local_52 + 1); ++local_55)
        {
            local_57 = !local_57;
            if (!(local_57))
            {
                local_57 = false;
            }
            else
            {
                local_58 = !local_58;
                local_57 = local_58;
            }
            if (local_57)
            {
                XError(ELog(16), FString().Append("Trait level ").Append(local_55).Append(" is not found in trait config ").Append(local_26.GetDataName()));
                continue;
            }
            FM_Trait& local_68 = ::FM_Trait::Create(this.GetContext().Manager, local_26, local_55);
            local_58 = (local_55 == local_51);
            TEUIModelRef<FM_Trait> local_2_3 = TEUIModelRef<FM_Trait>(local_68);
            FEUIModelRef local_70;
            this.GetModify_ListItems().Add(local_70);
        }
        return;
    }
    FSoftBrush GetTraitIcon() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return GetTraitConfig().opArrow().TraitIcon;
    }
    FText GetTraitName() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return GetTraitConfig().opArrow().TraitName;
    }
    FText GetTraitLevelText() const
    {
        TEUIModelRef<FM_Trait> local_2 = this.GetTrait();
        return FText::Format(FText::AsCultureInvariant("Lv.{0}"), GetTraitLevel());
    }
    TEUIModelRef<FM_Trait> GetTrait() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Trait;
    }
    void SetTrait(const TEUIModelRef<FM_Trait> &inout __Value) property
    {
        TEUIModelRef<FM_Trait> local_2;
        local_2 = this.m_Trait;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Trait = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetListItems() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ListItems() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetListItems(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ListItems = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TraitDetailList
{
    UPROPERTY()
    FSoftBrush TraitIcon;
    UPROPERTY()
    FText TraitName;
    UPROPERTY()
    FText TraitLevelText;
    UPROPERTY()
    TEUIModelRef<FVM_TraitDetailList> Self;

    __GeneratedProperties_FVM_TraitDetailList()
    {
        return;
    }
}

namespace FVM_TraitDetailList
{
FVM_TraitDetailList& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout Trait)
{
    return FVM_TraitDetailList::CreateByManager(EUIInternal::GetContextManager(ContextObject), Trait);
}
FVM_TraitDetailList CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout Trait)
{
    FVM_TraitDetailList __r;
    TEUIModelRef<FVM_TraitDetailList> local_6 = TEUIModelRef<FVM_TraitDetailList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TraitDetailList::ModelId, 0, Trait));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ListItems";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitName";
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
    local_14.TypeName = "TEUIModelRef<FVM_TraitDetailList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TraitDetailList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TraitDetailList;
}
TArray<FEUIModelRef> __UIGetter_ListItems(const FVM_TraitDetailList &inout Model)
{
    return Model.GetListItems();
}
FSoftBrush __UIGetter_TraitIcon(const FVM_TraitDetailList &inout Model)
{
    return Model.GetTraitIcon();
}
FText __UIGetter_TraitName(const FVM_TraitDetailList &inout Model)
{
    return Model.GetTraitName();
}
FText __UIGetter_TraitLevelText(const FVM_TraitDetailList &inout Model)
{
    return Model.GetTraitLevelText();
}
TEUIModelRef<FVM_TraitDetailList> __UIGetter_Self(const FVM_TraitDetailList &inout Model)
{
    return TEUIModelRef<FVM_TraitDetailList>(Model);
}
int __IndexOf_Trait()
{
    return 0;
}
int __IndexOf_ListItems()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TraitDetailList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
