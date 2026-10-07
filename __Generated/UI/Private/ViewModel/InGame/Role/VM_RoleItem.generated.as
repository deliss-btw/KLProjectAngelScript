
namespace __FVM_RoleItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RoleItem> __ModelContainer_Require_FVM_RoleItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RoleItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RoleItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RoleItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RoleItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RoleItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
