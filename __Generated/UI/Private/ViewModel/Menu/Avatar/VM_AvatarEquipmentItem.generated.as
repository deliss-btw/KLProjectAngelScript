
namespace __FVM_AvatarEquipmentItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentItem> __ModelContainer_Require_FVM_AvatarEquipmentItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
