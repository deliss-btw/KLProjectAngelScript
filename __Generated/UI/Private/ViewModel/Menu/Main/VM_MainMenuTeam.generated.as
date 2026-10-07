
namespace __FVM_MainMenuTeam_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MainMenuTeam> __ModelContainer_Require_FVM_MainMenuTeam(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MainMenuTeam>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MainMenuTeam(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MainMenuTeam>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MainMenuTeam>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MainMenuTeam>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
