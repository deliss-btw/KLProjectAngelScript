
namespace __FVM_ItemRarity_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemRarity> __ModelContainer_Require_FVM_ItemRarity(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemRarity>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemRarity(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemRarity>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemRarity>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemRarity>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
