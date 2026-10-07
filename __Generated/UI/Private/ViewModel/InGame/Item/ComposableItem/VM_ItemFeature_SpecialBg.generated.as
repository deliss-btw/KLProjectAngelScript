
namespace __FVM_ItemFeature_SpecialBg_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_SpecialBg> __ModelContainer_Require_FVM_ItemFeature_SpecialBg(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_SpecialBg>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_SpecialBg(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_SpecialBg>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_SpecialBg>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_SpecialBg>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
