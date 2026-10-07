
namespace __FVM_Cook_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Cook> __ModelContainer_Require_FVM_Cook(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Cook>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Cook(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Cook>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Cook>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Cook>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
