
namespace DisplayItemUtility
{
void SetDisplayState(const FEUIModelContainer &inout DisplayItemContainer, const int DisplayState)
{
    FVM_DisplayItem& local_2 = FEUIModelContainer::GetModel(DisplayItemContainer).opCall();
    if (local_2)
    {
        DisplayItemUtility::SetDisplayState(local_2, DisplayState);
    }
    return;
}
void SetDisplayState(FVM_DisplayItem &inout DisplayItemVM, const int DisplayState)
{
    DisplayItemVM.ApplyDisplayState(DisplayState);
    return;
}
void SetSpecialDisplayItemImage(const FEUIModelContainer &inout DisplayItemContainer, const FSoftBrush &inout InItemImage)
{
    FVM_DisplayItem& local_2 = FEUIModelContainer::GetModel(DisplayItemContainer).opCall();
    if (local_2)
    {
        DisplayItemUtility::SetSpecialDisplayItemImage(local_2, InItemImage);
    }
    return;
}
void SetSpecialDisplayItemImage(FVM_DisplayItem &inout DisplayItemVM, const FSoftBrush &inout InItemImage)
{
    DisplayItemVM.SetDisplayItemImage(InItemImage);
    return;
}
void SetTempDisplayItemImage(const FEUIModelContainer &inout DisplayItemContainer, const FSoftBrush &inout InItemImage)
{
    FVM_DisplayItem& local_2 = FEUIModelContainer::GetModel(DisplayItemContainer).opCall();
    if (local_2)
    {
        DisplayItemUtility::SetTempDisplayItemImage(local_2, InItemImage);
    }
    return;
}
void SetTempDisplayItemImage(FVM_DisplayItem &inout DisplayItemVM, const FSoftBrush &inout InItemImage)
{
    DisplayItemVM.SetTempDisplayItemImage(InItemImage);
    return;
}
void SetCustomSelection(const FEUIModelContainer &inout DisplayItemContainer, const bool bIsSelected)
{
    FVM_DisplayItem& local_2 = FEUIModelContainer::GetModel(DisplayItemContainer).opCall();
    if (local_2)
    {
        DisplayItemUtility::SetCustomSelection(local_2, bIsSelected);
    }
    return;
}
void SetCustomSelection(const FVM_DisplayItem &inout DisplayItemVM, const bool bIsSelected)
{
    if (DisplayItemVM.GetCommonItemVM().IsValid())
    {
        TEUIModelRef<FVM_CommonItem> local_2 = DisplayItemVM.GetCommonItemVM();
        bIsSelected.SetItemCustomSelection();
    }
    return;
}
void BindDisplayItemClickCallback(const FEUIModelContainer &inout DisplayItemContainer, const FEUIModelRef &inout ModelRef, const FEUIModelCallbackSignature &inout Callback)
{
    FVM_DisplayItem& local_2 = FEUIModelContainer::GetModel(DisplayItemContainer).opCall();
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
void UnbindDisplayItemClickCallback(const FEUIModelContainer &inout DisplayItemContainer, const FEUIModelRef &inout ModelRef, const FEUIModelCallbackSignature &inout Callback)
{
    FVM_DisplayItem& local_2 = FEUIModelContainer::GetModel(DisplayItemContainer).opCall();
    if (local_2)
    {
        if (local_2.GetCommonItemVM().IsValid())
        {
            TEUIModelRef<FVM_CommonItem> local_10 = local_2.GetCommonItemVM();
        }
    }
    return;
}
void SetCountText(const FVM_DisplayItem &inout DisplayItemVM, const FText &inout CountText)
{
    ItemFeature_Count_Util::SetDisplayText(DisplayItemVM.GetFeature_Count().ModelContainer, CountText);
    return;
}
void SetIsShowLevel(const FVM_DisplayItem &inout DisplayItemVM, const bool bIsShowLevel)
{
    ItemFeature_Level_Util::SetIsShowLevel(DisplayItemVM.GetFeature_Level().ModelContainer, bIsShowLevel);
    return;
}
void SetLevelText(const FVM_DisplayItem &inout DisplayItemVM, const FText &inout LevelText)
{
    ItemFeature_Level_Util::SetDisplayLevelText(DisplayItemVM.GetFeature_Level().ModelContainer, LevelText);
    ItemFeature_Level_Util::SetIsShowLevel(DisplayItemVM.GetFeature_Level().ModelContainer, !(LevelText.IsEmpty()));
    return;
}
int GetEquipMarkState(const FVM_DisplayItem &inout DisplayItemVM)
{
    return ItemFeature_EquipMark_Util::GetItemState(DisplayItemVM.GetFeature_EquipMark().ModelContainer);
}
void SetEquipMarkState(const FVM_DisplayItem &inout DisplayItemVM, const int EquipMarkState)
{
    ItemFeature_EquipMark_Util::SetItemState(DisplayItemVM.GetFeature_EquipMark().ModelContainer, EquipMarkState);
    return;
}
void SetEquipStateByFlags(const FVM_DisplayItem &inout DisplayItemVM, const bool bCurrent, const bool bEquipped)
{
    int local_1 = 4;
    if (bCurrent)
    {
        local_1 = 1;
    }
    else
    {
        if (bEquipped)
        {
            local_1 = 2;
        }
    }
    DisplayItemUtility::SetEquipMarkState(DisplayItemVM, local_1);
    return;
}
bool GetEquipMarkIsCheckableSelected(const FVM_DisplayItem &inout DisplayItemVM)
{
    return ItemFeature_EquipMark_Util::GetItemIsCheckableSelected(DisplayItemVM.GetFeature_EquipMark().ModelContainer);
}
void SetEquipMarkIsCheckableSelected(const FVM_DisplayItem &inout DisplayItemVM, const bool bIsCheckableSelected)
{
    ItemFeature_EquipMark_Util::SetItemIsCheckableSelected(DisplayItemVM.GetFeature_EquipMark().ModelContainer, bIsCheckableSelected);
    return;
}
void SetEquipMarkLimitCount(const FVM_DisplayItem &inout DisplayItemVM, const int LimitCount)
{
    ItemFeature_EquipMark_Util::SetItemLimitCount(DisplayItemVM.GetFeature_EquipMark().ModelContainer, LimitCount);
    return;
}
void SetMaskEnable(const FVM_DisplayItem &inout DisplayItemVM, const bool bEnableMask)
{
    ItemFeature_Mask_Util::SetEnableMask(DisplayItemVM.GetFeature_Mask().ModelContainer, bEnableMask);
    return;
}
void SetMaskType(const FVM_DisplayItem &inout DisplayItemVM, const int MaskType)
{
    ItemFeature_Mask_Util::SetItemMaskType(DisplayItemVM.GetFeature_Mask().ModelContainer, MaskType);
    return;
}
void SetMask(const FVM_DisplayItem &inout DisplayItemVM, const bool bEnableMask, const int MaskType)
{
    DisplayItemUtility::SetMaskEnable(DisplayItemVM, bEnableMask);
    DisplayItemUtility::SetMaskType(DisplayItemVM, MaskType);
    return;
}
void SetGradeImage(const FVM_DisplayItem &inout DisplayItemVM, const FSoftBrush &inout ItemRarityImage)
{
    ItemFeature_Grade_Util::SetItemRarityImage(DisplayItemVM.GetFeature_Grade().ModelContainer, ItemRarityImage);
    return;
}
void SetRedDotVM(const FVM_DisplayItem &inout DisplayItemVM, const TEUIModelRef<FVM_RedDot> &inout RedDotVM)
{
    ItemFeature_RedDot_Util::SetCurRedDotVM(DisplayItemVM.GetFeature_RedDot().ModelContainer, RedDotVM);
    return;
}
void SetIsShowTag(const FVM_DisplayItem &inout DisplayItemVM, const bool bIsShowTag)
{
    ItemFeature_Tag_Util::SetIsShowTag(DisplayItemVM.GetFeature_Tag().ModelContainer, bIsShowTag);
    return;
}
void SetDisplayTagText(const FVM_DisplayItem &inout DisplayItemVM, const FText &inout DisplayTagText)
{
    ItemFeature_Tag_Util::SetDisplayTagText(DisplayItemVM.GetFeature_Tag().ModelContainer, DisplayTagText);
    return;
}
void SetTag(const FVM_DisplayItem &inout DisplayItemVM, const bool bIsShowTag, const FText &inout DisplayTagText)
{
    DisplayItemUtility::SetIsShowTag(DisplayItemVM, bIsShowTag);
    DisplayItemUtility::SetDisplayTagText(DisplayItemVM, DisplayTagText);
    return;
}
}
