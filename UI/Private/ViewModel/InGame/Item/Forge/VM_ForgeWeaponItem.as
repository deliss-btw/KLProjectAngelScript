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
        if (this.GetNode().IsValid() && this.GetNode().Get().GetConfig().GetCraft().IsSet())
        {
            TEUIModelRef<FM_ItemData> local_6 = TEUIModelRef<FM_ItemData>(::FM_ItemData::Create(this.GetContext().Manager));
            local_6.Get().SetConfig(this.GetNode().Get().GetConfig().GetCraft().Get().Product.Item);
            local_6.Get().SetNum(1);
            this.SetComposableItemVM(TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, local_6, EItemDisplayScenario(6))));
            ::ComposableItemUtility::BindItemClickCallback(FEUIModelContainer(this.GetComposableItemVM().Get()), FEUIModelRef(this), FVM_ForgeWeaponItem::OnItemClicked);
            this.SetItemImage(local_6.Get().GetConfig().Get().ItemIcon);
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
            ::ComposableItemUtility::UnbindItemClickCallback(FEUIModelContainer(this.GetComposableItemVM().Get()), FEUIModelRef(this), FVM_ForgeWeaponItem::OnItemClicked);
        }
        return;
    }
    void OnNodeStateTypeChanged()
    {
        if (this.GetNode().IsValid() && this.GetComposableItemVM().IsValid())
        {
            ::ComposableItemUtility::SetIsShowLevel(this.GetComposableItemVM().Get(), true);
            FEUIModelContainer local_22 = FEUIModelContainer(this.GetComposableItemVM().Get());
            ::ComposableItemUtility::SetSpecialDisplayItemImage(local_22, this.GetItemImage());
            ::ComposableItemUtility::SetItemMaskEnable(this.GetComposableItemVM().Get(), (int(this.GetNode().Get().GetStateType()) != 0));
            if (int(this.GetNode().Get().GetStateType()) == 3)
            {
                ::ComposableItemUtility::SetItemMaskType(this.GetComposableItemVM().Get(), 4);
                ::ComposableItemUtility::SetIsShowLevel(this.GetComposableItemVM().Get(), false);
                FEUIModelContainer local_22_2 = FEUIModelContainer(this.GetComposableItemVM().Get());
                ::ComposableItemUtility::SetSpecialDisplayItemImage(local_22_2, this.GetHiddenItemImage());
            }
            else
            {
                if (int(this.GetNode().Get().GetStateType()) == 2)
                {
                    ::ComposableItemUtility::SetItemMaskType(this.GetComposableItemVM().Get(), 1);
                }
                else
                {
                    if (int(this.GetNode().Get().GetStateType()) == 1)
                    {
                        ::ComposableItemUtility::SetItemMaskType(this.GetComposableItemVM().Get(), 2);
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
FVM_ForgeWeaponItem& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FM_ForgeNode> &inout Node)
{
    return TEUIModelRef<FVM_ForgeWeaponItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponItem::ModelId, 0, Node)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ComposableItemVM";
    local_14.TypeName = "TEUIModelRef<FVM_ComposableItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponItem;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(7);
    local_22.AddRefPropertyDirty(0, 0, FM_ForgeNode::__IndexOf_StateType());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("Node");
    local_30.PropertyModelId = FM_ForgeNode::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FM_ForgeNode::__IndexOf_StateType(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__OnNodeStateTypeChanged";
    local_40.DirtyFlags.Set(FVM_ForgeWeaponItem::__IndexOf_Node());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    return;
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
    return __GeneratedProperties_FVM_ForgeWeaponItem.Get();
}
}
