namespace AutoTest::API::CookAPI
{
TEUIModelRef<FVM_Cook> GetCookViewModel()
{
    UWidget_Cook local_28;
    TEUIModelRef<FVM_Cook> local_2;
    TArray<UWidget> local_6;
    KLAutomation::GetAllWidgetsOfClass(local_6, UWidget_Cook, false);
    ThrowIf(local_6.IsEmpty(), "Can't get CookViewModel, check if the Cook Widget is open.");
    for (auto local_24 : local_6)
    {
        local_28 = Cast<UWidget_Cook>(local_24);
        ThrowIf(local_28, !((local_28 != nullptr)));
        if (local_28.Cook.Get())
        {
            TEUIModelRef<FVM_Cook> local_30;
            local_30;
            local_2 = local_30;
            break;
        }
    }
    return local_2;
}
TArray<FString> GetAllDisplayedIngredientNames()
{
    int local_28 = 0;
    TEUIModelRef<FVM_Cook> local_2 = AutoTest::API::CookAPI::GetCookViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get CookViewModel, check if the Cook Widget is open.");
    TArray<FString> local_10;
    for (auto& local_24 : local_2.Get().GetCurrentDisplayItems())
    {
        if (!(local_24.Get().IsValid()))
        {
            continue;
        }
        TEUIModelRef<FM_ItemData> local_26 = local_24.Get().GetItem();
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
    TEUIModelRef<FVM_Cook> local_2 = AutoTest::API::CookAPI::GetCookViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get CookViewModel, check if the Cook Widget is open.");
    for (auto& local_20 : local_2.Get().GetCurrentDisplayItems())
    {
        if (!(local_20.Get().IsValid()))
        {
            continue;
        }
        TEUIModelRef<FM_ItemData> local_22 = local_20.Get().GetItem();
        if (local_24.GetConfig() && (local_24.GetConfig().GetDataName().ToString() == FoodName))
        {
            return local_20.Get().GetItemNum();
        }
    }
    ThrowIf(true, FString().Append("Can't find ingredient with name: ").Append(FoodName));
    return 0;
}
bool PushFoodToReady(const FString &inout FoodName)
{
    int local_28 = 0;
    TEUIModelRef<FVM_Cook> local_2 = AutoTest::API::CookAPI::GetCookViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get CookViewModel, check if the Cook Widget is open.");
    FVM_Cook& local_8 = local_2.Get();
    bool local_9 = false;
    for (auto& local_24 : local_8.GetCurrentDisplayItems())
    {
        if (!(local_24.Get().IsValid()))
        {
            continue;
        }
        TEUIModelRef<FM_ItemData> local_26 = local_24.Get().GetItem();
        if (local_28.GetConfig() && (local_28.GetConfig().GetDataName().ToString() == FoodName))
        {
            ThrowIf((local_24.Get().GetItemNum() <= 0), FString().Append("Ingredient ").Append(FoodName).Append(" has no available quantity to push."));
            local_8.SetCurSelectedItem(local_24.Get().GetItemModels());
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
    TEUIModelRef<FVM_Cook> local_2 = AutoTest::API::CookAPI::GetCookViewModel();
    ThrowIf(!(local_2), "Can't get CookViewModel, check if the Cook Widget is open.");
    TArray<FString> local_10;
    for (auto& local_24 : local_2.Get().GetAllCookCostFoodItems())
    {
        GetModel local_28 = FEUIModelContainer::GetModel(local_24);
        if (!(!(local_30.IsValid() && local_30.GetItem().IsValid())) && local_30.GetItem().Get().GetConfig())
        {
            local_10.Add(local_30.GetItem().Get().GetConfig().GetDataName().ToString());
        }
    }
    return local_10;
}
bool CancelReadyFood(const FString &inout FoodName)
{
    int local_30 = 0;
    TEUIModelRef<FVM_Cook> local_2 = AutoTest::API::CookAPI::GetCookViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get CookViewModel, check if the Cook Widget is open.");
    FVM_Cook& local_8 = local_2.Get();
    bool local_9 = false;
    for (auto& local_24 : local_8.GetAllCookCostFoodItems())
    {
        GetModel local_28 = FEUIModelContainer::GetModel(local_24);
        if (!(local_30.IsValid()) || !(local_30.GetItem().IsValid()) || !(local_30.GetItem().Get().GetConfig()))
        {
            continue;
        }
        if ((local_30.GetItem().Get().GetConfig().GetDataName().ToString() == FoodName))
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
    TEUIModelRef<FVM_Cook> local_2 = AutoTest::API::CookAPI::GetCookViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get CookViewModel, check if the Cook Widget is open.");
    local_2.Get().OnClickReady();
    return;
}
void ExitCook()
{
    TEUIModelRef<FVM_Cook> local_2 = AutoTest::API::CookAPI::GetCookViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get CookViewModel, check if the Cook Widget is open.");
    FCommonDialogAnswer local_8;
    local_8.AnswerType = ECommonDialogAnswerType(1);
    local_2.Get().OnComfirmExit(local_8);
    return;
}
}
