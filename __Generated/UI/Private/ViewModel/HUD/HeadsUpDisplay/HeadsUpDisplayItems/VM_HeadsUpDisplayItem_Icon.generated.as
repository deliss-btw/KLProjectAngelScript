
namespace __FVM_HeadsUpDisplayItem_Icon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayItem_Icon> __ModelContainer_Require_FVM_HeadsUpDisplayItem_Icon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Icon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayItem_Icon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Icon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Icon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayItem_Icon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
