
namespace __FVM_TraitInfoIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TraitInfoIcon> __ModelContainer_Require_FVM_TraitInfoIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TraitInfoIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TraitInfoIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TraitInfoIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TraitInfoIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TraitInfoIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
