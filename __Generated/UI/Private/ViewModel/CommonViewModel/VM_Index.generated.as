
namespace __FVM_Index_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Index> __ModelContainer_Require_FVM_Index(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Index>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Index(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Index>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Index>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Index>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
