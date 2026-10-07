
namespace __FVM_EquipmentSelectListItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EquipmentSelectListItem> __ModelContainer_Require_FVM_EquipmentSelectListItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EquipmentSelectListItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EquipmentSelectListItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EquipmentSelectListItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EquipmentSelectListItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EquipmentSelectListItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
