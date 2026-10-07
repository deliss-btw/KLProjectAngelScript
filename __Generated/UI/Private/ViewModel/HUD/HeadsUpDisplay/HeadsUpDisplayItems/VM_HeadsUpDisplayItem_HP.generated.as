
namespace __FVM_HeadsUpDisplayItem_HP_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayItem_HP> __ModelContainer_Require_FVM_HeadsUpDisplayItem_HP(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_HP>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayItem_HP(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_HP>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_HP>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayItem_HP>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
