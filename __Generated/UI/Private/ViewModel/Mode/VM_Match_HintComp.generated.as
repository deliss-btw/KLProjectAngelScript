
namespace __FVM_Match_HintComp_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Match_HintComp> __ModelContainer_Require_FVM_Match_HintComp(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Match_HintComp>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Match_HintComp(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Match_HintComp>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Match_HintComp>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Match_HintComp>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
