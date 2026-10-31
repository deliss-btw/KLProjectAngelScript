namespace AutoTest::API::CraftAPI
{
TEUIModelRef<FVM_ItemCraft> GetCraftViewModel()
{
    UWidget_CraftPanel local_28;
    TEUIModelRef<FVM_ItemCraft> local_2;
    TArray<UWidget> local_6;
    KLAutomation::GetAllWidgetsOfClass(local_6, UWidget_CraftPanel, false);
    ThrowIf(local_6.IsEmpty(), "Can't get CraftViewModel, check if the Craft Widget is open.");
    for (auto local_24 : local_6)
    {
        local_28 = Cast<UWidget_CraftPanel>(local_24);
        ThrowIf(local_28, !((local_28 != nullptr)));
        if (local_28.Craft.Get())
        {
            TEUIModelRef<FVM_ItemCraft> local_30;
            local_30;
            local_2 = local_30;
            break;
        }
    }
    return local_2;
}
TEUIModelRef<FVM_WeaponForge> GetWeaponForgeViewModel()
{
    UWidget_ForgeMain local_28;
    TEUIModelRef<FVM_WeaponForge> local_2;
    TArray<UWidget> local_6;
    KLAutomation::GetAllWidgetsOfClass(local_6, UWidget_ForgeMain, false);
    ThrowIf(local_6.IsEmpty(), "Can't get CraftViewModel, check if the Craft Widget is open.");
    for (auto local_24 : local_6)
    {
        local_28 = Cast<UWidget_ForgeMain>(local_24);
        ThrowIf(local_28, !((local_28 != nullptr)));
        if (local_28.WeaponForge.Get())
        {
            TEUIModelRef<FVM_WeaponForge> local_30;
            local_30;
            local_2 = local_30;
            break;
        }
    }
    return local_2;
}
void SelectItemInCraftPanel(const FName &inout ItemName)
{
    ThrowIf(ItemName.IsNone(), "ItemName is None.");
    TEUIModelRef<FVM_ItemCraft> local_4 = AutoTest::API::CraftAPI::GetCraftViewModel();
    ThrowIf(!(local_4), "Can't get CraftViewModel, check if the Craft Widget is open.");
    TDataObjectPtr<FItemConfig> local_30 = InventoryUtils::GetItemConfigByName(ItemName);
    ThrowIf((local_30 == nullptr), FString().Append("Can't find ItemConfig by name: ").Append(ItemName));
    for (auto& local_72 : local_4.opArrow().GetAllCraftableItems())
    {
        bool local_1_2 = !(local_72) || !(local_72.opArrow().GetItem());
        if (local_1_2)
        {
            local_1_2 = true;
        }
        else
        {
            TDataObjectPtr<FItemConfig> local_54;
            local_54 = local_72.opArrow().GetItem().opArrow().GetItemConfig();
            local_1_2 = (local_54 == nullptr);
        }
        if (local_1_2)
        {
            continue;
        }
        TDataObjectPtr<FItemConfig> local_100;
        local_100 = local_72.opArrow().GetItem().opArrow().GetItemConfig();
        if ((local_100 == local_30.opImplConv()))
        {
            local_4.Get().OnCraftableItemSelected(local_72);
            return;
        }
    }
    ThrowIf(true, FString().Append("Can't find craftable item in CraftPanel: ").Append(ItemName));
    return;
}
bool IsCurrentSelectedItemMatched(const FName &inout ItemName)
{
    ThrowIf(ItemName.IsNone(), "ItemName is None.");
    TEUIModelRef<FVM_ItemCraft> local_4 = AutoTest::API::CraftAPI::GetCraftViewModel();
    ThrowIf(!(local_4), "Can't get CraftViewModel, check if the Craft Widget is open.");
    TDataObjectPtr<FItemConfig> local_30 = InventoryUtils::GetItemConfigByName(ItemName);
    ThrowIf((local_30 == nullptr), FString().Append("Can't find ItemConfig by name: ").Append(ItemName));
    TDataObjectPtr<FItemConfig> local_54;
    local_54 = local_4.Get().GetCurrentCraft().Get().GetItem().opArrow().GetItemConfig();
    return (local_54 == local_30.opImplConv());
}
void PerformCraft()
{
    TEUIModelRef<FVM_ItemCraft> local_2 = AutoTest::API::CraftAPI::GetCraftViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get CraftViewModel, check if the Craft Widget is open.");
    local_2.Get().DoCraft();
    return;
}
TArray<uint> GetCurrentUnlockedForgeTrees()
{
    TArray<uint> local_4;
    TEUIModelRef<FVM_WeaponForge> local_6 = AutoTest::API::CraftAPI::GetWeaponForgeViewModel();
    ThrowIf(!(local_6), "Can't get ForgeViewModel, check if the Forge Widget is open.");
    TEUIModelRef<FMS_Forge> local_14 = local_6.opArrow().GetForgeModel();
    TEUIModelRef<FMS_Forge> local_12;
    ThrowIf(!(local_12), "ForgeModel is invalid, check if the Forge Widget is fully initialized.");
    for (auto local_31 : ForgeCommonUtil::GetWeaponTypeForgePriorityList())
    {
        TArray<TEUIModelWeakRef<FM_ForgeTree>> local_36 = local_12.Get().GetForgeTreeListByWeaponType(EWeaponType(local_31));
        for (auto& local_54 : local_36)
        {
            if (local_54.IsValid() && local_54.Get().CheckValid())
            {
                local_4.AddUnique(local_54.Get().GetTreeId());
            }
        }
    }
    return local_4;
}
TArray<uint> GetCurrentStateForgeNodes(const FString &inout NodeStateType)
{
    ThrowIf(NodeStateType.IsEmpty(), "NodeStateType is empty.");
    UEnum local_4 = UEnum::GetEnumType(n"EForgeNodeStateType");
    int local_5 = local_4.GetIndexByName(FName(NodeStateType), EGetByNameFlags(0));
    ThrowIf((local_5 == INDEX_NONE), FString().Append("NodeStateType: ").Append(NodeStateType).Append(" is not a valid EForgeNodeStateType enum value."));
    return AutoTest::API::CraftAPI::GetCurrentForgeNodesWithStateType(EForgeNodeStateType(local_5));
}
TArray<uint> GetCurrentForgeNodesWithStateType(const EForgeNodeStateType NodeStateType)
{
    EForgeNodeStateType local_71;
    TArray<uint> local_4;
    TEUIModelRef<FVM_WeaponForge> local_6 = AutoTest::API::CraftAPI::GetWeaponForgeViewModel();
    bool local_9 = !(local_6);
    ThrowIf(local_9, "Can't get ForgeViewModel, check if the Forge Widget is open.");
    TEUIModelRef<FMS_Forge> local_14 = local_6.opArrow().GetForgeModel();
    TEUIModelRef<FMS_Forge> local_12;
    local_9 = !(local_12);
    ThrowIf(local_9, "ForgeModel is invalid, check if the Forge Widget is fully initialized.");
    for (auto local_31 : ForgeCommonUtil::GetWeaponTypeForgePriorityList())
    {
        TArray<TEUIModelWeakRef<FM_ForgeTree>> local_36 = local_12.Get().GetForgeTreeListByWeaponType(EWeaponType(local_31));
        for (auto& local_54 : local_36)
        {
            if (!(local_54.IsValid()) || !(local_54.Get().CheckValid()))
            {
                continue;
            }
            for (auto& local_70 : local_54.Get().GetNodeList())
            {
                if (!(local_70.IsValid()))
                {
                    continue;
                }
                local_71 = local_70.Get().GetStateType();
                if ((int(local_71)) == (int(NodeStateType)))
                {
                    local_4.AddUnique(local_70.Get().GetDataId());
                }
            }
        }
    }
    return local_4;
}
void SelectForgeNodeByWeaponTypeAndDataId(const FString &inout WeaponType, const int NodeDataId)
{
    ThrowIf(WeaponType.IsEmpty(), "WeaponType is empty.");
    ThrowIf((NodeDataId <= 0), FString().Append("NodeDataId is invalid: ").Append(NodeDataId));
    TEUIModelRef<FVM_WeaponForge> local_10 = AutoTest::API::CraftAPI::GetWeaponForgeViewModel();
    ThrowIf(!(local_10), "Can't get ForgeViewModel, check if the Forge Widget is open.");
    UEnum local_14 = UEnum::GetEnumType(n"EWeaponType");
    int local_7 = local_14.GetIndexByName(FName(WeaponType), EGetByNameFlags(0));
    int local_17 = INDEX_NONE;
    ThrowIf((local_7 == local_17), FString().Append("WeaponType: ").Append(WeaponType).Append(" is not a valid EWeaponType enum value."));
    int local_22 = local_7;
    int local_17_2 = INDEX_NONE;
    int local_23 = local_17_2;
    int local_24 = 0;
    for (; local_24 < local_10.opArrow().GetWeaponTypes().Num(); ++local_24)
    {
        if (int(local_10.opArrow().GetWeaponTypes()[local_24]) == local_22)
        {
            local_23 = local_24;
            break;
        }
    }
    ThrowIf((local_23 == INDEX_NONE), FString().Append("WeaponType: ").Append(WeaponType).Append(" not found in current forge categories."));
    local_10.Get().OnWeaponCategorySelected(local_23);
    TEUIModelRef<FMS_Forge> local_30 = local_10.opArrow().GetForgeModel();
    TEUIModelRef<FMS_Forge> local_28;
    ThrowIf(!(local_28), "ForgeModel is invalid, check if the Forge Widget is fully initialized.");
    TEUIModelWeakRef<FM_ForgeNode> local_32 = local_28.Get().GetNode(NodeDataId);
    ThrowIf(!(local_32.IsValid()), FString().Append("ForgeNode not found by DataId: ").Append(NodeDataId));
    TEUIModelWeakRef<FM_ForgeTree> local_38 = local_28.Get().GetTree(local_32.Get().GetTreeId());
    ThrowIf(!(local_38.IsValid()), FString().Append("ForgeTree not found by TreeId: ").Append(local_32.Get().GetTreeId()));
    ThrowIf((int(local_38.Get().GetConfig().WeaponType) != local_22), FString().Append("ForgeNode ").Append(NodeDataId).Append(" does not belong to WeaponType ").Append(WeaponType));
    local_10.Get().SetCurrentSelectNode(TEUIModelWeakRef<FM_ForgeNode>(local_32.Get()));
    return;
}
void ClickForgeDoForgeButton()
{
    TEUIModelRef<FVM_WeaponForge> local_2 = AutoTest::API::CraftAPI::GetWeaponForgeViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get ForgeViewModel, check if the Forge Widget is open.");
    local_2.Get().OnDoForgeButtonClick();
    return;
}
}
