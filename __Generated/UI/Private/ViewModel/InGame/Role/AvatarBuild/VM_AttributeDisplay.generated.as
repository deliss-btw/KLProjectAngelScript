
namespace __FVM_AttributeDisplay_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AttributeDisplay> __ModelContainer_Require_FVM_AttributeDisplay(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AttributeDisplay>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AttributeDisplay(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AttributeDisplay>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AttributeDisplay>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AttributeDisplay>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
