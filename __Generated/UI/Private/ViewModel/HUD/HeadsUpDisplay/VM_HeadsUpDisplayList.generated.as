
namespace __FVM_HeadsUpDisplayList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayList> __ModelContainer_Require_FVM_HeadsUpDisplayList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
