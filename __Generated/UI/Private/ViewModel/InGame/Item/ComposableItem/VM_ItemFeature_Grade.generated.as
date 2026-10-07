
namespace __FVM_ItemFeature_Grade_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_Grade> __ModelContainer_Require_FVM_ItemFeature_Grade(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_Grade>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_Grade(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_Grade>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_Grade>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_Grade>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
