
namespace FVM_CommissionBadgeItem
{
    const int ModelId = 0;

}
struct FCommissionBadgeItemData
{
    UPROPERTY()
    FCommissionBadgeRewardResurlt BadgeRewardResurlt;

    FCommissionBadgeItemData()
    {
        return;
    }
}

struct FVM_CommissionBadgeItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FCommissionBadgeRewardResurlt m_BadgeRewardResurlt;

    FVM_CommissionBadgeItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionBadgeItem' by default constructor.");
        return;
    }
    FVM_CommissionBadgeItem(const FVM_CommissionBadgeItem &inout Other)
    {
        this.m_BadgeRewardResurlt = Other.m_BadgeRewardResurlt;
        return;
    }
    FVM_CommissionBadgeItem(const FCommissionBadgeRewardResurlt &inout InBadgeRewardResurlt)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetBadgeRewardResurlt(InBadgeRewardResurlt);
        return;
    }
    FVM_CommissionBadgeItem& opAssign(const FVM_CommissionBadgeItem &inout Other)
    {
        return Other.m_BadgeRewardResurlt;
    }
    FText GetName() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FText __r; return __r;
    }
    FSoftBrush GetIcon() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FSoftBrush __r; return __r;
    }
    FText GetBadgeDesc() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FText __r; return __r;
    }
    FText GetBadgeValueDesc() const
    {
        TMap<FString, FFormatArgumentValue> local_20;
        FFormatArgumentValue local_32 = FFormatArgumentValue(this.ValueToText(this.GetBadgeRewardResurlt()));
        local_20.Add("Value", local_32);
        FText local_24 = this.TypeToText(this.GetBadgeRewardResurlt());
        FFormatArgumentValue local_32_2 = FFormatArgumentValue(local_24);
        local_20.Add("Type", local_32_2);
        return local_24;
    }
    FText TypeToText(const FCommissionBadgeRewardResurlt &inout BadgeReward) const
    {
        int local_1 = 0;
        if (local_1 == 2)
        {
            return NSLOCTEXT("CommissionBadge", "CommissionBadge_RankFirst", "з¬¬дёЂ");
        }
        if (local_1 == 3)
        {
            return NSLOCTEXT("CommissionBadge", "CommissionBadge_RankSecond", "з¬¬дєЊ");
        }
        return FText();
    }
    FText ValueToText(const FCommissionBadgeRewardResurlt &inout BadgeReward) const
    {
        int local_2 = 0;
        if (BadgeReward.GetbPercent())
        {
            FText local_10;
            FText::AsNumber(uint((BadgeReward.GetPercent() * 100.0f)), local_10);
            return FText::Format(INVTEXT("{0}%"), local_10);
        }
        else
        {
            FText local_10;
            FText::AsNumber(local_2, local_10);
            return local_10;
        }
    }
    const FCommissionBadgeRewardResurlt GetBadgeRewardResurlt() const property
    {
        const FCommissionBadgeRewardResurlt __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FCommissionBadgeRewardResurlt GetModify_BadgeRewardResurlt() property
    {
        FCommissionBadgeRewardResurlt __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBadgeRewardResurlt(const FCommissionBadgeRewardResurlt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BadgeRewardResurlt = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionBadgeItem
{
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText BadgeDesc;
    UPROPERTY()
    FText BadgeValueDesc;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionBadgeItem> Self;

    __GeneratedProperties_FVM_CommissionBadgeItem()
    {
        return;
    }
}

namespace FVM_CommissionBadgeItem
{
FVM_CommissionBadgeItem& Create(const UObject ContextObject, const FCommissionBadgeRewardResurlt &inout BadgeRewardResurlt)
{
    return FVM_CommissionBadgeItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), BadgeRewardResurlt);
}
FVM_CommissionBadgeItem CreateByManager(const UEUIManagerSubsystem Manager, const FCommissionBadgeRewardResurlt &inout BadgeRewardResurlt)
{
    FVM_CommissionBadgeItem __r;
    TEUIModelRef<FVM_CommissionBadgeItem> local_6 = TEUIModelRef<FVM_CommissionBadgeItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionBadgeItem::ModelId, 0, BadgeRewardResurlt));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BadgeDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BadgeValueDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionBadgeItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionBadgeItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionBadgeItem;
}
FText __UIGetter_Name(const FVM_CommissionBadgeItem &inout Model)
{
    return Model.GetName();
}
FSoftBrush __UIGetter_Icon(const FVM_CommissionBadgeItem &inout Model)
{
    return Model.GetIcon();
}
FText __UIGetter_BadgeDesc(const FVM_CommissionBadgeItem &inout Model)
{
    return Model.GetBadgeDesc();
}
FText __UIGetter_BadgeValueDesc(const FVM_CommissionBadgeItem &inout Model)
{
    return Model.GetBadgeValueDesc();
}
TEUIModelRef<FVM_CommissionBadgeItem> __UIGetter_Self(const FVM_CommissionBadgeItem &inout Model)
{
    return TEUIModelRef<FVM_CommissionBadgeItem>(Model);
}
int __IndexOf_BadgeRewardResurlt()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_CommissionBadgeItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
