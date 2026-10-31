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
        return this.GetBadgeRewardResurlt().GetConfig().Get().BadgeName;
    }
    FSoftBrush GetIcon() const
    {
        return this.GetBadgeRewardResurlt().GetConfig().Get().IconBrush;
    }
    FText GetBadgeDesc() const
    {
        return this.GetBadgeRewardResurlt().GetConfig().Get().BadgeDesc;
    }
    FText GetBadgeValueDesc() const
    {
        TMap<FString, FFormatArgumentValue> local_20;
        FFormatArgumentValue local_32 = FFormatArgumentValue(this.ValueToText(this.GetBadgeRewardResurlt()));
        local_20.Add("Value", local_32);
        FFormatArgumentValue local_32_2 = FFormatArgumentValue(this.TypeToText(this.GetBadgeRewardResurlt()));
        local_20.Add("Type", local_32_2);
        return FText::Format(this.GetBadgeRewardResurlt().GetConfig().Get().BadgeValueDesc, local_20);
    }
    FText TypeToText(const FCommissionBadgeRewardResurlt &inout BadgeReward) const
    {
        if (int(BadgeReward.GetConfig().Get().CountType) == 2)
        {
            return NSLOCTEXT("CommissionBadge", "CommissionBadge_RankFirst", "第一");
        }
        if (int(BadgeReward.GetConfig().Get().CountType) == 3)
        {
            return NSLOCTEXT("CommissionBadge", "CommissionBadge_RankSecond", "第二");
        }
        return FText();
    }
    FText ValueToText(const FCommissionBadgeRewardResurlt &inout BadgeReward) const
    {
        if (BadgeReward.GetbPercent())
        {
            FText local_10;
            FText::AsNumber(uint((BadgeReward.GetPercent() * 100.0f)), local_10);
            return FText::Format(INVTEXT("{0}%"), local_10);
        }
        else
        {
            FText local_10;
            FText::AsNumber(BadgeReward.GetValue(), local_10);
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
FVM_CommissionBadgeItem& CreateByManager(const UEUIManagerSubsystem Manager, const FCommissionBadgeRewardResurlt &inout BadgeRewardResurlt)
{
    return TEUIModelRef<FVM_CommissionBadgeItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionBadgeItem::ModelId, 0, BadgeRewardResurlt)).Get();
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
    return __GeneratedProperties_FVM_CommissionBadgeItem.Get();
}
}
