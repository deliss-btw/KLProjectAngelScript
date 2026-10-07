
namespace __FVM_AvatarEquipmentItemInfoTitle_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> __ModelContainer_Require_FVM_AvatarEquipmentItemInfoTitle(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentItemInfoTitle(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
