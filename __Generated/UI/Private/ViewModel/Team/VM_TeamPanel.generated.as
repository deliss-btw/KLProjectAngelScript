
namespace __FVM_TeamPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamPanel> __ModelContainer_Require_FVM_TeamPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
