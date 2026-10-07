
namespace FVM_CommonItemBar
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenRechargePage = FEUIModelCallbackSignature();

}
struct FVM_CommonItemBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_ItemConfig;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemData;
    UPROPERTY()
    int m_ItemNum;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_TipsItem;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommonHoverProvider> m_HoverProvider;
    UPROPERTY()
    FEUIModelContainer m_CommonTipHoverModels;
    UPROPERTY()
    FEUIModelContainer m_ExternalTipModels;
    UPROPERTY()
    bool m_bEnableClickLock;
    UPROPERTY()
    bool m_bHasFixedTooltip;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_SharedHoverAnchor;
    UPROPERTY()
    ECommonHoverLayout m_SharedHoverLayout;

    FVM_CommonItemBar()
    {
        this.m_ItemNum = 0;
        this.m_bEnableClickLock = false;
        this.m_bHasFixedTooltip = false;
        this.m_SharedHoverLayout = ECommonHoverLayout(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonItemBar(const FVM_CommonItemBar &inout Other)
    {
        this.m_ItemNum = 0;
        this.m_bEnableClickLock = false;
        this.m_bHasFixedTooltip = false;
        this.m_SharedHoverLayout = ECommonHoverLayout(0);
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ItemData = Other.m_ItemData;
        this.m_ItemNum = int(Other.m_ItemNum);
        this.m_TipsItem = Other.m_TipsItem;
        this.m_HoverProvider = Other.m_HoverProvider;
        this.m_CommonTipHoverModels = Other.m_CommonTipHoverModels;
        this.m_ExternalTipModels = Other.m_ExternalTipModels;
        this.m_bEnableClickLock = Other.m_bEnableClickLock;
        this.m_bHasFixedTooltip = Other.m_bHasFixedTooltip;
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        this.m_SharedHoverLayout = Other.m_SharedHoverLayout;
        return;
    }
    FVM_CommonItemBar opAssign(const FVM_CommonItemBar &inout Other)
    {
        FVM_CommonItemBar __r;
        this.m_ItemConfig = Other.m_ItemConfig;
        this.m_ItemData = Other.m_ItemData;
        this.m_ItemNum = int(Other.m_ItemNum);
        this.m_TipsItem = Other.m_TipsItem;
        this.m_HoverProvider = Other.m_HoverProvider;
        this.m_CommonTipHoverModels = Other.m_CommonTipHoverModels;
        this.m_ExternalTipModels = Other.m_ExternalTipModels;
        this.m_bEnableClickLock = Other.m_bEnableClickLock;
        this.m_bHasFixedTooltip = Other.m_bHasFixedTooltip;
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        this.m_SharedHoverLayout = Other.m_SharedHoverLayout;
        return __r;
    }
    void LoadConfig(const FConfigVM_CommonItemBar &inout InConfig)
    {
        this.SetbEnableClickLock(InConfig.bEnableClickLock);
        this.SetItemConfig(InConfig.ItemConfig);
        return;
    }
    void PostLoad()
    {
        if (this.GetItemData().IsValid())
        {
            if (!(this.GetItemConfig()))
            {
                TEUIModelRef<FM_ItemData> local_2 = this.GetItemData();
                this.SetItemConfig(GetConfig());
            }
        }
        else
        {
            if (this.GetItemConfig())
            {
                this.SetItemData(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(this.GetItemConfig()));
            }
        }
        if (this.GetItemConfig())
        {
            this.SetTipsItem(TEUIModelRef<FVM_Item>(::FVM_Item::CreateInventoryTotal(this.GetContext().Manager, this.GetItemConfig())));
        }
        this.RefreshCommonTipHoverModels();
        this.RefreshItemNum();
        this.UpdateHoverForbidden();
        return;
    }
    void SetupItemConfig(const TDataObjectPtr<FItemConfig> &inout InItemConfig)
    {
        this.SetItemConfig(InItemConfig);
        if (this.GetItemConfig())
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FM_ItemData> local_4 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(this.GetItemConfig());
            this.SetItemData(local_4);
            local_6 = TEUIModelRef<FVM_Item>(::FVM_Item::CreateInventoryTotal(this.GetContext().Manager, this.GetItemConfig()));
            this.SetTipsItem(local_6);
        }
        else
        {
            TEUIModelRef<FVM_Item> local_6;
            TEUIModelRef<FM_ItemData> local_4;
            this.SetItemData(local_4);
            this.SetTipsItem(local_6);
        }
        this.RefreshCommonTipHoverModels();
        this.RefreshItemNum();
        this.UpdateHoverForbidden();
        return;
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshItemNum();
        this.RefreshCommonTipHoverModels();
        return;
    }
    void RefreshItemNum()
    {
        int local_3 = this.GetItemConfig() ? ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(this.GetItemConfig()) : 0;
        this.SetItemNum(local_3);
        return;
    }
    FSlateBrush GetItemIcon() const
    {
        if (this.GetItemConfig())
        {
            return this.GetItemConfig().opArrow().ItemIcon.LoadBrush();
        }
        return ::UGlobalItemSettings::Get().EmptyItemIcon.LoadBrush();
    }
    FText GetItemName() const
    {
        FText local_10;
        if (this.GetItemConfig())
        {
            local_10 = this.GetItemConfig().opArrow().ItemName;
        }
        else
        {
            local_10 = FText();
        }
        return local_10;
    }
    bool ShouldShowVoucherAction() const
    {
        TDataObjectPtr<FItemConfig> local_52;
        if (this.GetItemData().IsValid())
        {
            TEUIModelRef<FM_ItemData> local_26 = this.GetItemData();
            local_52 = GetConfig();
        }
        else
        {
            local_52 = this.GetItemConfig();
        }
        if ((!(local_52) || !(::UGlobalItemSettings::Get().VoucherConfig)))
        {
            return false;
        }
        return (0 == 0);
    }
    void OpenRechargePage()
    {
        if (!(this.ShouldShowVoucherAction()))
        {
            return;
        }
        FGameplayTag local_3 = FGameplayTag(GameplayTags::UI_Type_MallGovReview);
        FEUIWidgetRef local_6 = FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, local_3);
        if (!(local_6))
        {
            local_6 = FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, local_3);
        }
        if (local_6)
        {
            FEUIWidgetRef::GetViewModel local_12;
            local_12.opCall(NAME_None).OnTabSelected(1);
        }
        return;
    }
    void UpdateHoverForbidden()
    {
        if (this.GetHoverProvider().IsValid())
        {
            TEUIModelWeakRef<FVM_CommonHoverProvider> local_2 = this.GetHoverProvider();
            (this.GetbHasFixedTooltip() || !(this.GetExternalTipModels().IsEmpty())).SetbIsForbidHover();
        }
        return;
    }
    void SetHasFixedTooltip(const bool bValue)
    {
        this.SetbHasFixedTooltip(bValue);
        this.UpdateHoverForbidden();
        return;
    }
    void SetSharedHoverAnchor(const UWidget InHoverAnchor, const ECommonHoverLayout InHoverLayout)
    {
        this.SetSharedHoverAnchor(TWeakObjectPtr<UWidget>(InHoverAnchor));
        this.SetSharedHoverLayout(ECommonHoverLayout(InHoverLayout));
        return;
    }
    UWidget ResolveSharedHoverAnchorWidget() const
    {
        TWeakObjectPtr<UWidget> local_2 = this.GetSharedHoverAnchor();
        UWidget local_4;
        return local_4;
    }
    ECommonHoverLayout ResolveSharedHoverLayout() const
    {
        return this.GetSharedHoverLayout();
    }
    void ApplyExternalTipModels(const FEUIModelContainer &inout InModels)
    {
        this.SetExternalTipModels(InModels);
        this.UpdateHoverForbidden();
        return;
    }
    bool HasExternalTipTarget() const
    {
        return !(this.GetExternalTipModels().IsEmpty());
    }
    void SyncClickLockSetting()
    {
        if (this.GetHoverProvider().IsValid())
        {
            TEUIModelWeakRef<FVM_CommonHoverProvider> local_2 = this.GetHoverProvider();
            (this.GetbEnableClickLock() && this.GetExternalTipModels().IsEmpty()).SetbResponsibleForClick();
        }
        return;
    }
    void RefreshCommonTipHoverModels()
    {
        int local_75;
        if (!(this.GetItemConfig()))
        {
            return;
        }
        FItemTipData local_36;
        if (this.GetItemData().IsValid())
        {
            ::CommonItemTip::MakeSimpleFromItemData(this.GetItemData());
        }
        else
        {
            if (this.GetItemNum() > 0)
            {
                local_75 = this.GetItemNum();
            }
            else
            {
                local_75 = 1;
            }
            ::CommonItemTip::MakeSimpleFromItemConfig(this.GetItemConfig(), local_75);
        }
        if (this.ShouldShowVoucherAction())
        {
            FSimpleModelEvent local_98;
            local_98.Add(this, FVM_CommonItemBar::OpenRechargePage);
        }
        this.SetCommonTipHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, local_36));
        return;
    }
    void NotifyExternalHoverEnter()
    {
        if (this.GetExternalTipModels().IsEmpty() || !(this.GetItemData().IsValid()))
        {
            return;
        }
        FEUIModelContainer::GetModel(this.GetExternalTipModels()).opCall().SetExternalDisplayItem(this.GetItemData());
        return;
    }
    void NotifyExternalHoverLeave()
    {
        if (this.GetExternalTipModels().IsEmpty())
        {
            return;
        }
        FEUIModelContainer::GetModel(this.GetExternalTipModels()).opCall().ClearExternalDisplayItem();
        return;
    }
    void NotifyExternalClick()
    {
        if (this.GetExternalTipModels().IsEmpty() || !(this.GetItemData().IsValid()))
        {
            return;
        }
        FEUIModelContainer::GetModel(this.GetExternalTipModels()).opCall().SetExternalDisplayItem(this.GetItemData());
        FEUIModelContainer::GetModel(this.GetExternalTipModels()).opCall().SetFixedItem(FEUIModelContainer::GetModel(this.GetExternalTipModels()).opCall().GetExternalDisplayItem());
        return;
    }
    TDataObjectPtr<FItemConfig> GetItemConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_ItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemConfig = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetItemData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ItemData;
    }
    void SetItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemData = __Value;
        return;
    }
    int GetItemNum() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemNum;
    }
    void SetItemNum(const int __Value) property
    {
        if (this.m_ItemNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemNum = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetTipsItem() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TipsItem;
    }
    void SetTipsItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_TipsItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TipsItem = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_CommonHoverProvider> GetHoverProvider() const property
    {
        this.TrackPropertyRead(4);
        return this.m_HoverProvider;
    }
    void SetHoverProvider(const TEUIModelWeakRef<FVM_CommonHoverProvider> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommonHoverProvider> local_2;
        local_2 = this.m_HoverProvider;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HoverProvider = __Value;
        return;
    }
    const FEUIModelContainer GetCommonTipHoverModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIModelContainer GetModify_CommonTipHoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCommonTipHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CommonTipHoverModels = __Value;
        return;
    }
    const FEUIModelContainer GetExternalTipModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FEUIModelContainer GetModify_ExternalTipModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetExternalTipModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ExternalTipModels = __Value;
        return;
    }
    bool GetbEnableClickLock() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bEnableClickLock;
    }
    void SetbEnableClickLock(const bool __Value) property
    {
        if (!(this.m_bEnableClickLock) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bEnableClickLock = __Value;
        return;
    }
    bool GetbHasFixedTooltip() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bHasFixedTooltip;
    }
    void SetbHasFixedTooltip(const bool __Value) property
    {
        if (!(this.m_bHasFixedTooltip) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bHasFixedTooltip = __Value;
        return;
    }
    TWeakObjectPtr<UWidget> GetSharedHoverAnchor() const property
    {
        this.TrackPropertyRead(9);
        return this.m_SharedHoverAnchor;
    }
    void SetSharedHoverAnchor(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_SharedHoverAnchor == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SharedHoverAnchor = __Value;
        return;
    }
    ECommonHoverLayout GetSharedHoverLayout() const property
    {
        this.TrackPropertyRead(10);
        return this.m_SharedHoverLayout;
    }
    void SetSharedHoverLayout(const ECommonHoverLayout __Value) property
    {
        if (int(this.m_SharedHoverLayout) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SharedHoverLayout = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonItemBar
{
    UPROPERTY()
    FSlateBrush ItemIcon;
    UPROPERTY()
    FText ItemName;
    UPROPERTY()
    bool ShouldShowVoucherAction;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItemBar> Self;


}

namespace FVM_CommonItemBar
{
FVM_CommonItemBar& Create(const UObject ContextObject)
{
    return FVM_CommonItemBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonItemBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonItemBar __r;
    TEUIModelRef<FVM_CommonItemBar> local_6 = TEUIModelRef<FVM_CommonItemBar>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonItemBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipsItem";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommonTipHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowVoucherAction";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonItemBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonItemBar;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnInventoryChanged";
    local_26.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonItemBar;
}
void __OnInventoryChanged(FVM_CommonItemBar &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
int __UIGetter_ItemNum(const FVM_CommonItemBar &inout Model)
{
    return Model.GetItemNum();
}
TEUIModelRef<FVM_Item> __UIGetter_TipsItem(const FVM_CommonItemBar &inout Model)
{
    return Model.GetTipsItem();
}
FEUIModelContainer __UIGetter_CommonTipHoverModels(const FVM_CommonItemBar &inout Model)
{
    return Model.GetCommonTipHoverModels();
}
FSlateBrush __UIGetter_ItemIcon(const FVM_CommonItemBar &inout Model)
{
    return Model.GetItemIcon();
}
FText __UIGetter_ItemName(const FVM_CommonItemBar &inout Model)
{
    return Model.GetItemName();
}
bool __UIGetter_ShouldShowVoucherAction(const FVM_CommonItemBar &inout Model)
{
    return Model.ShouldShowVoucherAction();
}
TEUIModelRef<FVM_CommonItemBar> __UIGetter_Self(const FVM_CommonItemBar &inout Model)
{
    return TEUIModelRef<FVM_CommonItemBar>(Model);
}
int __IndexOf_ItemConfig()
{
    return 0;
}
int __IndexOf_ItemData()
{
    return 1;
}
int __IndexOf_ItemNum()
{
    return 2;
}
int __IndexOf_TipsItem()
{
    return 3;
}
int __IndexOf_HoverProvider()
{
    return 4;
}
int __IndexOf_CommonTipHoverModels()
{
    return 5;
}
int __IndexOf_ExternalTipModels()
{
    return 6;
}
int __IndexOf_bEnableClickLock()
{
    return 7;
}
int __IndexOf_bHasFixedTooltip()
{
    return 8;
}
int __IndexOf_SharedHoverAnchor()
{
    return 9;
}
int __IndexOf_SharedHoverLayout()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_CommonItemBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
