
namespace __FVM_AttributeValueItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AttributeValueItem> __ModelContainer_Require_FVM_AttributeValueItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AttributeValueItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AttributeValueItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AttributeValueItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AttributeValueItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AttributeValueItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
