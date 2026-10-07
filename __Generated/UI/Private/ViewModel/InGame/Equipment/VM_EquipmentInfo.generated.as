
namespace __FVM_EquipmentInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EquipmentInfo> __ModelContainer_Require_FVM_EquipmentInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EquipmentInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EquipmentInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EquipmentInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EquipmentInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EquipmentInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
