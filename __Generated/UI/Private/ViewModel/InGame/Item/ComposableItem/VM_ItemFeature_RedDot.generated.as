
namespace __FVM_ItemFeature_RedDot_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_RedDot> __ModelContainer_Require_FVM_ItemFeature_RedDot(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_RedDot>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_RedDot(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_RedDot>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_RedDot>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_RedDot>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
