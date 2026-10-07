
namespace __FVM_AvatarEquipmentCompareItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentCompareItem> __ModelContainer_Require_FVM_AvatarEquipmentCompareItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentCompareItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentCompareItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentCompareItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentCompareItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
