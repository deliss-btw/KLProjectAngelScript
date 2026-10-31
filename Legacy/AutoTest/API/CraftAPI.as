namespace AutoTest::API::CraftAPI
{
TEUIModelRef<FVM_ItemCraft> GetCraftViewModel()
{
    // body not fully recovered — stub [unresolved-operand]
    TEUIModelRef<FVM_ItemCraft> __r; return __r;
}
TEUIModelRef<FVM_WeaponForge> GetWeaponForgeViewModel()
{
    // body not fully recovered — stub [unresolved-operand]
    TEUIModelRef<FVM_WeaponForge> __r; return __r;
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
            local_72.OnCraftableItemSelected();
            return;
        }
    }
    ThrowIf(true, FString().Append("Can't find craftable item in CraftPanel: ").Append(ItemName));
    return;
}
bool IsCurrentSelectedItemMatched(const FName &inout ItemName)
{
    ThrowIf(ItemName.IsNone(), "ItemName is None.");
    ThrowIf(!(AutoTest::API::CraftAPI::GetCraftViewModel()), "Can't get CraftViewModel, check if the Craft Widget is open.");
    TDataObjectPtr<FItemConfig> local_30 = InventoryUtils::GetItemConfigByName(ItemName);
    ThrowIf((local_30 == nullptr), FString().Append("Can't find ItemConfig by name: ").Append(ItemName));
    TDataObjectPtr<FItemConfig> local_54;
    TEUIModelRef<FVM_CraftableItem> local_60;
    local_60.GetCurrentCraft();
    TEUIModelRef<FVM_Item> local_62;
    local_62.GetItem();
    local_54 = local_62.opArrow().GetItemConfig();
    return (local_54 == local_30.opImplConv());
}
void PerformCraft()
{
    ThrowIf(!(AutoTest::API::CraftAPI::GetCraftViewModel()), "Can't get CraftViewModel, check if the Craft Widget is open.");
    DoCraft();
    return;
}
TArray<uint> GetCurrentUnlockedForgeTrees()
{
    TArray<TEUIModelWeakRef<FM_ForgeTree>> local_36;
    TArray<uint> local_4;
    TEUIModelRef<FVM_WeaponForge> local_6 = AutoTest::API::CraftAPI::GetWeaponForgeViewModel();
    ThrowIf(!(local_6), "Can't get ForgeViewModel, check if the Forge Widget is open.");
    TEUIModelRef<FMS_Forge> local_14 = local_6.opArrow().GetForgeModel();
    TEUIModelRef<FMS_Forge> local_12;
    ThrowIf(!(local_12), "ForgeModel is invalid, check if the Forge Widget is fully initialized.");
    for (auto local_31 : ForgeCommonUtil::GetWeaponTypeForgePriorityList())
    {
        local_36.GetForgeTreeListByWeaponType(EWeaponType(local_31));
        for (auto& local_54 : local_36)
        {
            if (local_54.IsValid() && CheckValid())
            {
                local_4.AddUnique(GetTreeId());
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
    TArray<TEUIModelWeakRef<FM_ForgeTree>> local_36;
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
        local_36.GetForgeTreeListByWeaponType(EWeaponType(local_31));
        for (auto& local_54 : local_36)
        {
            if (!(local_54.IsValid()) || !(CheckValid()))
            {
                continue;
            }
            for (auto& local_70 : GetNodeList())
            {
                if (!(local_70.IsValid()))
                {
                    continue;
                }
                local_71 = GetStateType();
                if ((int(local_71)) == (int(NodeStateType)))
                {
                    local_4.AddUnique(GetDataId());
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
    local_23.OnWeaponCategorySelected();
    TEUIModelRef<FMS_Forge> local_30 = local_10.opArrow().GetForgeModel();
    TEUIModelRef<FMS_Forge> local_28;
    ThrowIf(!(local_28), "ForgeModel is invalid, check if the Forge Widget is fully initialized.");
    TEUIModelWeakRef<FM_ForgeNode> local_32;
    local_32.GetNode(NodeDataId);
    ThrowIf(!(local_32.IsValid()), FString().Append("ForgeNode not found by DataId: ").Append(NodeDataId));
    TEUIModelWeakRef<FM_ForgeTree> local_38;
    local_38.GetTree(GetTreeId());
    ThrowIf(!(local_38.IsValid()), FString().Append("ForgeTree not found by TreeId: ").Append(GetTreeId()));
    ThrowIf((int(GetConfig().WeaponType) != local_22), FString().Append("ForgeNode ").Append(NodeDataId).Append(" does not belong to WeaponType ").Append(WeaponType));
    TEUIModelWeakRef<FM_ForgeNode> local_34;
    local_34.SetCurrentSelectNode();
    return;
}
void ClickForgeDoForgeButton()
{
    ThrowIf(!(AutoTest::API::CraftAPI::GetWeaponForgeViewModel()), "Can't get ForgeViewModel, check if the Forge Widget is open.");
    OnDoForgeButtonClick();
    return;
}
}
