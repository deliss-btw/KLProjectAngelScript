
namespace __FVM_ThreeChooseOneEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ThreeChooseOneEntry> __ModelContainer_Require_FVM_ThreeChooseOneEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ThreeChooseOneEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ThreeChooseOneEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ThreeChooseOneEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ThreeChooseOneEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
