
namespace __FVM_MarkMinimapIconTips_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MarkMinimapIconTips> __ModelContainer_Require_FVM_MarkMinimapIconTips(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MarkMinimapIconTips>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MarkMinimapIconTips(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MarkMinimapIconTips>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MarkMinimapIconTips>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MarkMinimapIconTips>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
