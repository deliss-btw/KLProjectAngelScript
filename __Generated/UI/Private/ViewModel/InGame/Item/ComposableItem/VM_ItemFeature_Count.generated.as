
namespace __FVM_ItemFeature_Count_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_Count> __ModelContainer_Require_FVM_ItemFeature_Count(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_Count>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_Count(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_Count>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_Count>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_Count>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
