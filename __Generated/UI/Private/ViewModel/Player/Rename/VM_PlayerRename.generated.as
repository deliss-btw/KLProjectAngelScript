
namespace __FVM_PlayerRename_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerRename> __ModelContainer_Require_FVM_PlayerRename(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerRename>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerRename(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerRename>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerRename>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerRename>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
