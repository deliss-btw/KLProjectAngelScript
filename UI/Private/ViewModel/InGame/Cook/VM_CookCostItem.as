
namespace FVM_CookCostItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetItemSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnLossHover = FEUIModelCallbackSignature();
}
namespace FVM_WaitCookItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetItemSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnLossHover = FEUIModelCallbackSignature();

}
struct FVM_CookCostItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_Item;
    UPROPERTY()
    TEUIModelWeakRef<FVM_Cook> m_CookMain;
    UPROPERTY()
    bool m_bIsValid;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_ItemModels;
    UPROPERTY()
    FEUIModelContainer m_TipHoverModels;
    UPROPERTY()
    FECSEntity m_CookPropEntity;
    UPROPERTY()
    int m_PushReadyItemNum;

    FVM_CookCostItem()
    {
        this.m_bIsValid = false;
        this.m_PushReadyItemNum = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CookCostItem' by default constructor.");
        return;
    }
    FVM_CookCostItem(const FVM_CookCostItem &inout Other)
    {
        this.m_bIsValid = false;
        this.m_PushReadyItemNum = 0;
        this.m_Item = Other.m_Item;
        this.m_CookMain = Other.m_CookMain;
        this.m_bIsValid = Other.m_bIsValid;
        this.m_ItemModels = Other.m_ItemModels;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_PushReadyItemNum = int(Other.m_PushReadyItemNum);
        return;
    }
    FVM_CookCostItem(const TEUIModelRef<FM_ItemData> &inout InItem, const TEUIModelWeakRef<FVM_Cook> &inout InCookMain)
    {
        this.m_bIsValid = false;
        this.m_PushReadyItemNum = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItem(InItem);
        this.SetCookMain(InCookMain);
        return;
    }
    FVM_CookCostItem opAssign(const FVM_CookCostItem &inout Other)
    {
        FVM_CookCostItem __r;
        this.m_Item = Other.m_Item;
        this.m_CookMain = Other.m_CookMain;
        this.m_bIsValid = Other.m_bIsValid;
        this.m_ItemModels = Other.m_ItemModels;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_PushReadyItemNum = int(Other.m_PushReadyItemNum);
        return __r;
    }
    void PostConstruct()
    {
        TEUIModelWeakRef<FVM_Cook> local_2 = this.GetCookMain();
        this.SetCookPropEntity(GetCookPropEntity());
        this.RefreshItemModel();
        this.SetPushReadyItemNum();
        return;
    }
    void OnCookPropChanged(const FC_CookProp &inout CookProp)
    {
        this.SetPushReadyItemNum();
        return;
    }
    bool IsValid() const
    {
        bool local_3;
        if (!(this.GetItem().IsValid()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = this.GetItem().opArrow().GetConfig();
        }
        return local_3;
    }
    FSoftBrush GetItemIcon() const
    {
        if (this.GetItem().IsNull() || this.GetItemModels().IsNull())
        {
            return FSoftBrush();
        }
        TEUIModelRef<FVM_Item> local_6 = this.GetItemModels();
        return GetItemConfig().opArrow().ItemIcon;
    }
    int GetItemNum() const
    {
        if (this.GetItem().IsNull())
        {
            return 0;
        }
        return FMath::Clamp((this.GetItem().opArrow().GetNum() - this.GetPushReadyItemNum()), 0, 99);
    }
    int GetItemNumSwitch() const
    {
        return this.GetItemNum() == 0 ? 0 : 1;
    }
    FLinearColor GetItemNumColor() const
    {
        if (this.GetItemNum() == 0)
        {
            return FLinearColor(0.49f, 0.08f, 0.08f, 1.0f);
        }
        return FLinearColor(0.98f, 0.93f, 0.91f, 1.0f);
    }
    FLinearColor GetItemImageBGColor() const
    {
        if (!(this.GetItemModels().IsNull()))
        {
            FLinearColor local_7;
            TEUIModelRef<FVM_Item> local_2 = this.GetItemModels();
            local_7.GetRarityColor();
            return local_7;
        }
        return FLinearColor::White;
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshItemModel();
        return;
    }
    void RefreshItemModel()
    {
        int local_4 = 0;
        bool local_6;
        int local_8;
        TEUIModelRef<FM_ItemData> local_2 = this.GetItem();
        if (local_4)
        {
            local_8 = local_4.GetNum();
        }
        else
        {
            local_8 = 0;
        }
        if (local_8 <= 0)
        {
            local_6 = false;
        }
        else
        {
            local_6 = local_4.GetConfig();
        }
        this.SetbIsValid(local_6);
        if (!(this.GetbIsValid()))
        {
            return;
        }
        this.SetItemModels(TEUIModelRef<FVM_Item>(::FVM_Item::Create(this.GetContext().Manager, this.GetItem())));
        this.RebuildTipHoverModels();
        return;
    }
    void RebuildTipHoverModels()
    {
        bool local_3 = !(this.GetItem().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_2 = this.GetItem();
            local_3 = !(GetConfig());
        }
        if (local_3)
        {
            return;
        }
        this.SetTipHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, ::CommonItemTip::MakeSimpleFromItemData(this.GetItem())));
        return;
    }
    void SetPushReadyItemNum()
    {
        int local_51 = 0;
        int local_52 = 0;
        FVM_CookCostItem& local_62;
        bool local_3 = !(this.GetItem().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_2 = this.GetItem();
            local_3 = !(GetConfig());
        }
        local_3 = local_3 || !(this.GetCookMain().IsValid());
        if (local_3)
        {
            this.SetPushReadyItemNum(0);
            return;
        }
        int local_8 = 0;
        TEUIModelWeakRef<FVM_Cook> local_6 = this.GetCookMain();
        Get local_14;
        const FC_CookProp& local_10 = local_14.opCall();
        if (local_10)
        {
            for (auto& local_28 : local_10.GetCookPlayerDatas())
            {
                bool local_4 = (FECSEntity(local_28.GetPlayerEntity()) == this.GetContext().GetLocalPlayerPawn());
                if (local_4)
                {
                    for (auto& local_50 : local_28.GetCookCostItems())
                    {
                        if (!(local_50.GetCookCostItem()))
                        {
                            local_4 = false;
                        }
                        else
                        {
                            TEUIModelRef<FM_ItemData> local_2_2 = this.GetItem();
                            local_4 = (local_51 == local_52);
                        }
                        if (local_4)
                        {
                            local_8 = local_8 + 1;
                        }
                    }
                }
            }
        }
        int local_53 = 0;
        int local_54 = 0;
        bool local_55 = false;
        TEUIModelWeakRef<FVM_Cook> local_6_2 = this.GetCookMain();
        int local_59 = 0;
        for (; local_59 < 0.Num(); ++local_59)
        {
            bool local_3_2 = !(local_62.GetItem().IsValid());
            if (local_3_2)
            {
                local_3_2 = true;
            }
            else
            {
                TEUIModelRef<FM_ItemData> local_2_3 = local_62.GetItem();
                local_3_2 = !(GetConfig());
            }
            if (local_3_2)
            {
                continue;
            }
            TEUIModelRef<FM_ItemData> local_2_4 = local_62.GetItem();
            TEUIModelRef<FM_ItemData> local_64 = this.GetItem();
            if (local_52 != local_51)
            {
                continue;
            }
            TEUIModelRef<FM_ItemData> local_64_2 = local_62.GetItem();
            local_53 = local_53 + GetNum();
            if ((local_62.GetItem() == this.GetItem().opImplConv()))
            {
                local_55 = true;
                continue;
            }
            if (!(local_55))
            {
                TEUIModelRef<FM_ItemData> local_64_3 = local_62.GetItem();
                local_54 = local_54 + GetNum();
            }
        }
        int local_67 = FMath::Max(local_53 - local_8, 0);
        TEUIModelRef<FM_ItemData> local_2_5 = this.GetItem();
        int local_69 = FMath::Clamp(local_67 - local_54, 0, GetNum());
        TEUIModelRef<FM_ItemData> local_2_6 = this.GetItem();
        this.SetPushReadyItemNum(GetNum() - local_69);
        return;
    }
    void SetItemSelected(const bool bSelected)
    {
        int local_6 = 0;
        if (!(this.IsValid()))
        {
            return;
        }
        else
        {
            TEUIModelWeakRef<FVM_Cook> local_4 = this.GetCookMain();
            if (bSelected)
            {
                local_6.OnClickPushFood();
                return;
            }
        }
    }
    void OnHover()
    {
        int local_6 = 0;
        if (!(this.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_Cook> local_4 = this.GetCookMain();
        local_6.SetLastHoveredItem(TEUIModelRef<FVM_CookCostItem>(this));
        return;
    }
    void OnLossHover()
    {
        int local_6 = 0;
        if (!(this.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_Cook> local_4 = this.GetCookMain();
        if ((local_6.GetLastHoveredItem() == FEUIModelRef(this)))
        {
            local_6.SetLastHoveredItem(TEUIModelRef<FVM_CookCostItem>(nullptr));
        }
        return;
    }
    TEUIModelRef<FM_ItemData> GetItem() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Item;
    }
    void SetItem(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_Item;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Item = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_Cook> GetCookMain() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CookMain;
    }
    void SetCookMain(const TEUIModelWeakRef<FVM_Cook> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_Cook> local_2;
        local_2 = this.m_CookMain;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CookMain = __Value;
        return;
    }
    bool GetbIsValid() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsValid;
    }
    void SetbIsValid(const bool __Value) property
    {
        if (!(this.m_bIsValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsValid = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetItemModels() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ItemModels;
    }
    void SetItemModels(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_ItemModels;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ItemModels = __Value;
        return;
    }
    const FEUIModelContainer GetTipHoverModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelContainer GetModify_TipHoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTipHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TipHoverModels = __Value;
        return;
    }
    const FECSEntity GetCookPropEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FECSEntity GetModify_CookPropEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCookPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CookPropEntity = __Value;
        return;
    }
    int GetPushReadyItemNum() const property
    {
        this.TrackPropertyRead(6);
        return this.m_PushReadyItemNum;
    }
    void SetPushReadyItemNum(const int __Value) property
    {
        if (this.m_PushReadyItemNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PushReadyItemNum = __Value;
        return;
    }
}

struct FVM_WaitCookItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_Item;
    UPROPERTY()
    TEUIModelWeakRef<FVM_Cook> m_CookMain;
    UPROPERTY()
    FECSEntity m_Owner;
    UPROPERTY()
    FECSEntity m_CookPropEntity;
    UPROPERTY()
    FFPTime m_PushTime;

    FVM_WaitCookItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_WaitCookItem' by default constructor.");
        return;
    }
    FVM_WaitCookItem(const FVM_WaitCookItem &inout Other)
    {
        this.m_Item = Other.m_Item;
        this.m_CookMain = Other.m_CookMain;
        this.m_Owner = Other.m_Owner;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_PushTime = Other.m_PushTime;
        return;
    }
    FVM_WaitCookItem(const TEUIModelRef<FM_ItemData> &inout InItem, const TEUIModelWeakRef<FVM_Cook> &inout InCookMain)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItem(InItem);
        this.SetCookMain(InCookMain);
        return;
    }
    FVM_WaitCookItem& opAssign(const FVM_WaitCookItem &inout Other)
    {
        this.m_Item = Other.m_Item;
        this.m_CookMain = Other.m_CookMain;
        this.m_Owner = Other.m_Owner;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        return Other.m_PushTime;
    }
    bool IsValid() const
    {
        bool local_3;
        if (!(this.GetItem().IsValid()))
        {
            local_3 = false;
        }
        else
        {
            local_3 = this.GetItem().opArrow().GetConfig();
        }
        return local_3;
    }
    int GetOwnerExistSwitch() const
    {
        return this.GetOwner().IsValid() ? 0 : 1;
    }
    ESlateVisibility GetOwnerVisibility() const
    {
        int local_2;
        if (this.GetOwner().IsValid())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetOwnerIconVisibility() const
    {
        if (!(this.GetOwner().IsValid()))
        {
            return ESlateVisibility(2);
        }
        if (::GetAvatarConfig(this.GetOwner()))
        {
            return ESlateVisibility(0);
        }
        return ESlateVisibility(2);
    }
    ESlateVisibility GetWaitCookItemIconVisibility() const
    {
        bool local_5 = this.GetItem();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_2 = this.GetItem();
            local_5 = GetConfig();
        }
        if (local_5)
        {
            return ESlateVisibility(0);
        }
        return ESlateVisibility(2);
    }
    ESlateVisibility GetEmptyCookItemIconVisibility() const
    {
        bool local_5 = this.GetItem();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_2 = this.GetItem();
            local_5 = GetConfig();
        }
        if (local_5)
        {
            return ESlateVisibility(2);
        }
        return ESlateVisibility(0);
    }
    FSoftBrush GetOwnerIcon() const
    {
        FSoftBrush __return;
        if (!(this.GetOwner().IsValid()))
        {
            return FSoftBrush();
        }
        if (::GetAvatarConfig(this.GetOwner()))
        {
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    ESlateVisibility GetOwnerReady() const
    {
        int local_4 = 0;
        if (!(this.GetCookPropEntity().IsValid()))
        {
            return ESlateVisibility(2);
        }
        if (!(local_4))
        {
            return ESlateVisibility(2);
        }
        for (auto& local_22 : local_4.GetCookPlayerDatas())
        {
            if ((FECSEntity(local_22.GetPlayerEntity()) == this.GetOwner()) && local_22.GetbPlayerReady())
            {
                return ESlateVisibility(0);
            }
        }
        return ESlateVisibility(2);
    }
    int GetMyselfSwitch() const
    {
        return (FECSEntity(this.GetOwner()) == this.GetContext().GetLocalPlayerPawn()) ? 0 : 1;
    }
    ESlateVisibility GetMyself() const
    {
        int local_10;
        if ((FECSEntity(this.GetOwner()) == this.GetContext().GetLocalPlayerPawn()))
        {
            local_10 = 0;
        }
        else
        {
            local_10 = 2;
        }
        return ESlateVisibility(local_10);
    }
    void SetItemSelected(const bool bSelected)
    {
        int local_6 = 0;
        if (!(this.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_Cook> local_4 = this.GetCookMain();
        if (bSelected)
        {
            local_6.OnClickCancelReadyFood();
        }
        return;
    }
    void OnHover()
    {
        int local_6 = 0;
        if (!(this.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_Cook> local_4 = this.GetCookMain();
        local_6.SetChooseReadyFood(TEUIModelRef<FVM_WaitCookItem>(this));
        return;
    }
    void OnLossHover()
    {
        int local_6 = 0;
        if (!(this.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_Cook> local_4 = this.GetCookMain();
        local_6.SetChooseReadyFood(TEUIModelRef<FVM_WaitCookItem>(nullptr));
        return;
    }
    void BeginDestroy()
    {
        int local_6 = 0;
        if (this.GetCookMain().IsNull())
        {
            return;
        }
        TEUIModelWeakRef<FVM_Cook> local_2 = this.GetCookMain();
        local_6.SetChooseReadyFood(TEUIModelRef<FVM_WaitCookItem>(nullptr));
        return;
    }
    TEUIModelRef<FM_ItemData> GetItem() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Item;
    }
    void SetItem(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_Item;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Item = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_Cook> GetCookMain() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CookMain;
    }
    void SetCookMain(const TEUIModelWeakRef<FVM_Cook> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_Cook> local_2;
        local_2 = this.m_CookMain;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CookMain = __Value;
        return;
    }
    FECSEntity GetOwner() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FECSEntity GetModify_Owner() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOwner(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Owner = __Value;
        return;
    }
    const FECSEntity GetCookPropEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FECSEntity GetModify_CookPropEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCookPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CookPropEntity = __Value;
        return;
    }
    const FFPTime GetPushTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FFPTime GetModify_PushTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPushTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PushTime = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CookCostItem
{
    UPROPERTY()
    bool IsValid;
    UPROPERTY()
    FSoftBrush ItemIcon;
    UPROPERTY()
    int ItemNum;
    UPROPERTY()
    int ItemNumSwitch;
    UPROPERTY()
    FLinearColor ItemNumColor;
    UPROPERTY()
    FLinearColor ItemImageBGColor;
    UPROPERTY()
    TEUIModelRef<FVM_CookCostItem> Self;


}

struct __GeneratedProperties_FVM_WaitCookItem
{
    UPROPERTY()
    bool IsValid;
    UPROPERTY()
    int OwnerExistSwitch;
    UPROPERTY()
    ESlateVisibility OwnerVisibility;
    UPROPERTY()
    ESlateVisibility OwnerIconVisibility;
    UPROPERTY()
    ESlateVisibility WaitCookItemIconVisibility;
    UPROPERTY()
    ESlateVisibility EmptyCookItemIconVisibility;
    UPROPERTY()
    FSoftBrush OwnerIcon;
    UPROPERTY()
    ESlateVisibility OwnerReady;
    UPROPERTY()
    int MyselfSwitch;
    UPROPERTY()
    ESlateVisibility Myself;
    UPROPERTY()
    TEUIModelRef<FVM_WaitCookItem> Self;


}

namespace FVM_CookCostItem
{
FVM_CookCostItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout Item, const TEUIModelWeakRef<FVM_Cook> &inout CookMain)
{
    return FVM_CookCostItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Item, CookMain);
}
FVM_CookCostItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout Item, const TEUIModelWeakRef<FVM_Cook> &inout CookMain)
{
    FVM_CookCostItem __r;
    TEUIModelRef<FVM_CookCostItem> local_6 = TEUIModelRef<FVM_CookCostItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CookCostItem::ModelId, 0, Item, CookMain));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsValid";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemModels";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsValid";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemNumSwitch";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemNumColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImageBGColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CookCostItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CookCostItem;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnCookPropChanged";
    local_26.ComponentType = FC_CookProp;
    local_26.MonitorPropertyName = FName("CookPropEntity");
    int local_2_2 = FVM_CookCostItem::__IndexOf_CookPropEntity();
    Result.MonitorFunctions.Add(local_26);
    FEUIModelMsgHandleDefine local_40;
    local_40.FunctionName = "__OnInventoryChanged";
    local_40.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_40.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_40);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CookCostItem;
}
void __OnCookPropChanged(FVM_CookCostItem &inout Model, const FECSEntity &inout Entity, const FC_CookProp &inout Component)
{
    Model.OnCookPropChanged(Component);
    return;
}
void __OnInventoryChanged(FVM_CookCostItem &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
bool __UIGetter_bIsValid(const FVM_CookCostItem &inout Model)
{
    return Model.GetbIsValid();
}
TEUIModelRef<FVM_Item> __UIGetter_ItemModels(const FVM_CookCostItem &inout Model)
{
    return Model.GetItemModels();
}
FEUIModelContainer __UIGetter_TipHoverModels(const FVM_CookCostItem &inout Model)
{
    return Model.GetTipHoverModels();
}
bool __UIGetter_IsValid(const FVM_CookCostItem &inout Model)
{
    return Model.IsValid();
}
FSoftBrush __UIGetter_ItemIcon(const FVM_CookCostItem &inout Model)
{
    return Model.GetItemIcon();
}
int __UIGetter_ItemNum(const FVM_CookCostItem &inout Model)
{
    return Model.GetItemNum();
}
int __UIGetter_ItemNumSwitch(const FVM_CookCostItem &inout Model)
{
    return Model.GetItemNumSwitch();
}
FLinearColor __UIGetter_ItemNumColor(const FVM_CookCostItem &inout Model)
{
    return Model.GetItemNumColor();
}
FLinearColor __UIGetter_ItemImageBGColor(const FVM_CookCostItem &inout Model)
{
    return Model.GetItemImageBGColor();
}
TEUIModelRef<FVM_CookCostItem> __UIGetter_Self(const FVM_CookCostItem &inout Model)
{
    return TEUIModelRef<FVM_CookCostItem>(Model);
}
int __IndexOf_Item()
{
    return 0;
}
int __IndexOf_CookMain()
{
    return 1;
}
int __IndexOf_bIsValid()
{
    return 2;
}
int __IndexOf_ItemModels()
{
    return 3;
}
int __IndexOf_TipHoverModels()
{
    return 4;
}
int __IndexOf_CookPropEntity()
{
    return 5;
}
int __IndexOf_PushReadyItemNum()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_CookCostItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_WaitCookItem
{
FVM_WaitCookItem& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout Item, const TEUIModelWeakRef<FVM_Cook> &inout CookMain)
{
    return FVM_WaitCookItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Item, CookMain);
}
FVM_WaitCookItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout Item, const TEUIModelWeakRef<FVM_Cook> &inout CookMain)
{
    FVM_WaitCookItem __r;
    TEUIModelRef<FVM_WaitCookItem> local_6 = TEUIModelRef<FVM_WaitCookItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_WaitCookItem::ModelId, 0, Item, CookMain));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IsValid";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OwnerExistSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OwnerVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OwnerIconVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WaitCookItemIconVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EmptyCookItemIconVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OwnerIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OwnerReady";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MyselfSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Myself";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WaitCookItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WaitCookItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WaitCookItem;
}
bool __UIGetter_IsValid(const FVM_WaitCookItem &inout Model)
{
    return Model.IsValid();
}
int __UIGetter_OwnerExistSwitch(const FVM_WaitCookItem &inout Model)
{
    return Model.GetOwnerExistSwitch();
}
ESlateVisibility __UIGetter_OwnerVisibility(const FVM_WaitCookItem &inout Model)
{
    return Model.GetOwnerVisibility();
}
ESlateVisibility __UIGetter_OwnerIconVisibility(const FVM_WaitCookItem &inout Model)
{
    return Model.GetOwnerIconVisibility();
}
ESlateVisibility __UIGetter_WaitCookItemIconVisibility(const FVM_WaitCookItem &inout Model)
{
    return Model.GetWaitCookItemIconVisibility();
}
ESlateVisibility __UIGetter_EmptyCookItemIconVisibility(const FVM_WaitCookItem &inout Model)
{
    return Model.GetEmptyCookItemIconVisibility();
}
FSoftBrush __UIGetter_OwnerIcon(const FVM_WaitCookItem &inout Model)
{
    return Model.GetOwnerIcon();
}
ESlateVisibility __UIGetter_OwnerReady(const FVM_WaitCookItem &inout Model)
{
    return Model.GetOwnerReady();
}
int __UIGetter_MyselfSwitch(const FVM_WaitCookItem &inout Model)
{
    return Model.GetMyselfSwitch();
}
ESlateVisibility __UIGetter_Myself(const FVM_WaitCookItem &inout Model)
{
    return Model.GetMyself();
}
TEUIModelRef<FVM_WaitCookItem> __UIGetter_Self(const FVM_WaitCookItem &inout Model)
{
    return TEUIModelRef<FVM_WaitCookItem>(Model);
}
int __IndexOf_Item()
{
    return 0;
}
int __IndexOf_CookMain()
{
    return 1;
}
int __IndexOf_Owner()
{
    return 2;
}
int __IndexOf_CookPropEntity()
{
    return 3;
}
int __IndexOf_PushTime()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_WaitCookItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
