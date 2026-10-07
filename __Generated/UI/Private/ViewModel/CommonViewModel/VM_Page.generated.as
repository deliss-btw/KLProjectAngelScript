
namespace __FVM_Page_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Page> __ModelContainer_Require_FVM_Page(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Page>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Page(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Page>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Page>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Page>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
