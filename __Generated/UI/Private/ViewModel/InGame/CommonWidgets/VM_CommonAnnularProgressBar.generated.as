
namespace __FVM_CommonAnnularProgressBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonAnnularProgressBar> __ModelContainer_Require_FVM_CommonAnnularProgressBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonAnnularProgressBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonAnnularProgressBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonAnnularProgressBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonAnnularProgressBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonAnnularProgressBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
