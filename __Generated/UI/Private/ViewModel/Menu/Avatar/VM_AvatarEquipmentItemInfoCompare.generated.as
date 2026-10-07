
namespace __FVM_AvatarEquipmentItemInfoCompare_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> __ModelContainer_Require_FVM_AvatarEquipmentItemInfoCompare(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentItemInfoCompare(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
