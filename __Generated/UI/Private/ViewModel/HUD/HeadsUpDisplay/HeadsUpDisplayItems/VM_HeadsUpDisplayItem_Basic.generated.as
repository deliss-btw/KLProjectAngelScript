
namespace __FVM_HeadsUpDisplayItem_Basic_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayItem_Basic> __ModelContainer_Require_FVM_HeadsUpDisplayItem_Basic(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Basic>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayItem_Basic(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Basic>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Basic>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayItem_Basic>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
