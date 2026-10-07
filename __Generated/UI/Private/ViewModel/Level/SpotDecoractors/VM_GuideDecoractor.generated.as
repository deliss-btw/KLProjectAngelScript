
namespace __FVM_GuideDecoractor_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GuideDecoractor> __ModelContainer_Require_FVM_GuideDecoractor(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GuideDecoractor>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GuideDecoractor(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GuideDecoractor>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GuideDecoractor>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GuideDecoractor>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
