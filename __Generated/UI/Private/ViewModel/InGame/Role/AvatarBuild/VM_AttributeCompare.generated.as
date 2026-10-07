
namespace __FVM_AttributeCompare_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AttributeCompare> __ModelContainer_Require_FVM_AttributeCompare(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AttributeCompare>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AttributeCompare(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AttributeCompare>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AttributeCompare>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AttributeCompare>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
