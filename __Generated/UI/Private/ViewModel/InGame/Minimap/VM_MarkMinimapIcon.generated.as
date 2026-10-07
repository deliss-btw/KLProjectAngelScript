
namespace __FVM_MarkMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MarkMinimapIcon> __ModelContainer_Require_FVM_MarkMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MarkMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MarkMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MarkMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MarkMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MarkMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
