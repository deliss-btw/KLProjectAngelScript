
namespace __FVM_AvatarEquipmentTraitHoverTips_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> __ModelContainer_Require_FVM_AvatarEquipmentTraitHoverTips(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentTraitHoverTips(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
