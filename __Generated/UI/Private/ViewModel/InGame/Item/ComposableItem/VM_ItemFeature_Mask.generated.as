
namespace __FVM_ItemFeature_Mask_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_Mask> __ModelContainer_Require_FVM_ItemFeature_Mask(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_Mask>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_Mask(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_Mask>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_Mask>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_Mask>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
