
namespace __FVM_ItemFeature_Tag_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_Tag> __ModelContainer_Require_FVM_ItemFeature_Tag(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_Tag>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_Tag(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_Tag>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_Tag>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_Tag>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
