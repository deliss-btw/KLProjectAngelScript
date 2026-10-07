
namespace __FVM_SettingItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SettingItem> __ModelContainer_Require_FVM_SettingItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SettingItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SettingItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SettingItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SettingItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SettingItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
