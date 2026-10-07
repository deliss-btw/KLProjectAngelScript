
namespace __FVM_EquipmentEditPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EquipmentEditPage> __ModelContainer_Require_FVM_EquipmentEditPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EquipmentEditPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EquipmentEditPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EquipmentEditPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EquipmentEditPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EquipmentEditPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
