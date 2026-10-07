
namespace AutoTest::API::CookAPI
{
TEUIModelRef<FVM_Cook> GetCookViewModel()
{
    // body not fully recovered вЂ” stub [unresolved-operand]
    TEUIModelRef<FVM_Cook> __r; return __r;
}
TArray<FString> GetAllDisplayedIngredientNames()
{
    int local_28 = 0;
    ThrowIf(!(AutoTest::API::CookAPI::GetCookViewModel()), "Can't get CookViewModel, check if the Cook Widget is open.");
    TArray<FString> local_10;
    for (auto& local_24 : GetCurrentDisplayItems())
    {
        local_24;
        if (!(IsValid()))
        {
            continue;
        }
        TEUIModelRef<FM_ItemData> local_26;
        local_26.GetItem();
        if (local_28.GetConfig())
        {
            local_10.Add(local_28.GetConfig().GetDataName().ToString());
        }
    }
    return local_10;
}
int GetIngredientQuantity(const FString &inout FoodName)
{
    int local_24 = 0;
    ThrowIf(!(AutoTest::API::CookAPI::GetCookViewModel()), "Can't get CookViewModel, check if the Cook Widget is open.");
    for (auto& local_20 : GetCurrentDisplayItems())
    {
        local_20;
        if (!(IsValid()))
        {
            continue;
        }
        TEUIModelRef<FM_ItemData> local_22;
        local_22.GetItem();
        if (local_24.GetConfig() && (local_24.GetConfig().GetDataName().ToString() == FoodName))
        {
            return GetItemNum();
        }
    }
    ThrowIf(true, FString().Append("Can't find ingredient with name: ").Append(FoodName));
    return 0;
}
bool PushFoodToReady(const FString &inout FoodName)
{
    FVM_Cook& local_8;
    int local_28 = 0;
    ThrowIf(!(AutoTest::API::CookAPI::GetCookViewModel()), "Can't get CookViewModel, check if the Cook Widget is open.");
    bool local_9 = false;
    for (auto& local_24 : local_8.GetCurrentDisplayItems())
    {
        local_24;
        if (!(IsValid()))
        {
            continue;
        }
        TEUIModelRef<FM_ItemData> local_26;
        local_26.GetItem();
        if (local_28.GetConfig() && (local_28.GetConfig().GetDataName().ToString() == FoodName))
        {
            TEUIModelRef<FVM_Item> local_40;
            ThrowIf((GetItemNum() <= 0), FString().Append("Ingredient ").Append(FoodName).Append(" has no available quantity to push."));
            local_40.GetItemModels();
            local_8.SetCurSelectedItem(local_40);
            local_8.OnClickPushFood();
            local_9 = true;
            break;
        }
    }
    return local_9;
}
TArray<FString> GetAllReadyFoodNames()
{
    int local_30 = 0;
    bool local_33;
    ThrowIf(!(AutoTest::API::CookAPI::GetCookViewModel()), "Can't get CookViewModel, check if the Cook Widget is open.");
    TArray<FString> local_10;
    for (auto& local_24 : GetAllCookCostFoodItems())
    {
        GetModel local_28 = FEUIModelContainer::GetModel(local_24);
        if (!(local_30.IsValid() && local_30.GetItem().IsValid()))
        {
            local_33 = false;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_32 = local_30.GetItem();
            local_33 = GetConfig();
        }
        if (local_33)
        {
            TEUIModelRef<FM_ItemData> local_32_2 = local_30.GetItem();
            local_10.Add(GetConfig().GetDataName().ToString());
        }
    }
    return local_10;
}
bool CancelReadyFood(const FString &inout FoodName)
{
    FVM_Cook& local_8;
    int local_30 = 0;
    ThrowIf(!(AutoTest::API::CookAPI::GetCookViewModel()), "Can't get CookViewModel, check if the Cook Widget is open.");
    bool local_9 = false;
    for (auto& local_24 : local_8.GetAllCookCostFoodItems())
    {
        GetModel local_28 = FEUIModelContainer::GetModel(local_24);
        bool local_5 = !(local_30.IsValid()) || !(local_30.GetItem().IsValid());
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_32 = local_30.GetItem();
            local_5 = !(GetConfig());
        }
        if (local_5)
        {
            continue;
        }
        TEUIModelRef<FM_ItemData> local_32_2 = local_30.GetItem();
        if ((GetConfig().GetDataName().ToString() == FoodName))
        {
            local_8.SetCurReadyItem(TEUIModelRef<FVM_Item>(FEUIModelContainer::GetModel(local_24).opCall()));
            local_8.OnClickCancelReadyFood();
            local_9 = true;
            break;
        }
    }
    return local_9;
}
void ClickReady()
{
    ThrowIf(!(AutoTest::API::CookAPI::GetCookViewModel()), "Can't get CookViewModel, check if the Cook Widget is open.");
    OnClickReady();
    return;
}
void ExitCook()
{
    ThrowIf(!(AutoTest::API::CookAPI::GetCookViewModel()), "Can't get CookViewModel, check if the Cook Widget is open.");
    FCommonDialogAnswer local_8;
    local_8.AnswerType = ECommonDialogAnswerType(1);
    local_8.OnComfirmExit();
    return;
}
}
