
namespace ItemActionUtils
{
bool FindItemActionConfig(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const EItemActionType ActionType, TSubclassOf<UItemActionConfigBase> &out ItemActionConfig)
{
    TSubclassOf<UItemActionConfigBase> local_2;
    ItemActionConfig = local_2;
    if (unresolved.ItemActions.Find(ActionType, ItemActionConfig))
    {
        return true;
    }
    return false;
}
bool FindMainActionConfig(const TDataObjectPtr<FItemConfig> &inout ItemConfig, TSubclassOf<UItemActionConfigBase> &out ItemActionConfig, EItemActionType &out MainActionType)
{
    TSubclassOf<UItemActionConfigBase> local_2;
    ItemActionConfig = local_2;
    MainActionType = EItemActionType(0);
    if (ItemActionUtils::FindItemActionConfig(ItemConfig, EItemActionType(0), ItemActionConfig))
    {
        MainActionType = EItemActionType(0);
        return true;
    }
    if (ItemActionUtils::FindItemActionConfig(ItemConfig, EItemActionType(3), ItemActionConfig))
    {
        MainActionType = EItemActionType(3);
        return true;
    }
    return false;
}
bool CanExecuteAction(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const FItemActionSource &inout ActionSource, const EItemActionType ActionType)
{
    bool local_3;
    TSubclassOf<UItemActionConfigBase> local_2;
    if (!(ItemConfig))
    {
        local_3 = false;
    }
    else
    {
        local_3 = ActionSource;
    }
    local_3 = local_3 && ItemActionUtils::FindItemActionConfig(ItemConfig, EItemActionType(ActionType), local_2);
    local_3 = local_3 && local_2.IsValid();
    local_3 = local_3 && local_2.GetDefaultObject().CanExecuteAction(ActionSource);
    return local_3;
}
void ExecuteActionFromUI(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const FItemActionSource &inout ActionSource, const EItemActionType ActionType)
{
    int local_14 = 0;
    if ((!(ActionSource) || !(ItemConfig)))
    {
        XError(ELog(47), "Failed to execute item action");
        return;
    }
    if (!(ItemConfigUtils::IsDSItem(ItemConfig)))
    {
        return;
    }
    FFPTime local_10 = FFPTime(-1);
    local_14.ItemActionSource = ActionSource;
    return;
}
int GetItemActionGeneratedAbilityIndexFromAsset(const FItemActionSource &inout ActionSource, const TSoftClassPtr<UEASAbility> &inout AbilityClass)
{
    return FAbilityUtils::GetAbilityIndex(ActionSource.GetItemOwner(), ItemActionUtils::GetItemActionGeneratedAbilityName(AbilityClass));
}
FName GetItemActionGeneratedAbilityName(const TSoftClassPtr<UEASAbility> &inout AbilityClass)
{
    return FName(FString().Append(AbilityClass.GetAssetName()));
}
}
