
namespace __FVM_AvatarEquipmentItemInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentItemInfo> __ModelContainer_Require_FVM_AvatarEquipmentItemInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentItemInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentItemInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
