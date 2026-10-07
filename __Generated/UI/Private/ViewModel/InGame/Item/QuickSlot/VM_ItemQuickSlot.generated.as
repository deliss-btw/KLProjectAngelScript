
namespace __FVM_ItemQuickSlot_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemQuickSlot> __ModelContainer_Require_FVM_ItemQuickSlot(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemQuickSlot>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemQuickSlot(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemQuickSlot>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemQuickSlot>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemQuickSlot>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
