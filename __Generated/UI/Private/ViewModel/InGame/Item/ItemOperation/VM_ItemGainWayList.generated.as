
namespace __FVM_ItemGainWayList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemGainWayList> __ModelContainer_Require_FVM_ItemGainWayList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemGainWayList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemGainWayList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemGainWayList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemGainWayList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemGainWayList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
