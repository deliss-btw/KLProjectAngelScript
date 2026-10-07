
namespace __FVM_PVX_MatchConfirmContent_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_MatchConfirmContent> __ModelContainer_Require_FVM_PVX_MatchConfirmContent(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_MatchConfirmContent>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_MatchConfirmContent(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_MatchConfirmContent>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_MatchConfirmContent>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_MatchConfirmContent>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
