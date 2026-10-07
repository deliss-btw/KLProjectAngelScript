
namespace __FVM_LoginServer_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_LoginServer> __ModelContainer_Require_FVM_LoginServer(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_LoginServer>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_LoginServer(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_LoginServer>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_LoginServer>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_LoginServer>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
