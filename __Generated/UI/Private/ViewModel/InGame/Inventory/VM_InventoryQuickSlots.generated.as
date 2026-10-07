
namespace __FVM_InventoryQuickSlotsFocus_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryQuickSlotsFocus> __ModelContainer_Require_FVM_InventoryQuickSlotsFocus(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryQuickSlotsFocus>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryQuickSlotsFocus(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryQuickSlotsFocus>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryQuickSlotsFocus>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryQuickSlotsFocus>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_InventoryQuickSlots_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InventoryQuickSlots> __ModelContainer_Require_FVM_InventoryQuickSlots(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InventoryQuickSlots>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InventoryQuickSlots(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InventoryQuickSlots>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InventoryQuickSlots>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InventoryQuickSlots>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
