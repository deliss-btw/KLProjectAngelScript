
namespace __FVM_PVX_Match_CampusItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_Match_CampusItem> __ModelContainer_Require_FVM_PVX_Match_CampusItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_Match_CampusItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_Match_CampusItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_Match_CampusItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_Match_CampusItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_Match_CampusItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
