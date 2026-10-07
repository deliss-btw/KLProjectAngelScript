
namespace FVM_AvatarEquipmentItemInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnGoToEquipmentPage = FEUIModelCallbackSignature();

}
struct FVM_AvatarEquipmentItemInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_EquipmentInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> m_ItemInfoTitle;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> m_ItemInfoDetail;
    UPROPERTY()
    EEquipSlotType m_EquipSlot;
    UPROPERTY()
    bool m_bShowGoToBtn;

    FVM_AvatarEquipmentItemInfo()
    {
        this.m_EquipSlot = EEquipSlotType(0);
        this.m_bShowGoToBtn = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarEquipmentItemInfo' by default constructor.");
        return;
    }
    FVM_AvatarEquipmentItemInfo(const FVM_AvatarEquipmentItemInfo &inout Other)
    {
        this.m_EquipSlot = EEquipSlotType(0);
        this.m_bShowGoToBtn = false;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_ItemInfoTitle = Other.m_ItemInfoTitle;
        this.m_ItemInfoDetail = Other.m_ItemInfoDetail;
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_bShowGoToBtn = Other.m_bShowGoToBtn;
        return;
    }
    FVM_AvatarEquipmentItemInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout InEquipmentInfo)
    {
        this.m_EquipSlot = EEquipSlotType(0);
        this.m_bShowGoToBtn = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEquipmentInfo(InEquipmentInfo);
        return;
    }
    FVM_AvatarEquipmentItemInfo opAssign(const FVM_AvatarEquipmentItemInfo &inout Other)
    {
        FVM_AvatarEquipmentItemInfo __r;
        this.m_EquipmentInfo = Other.m_EquipmentInfo;
        this.m_ItemInfoTitle = Other.m_ItemInfoTitle;
        this.m_ItemInfoDetail = Other.m_ItemInfoDetail;
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_bShowGoToBtn = Other.m_bShowGoToBtn;
        return __r;
    }
    void PostConstruct()
    {
        this.SetItemInfoTitle(TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(::FVM_AvatarEquipmentItemInfoTitle::Create(this.GetContext().Manager, this.GetEquipmentInfo())));
        this.SetItemInfoDetail(TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(::FVM_AvatarEquipmentItemInfoDetail::Create(this.GetContext().Manager, this.GetEquipmentInfo())));
        return;
    }
    void SetIsEquipmentDescriptionShow(const bool bShow)
    {
        if (this.GetItemInfoDetail().IsValid())
        {
            TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_2 = this.GetItemInfoDetail();
            bShow.SetIsEquipmentDescriptionShow();
        }
        return;
    }
    void OnGoToEquipmentPage()
    {
        if (!(this.GetbShowGoToBtn()))
        {
            return;
        }
        if (::FEquipmentUtils::IsTalismanSlot(EEquipSlotType(this.GetEquipSlot())) || (int(this.GetEquipSlot()) == 1))
        {
            TEUIModelRef<FVM_EquipmentInfo> local_8 = this.GetEquipmentInfo();
            TEUIModelRef<FM_Equipment> local_10;
            local_10.GetEquipment();
            EEquipSlotType local_2 = this.GetEquipSlot();
        }
        return;
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
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> GetItemInfoTitle() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ItemInfoTitle;
    }
    void SetItemInfoTitle(const TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> local_2;
        local_2 = this.m_ItemInfoTitle;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemInfoTitle = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> GetItemInfoDetail() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemInfoDetail;
    }
    void SetItemInfoDetail(const TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_2;
        local_2 = this.m_ItemInfoDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemInfoDetail = __Value;
        return;
    }
    EEquipSlotType GetEquipSlot() const property
    {
        this.TrackPropertyRead(3);
        return this.m_EquipSlot;
    }
    void SetEquipSlot(const EEquipSlotType __Value) property
    {
        if (int(this.m_EquipSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipSlot = __Value;
        return;
    }
    bool GetbShowGoToBtn() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bShowGoToBtn;
    }
    void SetbShowGoToBtn(const bool __Value) property
    {
        if (!(this.m_bShowGoToBtn) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bShowGoToBtn = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarEquipmentItemInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfo> Self;

    __GeneratedProperties_FVM_AvatarEquipmentItemInfo()
    {
        return;
    }
}

namespace FVM_AvatarEquipmentItemInfo
{
FVM_AvatarEquipmentItemInfo& Create(const UObject ContextObject, const TEUIModelRef<FVM_EquipmentInfo> &inout EquipmentInfo)
{
    return FVM_AvatarEquipmentItemInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), EquipmentInfo);
}
FVM_AvatarEquipmentItemInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_EquipmentInfo> &inout EquipmentInfo)
{
    FVM_AvatarEquipmentItemInfo __r;
    TEUIModelRef<FVM_AvatarEquipmentItemInfo> local_6 = TEUIModelRef<FVM_AvatarEquipmentItemInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarEquipmentItemInfo::ModelId, 0, EquipmentInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemInfoTitle";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemInfoDetail";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowGoToBtn";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentItemInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentItemInfo;
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> __UIGetter_ItemInfoTitle(const FVM_AvatarEquipmentItemInfo &inout Model)
{
    return Model.GetItemInfoTitle();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __UIGetter_ItemInfoDetail(const FVM_AvatarEquipmentItemInfo &inout Model)
{
    return Model.GetItemInfoDetail();
}
bool __UIGetter_bShowGoToBtn(const FVM_AvatarEquipmentItemInfo &inout Model)
{
    return Model.GetbShowGoToBtn();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfo> __UIGetter_Self(const FVM_AvatarEquipmentItemInfo &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfo>(Model);
}
int __IndexOf_EquipmentInfo()
{
    return 0;
}
int __IndexOf_ItemInfoTitle()
{
    return 1;
}
int __IndexOf_ItemInfoDetail()
{
    return 2;
}
int __IndexOf_EquipSlot()
{
    return 3;
}
int __IndexOf_bShowGoToBtn()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentItemInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
