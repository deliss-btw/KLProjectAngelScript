
namespace __FVM_AvatarEquipmentItemInfoDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __ModelContainer_Require_FVM_AvatarEquipmentItemInfoDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentItemInfoDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
