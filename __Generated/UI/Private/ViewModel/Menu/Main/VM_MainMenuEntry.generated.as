
namespace __FVM_MainMenuEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MainMenuEntry> __ModelContainer_Require_FVM_MainMenuEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MainMenuEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MainMenuEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MainMenuEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MainMenuEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MainMenuEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
