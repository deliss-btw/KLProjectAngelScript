
namespace __FVM_HeadsUpDisplayItem_Bubble_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble> __ModelContainer_Require_FVM_HeadsUpDisplayItem_Bubble(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayItem_Bubble(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayItem_Bubble>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
