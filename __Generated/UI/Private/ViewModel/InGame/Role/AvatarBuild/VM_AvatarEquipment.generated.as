
namespace __FVM_EquipmentSlotInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EquipmentSlotInfo> __ModelContainer_Require_FVM_EquipmentSlotInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EquipmentSlotInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EquipmentSlotInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EquipmentSlotInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EquipmentSlotInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EquipmentSlotInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarEquipment_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipment> __ModelContainer_Require_FVM_AvatarEquipment(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipment>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipment(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipment>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipment>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipment>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
