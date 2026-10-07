
namespace __FVM_Comp_Matching_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Comp_Matching> __ModelContainer_Require_FVM_Comp_Matching(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Comp_Matching>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Comp_Matching(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Comp_Matching>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Comp_Matching>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Comp_Matching>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
