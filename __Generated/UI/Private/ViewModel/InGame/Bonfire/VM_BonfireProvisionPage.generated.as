
namespace __FVM_BonfireProvisionPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BonfireProvisionPage> __ModelContainer_Require_FVM_BonfireProvisionPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BonfireProvisionPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BonfireProvisionPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BonfireProvisionPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BonfireProvisionPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BonfireProvisionPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
