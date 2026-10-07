
namespace __FVM_SegmentBarItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SegmentBarItem> __ModelContainer_Require_FVM_SegmentBarItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SegmentBarItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SegmentBarItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SegmentBarItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SegmentBarItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SegmentBarItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
