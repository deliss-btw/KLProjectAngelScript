
namespace FVM_ForgeWeaponItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnItemClicked = FEUIModelCallbackSignature();

}
struct FVM_ForgeWeaponItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeNode> m_Node;
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> m_ComposableItemVM;
    UPROPERTY()
    UWidget_ForgeWeaponItem m_ForgeWeaponItemWidget;
    UPROPERTY()
    UWidget_ForgeWeaponFormulaTree m_OwnerFormulaTreeWidget;
    UPROPERTY()
    FSoftBrush m_ItemImage;
    UPROPERTY()
    FSoftBrush m_HiddenItemImage;
    UPROPERTY()
    bool m_bSelected;

    FVM_ForgeWeaponItem()
    {
        this.m_ForgeWeaponItemWidget = nullptr;
        this.m_OwnerFormulaTreeWidget = nullptr;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponItem' by default constructor.");
        return;
    }
    FVM_ForgeWeaponItem(const FVM_ForgeWeaponItem &inout Other)
    {
        this.m_ForgeWeaponItemWidget = nullptr;
        this.m_OwnerFormulaTreeWidget = nullptr;
        this.m_bSelected = false;
        this.m_Node = Other.m_Node;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_ForgeWeaponItemWidget = Other.m_ForgeWeaponItemWidget;
        this.m_OwnerFormulaTreeWidget = Other.m_OwnerFormulaTreeWidget;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_HiddenItemImage = Other.m_HiddenItemImage;
        this.m_bSelected = Other.m_bSelected;
        return;
    }
    FVM_ForgeWeaponItem(const TEUIModelWeakRef<FM_ForgeNode> &inout InNode)
    {
        this.m_ForgeWeaponItemWidget = nullptr;
        this.m_OwnerFormulaTreeWidget = nullptr;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetNode(InNode);
        return;
    }
    FVM_ForgeWeaponItem opAssign(const FVM_ForgeWeaponItem &inout Other)
    {
        FVM_ForgeWeaponItem __r;
        this.m_Node = Other.m_Node;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_ForgeWeaponItemWidget = Other.m_ForgeWeaponItemWidget;
        this.m_OwnerFormulaTreeWidget = Other.m_OwnerFormulaTreeWidget;
        this.m_ItemImage = Other.m_ItemImage;
        this.m_HiddenItemImage = Other.m_HiddenItemImage;
        this.m_bSelected = Other.m_bSelected;
        return __r;
    }
    void PostConstruct()
    {
        bool local_3 = this.GetNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetNode();
            local_3 = GetConfig().GetCraft().IsSet();
        }
        if (local_3)
        {
            TEUIModelRef<FM_ItemData> local_8 = TEUIModelRef<FM_ItemData>(::FM_ItemData::Create(this.GetContext().Manager));
            TEUIModelWeakRef<FM_ForgeNode> local_2_2 = this.GetNode();
            1.SetNum();
            this.SetComposableItemVM(TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, local_8, EItemDisplayScenario(6))));
            FEUIModelRef local_14 = FEUIModelRef(this);
            TEUIModelRef<FVM_ComposableItem> local_12 = this.GetComposableItemVM();
            ::ComposableItemUtility::BindItemClickCallback(FEUIModelContainer(), local_14, FVM_ForgeWeaponItem::OnItemClicked);
            this.OnNodeStateTypeChanged();
        }
        if (::UGlobalItemSettings::Get().ItemHideStateImage.Contains(EItemType(2)))
        {
            this.SetHiddenItemImage(::UGlobalItemSettings::Get().ItemHideStateImage[EItemType(2)]);
        }
        return;
    }
    void BeginDestroy()
    {
        if (this.GetComposableItemVM().IsValid())
        {
            FEUIModelRef local_6 = FEUIModelRef(this);
            TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItemVM();
            ::ComposableItemUtility::UnbindItemClickCallback(FEUIModelContainer(), local_6, FVM_ForgeWeaponItem::OnItemClicked);
        }
        return;
    }
    void OnNodeStateTypeChanged()
    {
        if (this.GetNode().IsValid() && this.GetComposableItemVM().IsValid())
        {
            FEUIModelContainer local_22;
            TEUIModelRef<FVM_ComposableItem> local_6 = this.GetComposableItemVM();
            ::ComposableItemUtility::SetIsShowLevel(true);
            TEUIModelRef<FVM_ComposableItem> local_6_2 = this.GetComposableItemVM();
            ::ComposableItemUtility::SetSpecialDisplayItemImage(local_22, this.GetItemImage());
            TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetNode();
            bool local_7 = (int(GetStateType()) != 0);
            TEUIModelRef<FVM_ComposableItem> local_6_3 = this.GetComposableItemVM();
            ::ComposableItemUtility::SetItemMaskEnable(local_7);
            TEUIModelWeakRef<FM_ForgeNode> local_2_2 = this.GetNode();
            if (int(GetStateType()) == 3)
            {
                TEUIModelRef<FVM_ComposableItem> local_6_4 = this.GetComposableItemVM();
                TEUIModelRef<FVM_ComposableItem> local_6_5 = this.GetComposableItemVM();
                ::ComposableItemUtility::SetIsShowLevel(false);
                TEUIModelRef<FVM_ComposableItem> local_6_6 = this.GetComposableItemVM();
                ::ComposableItemUtility::SetSpecialDisplayItemImage(local_22, this.GetHiddenItemImage());
            }
            else
            {
                TEUIModelWeakRef<FM_ForgeNode> local_2_3 = this.GetNode();
                if (int(GetStateType()) == 2)
                {
                    TEUIModelRef<FVM_ComposableItem> local_6_7 = this.GetComposableItemVM();
                }
                else
                {
                    TEUIModelWeakRef<FM_ForgeNode> local_2_4 = this.GetNode();
                    if (int(GetStateType()) == 1)
                    {
                        TEUIModelRef<FVM_ComposableItem> local_6_8 = this.GetComposableItemVM();
                    }
                }
            }
        }
        if (this.GetNode().IsValid() && (this.GetOwnerFormulaTreeWidget() != nullptr))
        {
            this.GetOwnerFormulaTreeWidget().UpdateNodeLineStyle(this.GetNode());
        }
        return;
    }
    void OnItemClicked()
    {
        int local_2 = 0;
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        TEUIModelWeakRef<FM_ForgeNode> local_12 = this.GetNode();
        TEUIModelWeakRef<FM_ForgeNode> local_10;
        local_2.ItemNodeM = local_10;
        return;
    }
    TEUIModelWeakRef<FM_ForgeNode> GetNode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Node;
    }
    void SetNode(const TEUIModelWeakRef<FM_ForgeNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ForgeNode> local_2;
        local_2 = this.m_Node;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Node = __Value;
        return;
    }
    TEUIModelRef<FVM_ComposableItem> GetComposableItemVM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ComposableItemVM;
    }
    void SetComposableItemVM(const TEUIModelRef<FVM_ComposableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_ComposableItem> local_2;
        local_2 = this.m_ComposableItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ComposableItemVM = __Value;
        return;
    }
    UWidget_ForgeWeaponItem GetForgeWeaponItemWidget() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ForgeWeaponItemWidget;
    }
    void SetForgeWeaponItemWidget(const UWidget_ForgeWeaponItem __Value) property
    {
        if (this.m_ForgeWeaponItemWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    UWidget_ForgeWeaponFormulaTree GetOwnerFormulaTreeWidget() const property
    {
        this.TrackPropertyRead(3);
        return this.m_OwnerFormulaTreeWidget;
    }
    void SetOwnerFormulaTreeWidget(const UWidget_ForgeWeaponFormulaTree __Value) property
    {
        if (this.m_OwnerFormulaTreeWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    const FSoftBrush GetItemImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_ItemImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetItemImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ItemImage = __Value;
        return;
    }
    const FSoftBrush GetHiddenItemImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSoftBrush GetModify_HiddenItemImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetHiddenItemImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_HiddenItemImage = __Value;
        return;
    }
    bool GetbSelected() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bSelected;
    }
    void SetbSelected(const bool __Value) property
    {
        if (!(this.m_bSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bSelected = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponItem
{
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItem> Self;

    __GeneratedProperties_FVM_ForgeWeaponItem()
    {
        return;
    }
}

namespace FVM_ForgeWeaponItem
{
FVM_ForgeWeaponItem& Create(const UObject ContextObject, const TEUIModelWeakRef<FM_ForgeNode> &inout Node)
{
    return FVM_ForgeWeaponItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Node);
}
FVM_ForgeWeaponItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FM_ForgeNode> &inout Node)
{
    FVM_ForgeWeaponItem __r;
    TEUIModelRef<FVM_ForgeWeaponItem> local_6 = TEUIModelRef<FVM_ForgeWeaponItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponItem::ModelId, 0, Node));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponItem;
}
void __OnNodeStateTypeChanged(FVM_ForgeWeaponItem &inout Model)
{
    Model.OnNodeStateTypeChanged();
    return;
}
TEUIModelRef<FVM_ComposableItem> __UIGetter_ComposableItemVM(const FVM_ForgeWeaponItem &inout Model)
{
    return Model.GetComposableItemVM();
}
TEUIModelRef<FVM_ForgeWeaponItem> __UIGetter_Self(const FVM_ForgeWeaponItem &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponItem>(Model);
}
int __IndexOf_Node()
{
    return 0;
}
int __IndexOf_ComposableItemVM()
{
    return 1;
}
int __IndexOf_ForgeWeaponItemWidget()
{
    return 2;
}
int __IndexOf_OwnerFormulaTreeWidget()
{
    return 3;
}
int __IndexOf_ItemImage()
{
    return 4;
}
int __IndexOf_HiddenItemImage()
{
    return 5;
}
int __IndexOf_bSelected()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
