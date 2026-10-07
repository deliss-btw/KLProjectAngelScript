
namespace FVM_AvatarEquipmentItemInfoCompare
{
    const int ModelId = 0;

}
struct FVM_AvatarEquipmentItemInfoCompare : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_CurEquipmentInfo;
    UPROPERTY()
    bool m_bShowEquiptingAvatarText;
    UPROPERTY()
    bool m_bShowCompareEquiptingAvatarText;
    UPROPERTY()
    FText m_EquiptingAvatarText;
    UPROPERTY()
    FText m_CompareEquiptingAvatarText;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> m_CurEquipItemInfoTitle;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> m_CurEquipItemInfoDetail;
    UPROPERTY()
    bool m_bCanShowCompareInfo;
    UPROPERTY()
    bool m_bCanShowCompareOverview;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfo> m_CompareItemInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentCompareOverview> m_CompareOverview;
    UPROPERTY()
    TArray<FEUIModelContainer> m_CompareAttributeList;

    FVM_AvatarEquipmentItemInfoCompare()
    {
        this.m_bShowEquiptingAvatarText = false;
        this.m_bShowCompareEquiptingAvatarText = false;
        this.m_bCanShowCompareInfo = false;
        this.m_bCanShowCompareOverview = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentItemInfoCompare' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentItemInfoCompare(const FVM_AvatarEquipmentItemInfoCompare &inout Other)
    {
        this.m_bShowEquiptingAvatarText = false;
        this.m_bShowCompareEquiptingAvatarText = false;
        this.m_bCanShowCompareInfo = false;
        this.m_bCanShowCompareOverview = true;
        this.m_CurEquipmentInfo = Other.m_CurEquipmentInfo;
        this.m_bShowEquiptingAvatarText = Other.m_bShowEquiptingAvatarText;
        this.m_bShowCompareEquiptingAvatarText = Other.m_bShowCompareEquiptingAvatarText;
        this.m_EquiptingAvatarText = Other.m_EquiptingAvatarText;
        this.m_CompareEquiptingAvatarText = Other.m_CompareEquiptingAvatarText;
        this.m_CurEquipItemInfoTitle = Other.m_CurEquipItemInfoTitle;
        this.m_CurEquipItemInfoDetail = Other.m_CurEquipItemInfoDetail;
        this.m_bCanShowCompareInfo = Other.m_bCanShowCompareInfo;
        this.m_bCanShowCompareOverview = Other.m_bCanShowCompareOverview;
        this.m_CompareItemInfo = Other.m_CompareItemInfo;
        this.m_CompareOverview = Other.m_CompareOverview;
        this.m_CompareAttributeList = Other.m_CompareAttributeList;
        return;
    }
    FVM_AvatarEquipmentItemInfoCompare(const TEUIModelRef<FVM_EquipmentInfo> &inout InCurEquipmentInfo)
    {
        this.m_bShowEquiptingAvatarText = false;
        this.m_bShowCompareEquiptingAvatarText = false;
        this.m_bCanShowCompareInfo = false;
        this.m_bCanShowCompareOverview = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCurEquipmentInfo(InCurEquipmentInfo);
        return;
    }
    FVM_AvatarEquipmentItemInfoCompare& opAssign(const FVM_AvatarEquipmentItemInfoCompare &inout Other)
    {
        this.m_CurEquipmentInfo = Other.m_CurEquipmentInfo;
        this.m_bShowEquiptingAvatarText = Other.m_bShowEquiptingAvatarText;
        this.m_bShowCompareEquiptingAvatarText = Other.m_bShowCompareEquiptingAvatarText;
        this.m_EquiptingAvatarText = Other.m_EquiptingAvatarText;
        this.m_CompareEquiptingAvatarText = Other.m_CompareEquiptingAvatarText;
        this.m_CurEquipItemInfoTitle = Other.m_CurEquipItemInfoTitle;
        this.m_CurEquipItemInfoDetail = Other.m_CurEquipItemInfoDetail;
        this.m_bCanShowCompareInfo = Other.m_bCanShowCompareInfo;
        this.m_bCanShowCompareOverview = Other.m_bCanShowCompareOverview;
        this.m_CompareItemInfo = Other.m_CompareItemInfo;
        this.m_CompareOverview = Other.m_CompareOverview;
        return Other.m_CompareAttributeList;
    }
    void PostConstruct()
    {
        this.RefreshCurItemInfoDisplay(this.GetCurEquipmentInfo());
        return;
    }
    void RefreshCurItemInfoDisplay(const TEUIModelRef<FVM_EquipmentInfo> &inout NewEquipmentInfo)
    {
        if (NewEquipmentInfo.IsValid())
        {
            TEUIModelRef<FM_Equipment> local_10;
            this.SetCurEquipmentInfo(NewEquipmentInfo);
            this.SetCurEquipItemInfoTitle(TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(::FVM_AvatarEquipmentItemInfoTitle::Create(this.GetContext().Manager, this.GetCurEquipmentInfo())));
            this.SetCurEquipItemInfoDetail(TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(::FVM_AvatarEquipmentItemInfoDetail::Create(this.GetContext().Manager, this.GetCurEquipmentInfo())));
            TEUIModelRef<FVM_EquipmentInfo> local_4 = this.GetCurEquipmentInfo();
            local_10.GetEquipment();
            if (local_10.IsValid())
            {
                TEUIModelRef<FVM_EquipmentInfo> local_4_2 = this.GetCurEquipmentInfo();
                local_10.GetEquipment();
                this.SetCurItemEquiptingAvatarText(GetEquiptingAvatar());
            }
        }
        return;
    }
    void SetCurItemEquiptingAvatarText(const TDataObjectPtr<FAvatarPrefabConfig> &inout CurrentEquiptingAvatarCfg)
    {
        this.SetbShowEquiptingAvatarText(CurrentEquiptingAvatarCfg.IsSet());
        if (this.GetbShowEquiptingAvatarText())
        {
            NSLOCTEXT("EquiptingAvatarText", "{0}иЈ…е¤‡дё­");
            FText local_10;
            this.SetEquiptingAvatarText(local_10);
        }
        return;
    }
    void SetCompareEquipment(const TEUIModelRef<FVM_EquipmentInfo> &inout InCompareEquipmentInfo, const TDataObjectPtr<FAvatarPrefabConfig> &inout CurrentAvatarCfg)
    {
        this.SetbCanShowCompareInfo(false);
        this.SetCompareItemInfo(TEUIModelRef<FVM_AvatarEquipmentItemInfo>(nullptr));
        this.SetCompareOverview(TEUIModelRef<FVM_AvatarEquipmentCompareOverview>(nullptr));
        if (InCompareEquipmentInfo.IsValid())
        {
            TEUIModelRef<FM_Equipment> local_10;
            this.SetbCanShowCompareInfo(true);
            this.SetCompareItemInfo(TEUIModelRef<FVM_AvatarEquipmentItemInfo>(::FVM_AvatarEquipmentItemInfo::Create(this.GetContext().Manager, InCompareEquipmentInfo)));
            if (CurrentAvatarCfg.IsSet())
            {
                this.SetCompareOverview(TEUIModelRef<FVM_AvatarEquipmentCompareOverview>(::FVM_AvatarEquipmentCompareOverview::Create(this.GetContext().Manager, CurrentAvatarCfg, InCompareEquipmentInfo, this.GetCurEquipmentInfo())));
            }
            local_10.GetEquipment();
            if (local_10.IsValid())
            {
                local_10.GetEquipment();
                this.SetbShowCompareEquiptingAvatarText(GetEquiptingAvatar().IsSet());
                if (this.GetbShowCompareEquiptingAvatarText())
                {
                    local_10.GetEquipment();
                    NSLOCTEXT("CompareEquiptingAvatarText", "{0}иЈ…е¤‡дё­");
                    FText local_18;
                    this.SetCompareEquiptingAvatarText(local_18);
                }
            }
        }
        this.RefreshCompareAttributeList(InCompareEquipmentInfo);
        return;
    }
    void SetIsCompareOverviewShow(const bool bIsShow)
    {
        this.SetbCanShowCompareOverview(bIsShow);
        return;
    }
    void RefreshCompareAttributeList(const TEUIModelRef<FVM_EquipmentInfo> &inout InCompareEquipmentInfo)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    TEUIModelRef<FVM_EquipmentInfo> GetCurEquipmentInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurEquipmentInfo;
    }
    void SetCurEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_CurEquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurEquipmentInfo = __Value;
        return;
    }
    bool GetbShowEquiptingAvatarText() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bShowEquiptingAvatarText;
    }
    void SetbShowEquiptingAvatarText(const bool __Value) property
    {
        if (!(this.m_bShowEquiptingAvatarText) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bShowEquiptingAvatarText = __Value;
        return;
    }
    bool GetbShowCompareEquiptingAvatarText() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bShowCompareEquiptingAvatarText;
    }
    void SetbShowCompareEquiptingAvatarText(const bool __Value) property
    {
        if (!(this.m_bShowCompareEquiptingAvatarText) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bShowCompareEquiptingAvatarText = __Value;
        return;
    }
    FText GetEquiptingAvatarText() const property
    {
        FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_EquiptingAvatarText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquiptingAvatarText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquiptingAvatarText = __Value;
        return;
    }
    const FText GetCompareEquiptingAvatarText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_CompareEquiptingAvatarText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCompareEquiptingAvatarText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CompareEquiptingAvatarText = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> GetCurEquipItemInfoTitle() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurEquipItemInfoTitle;
    }
    void SetCurEquipItemInfoTitle(const TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> local_2;
        local_2 = this.m_CurEquipItemInfoTitle;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurEquipItemInfoTitle = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> GetCurEquipItemInfoDetail() const property
    {
        this.TrackPropertyRead(6);
        return this.m_CurEquipItemInfoDetail;
    }
    void SetCurEquipItemInfoDetail(const TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_2;
        local_2 = this.m_CurEquipItemInfoDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CurEquipItemInfoDetail = __Value;
        return;
    }
    bool GetbCanShowCompareInfo() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bCanShowCompareInfo;
    }
    void SetbCanShowCompareInfo(const bool __Value) property
    {
        if (!(this.m_bCanShowCompareInfo) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bCanShowCompareInfo = __Value;
        return;
    }
    bool GetbCanShowCompareOverview() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bCanShowCompareOverview;
    }
    void SetbCanShowCompareOverview(const bool __Value) property
    {
        if (!(this.m_bCanShowCompareOverview) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bCanShowCompareOverview = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfo> GetCompareItemInfo() const property
    {
        this.TrackPropertyRead(9);
        return this.m_CompareItemInfo;
    }
    void SetCompareItemInfo(const TEUIModelRef<FVM_AvatarEquipmentItemInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_2;
        local_2 = this.m_CompareItemInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CompareItemInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentCompareOverview> GetCompareOverview() const property
    {
        this.TrackPropertyRead(10);
        return this.m_CompareOverview;
    }
    void SetCompareOverview(const TEUIModelRef<FVM_AvatarEquipmentCompareOverview> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentCompareOverview> local_2;
        local_2 = this.m_CompareOverview;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CompareOverview = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetCompareAttributeList() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_CompareAttributeList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetCompareAttributeList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CompareAttributeList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentItemInfoCompare
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> Self;

    __GeneratedProperties_FVM_AvatarEquipmentItemInfoCompare()
    {
        return;
    }
}

namespace FVM_AvatarEquipmentItemInfoCompare
{
FVM_AvatarEquipmentItemInfoCompare& Create(const UObject ContextObject, const TEUIModelRef<FVM_EquipmentInfo> &inout CurEquipmentInfo)
{
    return FVM_AvatarEquipmentItemInfoCompare::CreateByManager(EUIInternal::GetContextManager(ContextObject), CurEquipmentInfo);
}
FVM_AvatarEquipmentItemInfoCompare CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_EquipmentInfo> &inout CurEquipmentInfo)
{
    FVM_AvatarEquipmentItemInfoCompare __r;
    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_6 = TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentItemInfoCompare::ModelId, 0, CurEquipmentInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bShowEquiptingAvatarText";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowCompareEquiptingAvatarText";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquiptingAvatarText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareEquiptingAvatarText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurEquipItemInfoTitle";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurEquipItemInfoDetail";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanShowCompareInfo";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanShowCompareOverview";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareItemInfo";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareOverview";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentCompareOverview>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CompareAttributeList";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentItemInfoCompare;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentItemInfoCompare;
}
bool __UIGetter_bShowEquiptingAvatarText(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetbShowEquiptingAvatarText();
}
bool __UIGetter_bShowCompareEquiptingAvatarText(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetbShowCompareEquiptingAvatarText();
}
FText __UIGetter_EquiptingAvatarText(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetEquiptingAvatarText();
}
FText __UIGetter_CompareEquiptingAvatarText(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetCompareEquiptingAvatarText();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> __UIGetter_CurEquipItemInfoTitle(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetCurEquipItemInfoTitle();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __UIGetter_CurEquipItemInfoDetail(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetCurEquipItemInfoDetail();
}
bool __UIGetter_bCanShowCompareInfo(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetbCanShowCompareInfo();
}
bool __UIGetter_bCanShowCompareOverview(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetbCanShowCompareOverview();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfo> __UIGetter_CompareItemInfo(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetCompareItemInfo();
}
TEUIModelRef<FVM_AvatarEquipmentCompareOverview> __UIGetter_CompareOverview(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetCompareOverview();
}
TArray<FEUIModelContainer> __UIGetter_CompareAttributeList(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return Model.GetCompareAttributeList();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> __UIGetter_Self(const FVM_AvatarEquipmentItemInfoCompare &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>(Model);
}
int __IndexOf_CurEquipmentInfo()
{
    return 0;
}
int __IndexOf_bShowEquiptingAvatarText()
{
    return 1;
}
int __IndexOf_bShowCompareEquiptingAvatarText()
{
    return 2;
}
int __IndexOf_EquiptingAvatarText()
{
    return 3;
}
int __IndexOf_CompareEquiptingAvatarText()
{
    return 4;
}
int __IndexOf_CurEquipItemInfoTitle()
{
    return 5;
}
int __IndexOf_CurEquipItemInfoDetail()
{
    return 6;
}
int __IndexOf_bCanShowCompareInfo()
{
    return 7;
}
int __IndexOf_bCanShowCompareOverview()
{
    return 8;
}
int __IndexOf_CompareItemInfo()
{
    return 9;
}
int __IndexOf_CompareOverview()
{
    return 10;
}
int __IndexOf_CompareAttributeList()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentItemInfoCompare
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
