
namespace FVM_AvatarEquipmentItemInfoDetail
{
    const int ModelId = 0;

}
struct FVM_AvatarEquipmentItemInfoDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_EquipmentInfo;
    UPROPERTY()
    TArray<FEUIModelContainer> m_CurrentAttributeList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitInfoHover>> m_CurrentTraitList;
    UPROPERTY()
    FText m_EquipmentRandomTraitText;
    UPROPERTY()
    bool m_bCanShowRandomTraitText;
    UPROPERTY()
    bool m_bShowEquipmentDescription;

    FVM_AvatarEquipmentItemInfoDetail()
    {
        this.m_bCanShowRandomTraitText = false;
        this.m_bShowEquipmentDescription = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentItemInfoDetail' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentItemInfoDetail(const FVM_AvatarEquipmentItemInfoDetail &inout Other)
    {
        this.m_bCanShowRandomTraitText = false;
        this.m_bShowEquipmentDescription = true;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_CurrentAttributeList = Other.m_CurrentAttributeList;
        this.m_CurrentTraitList = Other.m_CurrentTraitList;
        this.m_EquipmentRandomTraitText = Other.m_EquipmentRandomTraitText;
        this.m_bCanShowRandomTraitText = Other.m_bCanShowRandomTraitText;
        this.m_bShowEquipmentDescription = Other.m_bShowEquipmentDescription;
        return;
    }
    FVM_AvatarEquipmentItemInfoDetail(const TEUIModelRef<FVM_EquipmentInfo> &inout InEquipmentInfo)
    {
        this.m_bCanShowRandomTraitText = false;
        this.m_bShowEquipmentDescription = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipmentInfo(InEquipmentInfo);
        return;
    }
    FVM_AvatarEquipmentItemInfoDetail opAssign(const FVM_AvatarEquipmentItemInfoDetail &inout Other)
    {
        FVM_AvatarEquipmentItemInfoDetail __r;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_CurrentAttributeList = Other.m_CurrentAttributeList;
        this.m_CurrentTraitList = Other.m_CurrentTraitList;
        this.m_EquipmentRandomTraitText = Other.m_EquipmentRandomTraitText;
        this.m_bCanShowRandomTraitText = Other.m_bCanShowRandomTraitText;
        this.m_bShowEquipmentDescription = Other.m_bShowEquipmentDescription;
        return __r;
    }
    void PostConstruct()
    {
        int local_52 = 0;
        TEUIModelRef<FVM_EquipmentInfo> local_2 = this.GetEquipmentInfo();
        for (auto& local_18 : GetEquipmentAttributes())
        {
            FEUIModelContainer local_32;
            local_32.AddModel(local_18, false);
            this.GetModify_CurrentAttributeList().Add(local_32);
        }
        TEUIModelRef<FVM_EquipmentInfo> local_2_2 = this.GetEquipmentInfo();
        for (auto& local_48 : GetEquipmentTraits())
        {
            local_48;
            TEUIModelRef<FM_Trait> local_50;
            local_50.GetTrait();
            this.GetModify_CurrentTraitList().Add(TEUIModelRef<FVM_TraitInfoHover>(local_52));
        }
        return;
    }
    void EnableShowRandomTraitText()
    {
        int local_53 = 0;
        TEUIModelRef<FVM_EquipmentInfo> local_2 = this.GetEquipmentInfo();
        TDataObjectPtr<FEquipmentConfig> local_26;
        local_26.GetEquipmentConfig();
        if (local_26)
        {
            this.SetbCanShowRandomTraitText((0 > 0));
            if (this.GetbCanShowRandomTraitText())
            {
                this.SetEquipmentRandomTraitText(FText::Format(NSLOCTEXT("RandomTraitText", "йљЏжњє{0}дёЄиЇЌжќЎ"), local_53));
            }
        }
        return;
    }
    void SetIsEquipmentDescriptionShow(const bool bShow)
    {
        this.SetbShowEquipmentDescription(bShow);
        return;
    }
    void SetAttributeList(const TArray<FEUIModelContainer> &inout InAttributeList)
    {
        this.SetCurrentAttributeList(InAttributeList);
        return;
    }
    FText GetEquipmentDescription() const
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2 = this.GetEquipmentInfo();
        TDataObjectPtr<FEquipmentConfig> local_26;
        local_26.GetEquipmentConfig();
        if (local_26)
        {
            return local_26.opArrow().ItemBackgroundDescription;
        }
        return FText();
    }
    TEUIModelRef<FVM_EquipmentInfo> GetEquipmentInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EquipmentInfo;
    }
    void SetEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_EquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EquipmentInfo = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetCurrentAttributeList() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_CurrentAttributeList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCurrentAttributeList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentAttributeList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitInfoHover>> GetCurrentTraitList() const property
    {
        const TArray<TEUIModelRef<FVM_TraitInfoHover>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitInfoHover>> GetModify_CurrentTraitList() property
    {
        TArray<TEUIModelRef<FVM_TraitInfoHover>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentTraitList(const TArray<TEUIModelRef<FVM_TraitInfoHover>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentTraitList = __Value;
        return;
    }
    const FText GetEquipmentRandomTraitText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_EquipmentRandomTraitText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipmentRandomTraitText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentRandomTraitText = __Value;
        return;
    }
    bool GetbCanShowRandomTraitText() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bCanShowRandomTraitText;
    }
    void SetbCanShowRandomTraitText(const bool __Value) property
    {
        if (!(this.m_bCanShowRandomTraitText) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bCanShowRandomTraitText = __Value;
        return;
    }
    bool GetbShowEquipmentDescription() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bShowEquipmentDescription;
    }
    void SetbShowEquipmentDescription(const bool __Value) property
    {
        if (!(this.m_bShowEquipmentDescription) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bShowEquipmentDescription = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentItemInfoDetail
{
    UPROPERTY()
    FText EquipmentDescription;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> Self;

    __GeneratedProperties_FVM_AvatarEquipmentItemInfoDetail()
    {
        return;
    }
}

namespace FVM_AvatarEquipmentItemInfoDetail
{
FVM_AvatarEquipmentItemInfoDetail& Create(const UObject ContextObject, const TEUIModelRef<FVM_EquipmentInfo> &inout EquipmentInfo)
{
    return FVM_AvatarEquipmentItemInfoDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject), EquipmentInfo);
}
FVM_AvatarEquipmentItemInfoDetail CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_EquipmentInfo> &inout EquipmentInfo)
{
    FVM_AvatarEquipmentItemInfoDetail __r;
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_6 = TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentItemInfoDetail::ModelId, 0, EquipmentInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentAttributeList";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTraitList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitInfoHover>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentRandomTraitText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanShowRandomTraitText";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowEquipmentDescription";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentItemInfoDetail;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentItemInfoDetail;
}
TArray<FEUIModelContainer> __UIGetter_CurrentAttributeList(const FVM_AvatarEquipmentItemInfoDetail &inout Model)
{
    return Model.GetCurrentAttributeList();
}
TArray<TEUIModelRef<FVM_TraitInfoHover>> __UIGetter_CurrentTraitList(const FVM_AvatarEquipmentItemInfoDetail &inout Model)
{
    return Model.GetCurrentTraitList();
}
FText __UIGetter_EquipmentRandomTraitText(const FVM_AvatarEquipmentItemInfoDetail &inout Model)
{
    return Model.GetEquipmentRandomTraitText();
}
bool __UIGetter_bCanShowRandomTraitText(const FVM_AvatarEquipmentItemInfoDetail &inout Model)
{
    return Model.GetbCanShowRandomTraitText();
}
bool __UIGetter_bShowEquipmentDescription(const FVM_AvatarEquipmentItemInfoDetail &inout Model)
{
    return Model.GetbShowEquipmentDescription();
}
FText __UIGetter_EquipmentDescription(const FVM_AvatarEquipmentItemInfoDetail &inout Model)
{
    return Model.GetEquipmentDescription();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __UIGetter_Self(const FVM_AvatarEquipmentItemInfoDetail &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(Model);
}
int __IndexOf_EquipmentInfo()
{
    return 0;
}
int __IndexOf_CurrentAttributeList()
{
    return 1;
}
int __IndexOf_CurrentTraitList()
{
    return 2;
}
int __IndexOf_EquipmentRandomTraitText()
{
    return 3;
}
int __IndexOf_bCanShowRandomTraitText()
{
    return 4;
}
int __IndexOf_bShowEquipmentDescription()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentItemInfoDetail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
