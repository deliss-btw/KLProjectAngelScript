
namespace __FVM_PVP_Match_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVP_Match> __ModelContainer_Require_FVM_PVP_Match(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVP_Match>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVP_Match(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVP_Match>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVP_Match>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVP_Match>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
