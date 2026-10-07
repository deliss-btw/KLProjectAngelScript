
namespace __FVM_SpecialtyItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SpecialtyItem> __ModelContainer_Require_FVM_SpecialtyItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SpecialtyItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SpecialtyItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SpecialtyItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SpecialtyItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SpecialtyItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
