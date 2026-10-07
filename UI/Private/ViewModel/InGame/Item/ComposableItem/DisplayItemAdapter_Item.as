
namespace DisplayItemAdapter_Item
{
TEUIModelRef<FM_DisplayItemData> MakeDisplayData(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    int local_55 = 0;
    int local_112 = 0;
    FM_DisplayItemData& local_2 = FM_DisplayItemData::Create(ContextObject);
    local_2.SetSourceType(EDisplayItemSourceType(1));
    if (!(!(ItemDataModel.IsValid())) && GetConfig())
    {
        TDataObjectPtr<FItemConfig> local_30 = GetConfig();
        local_2.SetSourceId(local_55);
        FSoftBrush local_100;
        FVector2f local_111;
        if (0 == 2)
        {
            local_111 = FVector2f(180.0f, 180.0f);
        }
        else
        {
            local_111 = FVector2f(144.0f, 144.0f);
        }
        local_100.ImageSize = local_111;
        local_2.SetItemImage(local_100);
        int local_103 = local_112;
        local_2.SetRarityValue(local_103);
        if (UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_112)).IsSet())
        {
        }
    }
    return TEUIModelRef<FM_DisplayItemData>(local_2);
}
void ApplyRuntimeState(const FVM_DisplayItem &inout DisplayItemVM, const TEUIModelRef<FM_ItemData> &inout ItemDataModel)
{
    int local_4;
    int local_89 = 0;
    if (ItemDataModel.IsValid())
    {
        local_4 = GetNum();
    }
    else
    {
        local_4 = 0;
    }
    FText local_16 = local_4 > 0 ? FText::AsNumber(local_4, FNumberFormattingOptions::DefaultWithGrouping()) : FText();
    DisplayItemUtility::SetCountText(DisplayItemVM, local_16);
    FSoftBrush local_60;
    if (!(!(ItemDataModel.IsValid())) && GetConfig())
    {
        if (UGlobalItemSettings::Get().GetRarityConfig(EItemRarity(local_89)).IsSet())
        {
        }
    }
    DisplayItemUtility::SetGradeImage(DisplayItemVM, local_60);
    return;
}
TEUIModelRef<FVM_DisplayItem> CreateDisplayItem(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemDataModel, const EItemDisplayScenario Scenario = EItemDisplayScenario::Default)
{
    TEUIModelRef<FM_DisplayItemData> local_2 = DisplayItemAdapter_Item::MakeDisplayData(ContextObject, ItemDataModel);
    TEUIModelRef<FVM_DisplayItem> local_8 = TEUIModelRef<FVM_DisplayItem>(FVM_DisplayItem::Create(ContextObject, local_2, EItemDisplayScenario(Scenario)));
    return local_8;
}
}
