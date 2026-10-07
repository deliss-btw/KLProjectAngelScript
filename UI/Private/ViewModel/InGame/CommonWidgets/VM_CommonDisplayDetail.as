
enum ECommonDetailRightInfoMode
{
    Count,
    Locked,
    Empty,
}

namespace FVM_CommonDisplayDetail
{
    const int ModelId = 0;

}
struct FVM_CommonDisplayDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ItemName;
    UPROPERTY()
    FText m_ItemCategory;
    UPROPERTY()
    int m_ItemOwnNum;
    UPROPERTY()
    FText m_DetailText;
    UPROPERTY()
    FText m_DetailIpText;
    UPROPERTY()
    bool m_HasBankLimit;
    UPROPERTY()
    int m_ItemBankOwnNum;
    UPROPERTY()
    FText m_LockText;
    UPROPERTY()
    ECommonDetailRightInfoMode m_RightInfoMode;
    UPROPERTY()
    bool m_bHasDisplayContent;

    FVM_CommonDisplayDetail()
    {
        this.m_ItemOwnNum = 0;
        this.m_HasBankLimit = false;
        this.m_ItemBankOwnNum = 0;
        this.m_LockText = NSLOCTEXT("CommonDisplayDetail_Locked", "жњЄи§Јй”Ѓ");
        this.m_RightInfoMode = ECommonDetailRightInfoMode(0);
        this.m_bHasDisplayContent = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonDisplayDetail(const FVM_CommonDisplayDetail &inout Other)
    {
        this.m_ItemOwnNum = 0;
        this.m_HasBankLimit = false;
        this.m_ItemBankOwnNum = 0;
        this.m_LockText = NSLOCTEXT("CommonDisplayDetail_Locked", "жњЄи§Јй”Ѓ");
        this.m_RightInfoMode = ECommonDetailRightInfoMode(0);
        this.m_bHasDisplayContent = false;
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemCategory = Other.m_ItemCategory;
        this.m_ItemOwnNum = int(Other.m_ItemOwnNum);
        this.m_DetailText = Other.m_DetailText;
        this.m_DetailIpText = Other.m_DetailIpText;
        this.m_HasBankLimit = Other.m_HasBankLimit;
        this.m_ItemBankOwnNum = int(Other.m_ItemBankOwnNum);
        this.m_LockText = Other.m_LockText;
        this.m_RightInfoMode = Other.m_RightInfoMode;
        this.m_bHasDisplayContent = Other.m_bHasDisplayContent;
        return;
    }
    FVM_CommonDisplayDetail opAssign(const FVM_CommonDisplayDetail &inout Other)
    {
        FVM_CommonDisplayDetail __r;
        this.m_ItemName = Other.m_ItemName;
        this.m_ItemCategory = Other.m_ItemCategory;
        this.m_ItemOwnNum = int(Other.m_ItemOwnNum);
        this.m_DetailText = Other.m_DetailText;
        this.m_DetailIpText = Other.m_DetailIpText;
        this.m_HasBankLimit = Other.m_HasBankLimit;
        this.m_ItemBankOwnNum = int(Other.m_ItemBankOwnNum);
        this.m_LockText = Other.m_LockText;
        this.m_RightInfoMode = Other.m_RightInfoMode;
        this.m_bHasDisplayContent = Other.m_bHasDisplayContent;
        return __r;
    }
    void SetupEmpty()
    {
        this.SetItemName(FText());
        this.SetItemCategory(FText());
        this.SetItemOwnNum(0);
        this.SetDetailText(FText());
        this.SetDetailIpText(FText());
        this.SetHasBankLimit(false);
        this.SetItemBankOwnNum(0);
        this.SetLockText(NSLOCTEXT("CommonDisplayDetail_Locked", "жњЄи§Јй”Ѓ"));
        this.SetRightInfoMode(ECommonDetailRightInfoMode(2));
        this.SetbHasDisplayContent(false);
        return;
    }
    void SetupFashion(const TDataObjectPtr<FFashionConfig> &inout FashionConfig, const bool bUnlocked)
    {
        int local_7;
        bool local_9 = false;
        this.SetupEmpty();
        if (!(FashionConfig))
        {
            return;
        }
        this.SetbHasDisplayContent(true);
        this.SetItemCategory(this.BuildFashionCategoryText(FashionConfig));
        if (bUnlocked)
        {
            int local_8;
            local_8 = 2;
            local_7 = local_8;
        }
        else
        {
            int local_8;
            local_8 = 1;
            local_7 = local_8;
        }
        this.SetRightInfoMode(ECommonDetailRightInfoMode(local_7));
        bool local_1 = !(bUnlocked);
        if (local_1)
        {
            local_1 = !local_1;
            if (!(local_1))
            {
                local_1 = false;
            }
            else
            {
                local_9 = !local_9;
                local_1 = local_9;
            }
            if (local_1)
            {
                NSLOCTEXT("CommonDisplayDetail_UnlockCondition", "и§Јй”ЃжќЎд»¶пјљ{0}");
                FText local_14;
                this.SetDetailText(local_14);
                return;
            }
            if (GetUnlockCondition())
            {
                FText local_18;
                this.SetDetailText(FText::Format(NSLOCTEXT("CommonDisplayDetail_UnlockCondition", "и§Јй”ЃжќЎд»¶пјљ{0}"), local_18));
                return;
            }
            this.SetDetailText(NSLOCTEXT("CommonDisplayDetail_LockedNoConditionFallback", "<й™ђе®љиЋ·еЏ–>"));
        }
        return;
    }
    FText BuildFashionCategoryText(const TDataObjectPtr<FFashionConfig> &inout FashionConfig) const
    {
        int local_5 = 0;
        int local_67 = 0;
        FText __return;
        FText local_10;
        ::FashionSettings::GetFashionSlotName(local_10);
        int local_11 = local_5;
        if (local_11 != -55)
        {
            return local_10;
        }
        CastTo local_42;
        if (!(local_42.opCall()))
        {
            return local_10;
        }
        int local_11_2 = local_67;
        if (local_11_2 <= 1)
        {
            if (local_11_2 != 0)
            {
                if (local_11_2 != 1)
                {
                }
                else
                {
                    __return = FText::Format(NSLOCTEXT("CommonDisplayDetail_DoubleMountCategory", "еЏЊдєє{0}"), local_10);
                }
            }
        }
        __return = FText::Format(NSLOCTEXT("CommonDisplayDetail_SingleMountCategory", "еЌ•дєє{0}"), local_10);
        return __return;
    }
    int GetRightInfoSwitcherIndex() const
    {
        return (int(this.GetRightInfoMode())) == 1 ? 1 : 0;
    }
    ESlateVisibility GetRightInfoVisibility() const
    {
        int local_5;
        if ((int(this.GetRightInfoMode())) == 2)
        {
            local_5 = 1;
        }
        else
        {
            local_5 = 4;
        }
        return ESlateVisibility(local_5);
    }
    ESlateVisibility GetDetailVisibility() const
    {
        int local_2;
        if (this.GetbHasDisplayContent())
        {
            local_2 = 4;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    FText GetItemName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ItemName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemName = __Value;
        return;
    }
    FText GetItemCategory() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ItemCategory() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemCategory(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemCategory = __Value;
        return;
    }
    int GetItemOwnNum() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemOwnNum;
    }
    void SetItemOwnNum(const int __Value) property
    {
        if (this.m_ItemOwnNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemOwnNum = __Value;
        return;
    }
    const FText GetDetailText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_DetailText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDetailText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DetailText = __Value;
        return;
    }
    const FText GetDetailIpText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_DetailIpText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDetailIpText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DetailIpText = __Value;
        return;
    }
    bool GetHasBankLimit() const property
    {
        this.TrackPropertyRead(5);
        return this.m_HasBankLimit;
    }
    void SetHasBankLimit(const bool __Value) property
    {
        if (!(this.m_HasBankLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_HasBankLimit = __Value;
        return;
    }
    int GetItemBankOwnNum() const property
    {
        this.TrackPropertyRead(6);
        return this.m_ItemBankOwnNum;
    }
    void SetItemBankOwnNum(const int __Value) property
    {
        if (this.m_ItemBankOwnNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ItemBankOwnNum = __Value;
        return;
    }
    const FText GetLockText() const property
    {
        const FText __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FText GetModify_LockText() property
    {
        FText __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetLockText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LockText = __Value;
        return;
    }
    ECommonDetailRightInfoMode GetRightInfoMode() const property
    {
        this.TrackPropertyRead(8);
        return this.m_RightInfoMode;
    }
    void SetRightInfoMode(const ECommonDetailRightInfoMode __Value) property
    {
        if (int(this.m_RightInfoMode) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_RightInfoMode = __Value;
        return;
    }
    bool GetbHasDisplayContent() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bHasDisplayContent;
    }
    void SetbHasDisplayContent(const bool __Value) property
    {
        if (!(this.m_bHasDisplayContent) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bHasDisplayContent = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonDisplayDetail
{
    UPROPERTY()
    int RightInfoSwitcherIndex;
    UPROPERTY()
    ESlateVisibility RightInfoVisibility;
    UPROPERTY()
    ESlateVisibility DetailVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDisplayDetail> Self;


}

namespace FVM_CommonDisplayDetail
{
FVM_CommonDisplayDetail& Create(const UObject ContextObject)
{
    return FVM_CommonDisplayDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonDisplayDetail CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonDisplayDetail __r;
    TEUIModelRef<FVM_CommonDisplayDetail> local_6 = TEUIModelRef<FVM_CommonDisplayDetail>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonDisplayDetail::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemCategory";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemOwnNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DetailText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DetailIpText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasBankLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemBankOwnNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LockText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightInfoSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightInfoVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DetailVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDisplayDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonDisplayDetail;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonDisplayDetail;
}
FText __UIGetter_ItemName(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetItemName();
}
FText __UIGetter_ItemCategory(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetItemCategory();
}
int __UIGetter_ItemOwnNum(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetItemOwnNum();
}
FText __UIGetter_DetailText(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetDetailText();
}
FText __UIGetter_DetailIpText(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetDetailIpText();
}
bool __UIGetter_HasBankLimit(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetHasBankLimit();
}
int __UIGetter_ItemBankOwnNum(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetItemBankOwnNum();
}
FText __UIGetter_LockText(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetLockText();
}
int __UIGetter_RightInfoSwitcherIndex(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetRightInfoSwitcherIndex();
}
ESlateVisibility __UIGetter_RightInfoVisibility(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetRightInfoVisibility();
}
ESlateVisibility __UIGetter_DetailVisibility(const FVM_CommonDisplayDetail &inout Model)
{
    return Model.GetDetailVisibility();
}
TEUIModelRef<FVM_CommonDisplayDetail> __UIGetter_Self(const FVM_CommonDisplayDetail &inout Model)
{
    return TEUIModelRef<FVM_CommonDisplayDetail>(Model);
}
int __IndexOf_ItemName()
{
    return 0;
}
int __IndexOf_ItemCategory()
{
    return 1;
}
int __IndexOf_ItemOwnNum()
{
    return 2;
}
int __IndexOf_DetailText()
{
    return 3;
}
int __IndexOf_DetailIpText()
{
    return 4;
}
int __IndexOf_HasBankLimit()
{
    return 5;
}
int __IndexOf_ItemBankOwnNum()
{
    return 6;
}
int __IndexOf_LockText()
{
    return 7;
}
int __IndexOf_RightInfoMode()
{
    return 8;
}
int __IndexOf_bHasDisplayContent()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_CommonDisplayDetail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
