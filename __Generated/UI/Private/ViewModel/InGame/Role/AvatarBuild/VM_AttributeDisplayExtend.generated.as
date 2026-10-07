
namespace __FVM_AttributeDisplayExtend_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AttributeDisplayExtend> __ModelContainer_Require_FVM_AttributeDisplayExtend(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AttributeDisplayExtend>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AttributeDisplayExtend(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AttributeDisplayExtend>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AttributeDisplayExtend>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AttributeDisplayExtend>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
