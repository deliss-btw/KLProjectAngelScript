
namespace __FVM_MenuBarItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MenuBarItem> __ModelContainer_Require_FVM_MenuBarItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MenuBarItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MenuBarItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MenuBarItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MenuBarItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MenuBarItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
