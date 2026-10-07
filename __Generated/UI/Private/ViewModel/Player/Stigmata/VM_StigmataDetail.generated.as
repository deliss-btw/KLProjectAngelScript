
namespace __FVM_StigmataDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_StigmataDetail> __ModelContainer_Require_FVM_StigmataDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_StigmataDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_StigmataDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_StigmataDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_StigmataDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_StigmataDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
