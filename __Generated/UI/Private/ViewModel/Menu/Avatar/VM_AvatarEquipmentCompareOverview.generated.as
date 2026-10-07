
namespace __FVM_AvatarEquipmentCompareOverview_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentCompareOverview> __ModelContainer_Require_FVM_AvatarEquipmentCompareOverview(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentCompareOverview>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentCompareOverview(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentCompareOverview>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentCompareOverview>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentCompareOverview>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
