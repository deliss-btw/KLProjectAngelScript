
namespace __FVM_PlayerMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerMinimapIcon> __ModelContainer_Require_FVM_PlayerMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
