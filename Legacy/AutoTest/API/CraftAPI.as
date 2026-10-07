
namespace AutoTest::API::CraftAPI
{
TEUIModelRef<FVM_ItemCraft> GetCraftViewModel()
{
    // body not fully recovered вЂ” stub [unresolved-operand]
    TEUIModelRef<FVM_ItemCraft> __r; return __r;
}
TEUIModelRef<FVM_WeaponForge> GetWeaponForgeViewModel()
{
    // body not fully recovered вЂ” stub [unresolved-operand]
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
        local_31;
        local_36.GetForgeTreeListByWeaponType();
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    TArray<uint> __r; return __r;
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
        local_31;
        local_36.GetForgeTreeListByWeaponType();
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void ClickForgeDoForgeButton()
{
    ThrowIf(!(AutoTest::API::CraftAPI::GetWeaponForgeViewModel()), "Can't get ForgeViewModel, check if the Forge Widget is open.");
    OnDoForgeButtonClick();
    return;
}
}
