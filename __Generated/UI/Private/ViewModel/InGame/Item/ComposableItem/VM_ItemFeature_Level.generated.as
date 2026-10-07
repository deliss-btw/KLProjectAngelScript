
namespace __FVM_ItemFeature_Level_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_Level> __ModelContainer_Require_FVM_ItemFeature_Level(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_Level>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_Level(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_Level>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_Level>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_Level>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
