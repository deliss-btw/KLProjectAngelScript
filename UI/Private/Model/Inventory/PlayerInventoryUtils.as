

namespace PlayerInventoryUtils
{
void ShowInventoryAddMessage(const UObject ContextObject, const TDataObjectPtr<FItemConfig> &inout ItemConfig, const int IncreaseNum)
{
    FMS_ChatDataModel& local_2 = FMS_ChatDataModel::Get(ContextObject);
    if (local_2)
    {
        local_2.PublishGetItemSystemMsg(ItemConfig, IncreaseNum);
    }
    UGlobalItemSettings local_8 = UGlobalItemSettings::Get();
    if (!(local_8.InventoryAddItemHintWidget.IsNull()))
    {
        FVM_ItemRarity& local_12 = FVM_ItemRarity::Create(ContextObject, ItemConfig.opArrow().Rarity);
        FCommonSideHintData local_108;
        local_108.Content = FText::Format(NSLOCTEXT("InventoryAddItemSideHintContent", "иЋ·еѕ—{0}: {1}x{2}"), local_12.GetRarityConfig().opArrow().ItemNamePrefix, ItemConfig.opArrow().ItemName, IncreaseNum);
        local_108.Icon = ItemConfig.opArrow().ItemIcon;
        local_108.SpecialBgImage = ItemFeature_SpecialBg_Util::GetSpecialBgImage(ItemConfig);
        local_108.Lifetime = CommonPopupSettings::Get().DefaultSmallSideHintLifetime;
        Make local_194;
        FEUIModelContainer local_180 = local_194.opImplConv();
        local_180.AddModel(FEUIModelRef(local_12), false);
        CommonPopup::SmallHintCustom(local_8.InventoryAddItemHintWidget, local_180, 0);
    }
    return;
}
}
