
namespace __FVM_PlayerReborn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerReborn> __ModelContainer_Require_FVM_PlayerReborn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerReborn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerReborn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerReborn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerReborn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerReborn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
