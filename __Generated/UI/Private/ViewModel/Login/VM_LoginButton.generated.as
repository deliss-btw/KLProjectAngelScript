
namespace __FVM_LoginButton_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_LoginButton> __ModelContainer_Require_FVM_LoginButton(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_LoginButton>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_LoginButton(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_LoginButton>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_LoginButton>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_LoginButton>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
