
namespace __FVM_NavigationBarIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_NavigationBarIcon> __ModelContainer_Require_FVM_NavigationBarIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_NavigationBarIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_NavigationBarIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_NavigationBarIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_NavigationBarIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
