
namespace __FVM_BuffIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BuffIcon> __ModelContainer_Require_FVM_BuffIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BuffIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BuffIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BuffIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BuffIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BuffIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
