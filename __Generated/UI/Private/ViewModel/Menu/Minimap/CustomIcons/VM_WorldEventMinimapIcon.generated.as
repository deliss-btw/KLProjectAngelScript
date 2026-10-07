
namespace __FVM_WorldEventMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WorldEventMinimapIcon> __ModelContainer_Require_FVM_WorldEventMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WorldEventMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WorldEventMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WorldEventMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WorldEventMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WorldEventMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
