
namespace __FVM_ItemGainWayItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemGainWayItem> __ModelContainer_Require_FVM_ItemGainWayItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemGainWayItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemGainWayItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemGainWayItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemGainWayItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemGainWayItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
