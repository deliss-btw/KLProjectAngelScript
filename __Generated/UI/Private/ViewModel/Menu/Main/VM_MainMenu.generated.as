
namespace __FVM_MainMenu_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MainMenu> __ModelContainer_Require_FVM_MainMenu(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MainMenu>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MainMenu(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MainMenu>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MainMenu>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MainMenu>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
