
namespace __FVM_MainMenuCategory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MainMenuCategory> __ModelContainer_Require_FVM_MainMenuCategory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MainMenuCategory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MainMenuCategory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MainMenuCategory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MainMenuCategory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MainMenuCategory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
