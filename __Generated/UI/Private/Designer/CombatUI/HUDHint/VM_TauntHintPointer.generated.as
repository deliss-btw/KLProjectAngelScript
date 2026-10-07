
namespace __FVM_TauntHintPointer_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TauntHintPointer> __ModelContainer_Require_FVM_TauntHintPointer(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TauntHintPointer>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TauntHintPointer(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TauntHintPointer>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TauntHintPointer>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TauntHintPointer>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
