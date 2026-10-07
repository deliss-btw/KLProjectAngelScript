
namespace __FVM_TauntHint_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TauntHint> __ModelContainer_Require_FVM_TauntHint(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TauntHint>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TauntHint(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TauntHint>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TauntHint>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TauntHint>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
