
namespace __FVM_NearDeath_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_NearDeath> __ModelContainer_Require_FVM_NearDeath(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_NearDeath>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_NearDeath(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_NearDeath>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_NearDeath>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_NearDeath>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
