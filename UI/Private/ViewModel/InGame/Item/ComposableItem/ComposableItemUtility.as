
namespace ComposableItemUtility
{
    const int COMPOSABLE_ITEM_STATE_NORMAL = 0;
    const int COMPOSABLE_ITEM_STATE_PURE_BG = 1;
    const int COMPOSABLE_ITEM_STATE_EMPTY_SLOT = 2;
    const int COMPOSABLE_ITEM_STATE_TEMP_ICON = 3;

void SetItemDisplayState(const FEUIModelContainer &inout ItemModelContainer, const int DisplayState)
{
    FVM_ComposableItem& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetCurDisplayState(DisplayState);
    }
    return;
}
void SetSpecialDisplayItemImage(const FEUIModelContainer &inout ItemModelContainer, const FSoftBrush &inout InItemImage)
{
    FVM_ComposableItem& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        if (local_2.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_10 = local_2.GetCommonItemVM();
            InItemImage.SetSpecialDisplayItemImage();
        }
    }
    return;
}
void SetItemCustomSelection(const FEUIModelContainer &inout ItemModelContainer, const bool bIsSelected)
{
    FVM_ComposableItem& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        if (local_2.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_10 = local_2.GetCommonItemVM();
            bIsSelected.SetItemCustomSelection();
        }
    }
    return;
}
void BindItemClickCallback(const FEUIModelContainer &inout ItemModelContainer, const FEUIModelRef &inout ModelRef, const FEUIModelCallbackSignature &inout Callback)
{
    FVM_ComposableItem& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        if (local_2.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_10 = local_2.GetCommonItemVM();
            GetOnCommonItemClicked().Add(ModelRef, Callback);
        }
    }
    return;
}
void UnbindItemClickCallback(const FEUIModelContainer &inout ItemModelContainer, const FEUIModelRef &inout ModelRef, const FEUIModelCallbackSignature &inout Callback)
{
    FVM_ComposableItem& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        if (local_2.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_10 = local_2.GetCommonItemVM();
        }
    }
    return;
}
void SetItemCountText(const FVM_ComposableItem &inout ComposableItemVM, const FText &inout CountText)
{
    ItemFeature_Count_Util::SetDisplayText(ComposableItemVM.GetFeature_Count().ModelContainer, CountText);
    return;
}
void SetIsShowLevel(const FVM_ComposableItem &inout ComposableItemVM, const bool InIsShowLevel)
{
    ItemFeature_Level_Util::SetIsShowLevel(ComposableItemVM.GetFeature_Level().ModelContainer, InIsShowLevel);
    return;
}
int GetItemEquipMarkState(const FVM_ComposableItem &inout ComposableItemVM)
{
    return ItemFeature_EquipMark_Util::GetItemState(ComposableItemVM.GetFeature_EquipMark().ModelContainer);
}
bool IsItemEquipBySelf(const FVM_ComposableItem &inout ComposableItemVM)
{
    return (ComposableItemUtility::GetItemEquipMarkState(ComposableItemVM) == 1);
}
bool IsItemEquipByOther(const FVM_ComposableItem &inout ComposableItemVM)
{
    return (ComposableItemUtility::GetItemEquipMarkState(ComposableItemVM) == 2);
}
bool IsItemEquipped(const FVM_ComposableItem &inout ComposableItemVM)
{
    return ComposableItemUtility::IsItemEquipBySelf(ComposableItemVM) || ComposableItemUtility::IsItemEquipByOther(ComposableItemVM);
}
void SetItemEquipMarkState(const FVM_ComposableItem &inout ComposableItemVM, const int EquipMarkState)
{
    ItemFeature_EquipMark_Util::SetItemState(ComposableItemVM.GetFeature_EquipMark().ModelContainer, EquipMarkState);
    return;
}
bool GetItemEquipMarkIsCheckableSelected(const FVM_ComposableItem &inout ComposableItemVM)
{
    return ItemFeature_EquipMark_Util::GetItemIsCheckableSelected(ComposableItemVM.GetFeature_EquipMark().ModelContainer);
}
void SetItemEquipMarkIsCheckableSelected(const FVM_ComposableItem &inout ComposableItemVM, const bool IsCheckableSelected)
{
    ItemFeature_EquipMark_Util::SetItemIsCheckableSelected(ComposableItemVM.GetFeature_EquipMark().ModelContainer, IsCheckableSelected);
    return;
}
void SetItemEquipMarkLimitCount(const FVM_ComposableItem &inout ComposableItemVM, const int LimitCount)
{
    ItemFeature_EquipMark_Util::SetItemLimitCount(ComposableItemVM.GetFeature_EquipMark().ModelContainer, LimitCount);
    return;
}
void TriggerItemEquipMarkCheckableItemSelectedChange(const FVM_ComposableItem &inout ComposableItemVM)
{
    ItemFeature_EquipMark_Util::TriggerCheckableItemSelectedChange(ComposableItemVM.GetFeature_EquipMark().ModelContainer);
    return;
}
void SetItemMaskEnable(const FVM_ComposableItem &inout ComposableItemVM, const bool bEnableMask)
{
    ItemFeature_Mask_Util::SetEnableMask(ComposableItemVM.GetFeature_Mask().ModelContainer, bEnableMask);
    return;
}
int GetItemMaskType(const FVM_ComposableItem &inout ComposableItemVM)
{
    return ItemFeature_Mask_Util::GetItemMaskType(ComposableItemVM.GetFeature_Mask().ModelContainer);
}
void SetItemMaskType(const FVM_ComposableItem &inout ComposableItemVM, const int MaskType)
{
    ItemFeature_Mask_Util::SetItemMaskType(ComposableItemVM.GetFeature_Mask().ModelContainer, MaskType);
    return;
}
bool HasItemRedDot(const FVM_ComposableItem &inout ComposableItemVM)
{
    return ItemFeature_RedDot_Util::HasRedDot(ComposableItemVM.GetFeature_RedDot().ModelContainer);
}
void SetItemRedDotVM(const FVM_ComposableItem &inout ComposableItemVM, const TEUIModelRef<FVM_RedDot> &inout RedDotVM)
{
    ItemFeature_RedDot_Util::SetCurRedDotVM(ComposableItemVM.GetFeature_RedDot().ModelContainer, RedDotVM);
    return;
}
void SetIsShowTag(const FVM_ComposableItem &inout ComposableItemVM, const bool InIsShowTag)
{
    ItemFeature_Tag_Util::SetIsShowTag(ComposableItemVM.GetFeature_Tag().ModelContainer, InIsShowTag);
    return;
}
void SetDisplayTagText(const FVM_ComposableItem &inout ComposableItemVM, const FText &inout InDisplayTagText)
{
    ItemFeature_Tag_Util::SetDisplayTagText(ComposableItemVM.GetFeature_Tag().ModelContainer, InDisplayTagText);
    return;
}
void SetItemSpecialBgImage(const FVM_ComposableItem &inout ComposableItemVM, const FSoftBrush &inout InSpecialBgImage)
{
    ItemFeature_SpecialBg_Util::SetSpecialBgImage(ComposableItemVM.GetFeature_SpecialBg().ModelContainer, InSpecialBgImage);
    return;
}
}
