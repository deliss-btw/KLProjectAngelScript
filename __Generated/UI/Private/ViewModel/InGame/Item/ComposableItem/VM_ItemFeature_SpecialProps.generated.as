
namespace __FVM_ItemFeature_SpecialProps_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_SpecialProps> __ModelContainer_Require_FVM_ItemFeature_SpecialProps(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_SpecialProps>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_SpecialProps(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_SpecialProps>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_SpecialProps>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_SpecialProps>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
