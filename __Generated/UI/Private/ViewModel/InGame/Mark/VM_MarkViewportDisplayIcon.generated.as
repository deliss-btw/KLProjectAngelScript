
namespace __FVM_MarkViewportDisplayIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MarkViewportDisplayIcon> __ModelContainer_Require_FVM_MarkViewportDisplayIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MarkViewportDisplayIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MarkViewportDisplayIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MarkViewportDisplayIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MarkViewportDisplayIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MarkViewportDisplayIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
