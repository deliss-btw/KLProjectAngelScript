namespace DisplayItemAdapter_Item
{
TEUIModelRef<FM_DisplayItemData> MakeDisplayData(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    FM_DisplayItemData& local_2 = FM_DisplayItemData::Create(ContextObject);
    local_2.SetSourceType(EDisplayItemSourceType(1));
    if (!(!(ItemDataModel.IsValid())) && ItemDataModel.Get().GetConfig())
    {
        TDataObjectPtr<FItemConfig> local_30 = ItemDataModel.Get().GetConfig();
        local_2.SetSourceId(local_30.Get().DataId);
        local_2.SetDisplayName(local_30.Get().ItemName);
        FSoftBrush local_100 = FSoftBrush(local_30.Get().ItemIcon);
        FVector2f local_111;
        if (int(local_30.Get().ItemType) == 2)
        {
            local_111 = FVector2f(180.0f, 180.0f);
        }
        else
        {
            local_111 = FVector2f(144.0f, 144.0f);
        }
        local_100.ImageSize = local_111;
        local_2.SetItemImage(local_100);
        local_2.SetRarityValue(int(local_30.Get().Rarity));
        TDataObjectPtr<FItemRarityConfig> local_162 = UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_30.Get().Rarity));
        if (local_162.IsSet())
        {
            local_2.SetItemImageBG(local_162.Get().RarityImage);
            local_2.SetRarityColor(local_162.Get().DefaultColor);
        }
    }
    return TEUIModelRef<FM_DisplayItemData>(local_2);
}
void ApplyRuntimeState(const FVM_DisplayItem &inout DisplayItemVM, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    int local_4;
    if (ItemDataModel.IsValid())
    {
        local_4 = ItemDataModel.Get().GetNum();
    }
    else
    {
        local_4 = 0;
    }
    FText local_16 = local_4 > 0 ? FText::AsNumber(local_4, FNumberFormattingOptions::DefaultWithGrouping()) : FText();
    DisplayItemUtility::SetCountText(DisplayItemVM, local_16);
    FSoftBrush local_60;
    if (!(!(ItemDataModel.IsValid())) && ItemDataModel.Get().GetConfig())
    {
        TDataObjectPtr<FItemRarityConfig> local_114 = UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(ItemDataModel.Get().GetConfig().Get().Rarity));
        if (local_114.IsSet())
        {
            local_60 = local_114.Get().RarityImage;
        }
    }
    DisplayItemUtility::SetGradeImage(DisplayItemVM, local_60);
    return;
}
TEUIModelRef<FVM_DisplayItem> CreateDisplayItem(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel, const EItemDisplayScenario Scenario = EItemDisplayScenario::Default)
{
    TEUIModelRef<FM_DisplayItemData> local_2 = DisplayItemAdapter_Item::MakeDisplayData(ContextObject, ItemDataModel);
    TEUIModelRef<FVM_DisplayItem> local_6 = TEUIModelRef<FVM_DisplayItem>(FVM_DisplayItem::Create(ContextObject, local_2, EItemDisplayScenario(Scenario)));
    DisplayItemAdapter_Item::ApplyRuntimeState(local_6.Get(), ItemDataModel);
    return local_6;
}
}
