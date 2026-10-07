
namespace __FVM_HeadsUpDisplayItem_Energy_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayItem_Energy> __ModelContainer_Require_FVM_HeadsUpDisplayItem_Energy(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Energy>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayItem_Energy(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Energy>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Energy>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayItem_Energy>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
