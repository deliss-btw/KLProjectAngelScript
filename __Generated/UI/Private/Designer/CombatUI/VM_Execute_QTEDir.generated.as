
namespace __FVM_Execute_QTEDir_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Execute_QTEDir> __ModelContainer_Require_FVM_Execute_QTEDir(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Execute_QTEDir>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Execute_QTEDir(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Execute_QTEDir>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Execute_QTEDir>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Execute_QTEDir>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
