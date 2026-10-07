
namespace __FVM_ChatMainTab_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatMainTab> __ModelContainer_Require_FVM_ChatMainTab(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatMainTab>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatMainTab(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatMainTab>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatMainTab>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatMainTab>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
