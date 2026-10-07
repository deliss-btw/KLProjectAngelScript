
namespace __FVM_AvatarQuicklyEquip_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarQuicklyEquip> __ModelContainer_Require_FVM_AvatarQuicklyEquip(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarQuicklyEquip>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarQuicklyEquip(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarQuicklyEquip>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarQuicklyEquip>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarQuicklyEquip>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
