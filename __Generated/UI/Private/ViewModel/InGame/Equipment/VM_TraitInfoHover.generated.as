
namespace __FVM_TraitInfoHover_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TraitInfoHover> __ModelContainer_Require_FVM_TraitInfoHover(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TraitInfoHover>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TraitInfoHover(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TraitInfoHover>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TraitInfoHover>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TraitInfoHover>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
