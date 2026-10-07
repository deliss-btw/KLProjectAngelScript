
namespace FVM_AvatarEquipmentTraitHoverTips
{
    const int ModelId = 0;

}
struct FVM_AvatarEquipmentTraitHoverTips : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Trait> m_Trait;
    UPROPERTY()
    TEUIModelRef<FVM_TraitInfoHover> m_TraitInfo;
    UPROPERTY()
    TArray<FEUIModelRef> m_ListItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitSourceInfo>> m_TraitSourceList;

    FVM_AvatarEquipmentTraitHoverTips()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentTraitHoverTips' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentTraitHoverTips(const FVM_AvatarEquipmentTraitHoverTips &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        this.m_TraitInfo = Other.m_TraitInfo;
        this.m_ListItems = Other.m_ListItems;
        this.m_TraitSourceList = Other.m_TraitSourceList;
        return;
    }
    FVM_AvatarEquipmentTraitHoverTips(const TEUIModelRef<FM_Trait> &inout InTrait)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTrait(InTrait);
        return;
    }
    FVM_AvatarEquipmentTraitHoverTips& opAssign(const FVM_AvatarEquipmentTraitHoverTips &inout Other)
    {
        this.m_Trait = Other.m_Trait;
        this.m_TraitInfo = Other.m_TraitInfo;
        this.m_ListItems = Other.m_ListItems;
        return Other.m_TraitSourceList;
    }
    void PostConstruct()
    {
        bool local_60 = false;
        bool local_71 = false;
        bool local_1 = true;
        this.SetTraitInfo(TEUIModelRef<FVM_TraitInfoHover>(::FVM_TraitInfoHover::Create(this.GetContext().Manager, this.GetTrait(), local_1)));
        TEUIModelRef<FM_Trait> local_4 = this.GetTrait();
        TDataObjectPtr<FTraitConfig> local_30 = GetTraitConfig();
        TEUIModelRef<FM_Trait> local_4_2 = this.GetTrait();
        int local_56 = GetTraitLevel();
        int local_55;
        local_55 = local_56;
        int local_56_2 = ::NumericUtils::AsInt32(local_30.opArrow().LevelLimit);
        int local_59 = 1;
        for (; local_59 <= local_56_2; ++local_59)
        {
            local_1 = !local_1;
            if (!(local_1))
            {
                local_1 = false;
            }
            else
            {
                local_60 = !local_60;
                local_1 = local_60;
            }
            if (local_1)
            {
                XError(ELog(16), FString().Append("Trait level ").Append(local_59).Append(" is not found in trait config ").Append(local_30.GetDataName()));
                continue;
            }
            local_71 = local_59 == local_55 || (local_59 == local_56_2 && (local_55 >= local_56_2));
            TEUIModelRef<FM_Trait> local_4_3 = TEUIModelRef<FM_Trait>((::FM_Trait::Create(this.GetContext().Manager, local_30, local_59)));
            FEUIModelRef local_74;
            this.GetModify_ListItems().Add(local_74);
        }
        return;
    }
    bool GetShowTraitSourceList() const
    {
        return (this.GetTraitSourceList().Num() > 0);
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
    TEUIModelRef<FVM_TraitInfoHover> GetTraitInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TraitInfo;
    }
    void SetTraitInfo(const TEUIModelRef<FVM_TraitInfoHover> &inout __Value) property
    {
        TEUIModelRef<FVM_TraitInfoHover> local_2;
        local_2 = this.m_TraitInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TraitInfo = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetListItems() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ListItems() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetListItems(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ListItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitSourceInfo>> GetTraitSourceList() const property
    {
        const TArray<TEUIModelRef<FVM_TraitSourceInfo>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitSourceInfo>> GetModify_TraitSourceList() property
    {
        TArray<TEUIModelRef<FVM_TraitSourceInfo>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTraitSourceList(const TArray<TEUIModelRef<FVM_TraitSourceInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TraitSourceList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentTraitHoverTips
{
    UPROPERTY()
    bool ShowTraitSourceList;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> Self;


}

namespace FVM_AvatarEquipmentTraitHoverTips
{
FVM_AvatarEquipmentTraitHoverTips& Create(const UObject ContextObject, const TEUIModelRef<FM_Trait> &inout Trait)
{
    return FVM_AvatarEquipmentTraitHoverTips::CreateByManager(EUIInternal::GetContextManager(ContextObject), Trait);
}
FVM_AvatarEquipmentTraitHoverTips CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Trait> &inout Trait)
{
    FVM_AvatarEquipmentTraitHoverTips __r;
    TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> local_6 = TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentTraitHoverTips::ModelId, 0, Trait));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TraitInfo";
    local_14.TypeName = "TEUIModelRef<FVM_TraitInfoHover>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ListItems";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitSourceList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitSourceInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowTraitSourceList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentTraitHoverTips;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentTraitHoverTips;
}
TEUIModelRef<FVM_TraitInfoHover> __UIGetter_TraitInfo(const FVM_AvatarEquipmentTraitHoverTips &inout Model)
{
    return Model.GetTraitInfo();
}
TArray<FEUIModelRef> __UIGetter_ListItems(const FVM_AvatarEquipmentTraitHoverTips &inout Model)
{
    return Model.GetListItems();
}
TArray<TEUIModelRef<FVM_TraitSourceInfo>> __UIGetter_TraitSourceList(const FVM_AvatarEquipmentTraitHoverTips &inout Model)
{
    return Model.GetTraitSourceList();
}
bool __UIGetter_ShowTraitSourceList(const FVM_AvatarEquipmentTraitHoverTips &inout Model)
{
    return Model.GetShowTraitSourceList();
}
TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> __UIGetter_Self(const FVM_AvatarEquipmentTraitHoverTips &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>(Model);
}
int __IndexOf_Trait()
{
    return 0;
}
int __IndexOf_TraitInfo()
{
    return 1;
}
int __IndexOf_ListItems()
{
    return 2;
}
int __IndexOf_TraitSourceList()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentTraitHoverTips
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
