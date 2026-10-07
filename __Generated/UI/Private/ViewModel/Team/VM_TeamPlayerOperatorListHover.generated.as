
namespace __FVM_TeamPlayerOperatorListHover_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamPlayerOperatorListHover> __ModelContainer_Require_FVM_TeamPlayerOperatorListHover(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamPlayerOperatorListHover>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamPlayerOperatorListHover(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamPlayerOperatorListHover>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamPlayerOperatorListHover>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamPlayerOperatorListHover>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
