
namespace __FVM_EquipmentCompare_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EquipmentCompare> __ModelContainer_Require_FVM_EquipmentCompare(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EquipmentCompare>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EquipmentCompare(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EquipmentCompare>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EquipmentCompare>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EquipmentCompare>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
