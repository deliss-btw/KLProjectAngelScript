
namespace __FVM_EquipmentSelectDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EquipmentSelectDetail> __ModelContainer_Require_FVM_EquipmentSelectDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EquipmentSelectDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EquipmentSelectDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EquipmentSelectDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EquipmentSelectDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EquipmentSelectDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
