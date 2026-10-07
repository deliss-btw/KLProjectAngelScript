
namespace __FVM_PositionMarkList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PositionMarkList> __ModelContainer_Require_FVM_PositionMarkList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PositionMarkList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PositionMarkList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PositionMarkList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PositionMarkList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PositionMarkList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
