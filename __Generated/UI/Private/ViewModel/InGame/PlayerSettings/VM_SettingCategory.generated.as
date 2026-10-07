
namespace __FVM_SettingSubTitle_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SettingSubTitle> __ModelContainer_Require_FVM_SettingSubTitle(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SettingSubTitle>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SettingSubTitle(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SettingSubTitle>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SettingSubTitle>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SettingSubTitle>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SettingCategory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SettingCategory> __ModelContainer_Require_FVM_SettingCategory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SettingCategory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SettingCategory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SettingCategory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SettingCategory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SettingCategory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
