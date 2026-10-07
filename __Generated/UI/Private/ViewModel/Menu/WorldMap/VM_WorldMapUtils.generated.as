
namespace __FVM_WorldMapUtils_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WorldMapUtils> __ModelContainer_Require_FVM_WorldMapUtils(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WorldMapUtils>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WorldMapUtils(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WorldMapUtils>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WorldMapUtils>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WorldMapUtils>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
