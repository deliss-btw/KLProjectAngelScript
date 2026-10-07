
namespace __FVM_MarkSpotIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MarkSpotIcon> __ModelContainer_Require_FVM_MarkSpotIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MarkSpotIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MarkSpotIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MarkSpotIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MarkSpotIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MarkSpotIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
