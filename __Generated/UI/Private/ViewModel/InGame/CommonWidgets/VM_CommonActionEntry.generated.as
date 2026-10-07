
namespace __FVM_CommonActionEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonActionEntry> __ModelContainer_Require_FVM_CommonActionEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonActionEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonActionEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonActionEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonActionEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonActionEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
