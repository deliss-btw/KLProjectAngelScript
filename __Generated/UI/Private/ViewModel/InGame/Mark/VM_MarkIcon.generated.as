
namespace __FVM_MarkIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MarkIcon> __ModelContainer_Require_FVM_MarkIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MarkIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MarkIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MarkIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MarkIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MarkIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
